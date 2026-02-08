AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_glide_car" 
ENT.PrintName = "Brute Stockade LCPD"
ENT.GlideCategory = "LC - LCPD"
ENT.ChassisModel = "models/props_vehicles/lcp/brute_stockade/brute_stockade_lcpd.mdl"
ENT.ExplosionGibs = { "models/props_vehicles/lcp/brute_stockade/brute_stockade_lcpd.mdl" }
ENT.Author = "Exidnost"
ENT.IconOverride = "gui/glide/lcp/brute_stockade_lcpd.png"
ENT.CanSwitchSiren = true
if CLIENT then

    ENT.CameraOffset = Vector( -450, 0, 110 )
    ENT.CameraAngleOffset = Angle( 5, 0, 0 )
    ENT.ExhaustAlpha = 30
    ENT.ExhaustOffsets = {
        { pos = Vector( -60,-54,-13 ), angle = Angle( -10, 90, 0 ), scale = 2 },
        { pos = Vector( -56,-54,-13 ), angle = Angle( -10, 90, 0 ), scale = 2 },
    }

    ENT.EngineSmokeStrips = {
        { offset = Vector( 146, 0, 28 ), angle = Angle( -20, 0, 0 ), width = 50 },
    }

    ENT.EngineFireOffsets = {
        { offset = Vector( 146, 0, 28 ), angle = Angle( 0, 90, 0 ) }, 
    }

    ENT.Headlights = {
        { offset = Vector( 135,43,20 ) },
        { offset = Vector( 135,-43,20 ) },
    }

    ENT.LightSprites = {
-- reverse lights
        { type = "reverse", offset = Vector( -159,46,25 ), dir = Vector( -1, 0, 0 ), size = 40, color = COLOR_REARLIGHT },
        { type = "reverse", offset = Vector( -159,-46,25 ), dir = Vector( -1, 0, 0 ), size = 40, color = COLOR_REARLIGHT },	
-- brake lights
        { type = "brake", offset = Vector( -159,46,84 ), dir = Vector( -1, 0, 0 ), size = 60 },
        { type = "brake", offset = Vector( -159,-46,84 ), dir = Vector( -1, 0, 0 ), size = 60 },             		
-- rear lights 
		{ type = "taillight", offset = Vector( -159,46,36 ), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50 },   
		{ type = "taillight", offset = Vector( -159,-46,36 ), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50},	
-- headlights		
        { type = "headlight", offset = Vector( 135,43,20 ), dir = Vector( 1, 0, 0 ), size = 30 },
        { type = "headlight", offset = Vector( 135,-43,20 ), dir = Vector( 1, 0, 0 ), size = 30  },	
    }
    ENT.SirenLights = {
        -- (white) lights
        { offset = Vector( 70, 0, 101 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( 70, 0, 101 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( 70, 24, 101 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( 70, 24, 101 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( 70, -24, 101 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( 70, -24, 101 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_W },
        -- (red) lights
        { offset = Vector( 70, 12, 101 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( 70, 12, 101 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( 70, -12, 101 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( 70, -12, 101 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( 70, 36, 101 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( 70, 36, 101 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( 70, -36, 101 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( 70, -36, 101 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A },
        -- (red) back lights
        { offset = Vector( -160, 44, 96 ), time = 0.0, dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( -160, 44, 96 ), time = 0.25, dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( -160, -44, 96 ), time = 0.0, dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( -160, -44, 96 ), time = 0.25, dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( -160, 39, 96 ), time = 0.25, dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( -160, 39, 96 ), time = 0.5, dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( -160, -39, 96 ), time = 0.25, dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( -160, -39, 96 ), time = 0.5, dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_SIREN_COLOR_A },
        -- (red) front lights
        { offset = Vector( 149, 15, 40.5 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 149, -15, 40.5 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 149, 15, 40.5 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 149, -15, 40.5 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 149, 15, 40.5 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 149, -15, 40.5 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },

        { bodygroup = 4, time = 0.0 },
        { bodygroup = 4, time = 0.25 },
        { bodygroup = 5, time = 0.25 },
        { bodygroup = 5, time = 0.5 },
        { bodygroup = 6, time = 0.75 },
        { bodygroup = 6, time = 0.0 },
        { bodygroup = 7, time = 0.0 },
        { bodygroup = 7, time = 0.25 },
		
        { bodygroup = 8, time = 0.25 },
        { bodygroup = 8, time = 0.5 },
        { bodygroup = 8, time = 0.75 },
		}
    function ENT:OnCreateEngineStream( stream )
        stream.offset = Vector( 50, 0, 50 )
        stream:LoadPreset( "speedo" )
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
        { type = "brake", bodyGroupId = 2, subModelId = 1 },
        { type = "reverse", bodyGroupId = 3, subModelId = 1 },
    }
	
    ENT.SpawnPositionOffset = Vector( 0, 0, 20 )
    ENT.ChassisMass = 1300
    ENT.IsHeavyVehicle = true
    ENT.BurnoutForce = 15
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
        local randomSkin = math.random(0, 2)
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

        self:CreateSeat( Vector( 20,31,29 ), Angle( 0, -90, 0 ), Vector( 40.0,100,50 ), true )
		
        self:CreateSeat( Vector( 38, -31, 31 ), Angle( 0, -90, 18 ), Vector( 40.0,-100,50 ), true )       
		self:CreateSeat( Vector( -130, -39, 29 ), Angle( 0, 0, 0 ), Vector( -240.0,-30,50 ), true )
		self:CreateSeat( Vector( -130, 39, 29 ), Angle( 0, 180, 0 ), Vector( -240.0,30,50  ), true )
		self:CreateSeat( Vector( -80, -39, 29 ), Angle( 0, 0, 0 ), Vector( -240.0,-30,50 ), true )
		self:CreateSeat( Vector( -80, 39, 29 ), Angle( 0, 180, 0 ), Vector( -240.0,30,50  ), true )

        self:CreateWheel( Vector( 101,44,6 ), {
            model = "models/props_vehicles/lcp/wheel11.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.4, 1 ),
            steerMultiplier = 1,
        } )

        self:CreateWheel( Vector( 101,-44,6 ), {
            model = "models/props_vehicles/lcp/wheel11.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            modelScale = Vector( 1, 0.4, 1 ),
            steerMultiplier = 1,
        } )

        self:CreateWheel( Vector( -99,44,6 ), {
            model = "models/props_vehicles/lcp/wheel11.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.4, 1 ),

        } )

        self:CreateWheel( Vector(-99,-44,6 ), {
            model = "models/props_vehicles/lcp/wheel11.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            modelScale = Vector( 1, 0.4, 1 ),

        } )        

        self:ChangeWheelRadius( 25  )
    end
	
end

