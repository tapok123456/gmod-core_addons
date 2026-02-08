TOOL.Category = "Render"
TOOL.Name = "SubMaterial"

TOOL.ClientConVar["override"] = "debug/env_cubemap_model"
TOOL.ClientConVar["index"] = 0

if SERVER then
    util.AddNetworkString("SubMaterial_SP_Reload")
end

if CLIENT then
    language.Add("tool.submaterial.name", "SubMaterial Tool")
    language.Add("tool.submaterial.desc", "Allows overriding submaterials of a model.")
    language.Add("tool.submaterial.0", "Wheel Up/Down: Select target part, Primary: Apply material, Secondary: Set default material, Reload: Copy material")
    language.Add("tool.submaterial.help", "Select material here, type known material string or use HUD to copy materials")
end

local function ApplySubMaterials(Player, Entity, Data)
    if not IsValid(Entity) then return false end
    if not Entity.GetMaterials then return false end
    
    local mats = Entity:GetMaterials() or {}
    for i = 0, #mats - 1 do
        local key = "SubMaterialOverride_" .. i
        local matPath = Data[key]

        if matPath then
            if matPath == "" or (not game.SinglePlayer() and string.lower(matPath) == "pp/copy") then
                matPath = nil
                Data[key] = nil
            end
        end
        Entity:SetSubMaterial(i, matPath or "")
    end

    duplicator.ClearEntityModifier(Entity, "submaterial")
    if next(Data) then
        duplicator.StoreEntityModifier(Entity, "submaterial", Data)
    end
    return true
end

local function ApplyBaseMaterial(Player, Entity, Data)
    if not IsValid(Entity) then return false end
    local mat = Data.MaterialOverride
    if mat and (game.SinglePlayer() or string.lower(mat) ~= "pp/copy") then
        Entity:SetMaterial(mat)
        duplicator.StoreEntityModifier(Entity, "material", Data)
    end
    return true
end

duplicator.RegisterEntityModifier("submaterial", ApplySubMaterials)
duplicator.RegisterEntityModifier("material", ApplyBaseMaterial)

local function GetTarget(trace, owner)
    local ent = trace.Entity
    if not IsValid(ent) then ent = owner end
    if IsValid(ent.AttachedEntity) then ent = ent.AttachedEntity end
    return ent
end

local function UpdateSpecificSubMat(Player, Entity, Index, MaterialPath)
    if not IsValid(Entity) or not Entity.GetMaterials then return end
    local mats = Entity:GetMaterials() or {}
    if Index < 0 or Index >= #mats then return end

    local Data = {}
    for i = 0, #mats - 1 do
        local currentMat = Entity:GetSubMaterial(i)
        if i == Index then currentMat = MaterialPath end
        if currentMat and currentMat ~= "" then 
            Data["SubMaterialOverride_" .. i] = currentMat 
        end
    end
    ApplySubMaterials(Player, Entity, Data)
end

function TOOL:LeftClick(trace)
    if CLIENT then return true end
    local ent = GetTarget(trace, self:GetOwner())
    if not IsValid(ent) then return false end

    local mat = self:GetClientInfo("override")
    local index = self:GetClientNumber("index", 0)

    if index < 1 then
        ApplyBaseMaterial(self:GetOwner(), ent, { MaterialOverride = mat })
    else
        UpdateSpecificSubMat(self:GetOwner(), ent, index - 1, mat)
    end
    return true
end

function TOOL:RightClick(trace)
    if CLIENT then return true end
    local ent = GetTarget(trace, self:GetOwner())
    if not IsValid(ent) then return false end

    local index = self:GetClientNumber("index", 0)
    if index < 1 then
        ApplyBaseMaterial(self:GetOwner(), ent, { MaterialOverride = "" })
    else
        UpdateSpecificSubMat(self:GetOwner(), ent, index - 1, "")
    end
    return true
end

function TOOL:Reload(trace)
    if SERVER and game.SinglePlayer() then
        net.Start("SubMaterial_SP_Reload")
        net.Send(self:GetOwner())
        return false
    end
    if SERVER then return true end

    local ent = GetTarget(trace, self:GetOwner())
    if not IsValid(ent) then return false end

    local mat = self.HudData and self.HudData.EntCurMatString
    if mat and mat ~= "" then
        RunConsoleCommand("submaterial_override", mat)
        notification.AddLegacy("Material copied: " .. mat, NOTIFY_GENERIC, 3)
        surface.PlaySound("buttons/button14.wav")
    end
    return true
