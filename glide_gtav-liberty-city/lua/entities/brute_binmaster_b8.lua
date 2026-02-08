AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_glide_car" 
ENT.PrintName = "Brute Binmaster B8"
ENT.GlideCategory = "LC - Services"
ENT.ChassisModel = "models/props_vehicles/lcp/brute_tugmaster_b8/brute_binmaster_b8.mdl"
ENT.ExplosionGibs = { "models/props_vehicles/lcp/brute_tugmaster_b8/brute_binmaster_b8.mdl" }
ENT.Author = "Exidnost"
ENT.IconOverride = "gui/glide/lcp/brute_binmaster_b8.png"
if CLIENT then
    ENT.StartSound = "Glide.Engine.TruckStart"
    ENT.StartedSound = "glide/engines/start_tail_truck.wav"
    ENT.StoppedSound = "glide/engines/shut_down_truck_1.wav"
    ENT.HornSound = "glide/horns/large_truck_horn_2.wav"
    ENT.ReverseSound = "glide/alarms/reverse_warning.wav"
    ENT.BrakeLoopSound = "glide/wheels/rig_brake_disc_1.wav"
    ENT.BrakeReleaseSound = "glide/wheels/rig_brake_release.wav"
    ENT.BrakeSqueakSound = "Glide.Brakes.Squeak"
	
    ENT.CameraOffset = Vector( -650, 0, 140 )
    ENT.CameraAngleOffset = Angle( 5, 0, 0 )
    ENT.ExhaustOffsets = {
        { pos = Vector( 41, -46, 92 ), angle = Angle( 0, 30, 0 ), scale = 2 },
    }
	
    ENT.EngineSmokeStrips = {
        { offset = Vector( 125, 0, 10 ), angle = Angle( -20, 0, 0 ), width = 55 },

    }

    ENT.EngineFireOffsets = {
        { offset = Vector( 125, 0, 10 ), angle = Angle( 0, 90, 0 ) }, 
    }

    ENT.Headlights = {
        { offset = Vector( 124,36.5,14 ) },
        { offset = Vector( 124,-36.5,14 ) },
    }

    ENT.LightSprites = {
-- reverse lights
        { type = "reverse", offset = Vector( -232,6.5,1.5 ), dir = Vector( -1, 0, 0 ), size = 40, color = COLOR_REARLIGHT },
        { type = "reverse", offset = Vector( -232,-6.5,1.5 ), dir = Vector( -1, 0, 0 ), size = 40, color = COLOR_REARLIGHT },	
-- brake lights
        { type = "brake", offset = Vector( -232,10,1.5 ), dir = Vector( -1, 0, 0 ), size = 60 },
        { type = "brake", offset = Vector( -232,-10,1.5 ), dir = Vector( -1, 0, 0 ), size = 60 },             		
-- rear lights 
		{ type = "taillight", offset = Vector( -232,10,1.5 ), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50 },   
		{ type = "taillight", offset = Vector( -232,-10,1.5 ), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50},	
-- headlights		
        { type = "headlight", offset = Vector( 124,36.5,14 ), dir = Vector( 1, 0, 0 ), size = 30 },
        { type = "headlight", offset = Vector( 124,-36.5,14 ), dir = Vector( 1, 0, 0 ), size = 30  },	
-- turn signals			
		--front
		{ type = "signal_left", offset = Vector( 124,36.5,6 ), dir = Vector( 1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
        { type = "signal_right", offset = Vector( 124,-36.5,6 ), dir = Vector( 1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
    }

    function ENT:OnCreateEngineStream( stream )
        stream.offset = Vector( 50, 0, 50 )
        stream:LoadPreset( "hauler" )
    end
end

if SERVER then

    function ENT:InitializePhysics()
        self:SetSolid( SOLID_VPHYSICS )
        self:SetMoveType( MOVETYPE_VPHYSICS )
        self:PhysicsInit( SOLID_VPHYSICS, Vector( -80, 0, -15 ) )
    end
	
    ENT.LightBodygroups = {
        { type = "headlight", bodyGroupId = 1, subModelId = 1 },
        { type = "brake_or_taillight", bodyGroupId = 2, subModelId = 1 },
        { type = "signal_right", bodyGroupId = 3, subModelId = 1 },
        { type = "signal_left", bodyGroupId = 4, subModelId = 1 },
        { type = "reverse", bodyGroupId = 5, subModelId = 1 },
    }
	
    ENT.SpawnPositionOffset = Vector( 0, 0, 20 )
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

        self.engineBrakeTorque = 1000
		
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

        self:CreateSeat( Vector( 70,28,17 ), Angle( 0, -90, 0 ), Vector( 140.0,100,0 ), true )
		
        self:CreateSeat( Vector( 88, -28, 19 ), Angle( 0, -90, 18 ), Vector( 140.0,100,0 ), true )  		

        self:CreateWheel( Vector( 63,44,-5.0 ), {
            model = "models/props_vehicles/lcp/wheel28.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.35, 1 ),
            steerMultiplier = 1,
        } )

        self:CreateWheel( Vector( 63,-44,-5.0 ), {
            model = "models/props_vehicles/lcp/wheel28.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            modelScale = Vector( 1, 0.35, 1 ),
            steerMultiplier = 1,
        } )

        self:CreateWheel( Vector( -118,42,-5.0 ), {
            model = "models/props_vehicles/lcp/wheel28a.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.55, 1 ),

        } )

        self:CreateWheel( Vector(-118,-42,-5.0 ), {
            model = "models/props_vehicles/lcp/wheel28a.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            modelScale = Vector( 1, 0.55, 1 ),

        } )   
        self:CreateWheel( Vector( -171,42,-5.0 ), {
            model = "models/props_vehicles/lcp/wheel28a.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.55, 1 ),

        } )

        self:CreateWheel( Vector(-171,-42,-5.0 ), {
            model = "models/props_vehicles/lcp/wheel28a.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            modelScale = Vector( 1, 0.55, 1 ),

        } )  
        self:ChangeWheelRadius( 26  )
    end
	
end

