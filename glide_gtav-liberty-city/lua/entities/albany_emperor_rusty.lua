AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_glide_car" 
ENT.PrintName = "Albany Emperor Rusty"
ENT.GlideCategory = "LC"
ENT.ChassisModel = "models/props_vehicles/lcp/albany_emperor/albany_emperor_rusty.mdl"
ENT.ExplosionGibs = { "models/props_vehicles/lcp/albany_emperor/albany_emperor_rusty.mdl" }
ENT.Author = "Exidnost"
ENT.IconOverride = "gui/glide/lcp/albany_emperor_rusty.png"

if CLIENT then
    ENT.HornSound = "glide/horns/car_horn_med_3.wav"
    ENT.CameraOffset = Vector( -290, 0, 40 )
    ENT.CameraAngleOffset = Angle( 5, 0, 0 )
    ENT.ExhaustAlpha = 90
    ENT.ExhaustOffsets = {
        { pos = Vector( -128,-29,-18 ), angle = Angle( -20, 20, 0 ), scale = 2 },
    }

    ENT.EngineSmokeStrips = {
        { offset = Vector( 104, 0, 3 ), angle = Angle( -20, 0, 0 ), width = 45 },
    }

    ENT.EngineFireOffsets = {
        { offset = Vector( 104, 0, 3 ), angle = Angle( 0, 90, 0 ) }, 
    }

    ENT.Headlights = {
        { offset = Vector( 101,26,4 )  },
        { offset = Vector( 101,-26,4 )  },
    }

    ENT.LightSprites = {
-- reverse lights
        { type = "reverse", offset = Vector( -124,9.5,4 ), dir = Vector( -1, 0, 0 ), size = 40, color = COLOR_REARLIGHT },
        { type = "reverse", offset = Vector( -124,-9.5,4 ), dir = Vector( -1, 0, 0 ), size = 40, color = COLOR_REARLIGHT },	
-- brake lights
        { type = "brake", offset = Vector( -132,37,3 ), dir = Vector( -1, 0, 0 ), size = 60 },
        { type = "brake", offset = Vector( -132,-37,3 ), dir = Vector( -1, 0, 0 ), size = 60 },             		
-- rear lights 
		{ type = "taillight", offset = Vector( -132,37,-2.5 ), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50 },   
		{ type = "taillight", offset = Vector( -132,-37,-2.5 ), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50},	
-- headlights		
        { type = "headlight", offset = Vector( 101,26,4 ), dir = Vector( 1, 0, 0 ), size = 30 },
        { type = "headlight", offset = Vector( 101,-26,4 ), dir = Vector( 1, 0, 0 ), size = 30  },	
        { type = "headlight", offset = Vector( 101,-34,4 ), dir = Vector( 1, 0, 0 ), size = 25  },	
-- turn signals			
		--front
        { type = "signal_right", offset = Vector( 99,-40,4 ), dir = Vector( 0.8, -1, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
		--rear
		{ type = "signal_left", offset = Vector( -131,37,8 ), dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
        { type = "signal_right", offset = Vector( -131,-37,8 ), dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
    }

    function ENT:OnCreateEngineStream( stream )
        stream.offset = Vector( 50, 0, 50 )
        stream:LoadPreset( "police_cruiser" )
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
        { type = "reverse", bodyGroupId = 5, subModelId = 1 },
    }
	
    ENT.SpawnPositionOffset = Vector( 0, 0, 20 )
    ENT.ChassisMass = 1000
    ENT.IsHeavyVehicle = false
    ENT.BurnoutForce = 20
    ENT.UnflipForce = 50
    ENT.AirControlForce = Vector( 0.5, 0.3, 0.5 )
    ENT.AirMaxAngularVelocity = Vector( 50, 100, 50 )
	ENT.StartupTime	= 1.4	
    function ENT:GetGears()
        return {

            [-1] = 1,
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
        local randomSkin = math.random(0, 8)
        self:SetSkin(randomSkin)
        self.engineBrakeTorque = 500
		
        self:SetSuspensionLength( 18 )
        self:SetSpringStrength( 300 )
        self:SetSpringDamper( 1000 )


        self:SetDifferentialRatio( 2 ) 
        self:SetTransmissionEfficiency( 0.75 )
        self:SetPowerDistribution( -0.9 )
        self:SetBrakePower( 2500 )

        self:SetMinRPMTorque( 2000 )
        self:SetMaxRPMTorque( 2500 )
        self:SetMinRPM( 2000 ) 
        self:SetMaxRPM( 11000 ) 

        self:SetMaxSteerAngle( 45 )
        self:SetSteerConeChangeRate( 6 )
        self:SetSteerConeMaxSpeed( 1000 )
        self:SetSteerConeMaxAngle( 0.30 )
		self:SetCounterSteer ( 0.2 )

        self:SetForwardTractionMax( 2500 )
        self:SetSideTractionMultiplier( 20 )
        self:SetSideTractionMaxAng( 25 )
        self:SetSideTractionMax( 2000 )
        self:SetSideTractionMin( 800 )
		
		self:SetTurboCharged( false )
		self:SetFastTransmission( false ) 

        self:CreateSeat( Vector( -16,19,-14 ), Angle( 0, -90, 0 ), Vector( 20.0,80,50 ), true )
		
        self:CreateSeat( Vector( -1, -19, -13 ), Angle( 0, -90, 18 ), Vector( 20.0,-80,50 ), true )       
		self:CreateSeat( Vector( -39, -20, -13 ), Angle( 0, -90, 18 ), Vector( -38.0,-80,50 ), true )
		self:CreateSeat( Vector( -39, 20, -13 ), Angle( 0, -90, 18 ), Vector( -38.0,80,50  ), true )
		self:CreateSeat( Vector( -39, 0, -13 ), Angle( 0, -90, 18 ), Vector( -38.0,80,50  ), true )

        self:CreateWheel( Vector( 68,36,0 ), {
            model = "models/props_vehicles/lcp/wheel29a.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.35, 1 ),
            steerMultiplier = 1,
        } )

        self:CreateWheel( Vector( 68,-36,0 ), {
            model = "models/props_vehicles/lcp/wheel29a.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            modelScale = Vector( 1, 0.35, 1 ),
            steerMultiplier = 1,
        } )

        self:CreateWheel( Vector( -69,36,0 ), {
            model = "models/props_vehicles/lcp/wheel29a.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.35, 1 ),

        } )

        self:CreateWheel( Vector(-69,-36,0 ), {
            model = "models/props_vehicles/lcp/wheel29a.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            modelScale = Vector( 1, 0.35, 1 ),

        } )        

        self:ChangeWheelRadius( 17 )
    end
	
end