end

if CLIENT then
    net.Receive("SubMaterial_SP_Reload", function()
        local ply = LocalPlayer()
        -- ИСПРАВЛЕНИЕ ЗДЕСЬ: используем ply.GetTool вместо ply:GetTool для проверки
        local tool = ply.GetTool and ply:GetTool("submaterial")
        if tool and tool.Reload then
            tool:Reload(ply:GetEyeTrace())
        end
    end)

    TOOL.AimEnt = nil
    TOOL.HudData = { Mats = {}, CurMats = {}, OvrMats = {}, GlobalMat = "" }
    TOOL.SelIndx = 1
    TOOL.ToolMatString = ""

    function TOOL:Scroll(dir)
        if not IsValid(self.AimEnt) or not self.AimEnt.GetMaterials then return end
        local mats = self.AimEnt:GetMaterials()
        local count = #mats
        if count == 0 then return end
        self.SelIndx = (self.SelIndx + dir) % (count + 1)
        if self.SelIndx < 0 then self.SelIndx = count end 
        RunConsoleCommand("submaterial_index", tostring(self.SelIndx))
        surface.PlaySound("common/talk.wav")
    end

    hook.Add("PlayerBindPress", "SubMaterial_Scroll", function(ply, bind, pressed)
        if not pressed then return end
        if not IsValid(ply) then return end
        local wep = ply:GetActiveWeapon()
        if not IsValid(wep) or wep:GetClass() ~= "gmod_tool" then return end
        local tool = wep:GetToolObject()
        if not tool or tool.Mode ~= "submaterial" then return end

        if bind == "invnext" then
            tool:Scroll(1)
            return true
        elseif bind == "invprev" then
            tool:Scroll(-1)
            return true
        end
    end)

    local cachedMaterials = {} 
    local function GetCachedMaterial(name)
        if not name or name == "" then return nil end
        if not cachedMaterials[name] then
            local mat = Material(name)
            if not mat:IsError() and (string.find(mat:GetShader(), "VertexLitGeneric") or string.find(mat:GetShader(), "Cable")) then
                 local params = {
                    ["$basetexture"] = mat:GetString("$basetexture"),
                    ["$vertexcolor"] = 1,
                    ["$vertexalpha"] = 1
                }
                cachedMaterials[name] = CreateMaterial(name .. "_hud_fix_" .. os.time(), "UnlitGeneric", params)
            else
                cachedMaterials[name] = mat
            end
        end
        return cachedMaterials[name]
    end

    function TOOL:Think()
        local ply = LocalPlayer()
        local ent = GetTarget(ply:GetEyeTraceNoCursor(), ply)

        if self.AimEnt ~= ent then
            self.AimEnt = ent
            if IsValid(self.AimEnt) and self.AimEnt.GetMaterials then
                self.SelIndx = 0
                RunConsoleCommand("submaterial_index", "0")
                self.HudData.Mats = self.AimEnt:GetMaterials() or {}
            else
                self.HudData.Mats = {}
            end
        end

        if IsValid(self.AimEnt) and self.AimEnt.GetMaterials then
            self.HudData.CurMats = table.Copy(self.HudData.Mats)
            self.HudData.OvrMats = {}
            
            for i = 0, #self.HudData.Mats - 1 do
                local mat = self.AimEnt:GetSubMaterial(i)
                if mat and mat ~= "" then 
                    self.HudData.OvrMats[i + 1] = mat
                    self.HudData.CurMats[i + 1] = mat 
                end
            end
            
            self.HudData.GlobalMat = self.AimEnt:GetMaterial()
            local idx = self.SelIndx
            self.HudData.EntCurMatString = (idx > 0) and self.HudData.CurMats[idx] or self.HudData.GlobalMat
            self.HudData.EntOrigMatString = (idx > 0) and self.HudData.Mats[idx] or self.HudData.GlobalMat
        end
        
        local toolMat = self:GetClientInfo("override")
        if self.ToolMatString ~= toolMat then
            self.ToolMatString = toolMat
        end
    end

    function TOOL:DrawHUD()
        if not IsValid(self.AimEnt) or not self.HudData.Mats then return end

        local W, H = ScrW(), ScrH()
        local startX = W / 2 - 50
        local startY = H / 2
        
        surface.SetFont("ChatFont")
        
        local headerText = "Materials (" .. #self.HudData.Mats .. "):"
        local maxW, textH = surface.GetTextSize(headerText)
        
        for _, name in ipairs(self.HudData.CurMats) do
            local w = surface.GetTextSize(name)
            if w > maxW then maxW = w end
        end
        
        local boxW = maxW + 20
        local boxH = (textH + 2) * (#self.HudData.Mats + 2) + 5
        local boxX = startX - boxW
        local boxY = startY - boxH / 2

        draw.RoundedBox(4, boxX, boxY, boxW, boxH, Color(0, 0, 0, 180))
        draw.SimpleText(headerText, "ChatFont", boxX + 5, boxY + 5, Color(255, 255, 255), TEXT_ALIGN_LEFT)
        
        surface.SetDrawColor(255, 255, 255, 100)
        surface.DrawLine(boxX + 5, boxY + 5 + textH + 2, boxX + boxW - 5, boxY + 5 + textH + 2)

        local selY = boxY + 5 + (textH + 2) * (self.SelIndx + 1)
        draw.RoundedBox(0, boxX + 2, selY, boxW - 4, textH + 2, Color(0, 150, 255, 100))

        local baseCol = (self.HudData.GlobalMat and self.HudData.GlobalMat ~= "") and Color(100, 255, 100) or Color(200, 200, 200)
        draw.SimpleText("[Base] " .. (self.HudData.GlobalMat ~= "" and self.HudData.GlobalMat or "<default>"), "ChatFont", boxX + 5, boxY + 5 + (textH+2), baseCol)

        for i, name in ipairs(self.HudData.CurMats) do
            local isOverridden = self.HudData.OvrMats[i]
            local col = isOverridden and Color(255, 100, 100) or Color(255, 255, 255)
            draw.SimpleText(i-1 .. ": " .. name, "ChatFont", boxX + 5, boxY + 5 + (textH+2) * (i+1), col)
        end

        local previewX = W / 2 + 50
        local iconSize = 64
        local gap = 10
        local infoBoxH = (iconSize + gap) * 3 + 20
        local infoBoxW = 300
        local infoY = H / 2 - infoBoxH / 2

        draw.RoundedBox(4, previewX, infoY, infoBoxW, infoBoxH, Color(0, 0, 0, 180))

        local function DrawPreview(label, matName, yPos)
            surface.SetDrawColor(255, 255, 255, 255)
            draw.SimpleText(label, "ChatFont", previewX + iconSize + 15, yPos, Color(255, 255, 200))
            draw.SimpleText(matName or "", "ChatFont", previewX + iconSize + 15, yPos + 15, Color(255, 255, 255))
            surface.SetDrawColor(255, 255, 255, 255)
            surface.DrawOutlinedRect(previewX + 5, yPos, iconSize, iconSize)
            local mat = GetCachedMaterial(matName)
            if mat then
                surface.SetMaterial(mat)
                surface.DrawTexturedRect(previewX + 5, yPos, iconSize, iconSize)
            else
                draw.SimpleText("?", "ChatFont", previewX + 5 + iconSize/2, yPos + iconSize/2, Color(255,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
        end

        DrawPreview("Tool Material:", self.ToolMatString, infoY + 10)
        DrawPreview("Original Material:", self.HudData.EntOrigMatString, infoY + 10 + iconSize + gap)
        DrawPreview("Current Material:", self.HudData.EntCurMatString, infoY + 10 + (iconSize + gap) * 2)
    end
end

function TOOL.BuildCPanel(CPanel)
    CPanel:AddControl("Header", { Description = "#tool.submaterial.help" })
    CPanel:AddControl("TextBox", { Label = "Material Path:", Command = "submaterial_override", MaxLength = "128" })
    CPanel:MatSelect("submaterial_override", list.Get("OverrideMaterials"), true, 64, 64)
end