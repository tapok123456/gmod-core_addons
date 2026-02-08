AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_glide_car" 
ENT.PrintName = "Vapid Sadler Truck LCPD"
ENT.GlideCategory = "LC - LCPD"
ENT.ChassisModel = "models/props_vehicles/lcp/vapid_sadler/vapid_sadler_truck_lcpd.mdl"
ENT.ExplosionGibs = { "models/props_vehicles/lcp/vapid_sadler/vapid_sadler_truck_lcpd.mdl" }
ENT.Author = "Exidnost"
ENT.IconOverride = "gui/glide/lcp/vapid_sadler_truck_lcpd.png"
ENT.CanSwitchSiren = true
if CLIENT then

    ENT.CameraOffset = Vector( -420, 0, 90 )
    ENT.CameraAngleOffset = Angle( 5, 0, 0 )
    ENT.ExhaustAlpha = 30
    ENT.ExhaustOffsets = {
        { pos = Vector( -102,-57,-14 ), angle = Angle( 0, 90, 0 ), scale = 2 },
    }

    ENT.EngineSmokeStrips = {
        { offset = Vector( 137, 0, 15 ), angle = Angle( -20, 0, 0 ), width = 45 },
    }

    ENT.EngineFireOffsets = {
        { offset = Vector( 137, 0, 15 ), angle = Angle( 0, 90, 0 ) }, 
    }

    ENT.Headlights = {
        { offset = Vector( 127,36,16 ) },
        { offset = Vector( 127,-36,16 ) },
    }

    ENT.LightSprites = {
-- reverse lights
        { type = "reverse", offset = Vector( -138,44,14 ), dir = Vector( -1, 0, 0 ), size = 40, color = COLOR_REARLIGHT },
        { type = "reverse", offset = Vector( -138,-44,14 ), dir = Vector( -1, 0, 0 ), size = 40, color = COLOR_REARLIGHT },	
-- brake lights
        { type = "brake", offset = Vector( -138,44,38 ), dir = Vector( -1, 0, 0 ), size = 60 },
        { type = "brake", offset = Vector( -138,-44,38 ), dir = Vector( -1, 0, 0 ), size = 60 },             		
-- rear lights 
		{ type = "taillight", offset = Vector( -138,44,51 ), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50 },   
		{ type = "taillight", offset = Vector( -138,-44,51 ), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50},	
-- headlights		
        { type = "headlight", offset = Vector( 127,36,16 ), dir = Vector( 1, 0, 0 ), size = 30 },
        { type = "headlight", offset = Vector( 127,-36,16 ), dir = Vector( 1, 0, 0 ), size = 30  },	
        { type = "headlight", offset = Vector( 127,36,11 ), dir = Vector( 1, 0, 0 ), size = 30 },
        { type = "headlight", offset = Vector( 127,-36,11 ), dir = Vector( 1, 0, 0 ), size = 30  },	
-- turn signals			
		--front
		{ type = "signal_left", offset = Vector( 121,44,13 ), dir = Vector( 1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
        { type = "signal_right", offset = Vector( 121,-44,13 ), dir = Vector( 1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
    }
    ENT.SirenLights = {
        -- (white) lights
        { offset = Vector( 18, 3, 65 ), time = 0, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( 18, 3, 65 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( 18, -3, 65 ), time = 0, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( 18, -3, 65 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_W },		
        { offset = Vector( 18, 24, 65 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( 18, 24, 65 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( 18, -24, 65 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( 18, -24, 65 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_W },

        { offset = Vector( -123, 3, 91 ), time = 0, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( -123, 3, 91 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( -123, -3, 91 ), time = 0, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( -123, -3, 91 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_W },		

--side

        { offset = Vector( -116, 34, 71 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( -116, 34, 71 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( -116, -34, 71 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 0, -1, 0 ) },
        { offset = Vector( -116, -34, 71 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 0, -1, 0 ) },

        { offset = Vector( -19, 34, 71 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( -19, 34, 71 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( -19, -34, 71 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 0, -1, 0 ) },
        { offset = Vector( -19, -34, 71 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 0, -1, 0 ) },

        -- (red) lights
        { offset = Vector( 18, 12, 65 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( 18, 12, 65 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( 18, -12, 65 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( 18, -12, 65 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A },

        { offset = Vector( -121, 11, 91 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( -121, 11, 91 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( -121, -11, 91 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( -121, -11, 91 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A },

--side

        { offset = Vector( -127, 34, 71 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( -127, 34, 71 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( -127, -34, 71 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, -1, 0 ) },
        { offset = Vector( -127, -34, 71 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, -1, 0 ) },

        { offset = Vector( -7, 34, 71 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( -7, 34, 71 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( -7, -34, 71 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, -1, 0 ) },
        { offset = Vector( -7, -34, 71 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, -1, 0 ) },

        { offset = Vector( -67, 34, 73 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( -67, 34, 73 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( -67, -34, 73 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, -1, 0 ) },
        { offset = Vector( -67, -34, 73 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, -1, 0 ) },

--front

        { offset = Vector( 140, 16, 15 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 140, 16, 15 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 140, -16, 15 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 140, -16, 15 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },

        { offset = Vector( -138, 16, 50 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -138, 16, 50 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -138, -16, 50 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -138, -16, 50 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },

        { bodygroup = 6, time = 0.0 },
        { bodygroup = 6, time = 0.5 },
		
        { bodygroup = 7, time = 0.25 },
        { bodygroup = 7, time = 0.75 },
		
        { bodygroup = 8, time = 0.5 },
        { bodygroup = 8, time = 0.0 },
		
        { bodygroup = 9, time = 0.75 },
        { bodygroup = 9, time = 0.25 },
		
		}
    function ENT:OnCreateEngineStream( stream )
        stream.offset = Vector( 50, 0, 50 )
        stream:LoadPreset( "airbus" )
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
        { type = "signal_right", bodyGroupId = 3, subModelId = 1 },
        { type = "signal_left", bodyGroupId = 4, subModelId = 1 },
        { type = "reverse", bodyGroupId = 5, subModelId = 1 },
    }
	
    ENT.SpawnPositionOffset = Vector( 0, 0, 20 )
    ENT.ChassisMass = 1500
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

        self:CreateSeat( Vector( 16,23,1 ), Angle( 0, -90, 0 ), Vector( 40.0,100,50 ), true )
		
        self:CreateSeat( Vector( 36, -23, 3 ), Angle( 0, -90, 18 ), Vector( 40.0,-100,50 ), true )       

        self:CreateWheel( Vector( 96,42,-3.0 ), {
            model = "models/props_vehicles/lcp/wheel14.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.4, 1 ),
            steerMultiplier = 1,
        } )

        self:CreateWheel( Vector( 96,-42,-3.0 ), {
            model = "models/props_vehicles/lcp/wheel14.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            modelScale = Vector( 1, 0.4, 1 ),
            steerMultiplier = 1,
        } )

        self:CreateWheel( Vector( -72,48,-3.0 ), {
            model = "models/props_vehicles/lcp/wheel14a.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.6, 1 ),

        } )

        self:CreateWheel( Vector(-72,-48,-3.0 ), {
            model = "models/props_vehicles/lcp/wheel14a.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            modelScale = Vector( 1, 0.6, 1 ),

        } )        

        self:ChangeWheelRadius( 20  )
    end
	
end

