AddCSLuaFile()

if (CLIENT) then
	net.Receive("selfportrait_hook", function()
		timer.Simple(0.1, function()
			hook.Add("ShouldDrawLocalPlayer", "selfportrait_cam", function()
				if LocalPlayer():Alive() and LocalPlayer():GetActiveWeapon() and LocalPlayer():GetActiveWeapon():GetClass() == "selfportrait_camera" then
					return true
				else
					hook.Remove("ShouldDrawLocalPlayer", "selfportrait_cam")
				end
			end)
		end)
	end)
	net.Receive("selfportrait_bonereset", function()
		ResetBones(LocalPlayer())
	end)
else
	util.AddNetworkString("selfportrait_hook")
	util.AddNetworkString("selfportrait_bonereset")
	util.AddNetworkString("selfportrait_idonthavehands")
	net.Receive("selfportrait_idonthavehands", function()
		pl:GetWeapon("selfportrait_camera"):Remove()
	end)
end

SWEP.ViewModel = Model("models/weapons/c_arms_animations.mdl")
SWEP.WorldModel = Model("models/weapons/w_camphone.mdl")

SWEP.Primary.ClipSize           = -1
SWEP.Primary.DefaultClip        = -1
SWEP.Primary.Automatic          = false
SWEP.Primary.Ammo             	= "none"

SWEP.Secondary.ClipSize         = -1
SWEP.Secondary.DefaultClip      = -1
SWEP.Secondary.Automatic        = true
SWEP.Secondary.Ammo				= "none"

SWEP.PrintName  = "Self-Portrait Camera"

if (CLIENT) then
	SWEP.WepSelectIcon = surface.GetTextureID("weapons/selfportrait_camera")
	SWEP.BounceWeaponIcon = false
	SWEP.Author = ""
	SWEP.Contact = ""
	SWEP.Purpose = ""
	SWEP.Instructions = [[ALT - Move Arm
	ALT+Mouse2 - Arm Roll/Forearm Flex
	Mouse2 - Move Camera
	Mouse2+Shift - Camera Roll/FoV
	Shift - Move Hand
	Shift+Alt - Hand Roll]]
end

SWEP.Slot		= 5
SWEP.SlotPos	= 1

SWEP.DrawAmmo           = false
SWEP.DrawCrosshair      = false
SWEP.Spawnable          = true

SWEP.ShootSound = Sound("NPC_CScanner.TakePhoto")

if (SERVER) then
	SWEP.AutoSwitchTo	= false
	SWEP.AutoSwitchFrom	= false
end

function SWEP:SetupDataTables()
	self:NetworkVar( "Float", 0, "Pitch" )
	self:NetworkVar( "Float", 1, "Yaw" )
	self:NetworkVar( "Float", 2, "Roll" )
	self:NetworkVar( "Float", 3, "ArmPitch" )
	self:NetworkVar( "Float", 4, "ArmYaw" )
	self:NetworkVar( "Float", 5, "ArmRoll" )
	self:NetworkVar( "Float", 6, "ForearmFlex" )
	self:NetworkVar( "Float", 7, "HandPitch" )
	self:NetworkVar( "Float", 8, "HandYaw" )
	self:NetworkVar( "Float", 9, "HandRoll" )
	self:NetworkVar( "Float", 10, "Zoom" )
	if ( SERVER ) then
		self:SetPitch(0)
		self:SetYaw(0)
		self:SetRoll(0)
		self:SetArmPitch(0)
		self:SetArmYaw(0)
		self:SetArmRoll(0)
		self:SetForearmFlex(0)
		self:SetHandPitch(0)
		self:SetHandYaw(0)
		self:SetHandRoll(0)
		self:SetZoom(75)
	end
end

function SWEP:Initialize()
	self:SetHoldType("pistol")
end

