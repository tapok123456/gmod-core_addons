AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_glide_car" 
ENT.PrintName = "Brute Bus"
ENT.GlideCategory = "LC - Services"
ENT.ChassisModel = "models/props_vehicles/lcp/brute_bus/brute_bus.mdl"
ENT.ExplosionGibs = { "models/props_vehicles/lcp/brute_bus/brute_bus.mdl" }
ENT.Author = "Exidnost"
ENT.IconOverride = "gui/glide/lcp/brute_bus.png"

if CLIENT then
    ENT.StartSound = "Glide.Engine.TruckStart"
    ENT.StartedSound = "glide/engines/start_tail_truck.wav"
    ENT.StoppedSound = "glide/engines/shut_down_truck_1.wav"
    ENT.HornSound = "glide/horns/large_truck_horn_2.wav"
    ENT.ReverseSound = "glide/alarms/reverse_warning.wav"
    ENT.BrakeLoopSound = "glide/wheels/rig_brake_disc_1.wav"
    ENT.BrakeReleaseSound = "glide/wheels/rig_brake_release.wav"
    ENT.BrakeSqueakSound = "Glide.Brakes.Squeak"
	
    ENT.CameraOffset = Vector( -650, 0, 100 )
    ENT.CameraAngleOffset = Angle( 5, 0, 0 )
    ENT.ExhaustAlpha = 60
    ENT.ExhaustOffsets = {
        { pos = Vector( -266,54,83 ), angle = Angle( 0, -20, 0 ), scale = 2 },
    }

    ENT.EngineSmokeStrips = {
        { offset = Vector( -268, 60, 5 ), angle = Angle( -40, 90, 0 ), width = 15 },
        { offset = Vector( -268, -60, 5 ), angle = Angle( -40, -90, 0 ), width = 15 },
    }

    ENT.EngineFireOffsets = {
        { offset = Vector( 255, 0, -17 ), angle = Angle( 0, 90, 0 ) }, 
    }

    ENT.Headlights = {
        { offset = Vector( 255,34,-16 ) },
        { offset = Vector( 255,-34,-16 ) },
    }

    ENT.LightSprites = {
-- brake lights
        { type = "brake", offset = Vector( -285,54,4 ), dir = Vector( -1, 0, 0 ), size = 60 },
        { type = "brake", offset = Vector( -285,-54,4 ), dir = Vector( -1, 0, 0 ), size = 60 },             		
-- rear lights 
		{ type = "taillight", offset = Vector( -285,54,10.4 ), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50 },   
		{ type = "taillight", offset = Vector( -285,-54,10.4), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50},	
-- headlights		
        { type = "headlight", offset = Vector( 255,24.5,-16 ), dir = Vector( 1, 0, 0 ), size = 30 },
        { type = "headlight", offset = Vector( 255,-24.5,-16 ), dir = Vector( 1, 0, 0 ), size = 30  },	
        { type = "headlight", offset = Vector( 255,34,-16 ), dir = Vector( 1, 0, 0 ), size = 30 },
        { type = "headlight", offset = Vector( 255,-34,-16 ), dir = Vector( 1, 0, 0 ), size = 30  },	
        { type = "headlight", offset = Vector( 255,44,-16 ), dir = Vector( 1, 0, 0 ), size = 30 },
        { type = "headlight", offset = Vector( 255,-44,-16 ), dir = Vector( 1, 0, 0 ), size = 30  },	
-- turn signals			
		--front
		{ type = "signal_left", offset = Vector( 255,52.5,-16 ), dir = Vector( 1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
        { type = "signal_right", offset = Vector( 255,-52.5,-16 ), dir = Vector( 1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
		--rear
		{ type = "signal_left", offset = Vector( -285,54,-3 ), dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
        { type = "signal_right", offset = Vector( -285,-54,-3 ), dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
    }

    function ENT:OnCreateEngineStream( stream )
        stream.offset = Vector( 50, 0, 50 )
        stream:LoadPreset( "airbus" )
    end
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
    }
	
    ENT.SpawnPositionOffset = Vector( -50, 0, 20 )
    ENT.ChassisMass = 1800
    ENT.IsHeavyVehicle = true
    ENT.BurnoutForce = 10
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
		self:SetColor( Color( 255, 255, 255, 255 ) )
        local randomSkin = math.random(0, 4)
        self:SetSkin(randomSkin)
        self.engineBrakeTorque = 800
		
        self:SetSuspensionLength( 15 )
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

        self:CreateSeat( Vector( 196,35,4 ), Angle( 0, -90, 0 ), Vector( 220.0,-100,0 ), true )
		
        self:CreateSeat( Vector( 84, -34, 3 ), Angle( 0, -90, 8 ), Vector( 220.0,-100,0 ), true )  		
        self:CreateSeat( Vector( 84,34,3 ), Angle( 0, -90, 8 ), Vector( 220.0,-100,0 ), true )

        self:CreateSeat( Vector( -34, -34, 3 ), Angle( 0, -90, 8 ), Vector( 220.0,-100,0 ), true )  		
        self:CreateSeat( Vector( -34,34,3 ), Angle( 0, -90, 8 ), Vector( 220.0,-100,0 ), true )

        self:CreateSeat( Vector( -184, -34, 3 ), Angle( 0, -90, 8 ), Vector( -80.0,-100,0 ), true )  		
        self:CreateSeat( Vector( -184,34,3 ), Angle( 0, -90, 8 ), Vector( -80.0,-100,0 ), true )

        self:CreateSeat( Vector( -234, -34, 3 ), Angle( 0, -90, 8 ), Vector( -80.0,-100,0 ), true )  		
        self:CreateSeat( Vector( -234,34,3 ), Angle( 0, -90, 8 ), Vector( -80.0,-100,0 ), true )
        self:CreateSeat( Vector( -234, 0, 3 ), Angle( 0, -90, 8 ), Vector( -80.0,-100,0 ), true )  		

        self:CreateWheel( Vector( 156,50,-16 ), {
            model = "models/props_vehicles/lcp/wheel11.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.35, 1 ),
            steerMultiplier = 1,
        } )

        self:CreateWheel( Vector( 156,-50,-16 ), {
            model = "models/props_vehicles/lcp/wheel11.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            modelScale = Vector( 1, 0.35, 1 ),
            steerMultiplier = 1,
        } )

        self:CreateWheel( Vector( -155.5,52,-16 ), {
            model = "models/props_vehicles/lcp/wheel11a.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.5, 1 ),

        } )

        self:CreateWheel( Vector(-155.5,-52,-16 ), {
            model = "models/props_vehicles/lcp/wheel11a.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            modelScale = Vector( 1, 0.5, 1 ),

        } )   

        self:ChangeWheelRadius( 24  )
    end
	
end

