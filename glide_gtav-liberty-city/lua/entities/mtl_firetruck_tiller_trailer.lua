AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_glide_trailer"
ENT.PrintName = "MTL Firetruck Tiller Trailer"
ENT.Author = "Exidnost"
ENT.GlideCategory = "LC - FDLC"
ENT.ChassisModel = "models/props_vehicles/lcp/mtl_firetruck/mtl_firetruck_tiller_trailer.mdl"
ENT.ExplosionGibs = { "models/props_vehicles/lcp/mtl_firetruck/mtl_firetruck_tiller_trailer.mdl" }
ENT.IconOverride = "gui/glide/lcp/mtl_firetruck_tiller_trailer.png"
ENT.CanSwitchSiren = true
if CLIENT then
    ENT.LightSprites = {
        { type = "taillight", offset = Vector( -215, 32, -3 ), dir = Vector( -1, 0, 0 ) },
        { type = "taillight", offset = Vector( -215, -32, -3 ), dir = Vector( -1, 0, 0 ) },
        { type = "brake", offset = Vector( -248, 0, 43 ), dir = Vector( -1, 0, 0 ), size = 60 },
        { type = "reverse", offset = Vector( -215, 25, -3 ), dir = Vector( -1, 0, 0 ) },
        { type = "reverse", offset = Vector( -215, -25, -3 ), dir = Vector( -1, 0, 0 ) },
        { type = "signal_left", offset = Vector( -215, 39, -3 ), dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR },
        { type = "signal_right", offset = Vector( -215, -39, -3 ), dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR },
   }
   
end

if SERVER then
    function ENT:InitializePhysics()
        self:SetSolid( SOLID_VPHYSICS )
        self:SetMoveType( MOVETYPE_VPHYSICS )
        self:PhysicsInit( SOLID_VPHYSICS, Vector( 0, 0, -15 ) )
    end
    ENT.LightBodygroups = {
        { type = "headlight", bodyGroupId = 1, subModelId = 1 },
        { type = "brake", bodyGroupId = 2, subModelId = 1 },
        { type = "signal_right", bodyGroupId = 3, subModelId = 1 },
        { type = "signal_left", bodyGroupId = 4, subModelId = 1 },
        { type = "reverse", bodyGroupId = 5, subModelId = 1 },
    }
    ENT.SpawnPositionOffset = Vector( 0, 0, 50 )
    ENT.ChassisMass = 1500

    ENT.IsHeavyVehicle = true
    ENT.SuspensionHeavySound = "Glide.Suspension.CompressTruck"

    ENT.Sockets = {
        { offset = Vector( 195, 0, 20 ), id = "TruckSocket", isReceptacle = false }
    }


    function ENT:CreateFeatures()
		self:SetColor( Color( 255, 255, 255, 255 ) )
        local randomSkin = math.random(0, 3)
        self:SetSkin(randomSkin)
        local params = {
            model = "models/props_vehicles/lcp/wheel17a.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.35, 1 ),
            springStrength = 1000,
            springDamper = 2500,
        }

        -- Left
        self:CreateWheel( Vector( -111, 43, -15 ), params )

        -- Right
        params.modelAngle = Angle( 0, 180, 0 )
            modelScale = Vector( 1, 0.35, 1 ),
        self:CreateWheel( Vector( -111, -43, -15 ), params )
        self:ChangeWheelRadius( 24 ) -- wheel size
    end
end