function SWEP:Reload()
	self:SetPitch(0)
	self:SetYaw(0)
	self:SetRoll(0)
	self:SetArmPitch(0)
	self:SetArmYaw(0)
	self:SetArmRoll(0)
	self:SetForearmFlex(0)
	self:SetHandPitch(0)
	self:SetHandYaw(0)
	self:SetHandRoll(0)
	self:SetZoom(self.Owner:GetInfoNum("fov_desired", 75))
end

function SWEP:PrimaryAttack()
	self:DoShootEffect()
	if (!game.SinglePlayer() and SERVER) then return end
	if (CLIENT and !IsFirstTimePredicted()) then return end
	self.Owner:ConCommand("jpeg")
end

function SWEP:SecondaryAttack()
end

function SWEP:DoShootEffect()
	self:EmitSound( self.ShootSound )
	--self:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
	--self.Owner:SetAnimation( PLAYER_ATTACK1 )

	if ( SERVER and !game.SinglePlayer() ) then
		local vPos = self.Owner:GetShootPos()
		local vForward = self.Owner:GetAimVector()

		local trace = {}
		trace.start = vPos
		trace.endpos = vPos + vForward * 256
		trace.filter = self.Owner

		local tr = util.TraceLine( trace )

		local effectdata = EffectData()
		effectdata:SetOrigin( tr.HitPos )
		util.Effect( "camera_flash", effectdata, true )
	end
end

function SWEP:TranslateFOV(current_fov)
	return self:GetZoom()
end


function SWEP:Tick()

		if ( CLIENT and self.Owner != LocalPlayer() ) then return end -- If someone is spectating a player holding this weapon, bail

		local cmd = self.Owner:GetCurrentCommand()

		if cmd:KeyDown(IN_ATTACK2) and cmd:KeyDown(IN_SPEED) then
				self:SetZoom(math.Clamp( self:GetZoom() + cmd:GetMouseY() * 0.1, 0.1, 175 )) -- Handles zooming
				self:SetRoll(self:GetRoll() + -cmd:GetMouseX() * 0.025)
				return
		end
		if cmd:KeyDown(IN_WALK) and cmd:KeyDown(IN_ATTACK2) then
				self:SetForearmFlex(self:GetForearmFlex() + cmd:GetMouseY() * 0.025)
				self:SetArmRoll(self:GetArmRoll() + -cmd:GetMouseX() * 0.025)
				return
		end
		if cmd:KeyDown(IN_SPEED) and cmd:KeyDown(IN_WALK) then
				self:SetHandRoll(self:GetHandRoll() + -cmd:GetMouseX() * 0.025)
				return
		end
		if cmd:KeyDown(IN_SPEED) then
				self:SetHandPitch(self:GetHandPitch() + -cmd:GetMouseX() * 0.025)
				self:SetHandYaw(self:GetHandYaw() + -cmd:GetMouseY() * 0.025)
				return
		end
		if cmd:KeyDown(IN_ATTACK2) then
				self:SetPitch(self:GetPitch() + cmd:GetMouseY() * 0.025)
				self:SetYaw(self:GetYaw() + cmd:GetMouseX() * 0.025)
				return
		end
		if cmd:KeyDown(IN_WALK) then
				self:SetArmPitch(self:GetArmPitch() + cmd:GetMouseY() * 0.025)
				self:SetArmYaw(self:GetArmYaw() + cmd:GetMouseX() * 0.025)
				return
		end
end

function SWEP:Equip()
	if (self:GetZoom() == 70 and self.Owner:IsPlayer() and !self.Owner:IsBot()) then
		self:SetZoom(self.Owner:GetInfoNum("fov_desired", 75))
	end
end

function SWEP:Deploy()
		if (SERVER) then
				net.Start("selfportrait_hook")
				net.Send(self:GetOwner())
		end
		return true
end

