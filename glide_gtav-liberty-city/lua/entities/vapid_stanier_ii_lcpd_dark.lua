AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_glide_car" 
ENT.PrintName = "Vapid Stanier II LCPD Dark"
ENT.GlideCategory = "LC - LCPD"
ENT.ChassisModel = "models/props_vehicles/lcp/vapid_stanier_ii/vapid_stanier_ii_lcpd.mdl"
ENT.ExplosionGibs = { "models/props_vehicles/lcp/vapid_stanier_ii/vapid_stanier_ii_lcpd.mdl" }
ENT.Author = "Exidnost"
ENT.IconOverride = "gui/glide/lcp/vapid_stanier_ii_lcpd_dark.png"
ENT.CanSwitchSiren = true
if CLIENT then

    ENT.CameraOffset = Vector( -270, 0, 40 )
    ENT.CameraAngleOffset = Angle( 5, 0, 0 )
    ENT.ExhaustAlpha = 10
    ENT.ExhaustOffsets = {

        { pos = Vector( -114,24,-14 ), scale = 2 },
        { pos = Vector( -114,-24,-14 ), scale = 2 },
    }

    ENT.EngineSmokeStrips = {
        { offset = Vector( 115, 0, 2 ), angle = Angle( -20, 0, 0 ), width = 35 },
    }

    ENT.EngineFireOffsets = {
        { offset = Vector( 80, 0, 15 ), angle = Angle( 0, 90, 0 ) }, 
    }

    ENT.Headlights = {
        { offset = Vector( 113,30,4 ) },
        { offset = Vector( 113,-30,4 ) },
    }

    ENT.LightSprites = {
-- reverse lights
        { type = "reverse", offset = Vector( -114,29,5.8 ), dir = Vector( -1, 0, 0 ), size = 40, color = COLOR_REARLIGHT },
        { type = "reverse", offset = Vector( -114,-29,5.8 ), dir = Vector( -1, 0, 0 ), size = 40, color = COLOR_REARLIGHT },	

-- brake lights
        { type = "brake", offset = Vector( -112,31,12 ), dir = Vector( -1, 0, 0 ), size = 60 },
        { type = "brake", offset = Vector( -112,-31,12 ), dir = Vector( -1, 0, 0 ), size = 60 },             		
-- rear lights 
		{ type = "taillight", offset = Vector( -112,30,10 ), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50 },   
		{ type = "taillight", offset = Vector( -112,-30,10 ), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50},	
-- headlights		
        { type = "headlight", offset = Vector( 113,30,4 ), dir = Vector( 1, 0, 0 ), size = 30 },
        { type = "headlight", offset = Vector( 113,-30,4 ), dir = Vector( 1, 0, 0 ), size = 30  },	
-- turn signals			
		--front
		{ type = "signal_left", offset = Vector( 108,39,3.5 ), dir = Vector( 1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
        { type = "signal_right", offset = Vector( 108,-39,3.5 ), dir = Vector( 1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
		{ type = "signal_left", offset = Vector( 112,22,3.5 ), dir = Vector( 1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
        { type = "signal_right", offset = Vector( 112,-22,3.5 ), dir = Vector( 1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
		--rear
		{ type = "signal_left", offset = Vector( -110,35,6.5 ), dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
        { type = "signal_right", offset = Vector( -110,-35,6.5 ), dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
    }
    ENT.SirenLights = {
        -- (white) lights
        { offset = Vector( 4, 0, 44 ), time = 0, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( 4, 0, 44 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( -2, 12.5, 44 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( -2, 12.5, 44 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( -2, -12.5, 44 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( -2, -12.5, 44 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_W },

        -- (red) lights
        { offset = Vector( 1, 6, 44 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( 1, 6, 44 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( 1, -6, 44 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( 1, -6, 44 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( -6, 19, 44 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( -6, 19, 44 ), time = 1.0, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( -6, -19, 44 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( -6, -19, 44 ), time = 1.0, color = Glide.DEFAULT_SIREN_COLOR_A },
		
        { offset = Vector( -69, 20, 22 ), time = 0.0, duration = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -69, -20, 22 ), time = 0.0, duration = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
		
        { offset = Vector( 115, 9, 4.5 ), time = 0.0, duration = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 115, -9, 4.5 ), time = 0.0, duration = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },

       -- (blue) lights
        { offset = Vector( -69, 15, 22 ), time = 0.5, duration = 0.5, color = Glide.DEFAULT_SIREN_COLOR_B, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -69, -15, 22 ), time = 0.5, duration = 0.5, color = Glide.DEFAULT_SIREN_COLOR_B, dir = Vector( -1, 0, 0 ) },

        { bodygroup = 13, time = 0, duration = 0.5 },
        { bodygroup = 14, time = 0.5, duration = 0.5 },
        { bodygroup = 15, time = 0, duration = 0.5 },
        { bodygroup = 16, time = 0.5, duration = 0.5 },

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
        { type = "headlight", bodyGroupId = 9, subModelId = 1 }, -- Headlights
        { type = "headlight", bodyGroupId = 8, subModelId = 1 }, -- Tail light left

        { type = "brake", bodyGroupId = 7, subModelId = 1 },
        { type = "reverse", bodyGroupId = 12, subModelId = 1 },

        { type = "signal_left", bodyGroupId = 10, subModelId = 1 },
        { type = "signal_right", bodyGroupId = 11, subModelId = 1 },
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
		self:SetColor( Color( 25, 25, 25, 255 ) )
        local randomSkin = math.random(1, 1)
        self:SetSkin(randomSkin)
        self.engineBrakeTorque = 600
		
        self:SetSuspensionLength( 14 )
        self:SetSpringStrength( 600 )
        self:SetSpringDamper( 2000 )


        self:SetDifferentialRatio( 2 ) 
        self:SetTransmissionEfficiency( 0.75 )
        self:SetPowerDistribution( -0.9 )
        self:SetBrakePower( 2500 )

        self:SetMinRPMTorque( 2100 )
        self:SetMaxRPMTorque( 2600 )
        self:SetMinRPM( 2000 ) 
        self:SetMaxRPM( 18000 ) 

        self:SetMaxSteerAngle( 45 )
        self:SetSteerConeChangeRate( 6 )
        self:SetSteerConeMaxSpeed( 1000 )
        self:SetSteerConeMaxAngle( 0.30 )
		self:SetCounterSteer ( 0.2 )

        self:SetForwardTractionMax( 3300 )
        self:SetSideTractionMultiplier( 20 )
        self:SetSideTractionMaxAng( 25 )
        self:SetSideTractionMax( 2400 )
        self:SetSideTractionMin( 800 )
		
		self:SetTurboCharged( false )
		self:SetFastTransmission( false ) 

        self:CreateSeat( Vector( -7,20,-13 ), Angle( 0, -90, 0 ), Vector( 20.0,80,50 ), true )
		
        self:CreateSeat( Vector( 12, -20, -12 ), Angle( 0, -90, 18 ), Vector( 20.0,-80,50 ), true )       
		self:CreateSeat( Vector( -32, -20, -12 ), Angle( 0, -90, 18 ), Vector( -38.0,-80,50 ), true )
		self:CreateSeat( Vector( -32, 20, -12 ), Angle( 0, -90, 18 ), Vector( -38.0,80,50  ), true )
		self:CreateSeat( Vector( -32, 0, -12 ), Angle( 0, -90, 18 ), Vector( -38.0,80,50  ), true )

        self:CreateWheel( Vector( 75,37,-5.0 ), {
            model = "models/props_vehicles/lcp/wheel01.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.35, 1 ),
            steerMultiplier = 1,
        } )

        self:CreateWheel( Vector( 75,-37,-5.0 ), {
            model = "models/props_vehicles/lcp/wheel01.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            modelScale = Vector( 1, 0.35, 1 ),
            steerMultiplier = 1,
        } )

        self:CreateWheel( Vector( -60,37,-5.0 ), {
            model = "models/props_vehicles/lcp/wheel01.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.35, 1 ),

        } )

        self:CreateWheel( Vector(-60,-37,-5.0 ), {
            model = "models/props_vehicles/lcp/wheel01.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            modelScale = Vector( 1, 0.35, 1 ),

        } )        

        self:ChangeWheelRadius( 17 )
    end
	
end

