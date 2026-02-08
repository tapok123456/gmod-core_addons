AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_glide_car" 
ENT.PrintName = "Vapid Sadler Ambulance"
ENT.GlideCategory = "LC - FDLC"
ENT.ChassisModel = "models/props_vehicles/lcp/vapid_sadler/vapid_sadler_ambulance.mdl"
ENT.ExplosionGibs = { "models/props_vehicles/lcp/vapid_sadler/vapid_sadler_ambulance.mdl" }
ENT.Author = "Exidnost"
ENT.IconOverride = "gui/glide/lcp/vapid_sadler_ambulance.png"
ENT.CanSwitchSiren = true
if CLIENT then

    ENT.CameraOffset = Vector( -460, 0, 90 )
    ENT.CameraAngleOffset = Angle( 5, 0, 0 )
    ENT.ExhaustAlpha = 30
    ENT.ExhaustOffsets = {
        { pos = Vector( -83,-60,-13 ), angle = Angle( 0, 80, 0 ), scale = 2 },
    }

    ENT.EngineSmokeStrips = {
        { offset = Vector( 110, 0, 16 ), angle = Angle( -20, 0, 0 ), width = 45 },
    }

    ENT.EngineFireOffsets = {
        { offset = Vector( 110, 0, 16 ), angle = Angle( 0, 90, 0 ) }, 
    }

    ENT.Headlights = {
        { offset = Vector( 106,35,16 ) },
        { offset = Vector( 106,-35,16 ) },
    }

    ENT.LightSprites = {
-- reverse lights
        { type = "reverse", offset = Vector( -185,33,-2.5 ), dir = Vector( -1, 0, 0 ), size = 40, color = COLOR_REARLIGHT },
        { type = "reverse", offset = Vector( -185,-33,-2.5 ), dir = Vector( -1, 0, 0 ), size = 40, color = COLOR_REARLIGHT },	
-- brake lights
        { type = "brake", offset = Vector( -185,40.5,-2.5 ), dir = Vector( -1, 0, 0 ), size = 60 },
        { type = "brake", offset = Vector( -185,-40.5,-2.5 ), dir = Vector( -1, 0, 0 ), size = 60 },             		
-- rear lights 
		{ type = "taillight", offset = Vector( -185,40.5,-2.5 ), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50 },   
		{ type = "taillight", offset = Vector( -185,-40.5,-2.5 ), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50},	
-- headlights		
        { type = "headlight", offset = Vector( 106,35,16 ), dir = Vector( 1, 0, 0 ), size = 30 },
        { type = "headlight", offset = Vector( 106,-35,16 ), dir = Vector( 1, 0, 0 ), size = 30  },	
-- turn signals			
		--front
		{ type = "signal_left", offset = Vector( 104,39,11 ), dir = Vector( 1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
        { type = "signal_right", offset = Vector( 104,-39,11 ), dir = Vector( 1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
		{ type = "signal_left", offset = Vector( 90,45,16.5 ), dir = Vector( 0, 1, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
        { type = "signal_right", offset = Vector( 90,-45,16.5 ), dir = Vector( 0, -1, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
		--rear
		{ type = "signal_left", offset = Vector( -185,47.5,-2.5 ), dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
        { type = "signal_right", offset = Vector( -185,-47.5,-2.5 ), dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
    }
    ENT.SirenLights = {
        -- (white) lights
        { offset = Vector( 9, 13, 60 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( 9, -13, 60 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( 9, 13, 60 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( 9, -13, 60 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_W },

-- (white) side 

        { offset = Vector( -139, 56, 76 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( -139, 56, 76 ), time = 0.2, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( -139, -56, 76 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 0, -1, 0 ) },
        { offset = Vector( -139, -56, 76 ), time = 0.2, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 0, -1, 0 ) },
        { offset = Vector( -62, 56, 76 ), time = 0.4, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( -62, 56, 76 ), time = 0.6, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( -83, -56, 76 ), time = 0.4, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 0, -1, 0 ) },
        { offset = Vector( -83, -56, 76 ), time = 0.6, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 0, -1, 0 ) },

-- (white) back

        { offset = Vector( -186, 35, 86 ), time = 0.2, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -186, 35, 86 ), time = 0.4, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -186, -35, 86 ), time = 0.2, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -186, -35, 86 ), time = 0.4, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -186, 12, 86 ), time = 0.6, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -186, 12, 86 ), time = 0.8, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -186, -12, 86 ), time = 0.6, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -186, -12, 86 ), time = 0.8, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( -1, 0, 0 ) },

-- (red) lights
        { offset = Vector( 9, 22, 60 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( 9, -22, 60 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( 9, 22, 60 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( 9, -22, 60 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A },

-- (red) side

        { offset = Vector( -171, 56, 76 ), time = 0.2, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( -171, 56, 76 ), time = 0.4, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( -171, -56, 76 ), time = 0.2, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, -1, 0 ) },
        { offset = Vector( -171, -56, 76 ), time = 0.4, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, -1, 0 ) },
        { offset = Vector( -29, 56, 76 ), time = 0.6, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( -29, 56, 76 ), time = 0.8, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( -29, -56, 76 ), time = 0.6, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, -1, 0 ) },
        { offset = Vector( -29, -56, 76 ), time = 0.8, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, -1, 0 ) },
        { offset = Vector( -171, 56, 44 ), time = 0.8, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( -171, 56, 44 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( -171, -56, 44 ), time = 0.8, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, -1, 0 ) },
        { offset = Vector( -171, -56, 44 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, -1, 0 ) },

-- (red) front

        { offset = Vector( 108, 20, 13 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 108, 20, 13 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 108, -20, 13 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 108, -20, 13 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },

        { offset = Vector( -13, 43, 76 ), time = 0.6, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( -13, 43, 76 ), time = 0.8, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( -13, -43, 76 ), time = 0.6, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( -13, -43, 76 ), time = 0.8, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },

-- (red) back

        { offset = Vector( -186, 45, 86 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -186, 45, 86 ), time = 0.2, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -186, -45, 86 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -186, -45, 86 ), time = 0.2, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -185, 43, 78 ), time = 0.2, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -185, 43, 78 ), time = 0.4, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -185, -43, 78 ), time = 0.2, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -185, -43, 78 ), time = 0.4, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -186, 24, 86 ), time = 0.4, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -186, 24, 86 ), time = 0.6, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -186, -24, 86 ), time = 0.4, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -186, -24, 86 ), time = 0.6, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -186, 0, 86 ), time = 0.8, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -186, 0, 86 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },


        { bodygroup = 6, time = 0.0 },
        { bodygroup = 6, time = 0.2 },
		
        { bodygroup = 7, time = 0.2 },
        { bodygroup = 7, time = 0.4 },
		
        { bodygroup = 8, time = 0.4 },
        { bodygroup = 8, time = 0.6 },
		
        { bodygroup = 9, time = 0.6 },
        { bodygroup = 9, time = 0.8 },
		
        { bodygroup = 10, time = 0.8 },
        { bodygroup = 10, time = 0.0 },
		
        { bodygroup = 11, time = 0.25 },
        { bodygroup = 11, time = 0.75 },
		
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
        self:PhysicsInit( SOLID_VPHYSICS, Vector( -10, 0, -15 ) )
    end
	
    ENT.LightBodygroups = {
        { type = "headlight", bodyGroupId = 1, subModelId = 1 },
        { type = "brake_or_taillight", bodyGroupId = 2, subModelId = 1 },
        { type = "signal_right", bodyGroupId = 3, subModelId = 1 },
        { type = "signal_left", bodyGroupId = 4, subModelId = 1 },
        { type = "reverse", bodyGroupId = 5, subModelId = 1 },
    }
	
    ENT.SpawnPositionOffset = Vector( 0, 0, 20 )
    ENT.ChassisMass = 1300
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
		self:SetColor( Color( 255, 255, 255, 255 ) )
        local randomSkin = math.random(0, 3)
        self:SetSkin(randomSkin)
        self.engineBrakeTorque = 600
		
        self:SetSuspensionLength( 17 )
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

        self:CreateSeat( Vector( -6,22,0 ), Angle( 0, -90, 0 ), Vector( 40.0,100,50 ), true )
		
        self:CreateSeat( Vector( 16, -22, 2 ), Angle( 0, -90, 18 ), Vector( 40.0,-100,50 ), true )       
		self:CreateSeat( Vector( -160, -39, 11 ), Angle( 0, 0, 0 ), Vector( -240.0,-30,50 ), true )
		self:CreateSeat( Vector( -160, 39, 11 ), Angle( 0, 180, 0 ), Vector( -240.0,30,50  ), true )

        self:CreateWheel( Vector( 77,42,-1.0 ), {
            model = "models/props_vehicles/lcp/wheel21.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.4, 1 ),
            steerMultiplier = 1,
        } )

        self:CreateWheel( Vector( 77,-42,-1.0 ), {
            model = "models/props_vehicles/lcp/wheel21.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            modelScale = Vector( 1, 0.4, 1 ),
            steerMultiplier = 1,
        } )

        self:CreateWheel( Vector( -109,44,-1.0 ), {
            model = "models/props_vehicles/lcp/wheel21a.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.55, 1 ),

        } )

        self:CreateWheel( Vector(-109,-44,-1.0 ), {
            model = "models/props_vehicles/lcp/wheel21a.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            modelScale = Vector( 1, 0.55, 1 ),

        } )        

        self:ChangeWheelRadius( 20  )
    end
	
end

