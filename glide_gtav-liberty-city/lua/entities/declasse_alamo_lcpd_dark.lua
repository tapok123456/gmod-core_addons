AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_glide_car" 
ENT.PrintName = "Declasse Alamo LCPD Dark"
ENT.GlideCategory = "LC - LCPD"
ENT.ChassisModel = "models/props_vehicles/lcp/declasse_alamo/declasse_alamo_lcpd.mdl"
ENT.ExplosionGibs = { "models/props_vehicles/lcp/declasse_alamo/declasse_alamo_lcpd.mdl" }
ENT.Author = "Exidnost"
ENT.IconOverride = "gui/glide/lcp/declasse_alamo_lcpd_dark.png"
ENT.CanSwitchSiren = true
if CLIENT then

    ENT.CameraOffset = Vector( -300, 0, 70 )
    ENT.CameraAngleOffset = Angle( 5, 0, 0 )
    ENT.ExhaustAlpha = 20
    ENT.ExhaustOffsets = {
        { pos = Vector( -108,30,-9 ), scale = 2 },
        { pos = Vector( -108,-30,-9 ), scale = 2 },
        { pos = Vector( -108,25,-9 ), scale = 2 },
        { pos = Vector( -108,-25,-9 ), scale = 2 },
    }
    ENT.EngineSmokeStrips = {
        { offset = Vector( 122, 0, 13 ), angle = Angle( -20, 0, 0 ), width = 45 },
    }

    ENT.EngineFireOffsets = {
        { offset = Vector( 122, 0, 13 ), angle = Angle( 0, 90, 0 ) }, 
    }

    ENT.Headlights = {
        { offset = Vector( 112,33.5,17.5 ) },
        { offset = Vector( 112,-33.5,17.5 ) },
    }

    ENT.LightSprites = {
-- reverse lights
        { type = "reverse", offset = Vector( -105.5,42.5,18.5 ), dir = Vector( -1, 0, 0 ), size = 40, color = COLOR_REARLIGHT },
        { type = "reverse", offset = Vector( -105.5,-42.5,18.5 ), dir = Vector( -1, 0, 0 ), size = 40, color = COLOR_REARLIGHT },	
-- brake lights 
		{ type = "brake", offset = Vector( -105.5,42,24 ), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50 },   
		{ type = "brake", offset = Vector( -105.5,-42,24 ), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50},	
-- rear lights 
		{ type = "taillight", offset = Vector( -105.5,42,24 ), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50 },   
		{ type = "taillight", offset = Vector( -105.5,-42,24 ), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50},	
-- headlights		
        { type = "headlight", offset = Vector( 112,33.5,17.5 ), dir = Vector( 1, 0, 0 ), size = 30 },
        { type = "headlight", offset = Vector( 112,-33.5,17.5 ), dir = Vector( 1, 0, 0 ), size = 30  },	
        { type = "headlight", offset = Vector( 113,33.5,13 ), dir = Vector( 1, 0, 0 ), size = 30 },
        { type = "headlight", offset = Vector( 113,-33.5,13 ), dir = Vector( 1, 0, 0 ), size = 30  },	
-- turn signals			
		--front
		{ type = "signal_left", offset = Vector( 112,40.5,18 ), dir = Vector( 1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
        { type = "signal_right", offset = Vector( 112,-40.5,18 ), dir = Vector( 1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
		{ type = "signal_left", offset = Vector( 113,40.5,13 ), dir = Vector( 1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
        { type = "signal_right", offset = Vector( 113,-40.5,13 ), dir = Vector( 1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
		--rear
		{ type = "signal_left", offset = Vector( -105.5,43,14 ), dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
        { type = "signal_right", offset = Vector( -105.5,-43,14 ), dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
    }
    ENT.SirenLights = {
        -- (white) lights
        { offset = Vector( 23, 0, 61.5 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( 23, 0, 61.5 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( 16, 16, 61.5 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( 16, 16, 61.5 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( 16, -16, 61.5 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( 16, -16, 61.5 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_W },
        -- (red) lights
        { offset = Vector( 20, 8, 61.5 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( 20, 8, 61.5 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( 20, -8, 61.5 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( 20, -8, 61.5 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( 12, 25, 61.5 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( 12, 25, 61.5 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( 12, -25, 61.5 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( 12, -25, 61.5 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A },

        { offset = Vector( 119, 12, 11.5 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 119, -12, 11.5 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 119, 12, 11.5 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 119, -12, 11.5 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 119, 12, 11.5 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 119, -12, 11.5 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },

        { bodygroup = 7, time = 0.0, duration = 0.5 },
        { bodygroup = 8, time = 0.5, duration = 0.5 },
        { bodygroup = 9, time = 0.0, duration = 0.5 },
        { bodygroup = 10, time = 0.5, duration = 0.5 },
        { bodygroup = 11, time = 0.25 },
        { bodygroup = 11, time = 0.5 },
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
        self:PhysicsInit( SOLID_VPHYSICS, Vector( 10, 0, -15 ) )
    end
	
    ENT.LightBodygroups = {
        { type = "headlight", bodyGroupId = 1, subModelId = 1 },
        { type = "brake_or_taillight", bodyGroupId = 2, subModelId = 1 },
        { type = "brake", bodyGroupId = 3, subModelId = 1 },
        { type = "signal_right", bodyGroupId = 4, subModelId = 1 },
        { type = "signal_left", bodyGroupId = 5, subModelId = 1 },
        { type = "reverse", bodyGroupId = 6, subModelId = 1 },
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

        self:CreateSeat( Vector( 5,20,-4 ), Angle( 0, -90, 0 ), Vector( 20.0,80,50 ), true )
		
        self:CreateSeat( Vector( 20, -20, 0 ), Angle( 0, -90, 18 ), Vector( 20.0,-80,50 ), true )       
		self:CreateSeat( Vector( -28, -22, 0 ), Angle( 0, -90, 18 ), Vector( -38.0,-80,50 ), true )
		self:CreateSeat( Vector( -28, 22, 0 ), Angle( 0, -90, 18 ), Vector( -38.0,80,50  ), true )
		self:CreateSeat( Vector( -28, 0, 0 ), Angle( 0, -90, 18 ), Vector( -38.0,80,50  ), true )

        self:CreateWheel( Vector( 82.5,39,0.0 ), {
            model = "models/props_vehicles/lcp/wheel22.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.35, 1 ),
            steerMultiplier = 1,
        } )

        self:CreateWheel( Vector( 82.5,-39,0.0 ), {
            model = "models/props_vehicles/lcp/wheel22.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            modelScale = Vector( 1, 0.35, 1 ),
            steerMultiplier = 1,
        } )

        self:CreateWheel( Vector( -60,39,0.0 ), {
            model = "models/props_vehicles/lcp/wheel22.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.35, 1 ),

        } )

        self:CreateWheel( Vector(-60,-39,0.0 ), {
            model = "models/props_vehicles/lcp/wheel22.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            modelScale = Vector( 1, 0.35, 1 ),

        } )        

        self:ChangeWheelRadius( 20 )
    end
	
end

