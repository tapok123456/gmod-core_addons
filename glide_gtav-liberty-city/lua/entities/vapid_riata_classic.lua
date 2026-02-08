AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_glide_car" 
ENT.PrintName = "Vapid Riata Classic"
ENT.GlideCategory = "LC"
ENT.ChassisModel = "models/props_vehicles/lcp/vapid_riata_classic/vapid_riata_classic.mdl"
ENT.ExplosionGibs = { "models/props_vehicles/lcp/vapid_riata_classic/vapid_riata_classic.mdl" }
ENT.Author = "Exidnost"
ENT.IconOverride = "gui/glide/lcp/vapid_riata_classic.png"

if CLIENT then
    ENT.HornSound = "glide/horns/car_horn_med_3.wav"
    ENT.CameraOffset = Vector( -290, 0, 60 )
    ENT.CameraAngleOffset = Angle( 5, 0, 0 )
    ENT.ExhaustAlpha = 30
    ENT.ExhaustOffsets = {
        { pos = Vector( -89,-47,-9 ), angle = Angle( -20, 90, 0 ), scale = 2 },
    }

    ENT.EngineSmokeStrips = {
        { offset = Vector( 112, 0, 15 ), angle = Angle( -20, 0, 0 ), width = 35 },
    }

    ENT.EngineFireOffsets = {
        { offset = Vector( 112, 0, 15 ), angle = Angle( 0, 90, 0 ) }, 
    }

    ENT.Headlights = {
        { offset = Vector( 106,35,16 ) },
        { offset = Vector( 106,-35,16 ) },
    }

    ENT.LightSprites = {
-- reverse lights
        { type = "reverse", offset = Vector( -100,43.5,9 ), dir = Vector( -1, 0, 0 ), size = 40, color = COLOR_REARLIGHT },
        { type = "reverse", offset = Vector( -100,-43.5,9 ), dir = Vector( -1, 0, 0 ), size = 40, color = COLOR_REARLIGHT },	
-- brake lights 
		{ type = "brake", offset = Vector( -100,44,16 ), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50 },   
		{ type = "brake", offset = Vector( -100,-44,16 ), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50},	
-- rear lights 
		{ type = "taillight", offset = Vector( -100,44,16 ), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50 },   
		{ type = "taillight", offset = Vector( -100,-44,16 ), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50},	
-- headlights		
        { type = "headlight", offset = Vector( 106,35,16 ), dir = Vector( 1, 0, 0 ), size = 30 },
        { type = "headlight", offset = Vector( 106,-35,16 ), dir = Vector( 1, 0, 0 ), size = 30  },	
-- turn signals			
		--front
		{ type = "signal_left", offset = Vector( 106,35,11 ), dir = Vector( 1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
        { type = "signal_right", offset = Vector( 106,-35,11 ), dir = Vector( 1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
    }

    function ENT:OnCreateEngineStream( stream )
        stream.offset = Vector( 50, 0, 50 )
        stream:LoadPreset( "insurgent" )
    end
end

if SERVER then

    function ENT:InitializePhysics()
        self:SetSolid( SOLID_VPHYSICS )
        self:SetMoveType( MOVETYPE_VPHYSICS )
        self:PhysicsInit( SOLID_VPHYSICS, Vector( 10, 0, -15 ) )
    end
	
    ENT.LightBodygroups = {
        { type = "headlight", bodyGroupId = 1, subModelId = 1 },
        { type = "brake_or_taillight", bodyGroupId = 2, subModelId = 1 },
        { type = "reverse", bodyGroupId = 5, subModelId = 1 },
        { type = "signal_right", bodyGroupId = 3, subModelId = 1 },
        { type = "signal_left", bodyGroupId = 4, subModelId = 1 },
    }
	
    ENT.SpawnPositionOffset = Vector( 0, 0, 20 )
    ENT.ChassisMass = 1000
    ENT.IsHeavyVehicle = false
    ENT.BurnoutForce = 30
    ENT.UnflipForce = 50
    ENT.AirControlForce = Vector( 0.5, 0.3, 0.5 )
    ENT.AirMaxAngularVelocity = Vector( 50, 100, 50 )

    function ENT:GetGears()
        return {

            [-1] = 2,
            [0] = 0,
            [1] = 1.54,
            [2] = 1.15,
            [3] = 0.8,
            [4] = 0.6,
            [5] = 0.5,
            [6] = 0.3
        }
    end

    function ENT:CreateFeatures()
        self.engineBrakeTorque = 600
		
        self:SetSuspensionLength( 14 )
        self:SetSpringStrength( 600 )
        self:SetSpringDamper( 2000 )


        self:SetDifferentialRatio( 2 ) 
        self:SetTransmissionEfficiency( 0.75 )
        self:SetPowerDistribution( -0.9 )
        self:SetBrakePower( 2500 )

        self:SetMinRPMTorque( 2500 )
        self:SetMaxRPMTorque( 3100 )
        self:SetMinRPM( 2000 ) 
        self:SetMaxRPM( 18000 ) 

        self:SetMaxSteerAngle( 45 )
        self:SetSteerConeChangeRate( 6 )
        self:SetSteerConeMaxSpeed( 1000 )
        self:SetSteerConeMaxAngle( 0.30 )
		self:SetCounterSteer ( 0.2 )

        self:SetForwardTractionMax( 3800 )
        self:SetSideTractionMultiplier( 20 )
        self:SetSideTractionMaxAng( 25 )
        self:SetSideTractionMax( 2400 )
        self:SetSideTractionMin( 800 )
		
		self:SetTurboCharged( false )
		self:SetFastTransmission( false ) 

        self:CreateSeat( Vector( -6,23,0 ), Angle( 0, -90, 0 ), Vector( 20.0,80,50 ), true )
		
        self:CreateSeat( Vector( 8, -23, 4 ), Angle( 0, -90, 18 ), Vector( 20.0,-80,50 ), true )       
		self:CreateSeat( Vector( -28, -24, 1 ), Angle( 0, -90, 18 ), Vector( -38.0,-80,50 ), true )
		self:CreateSeat( Vector( -28, 24, 1 ), Angle( 0, -90, 18 ), Vector( -38.0,80,50  ), true )
		self:CreateSeat( Vector( -28, 0, 1 ), Angle( 0, -90, 18 ), Vector( -38.0,80,50  ), true )

        self:CreateWheel( Vector( 76,39,0.0 ), {
            model = "models/props_vehicles/lcp/wheel09.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.35, 1 ),
            steerMultiplier = 1,
        } )

        self:CreateWheel( Vector( 76,-39,0.0 ), {
            model = "models/props_vehicles/lcp/wheel09.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            modelScale = Vector( 1, 0.35, 1 ),
            steerMultiplier = 1,
        } )

        self:CreateWheel( Vector( -51,39,0.0 ), {
            model = "models/props_vehicles/lcp/wheel09.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.35, 1 ),

        } )

        self:CreateWheel( Vector(-51,-39,0.0 ), {
            model = "models/props_vehicles/lcp/wheel09.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            modelScale = Vector( 1, 0.35, 1 ),

        } )        

        self:ChangeWheelRadius( 19 )
    end
	
end

