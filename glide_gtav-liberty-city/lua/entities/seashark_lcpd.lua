AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_glide_boat"
ENT.PrintName = "Seashark LCPD"
ENT.GlideCategory = "LC - LCPD"
ENT.ChassisModel = "models/props_vehicles/lcp/seashark/seashark_lcpd.mdl"
ENT.ExplosionGibs = { "models/props_vehicles/lcp/seashark/seashark_lcpd.mdl" }
ENT.Author = "Exidnost"
ENT.IconOverride = "gui/glide/lcp/seashark_lcpd.png"
ENT.CanSwitchHeadlights = true

function ENT:GetFirstPersonOffset( _, localEyePos )
    localEyePos[3] = localEyePos[3] + 5
    return localEyePos
end

if CLIENT then
    ENT.CameraOffset = Vector( -240, 0, 70 )
    ENT.WaterParticlesScale = 0.7

    ENT.PropellerPositions = {
        Vector( -60, 0, -10 )
    }

    ENT.EngineFireOffsets = {
        { offset = Vector( -46, 0, 16 ), angle = Angle( -40, 0, 0 ), scale = 0.8 }
    }

    ENT.EngineSmokeStrips = {
        { offset = Vector( -46, 0, 16 ), angle = Angle( 0, 180, 0 ), width = 10 }
    }
    ENT.Headlights = {
        { offset = Vector( 36,13,36.5 ) },
        { offset = Vector( 36,-13,36.5 ) },
    }
    ENT.LightSprites = {
-- headlights		
        { type = "headlight", offset = Vector( 36,13,36.5 ), dir = Vector( 1, 0, 0 ), size = 30 },
        { type = "headlight", offset = Vector( 36,-13,36.5 ), dir = Vector( 1, 0, 0 ), size = 30  },	
    }
    function ENT:OnCreateEngineStream( stream )
        stream:LoadPreset( "seashark" )
    end

    local SEAT_1_POSE = {
        ["ValveBiped.Bip01_L_UpperArm"] = Angle( -10, 5, 0 ),
        ["ValveBiped.Bip01_R_UpperArm"] = Angle( 10, 8, -5 ),
        ["ValveBiped.Bip01_L_Thigh"] = Angle( -15, -5, 0 ),
        ["ValveBiped.Bip01_L_Calf"] = Angle( -25, 40, 0 ),
        ["ValveBiped.Bip01_R_Thigh"] = Angle( 15, -5, 0 ),
        ["ValveBiped.Bip01_R_Calf"] = Angle( 25, 40, 0 )
    }

    local SEAT_2_POSE = {
        ["ValveBiped.Bip01_L_Thigh"] = Angle( -15, 10, 0 ),
        ["ValveBiped.Bip01_L_Calf"] = Angle( -15, 10, 0 ),
        ["ValveBiped.Bip01_R_Thigh"] = Angle( 15, 10, 0 ),
        ["ValveBiped.Bip01_R_Calf"] = Angle( 15, 10, 0 )
    }

    function ENT:GetSeatBoneManipulations( seatIndex )
        return seatIndex > 1 and SEAT_2_POSE or SEAT_1_POSE
    end
end

if SERVER then
    ENT.LightBodygroups = {
        { type = "headlight", bodyGroupId = 1, subModelId = 1 },
    }
    ENT.ChassisMass = 700
    ENT.SpawnPositionOffset = Vector( 0, 0, 50 )
    ENT.FallOnCollision = true
    ENT.FallWhileUnderWater = false

    ENT.BuoyancyPointsXSpacing = 0.9
    ENT.BuoyancyPointsYSpacing = 0.7

    ENT.BoatParams = {
        waterAngularDrag = Vector( -1.5, -8, -10 ), -- (Roll, pitch, yaw)

        buoyancyDepth = 10,
        turbulanceForce = 40,
        maxSpeed = 1300,

        engineForce = 400,
        engineLiftForce = 900,

        turnForce = 700,
        rollForce = 80
    }

    function ENT:CreateFeatures()
		self:SetColor( Color( 255, 255, 255, 255 ) )

        self:CreateSeat( Vector( -19, 0, 18 ), Angle( 0, 270, -10 ), Vector( 20, 55, 25 ), true )
        self:CreateSeat( Vector( -30, 0, 22 ), Angle( 0, 270, 0 ), Vector( -80, 55, 25 ), true )    end
end
