AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_glide_car" 
ENT.PrintName = "Nagasaki Pegion LCPD Dark"
ENT.GlideCategory = "LC - LCPD"
ENT.ChassisModel = "models/props_vehicles/lcp/nagasaki_pegion/nagasaki_pegion_lcpd.mdl"
ENT.ExplosionGibs = { "models/props_vehicles/lcp/nagasaki_pegion/nagasaki_pegion_lcpd.mdl" }
ENT.Author = "Exidnost"
ENT.IconOverride = "gui/glide/lcp/nagasaki_pegion_lcpd_dark.png"
ENT.CanSwitchSiren = true
if CLIENT then

    ENT.CameraOffset = Vector( -250, 0, 60 )
    ENT.CameraAngleOffset = Angle( 5, 0, 0 )
    ENT.ExhaustAlpha = 20
    ENT.ExhaustOffsets = {
        { pos = Vector( -78, -13, -12 ), scale = 2 },
    }

    ENT.EngineSmokeStrips = {
        { offset = Vector( -73, 0, 18 ), angle = Angle( -20, 180, 0 ), width = 45 },
    }

    ENT.EngineFireOffsets = {
        { offset = Vector( -73, 0, 18 ), angle = Angle( 0, 90, 0 ) }, 
    }

    ENT.Headlights = {
        { offset = Vector( 62, 18, 3 ) },
        { offset = Vector( 62, -18, 3 ) },
    }

    ENT.LightSprites = {
-- reverse lights
        { type = "reverse", offset = Vector( -74, 13.5, 1 ), dir = Vector( -1, 0, 0 ), size = 40, color = COLOR_REARLIGHT },
        { type = "reverse", offset = Vector( -74, -13.5, 1 ), dir = Vector( -1, 0, 0 ), size = 40, color = COLOR_REARLIGHT },	
-- brake lights
        { type = "brake", offset = Vector( -20, 14, 54.5 ), dir = Vector( -1, 0, 0 ), size = 60 },
        { type = "brake", offset = Vector( -20, -14, 54.5 ), dir = Vector( -1, 0, 0 ), size = 60 },             		
-- rear lights 
		{ type = "taillight", offset = Vector( -74, 17, 1 ), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50 },   
		{ type = "taillight", offset = Vector( -74, -17, 1 ), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50},	
-- headlights		
        { type = "headlight", offset = Vector( 62, 18, 3 ), dir = Vector( 1, 0, 0 ), size = 30 },
        { type = "headlight", offset = Vector( 62, -18, 3 ), dir = Vector( 1, 0, 0 ), size = 30  },	
-- turn signals			
		--front
		{ type = "signal_left", offset = Vector( 62, 26, 4 ), dir = Vector( 1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
        { type = "signal_right", offset = Vector( 62, -26, 4 ), dir = Vector( 1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
		--rear
		{ type = "signal_left", offset = Vector( -74, 20.5, 1 ), dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
        { type = "signal_right", offset = Vector( -74, -20.5, 1 ), dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
    }
    ENT.SirenLights = {
        -- (white) lights
        { offset = Vector( -6, 3.5, 64 ), time = 0, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( -6, 3.5, 64 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( -6, -3.5, 64 ), time = 0, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( -6, -3.5, 64 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_W },
        -- (red) lights
        { offset = Vector( -6, 10.5, 64 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( -6, 10.5, 64 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( -6, -10.5, 64 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( -6, -10.5, 64 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( -6, 10.5, 64 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( -6, -10.5, 64 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_A },

		}
    function ENT:OnCreateEngineStream( stream )
        stream.offset = Vector( 50, 0, 50 )
        stream:LoadPreset( "jb700" )
    end
end

if SERVER then

    function ENT:InitializePhysics()
        self:SetSolid( SOLID_VPHYSICS )
        self:SetMoveType( MOVETYPE_VPHYSICS )
        self:PhysicsInit( SOLID_VPHYSICS, Vector( -20, 0, -15 ) )
    end
	
    ENT.LightBodygroups = {
        { type = "headlight", bodyGroupId = 1, subModelId = 1 },
        { type = "brake", bodyGroupId = 2, subModelId = 1 },
        { type = "reverse", bodyGroupId = 5, subModelId = 1 },
        { type = "signal_right", bodyGroupId = 3, subModelId = 1 },
        { type = "signal_left", bodyGroupId = 4, subModelId = 1 },
    }
	
    ENT.SpawnPositionOffset = Vector( 0, 0, 20 )
    ENT.ChassisMass = 800
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
		
        self:SetSuspensionLength( 15 )
        self:SetSpringStrength( 600 )
        self:SetSpringDamper( 2000 )


        self:SetDifferentialRatio( 2 ) 
        self:SetTransmissionEfficiency( 0.75 )
        self:SetPowerDistribution( -0.9 )
        self:SetBrakePower( 2500 )

        self:SetMinRPMTorque( 1600 )
        self:SetMaxRPMTorque( 2000 )
        self:SetMinRPM( 2000 ) 
        self:SetMaxRPM( 12000 ) 

        self:SetMaxSteerAngle( 45 )
        self:SetSteerConeChangeRate( 6 )
        self:SetSteerConeMaxSpeed( 1000 )
        self:SetSteerConeMaxAngle( 0.30 )
		self:SetCounterSteer ( 0.2 )

        self:SetForwardTractionMax( 2600 )
        self:SetSideTractionMultiplier( 50 )
        self:SetSideTractionMaxAng( 25 )
        self:SetSideTractionMax( 2400 )
        self:SetSideTractionMin( 800 )
		
		self:SetTurboCharged( false )
		self:SetFastTransmission( false ) 

        self:CreateSeat( Vector( -10, 0, 1 ), Angle( 0, -90, 0 ), Vector( 20.0,80,50 ), true )

        self:CreateWheel( Vector( 45.5,0,3.0 ), {
            model = "models/props_vehicles/lcp/wheel24.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.35, 1 ),
            steerMultiplier = 1,
        } )

        self:CreateWheel( Vector( -52,27,3.0 ), {
            model = "models/props_vehicles/lcp/wheel24.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.35, 1 ),

        } )

        self:CreateWheel( Vector(-52,-27,3.0 ), {
            model = "models/props_vehicles/lcp/wheel24.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            modelScale = Vector( 1, 0.35, 1 ),

        } )        

        self:ChangeWheelRadius( 13 )
    end
	
end

