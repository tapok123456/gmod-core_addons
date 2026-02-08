AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_glide_car" 
ENT.PrintName = "HVY Ripley"
ENT.GlideCategory = "LC - Services"
ENT.ChassisModel = "models/props_vehicles/lcp/hvy_ripley/hvy_ripley.mdl"
ENT.ExplosionGibs = { "models/props_vehicles/lcp/hvy_ripley/hvy_ripley.mdl" }
ENT.Author = "Exidnost"
ENT.IconOverride = "gui/glide/lcp/hvy_ripley.png"

if CLIENT then
    ENT.HornSound = "glide/horns/large_truck_horn_2.wav"
    ENT.CameraOffset = Vector( -460, 0, 60 )
    ENT.CameraAngleOffset = Angle( 5, 0, 0 )

    ENT.EngineSmokeStrips = {
        { offset = Vector( 1, 62, 13 ), angle = Angle( -20, 90, 0 ), width = 45 },
        { offset = Vector( 1, -62, 13 ), angle = Angle( -20, -90, 0 ), width = 45 },
    }

    ENT.EngineFireOffsets = {
        { offset = Vector( 104, 0, 3 ), angle = Angle( 0, 90, 0 ) }, 
    }

    ENT.Headlights = {
        { offset = Vector( 207,29,-25 ) },
        { offset = Vector( 207,-29,-25 ) },
    }

    ENT.LightSprites = {
-- reverse lights
        { type = "reverse", offset = Vector( -168,43,-8 ), dir = Vector( -1, 0, 0 ), size = 40, color = COLOR_REARLIGHT },
        { type = "reverse", offset = Vector( -168,-43,-8 ), dir = Vector( -1, 0, 0 ), size = 40, color = COLOR_REARLIGHT },	
-- brake lights
        { type = "brake", offset = Vector( -168,49,-8 ), dir = Vector( -1, 0, 0 ), size = 60 },
        { type = "brake", offset = Vector( -168,-49,-8 ), dir = Vector( -1, 0, 0 ), size = 60 },             		
-- rear lights 
		{ type = "taillight", offset = Vector( -168,49,-8 ), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50 },   
		{ type = "taillight", offset = Vector( -168,-49,-8 ), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50},	
-- headlights		
        { type = "headlight", offset = Vector( 207,29,-25 ), dir = Vector( 1, 0, 0 ), size = 30 },
        { type = "headlight", offset = Vector( 207,-29,-25 ), dir = Vector( 1, 0, 0 ), size = 30  },	
-- turn signals			
		--front
		{ type = "signal_left", offset = Vector( 207,54,-20 ), dir = Vector( 0.8, 1, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
        { type = "signal_right", offset = Vector( 207,-54,-20 ), dir = Vector( 0.8, -1, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
		--rear
		{ type = "signal_left", offset = Vector( -168,56,-8 ), dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
        { type = "signal_right", offset = Vector( -168,-56,-8 ), dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
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
        self:PhysicsInit( SOLID_VPHYSICS, Vector( 0, 0, -15 ) )
    end
	
    ENT.LightBodygroups = {
        { type = "headlight", bodyGroupId = 1, subModelId = 1 },
        { type = "brake_or_taillight", bodyGroupId = 2, subModelId = 1 },
        { type = "signal_right", bodyGroupId = 3, subModelId = 1 },
        { type = "signal_left", bodyGroupId = 4, subModelId = 1 },
        { type = "reverse", bodyGroupId = 5, subModelId = 1 },
    }
	
    ENT.SpawnPositionOffset = Vector( 0, 0, 20 )
    ENT.ChassisMass = 1000
    ENT.IsHeavyVehicle = true
    ENT.BurnoutForce = 10
    ENT.UnflipForce = 50
    ENT.AirControlForce = Vector( 0.5, 0.3, 0.5 )
    ENT.AirMaxAngularVelocity = Vector( 50, 100, 50 )

    function ENT:GetGears()
        return {

            [-1] = 1,
            [0] = 0,
            [1] = 2.5,
            [2] = 0.5,

        }
    end

    function ENT:CreateFeatures()
		self:SetColor( Color( 255, 255, 255, 255 ) )
        self.engineBrakeTorque = 600
		
        self:SetSuspensionLength( 15 )
        self:SetSpringStrength( 1000 )
        self:SetSpringDamper( 3000 )


        self:SetDifferentialRatio( 2 ) 
        self:SetTransmissionEfficiency( 0.75 )
        self:SetPowerDistribution( -0.9 )
        self:SetBrakePower( 2500 )

        self:SetMinRPMTorque( 1000 )
        self:SetMaxRPMTorque( 1500 )
        self:SetMinRPM( 2000 ) 
        self:SetMaxRPM( 10000 ) 

        self:SetMaxSteerAngle( 45 )
        self:SetSteerConeChangeRate( 6 )
        self:SetSteerConeMaxSpeed( 1000 )
        self:SetSteerConeMaxAngle( 0.30 )
		self:SetCounterSteer ( 0.2 )

        self:SetForwardTractionMax( 4000 )
        self:SetSideTractionMultiplier( 20 )
        self:SetSideTractionMaxAng( 25 )
        self:SetSideTractionMax( 2400 )
        self:SetSideTractionMin( 800 )
		
		self:SetTurboCharged( false )
		self:SetFastTransmission( false ) 

        self:CreateSeat( Vector( 138,41,-22 ), Angle( 0, -90, 0 ), Vector( 20.0,80,50 ), true )
		
        self:CreateSeat( Vector( 152, -41, -21 ), Angle( 0, -90, 18 ), Vector( 20.0,-80,50 ), true )       

        self:CreateWheel( Vector( 72,44,-10 ), {
            model = "models/props_vehicles/lcp/wheel11.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.5, 1 ),
            steerMultiplier = 1,
        } )

        self:CreateWheel( Vector( 72,-44,-10 ), {
            model = "models/props_vehicles/lcp/wheel11.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            modelScale = Vector( 1, 0.5, 1 ),
            steerMultiplier = 1,
        } )

        self:CreateWheel( Vector( -73,44,-10 ), {
            model = "models/props_vehicles/lcp/wheel11.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.5, 1 ),

        } )

        self:CreateWheel( Vector(-73,-44,-10 ), {
            model = "models/props_vehicles/lcp/wheel11.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            modelScale = Vector( 1, 0.5, 1 ),

        } )        

        self:ChangeWheelRadius( 35 )
    end
	
end

