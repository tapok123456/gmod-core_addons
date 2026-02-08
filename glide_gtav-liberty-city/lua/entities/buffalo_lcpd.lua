AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_glide_car" 
ENT.PrintName = "Buffalo LCPD"
ENT.GlideCategory = "LC - LCPD"
ENT.ChassisModel = "models/props_vehicles/lcp/buffalo/buffalo_lcpd.mdl"
ENT.ExplosionGibs = { "models/props_vehicles/lcp/buffalo/buffalo_lcpd.mdl" }
ENT.Author = "Exidnost"
ENT.IconOverride = "gui/glide/lcp/buffalo_lcpd.png"
ENT.CanSwitchSiren = true
if CLIENT then

    ENT.CameraOffset = Vector( -270, 0, 40 )
    ENT.CameraAngleOffset = Angle( 5, 0, 0 )
    ENT.ExhaustAlpha = 10
    ENT.ExhaustOffsets = {
        { pos = Vector( -112,23,-15 ), scale = 2 },
        { pos = Vector( -112,-23,-15 ), scale = 2 },
    }

    ENT.EngineSmokeStrips = {
        { offset = Vector( 112, 0, 1 ), angle = Angle( -20, 0, 0 ), width = 40 },
    }

    ENT.EngineFireOffsets = {
        { offset = Vector( 112, 0, -1 ), angle = Angle( 0, 90, 0 ) }, 
    }

    ENT.Headlights = {
        { offset = Vector( 97,30.5,5 ) },
        { offset = Vector( 97,-30.5,5 ) },
    }

    ENT.LightSprites = {
-- reverse lights
        { type = "reverse", offset = Vector( -104,31,6 ), dir = Vector( -1, 0, 0 ), size = 40, color = COLOR_REARLIGHT },
        { type = "reverse", offset = Vector( -104,-31,6 ), dir = Vector( -1, 0, 0 ), size = 40, color = COLOR_REARLIGHT },	
-- brake lights
        { type = "brake", offset = Vector( -103,31,11 ), dir = Vector( -1, 0, 0 ), size = 60 },
        { type = "brake", offset = Vector( -103,-31,11 ), dir = Vector( -1, 0, 0 ), size = 60 },             		
-- rear lights 
		{ type = "taillight", offset = Vector( -101,38,10 ), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50 },   
		{ type = "taillight", offset = Vector( -101,-38,10 ), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50},	
-- headlights		
        { type = "headlight", offset = Vector( 97,30.5,5 ), dir = Vector( 1, 0, 0 ), size = 30 },
        { type = "headlight", offset = Vector( 97,-30.5,5 ), dir = Vector( 1, 0, 0 ), size = 30  },	
-- turn signals			
		--front
		{ type = "signal_left", offset = Vector( 101,33.5,-5.5 ), dir = Vector( 1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
        { type = "signal_right", offset = Vector( 101,-33.5,-5.5 ), dir = Vector( 1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
		--rear
		{ type = "signal_left", offset = Vector( -101,33,15.5 ), dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
        { type = "signal_right", offset = Vector( -101,-33,15.5 ), dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
    }
    ENT.SirenLights = {
        -- (white) lights
        { offset = Vector( 0, 0, 40 ), time = 0, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( 0, 0, 40 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( -5, 13, 40 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( -5, 13, 40 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( -5, -13, 40 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( -5, -13, 40 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_W },

        -- (red) lights
        { offset = Vector( -2, 7, 40 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( -2, 7, 40 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( -2, -7, 40 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( -2, -7, 40 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( -8, 19, 40 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( -8, 19, 40 ), time = 1.0, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( -8, -19, 40 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( -8, -19, 40 ), time = 1.0, color = Glide.DEFAULT_SIREN_COLOR_A },
		
        { offset = Vector( 21, 2, 29 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 21, 2, 29 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 21, -2, 29 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 21, -2, 29 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },

        { bodygroup = 6, time = 0, duration = 0.5 },
        { bodygroup = 7, time = 0.5, duration = 0.5 },
        { bodygroup = 8, time = 0, duration = 0.5 },
        { bodygroup = 9, time = 0.5, duration = 0.5 },

        { bodygroup = 10, time = 0.25 },
        { bodygroup = 10, time = 0.75 },
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
            [-1] = 2.9,
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
        self:SetSpringStrength( 1000 )
        self:SetSpringDamper( 2500 )


        self:SetDifferentialRatio( 1 ) 
        self:SetTransmissionEfficiency( 0.75 )
        self:SetPowerDistribution( -0.9 )
        self:SetBrakePower( 2800 )

        self:SetMinRPMTorque( 3800 )
        self:SetMaxRPMTorque( 4000 )
        self:SetMinRPM( 2000 ) 
        self:SetMaxRPM( 12000 ) 

        self:SetMaxSteerAngle( 45 )
        self:SetSteerConeChangeRate( 6 )
        self:SetSteerConeMaxSpeed( 1000 )
        self:SetSteerConeMaxAngle( 0.30 )
		self:SetCounterSteer ( 0.2 )

        self:SetForwardTractionMax( 3400 )

        self:SetSideTractionMultiplier( 20 )
        self:SetSideTractionMaxAng( 30 )
        self:SetSideTractionMax( 3000 )
        self:SetSideTractionMin( 1100 )
		
		self:SetTurboCharged( false )
		self:SetFastTransmission( false )  

        self:CreateSeat( Vector( -10,19,-16 ), Angle( 0, -90, 0 ), Vector( 20.0,80,50 ), true )
		
        self:CreateSeat( Vector( 5, -19, -12 ), Angle( 0, -90, 18 ), Vector( 20.0,-80,50 ), true )       
		self:CreateSeat( Vector( -35, -20, -12 ), Angle( 0, -90, 18 ), Vector( -38.0,-80,50 ), true )
		self:CreateSeat( Vector( -35, 20, -12 ), Angle( 0, -90, 18 ), Vector( -38.0,80,50  ), true )
		self:CreateSeat( Vector( -35, 0, -12 ), Angle( 0, -90, 18 ), Vector( -38.0,80,50  ), true )

        self:CreateWheel( Vector( 71.5,35,-2.0 ), {
            model = "models/props_vehicles/lcp/wheel12.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.4, 1 ),
            steerMultiplier = 1,
        } )

        self:CreateWheel( Vector( 71.5,-35,-2.0 ), {
            model = "models/props_vehicles/lcp/wheel12.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            modelScale = Vector( 1, 0.4, 1 ),
            steerMultiplier = 1,
        } )

        self:CreateWheel( Vector( -65,35,-2.0 ), {
            model = "models/props_vehicles/lcp/wheel12.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.4, 1 ),

        } )

        self:CreateWheel( Vector(-65,-35,-2.0 ), {
            model = "models/props_vehicles/lcp/wheel12.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            modelScale = Vector( 1, 0.4, 1 ),

        } )        

        self:ChangeWheelRadius( 18 )
    end
	
end