local function ResetBones(ply)
	if IsValid(ply) then
		local RHand = ply:LookupBone("ValveBiped.Bip01_R_Hand")
		local RArm = ply:LookupBone("ValveBiped.Bip01_R_UpperArm")
		local RFArm = ply:LookupBone("ValveBiped.Bip01_R_Forearm")
		local RClav = ply:LookupBone("ValveBiped.Bip01_R_Clavicle")
		if RHand then ply:ManipulateBoneAngles(RHand, Angle(0,0,0)) end
		if RFarm then ply:ManipulateBoneAngles(RFArm, Angle(0,0,0)) end
		if RArm then ply:ManipulateBoneAngles(RArm, Angle(0,0,0)) end
		if RClav then ply:ManipulateBoneAngles(RClav, Angle(0,0,0)) end
	end
end

function SWEP:Holster()
	local owner = self:GetOwner()

	if IsValid(owner) then
		ResetBones(owner)
	end
	return true
end

function SWEP:OnRemove()
	if self:GetOwner() then
		ResetBones(self:GetOwner())
	end
end

function SWEP:OnDrop()
	if self:GetOwner() then
		if (SERVER) then
			ResetBones(self:GetOwner())
			net.Start("selfportrait_bonereset")
			net.Send(self:GetOwner())
		end
	end
end

function SWEP:ShouldDropOnDie() return false end

if (CLIENT) then
function SWEP:DrawHUD() end

function SWEP:HUDShouldDraw(name)
	if (name == "CHudWeaponSelection") then return true end
	if (name == "CHudChat") then return true end
	return false
end

function SWEP:FreezeMovement()
	if (self.Owner:KeyDown(IN_ATTACK2) or self.Owner:KeyReleased(IN_ATTACK2)) then return true end
	if (self.Owner:KeyDown(IN_WALK) or self.Owner:KeyReleased(IN_WALK)) then return true end
	if (self.Owner:KeyDown(IN_SPEED) or self.Owner:KeyReleased(IN_SPEED)) then return true end
	return false
end

function SWEP:DrawWorldModel()
	if self:GetOwner() == LocalPlayer() then return end
	self:DrawModel()
end

function SWEP:CalcView(ply, origin, angles, fov)
	local RHand = self:GetOwner():LookupBone("ValveBiped.Bip01_R_Hand")
	local RArm = self:GetOwner():LookupBone("ValveBiped.Bip01_R_UpperArm")
	local RFArm = self:GetOwner():LookupBone("ValveBiped.Bip01_R_Forearm")
	local RClav = self:GetOwner():LookupBone("ValveBiped.Bip01_R_Clavicle")
	if not RHand and not self.handMissing then
		GAMEMODE:AddNotify("You have no right hand!", NOTIFY_GENERIC, 10)
		surface.PlaySound("ambient/water/drip"..math.random(1, 4)..".wav")
		net.Start("selfportrait_idonthavehands")
		net.SendToServer()
		self.handMissing = true
	end
	local orig, ang = self:GetOwner():GetBonePosition(RHand)
		local origup = ang:Up()*-6
		local origfw = ang:Forward()*6
		local origrt = ang:Right()*1
	local origin = orig + origup + origfw + origrt
	local angles = self:GetOwner():EyeAngles()
	angles:RotateAroundAxis(angles:Up(), 180)
	angles = angles + Angle(self:GetPitch(), -self:GetYaw(), -self:GetRoll())
	if RHand then self:GetOwner():ManipulateBoneAngles(RHand, Angle(self:GetHandYaw(), self:GetHandPitch(), self:GetHandRoll())) end
	if RFArm then self:GetOwner():ManipulateBoneAngles(RFArm, Angle(0,self:GetForearmFlex(),0)) end
	if RArm then self:GetOwner():ManipulateBoneAngles(RArm, Angle(-self:GetArmYaw()*.6, self:GetArmPitch(), self:GetArmRoll())) end
	if RClav then self:GetOwner():ManipulateBoneAngles(RClav, Angle(self:GetArmYaw()*.4, 0, -self:GetArmPitch()*.4)) end
	return origin, angles, fov
end

function SWEP:AdjustMouseSensitivity()
	if (self.Owner:KeyDown(IN_SPEED)) then return 1 end
	return self:GetZoom() / 80
end
end