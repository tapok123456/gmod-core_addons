AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_glide_car" 
ENT.PrintName = "Declasse Impaler LX LCPD Old"
ENT.GlideCategory = "LC - LCPD Old"
ENT.ChassisModel = "models/props_vehicles/lcp/impaler_lx/impaler_lx_lcpd.mdl"
ENT.ExplosionGibs = { "models/props_vehicles/lcp/impaler_lx/impaler_lx_lcpd.mdl" }
ENT.Author = "Exidnost"
ENT.IconOverride = "gui/glide/lcp/declasse_impaler_lx_lcpd_old.png"
ENT.CanSwitchSiren = true
if CLIENT then
    ENT.HornSound = "glide/alarms/lcpd_old_horn.wav"
    ENT.SirenLoopSound = "glide/alarms/lcpd_old_siren.wav"
    ENT.SirenLoopAltSound = "glide/alarms/lcpd_old_siren1.wav"
    ENT.SirenInterruptSound = "glide/alarms/lcpd_old_siren_int.wav"
    ENT.CameraOffset = Vector( -280, 0, 50 )
    ENT.CameraAngleOffset = Angle( 5, 0, 0 )
    ENT.ExhaustAlpha = 30
    ENT.ExhaustOffsets = {
        { pos = Vector( -117,28,-8.5 ), scale = 2 },
        { pos = Vector( -117,-28,-8.5 ), scale = 2 },
    }

    ENT.EngineSmokeStrips = {
        { offset = Vector( 118, 0, 8 ), angle = Angle( -20, 0, 0 ), width = 40 },
    }

    ENT.EngineFireOffsets = {
        { offset = Vector( 118, 0, 8 ), angle = Angle( 0, 90, 0 ) }, 
    }

    ENT.Headlights = {
        { offset = Vector( 112,30,8.5 ) },
        { offset = Vector( 112,-30,8.5 ) },
    }

    ENT.LightSprites = {
-- reverse lights
        { type = "reverse", offset = Vector( -114,24,8.5 ), dir = Vector( -1, 0, 0 ), size = 40, color = COLOR_REARLIGHT },
        { type = "reverse", offset = Vector( -114,-24,8.5 ), dir = Vector( -1, 0, 0 ), size = 40, color = COLOR_REARLIGHT },	
-- brake lights
        { type = "brake", offset = Vector( -114,18,8.5 ), dir = Vector( -1, 0, 0 ), size = 60 },
        { type = "brake", offset = Vector( -114,-18,8.5 ), dir = Vector( -1, 0, 0 ), size = 60 },             		
-- rear lights 
		{ type = "taillight", offset = Vector( -114,31,8.5 ), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50 },   
		{ type = "taillight", offset = Vector( -114,-31,8.5 ), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50},	
-- headlights		
        { type = "headlight", offset = Vector( 112,30,8.5 ), dir = Vector( 1, 0, 0 ), size = 30 },
        { type = "headlight", offset = Vector( 112,-30,8.5 ), dir = Vector( 1, 0, 0 ), size = 30  },	
-- turn signals			
		--front
		{ type = "signal_left", offset = Vector( 108,40,8.5 ), dir = Vector( 0, 1, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 30 },
        { type = "signal_right", offset = Vector( 108,-40,8.5 ), dir = Vector( 0, -1, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 30 },
		--rear
		
		{ type = "signal_left", offset = Vector( -110,40,8.5 ), dir = Vector( 0, 1, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 30 },
        { type = "signal_right", offset = Vector( -110,-40,8.5 ), dir = Vector( 0, -1, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 30 },

		{ type = "signal_left", offset = Vector( -114,37,8.5 ), dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
        { type = "signal_right", offset = Vector( -114,-37,8.5 ), dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
    }
    ENT.SirenLights = {
        -- (white) lights
        { offset = Vector( -1, 22, 47 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( -1, 22, 47 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( -1, -22, 47 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( -1, -22, 47 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_W },

        -- (red) lights
        { offset = Vector( -1, 12, 47 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( -1, 12, 47 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( -1, -12, 47 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( -1, -12, 47 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A },

        { bodygroup = 6, time = 0, duration = 0.5 },
        { bodygroup = 7, time = 0.5, duration = 0.5 },
		}
    function ENT:OnCreateEngineStream( stream )
        stream.offset = Vector( 50, 0, 50 )
        stream:LoadPreset( "dukes" )
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
    ENT.BurnoutForce = 30
    ENT.UnflipForce = 50
    ENT.AirControlForce = Vector( 0.5, 0.3, 0.5 )
    ENT.AirMaxAngularVelocity = Vector( 50, 100, 50 )

    function ENT:GetGears()
        return {
            [-1] = 2,
            [0] = 0,
            [1] = 2.8,
            [2] = 1.7,
            [3] = 1.25,
            [4] = 0.95,
            [5] = 0.8,
            [6] = 0.3
        }
    end

    function ENT:CreateFeatures()
		self:SetColor( Color( 255, 255, 255, 255 ) )

        self.engineBrakeTorque = 600
		
        self:SetSuspensionLength( 14 )
        self:SetSpringStrength( 600 )
        self:SetSpringDamper( 2000 )


        self:SetDifferentialRatio( 1.5 ) 
        self:SetTransmissionEfficiency( 0.75 )
        self:SetPowerDistribution( -0.9 )
        self:SetBrakePower( 2800 )

        self:SetMinRPMTorque( 2500 )
        self:SetMaxRPMTorque( 3000 )
        self:SetMinRPM( 2000 ) 
        self:SetMaxRPM( 16000 ) 

        self:SetMaxSteerAngle( 45 )
        self:SetSteerConeChangeRate( 6 )
        self:SetSteerConeMaxSpeed( 1000 )
        self:SetSteerConeMaxAngle( 0.30 )
		self:SetCounterSteer ( 0.2 )

        self:SetForwardTractionMax( 3400 )
        self:SetSideTractionMultiplier( 20 )
        self:SetSideTractionMaxAng( 25 )
        self:SetSideTractionMax( 2800 )
        self:SetSideTractionMin( 700 )
		
		self:SetTurboCharged( false )
		self:SetFastTransmission( false ) 

        self:CreateSeat( Vector( -6,19,-8 ), Angle( 0, -90, 0 ), Vector( 20.0,80,50 ), true )
		
        self:CreateSeat( Vector( 9, -19, -6 ), Angle( 0, -90, 18 ), Vector( 20.0,-80,50 ), true )       
		self:CreateSeat( Vector( -27, -20, -6 ), Angle( 0, -90, 18 ), Vector( -38.0,-80,50 ), true )
		self:CreateSeat( Vector( -27, 20, -6 ), Angle( 0, -90, 18 ), Vector( -38.0,80,50  ), true )
		self:CreateSeat( Vector( -27, 0, -6 ), Angle( 0, -90, 18 ), Vector( -38.0,80,50  ), true )

        self:CreateWheel( Vector( 76.5,35,3 ), {
            model = "models/props_vehicles/lcp/wheel13.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.4, 1 ),
            steerMultiplier = 1,
        } )

        self:CreateWheel( Vector( 76.5,-35,3 ), {
            model = "models/props_vehicles/lcp/wheel13.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            modelScale = Vector( 1, 0.4, 1 ),
            steerMultiplier = 1,
        } )

        self:CreateWheel( Vector( -58,35,3 ), {
            model = "models/props_vehicles/lcp/wheel13.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.4, 1 ),

        } )

        self:CreateWheel( Vector(-58,-35,3 ), {
            model = "models/props_vehicles/lcp/wheel13.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            modelScale = Vector( 1, 0.4, 1 ),

        } )        

        self:ChangeWheelRadius( 16 )
    end
	
end

