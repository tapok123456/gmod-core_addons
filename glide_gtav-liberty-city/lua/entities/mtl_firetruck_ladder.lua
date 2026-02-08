AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_glide_car" 
ENT.PrintName = "MTL Firetruck Ladder"
ENT.GlideCategory = "LC - FDLC"
ENT.ChassisModel = "models/props_vehicles/lcp/mtl_firetruck/mtl_firetruck_ladder.mdl"
ENT.ExplosionGibs = { "models/props_vehicles/lcp/mtl_firetruck/mtl_firetruck_ladder.mdl" }
ENT.Author = "Exidnost"
ENT.IconOverride = "gui/glide/lcp/mtl_firetruck_ladder.png"
ENT.CanSwitchSiren = true
if CLIENT then
    ENT.StartSound = "Glide.Engine.TruckStart"
    ENT.StartedSound = "glide/engines/start_tail_truck.wav"
    ENT.StoppedSound = "glide/engines/shut_down_truck_1.wav"
    ENT.HornSound = "glide/horns/large_truck_horn_2.wav"
    ENT.ReverseSound = "glide/alarms/reverse_warning.wav"
    ENT.BrakeLoopSound = "glide/wheels/rig_brake_disc_1.wav"
    ENT.BrakeReleaseSound = "glide/wheels/rig_brake_release.wav"
    ENT.BrakeSqueakSound = "Glide.Brakes.Squeak"
	
    ENT.CameraOffset = Vector( -650, 0, 90 )
    ENT.CameraAngleOffset = Angle( 5, 0, 0 )
    ENT.ExhaustAlpha = 40
    ENT.ExhaustOffsets = {
        { pos = Vector( -1,36,-30 ), angle = Angle( -10, -90, 0 ), scale = 2 },
    }

    ENT.EngineSmokeStrips = {
        { offset = Vector( 186, 0, 6 ), angle = Angle( -20, 0, 0 ), width = 35 },
    }

    ENT.EngineFireOffsets = {
        { offset = Vector( 186, 0, 6 ), angle = Angle( 0, 90, 0 ) }, 
    }

    ENT.Headlights = {
        { offset = Vector( 183,28,11.5 ) },
        { offset = Vector( 183,-28,11.5 ) },
    }

    ENT.LightSprites = {
-- reverse lights
        { type = "reverse", offset = Vector( -347,39,-8.5 ), dir = Vector( -1, 0, 0 ), size = 40, color = COLOR_REARLIGHT },
        { type = "reverse", offset = Vector( -347,-39,-8.5 ), dir = Vector( -1, 0, 0 ), size = 40, color = COLOR_REARLIGHT },	
-- brake lights
        { type = "brake", offset = Vector( -347,39,-2 ), dir = Vector( -1, 0, 0 ), size = 60 },
        { type = "brake", offset = Vector( -347,-39,-2 ), dir = Vector( -1, 0, 0 ), size = 60 },             		
-- rear lights 
		{ type = "taillight", offset = Vector( -347,39,11 ), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50 },   
		{ type = "taillight", offset = Vector( -347,-39,11 ), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50},	
-- headlights		
        { type = "headlight", offset = Vector( 183,28,11.5 ), dir = Vector( 1, 0, 0 ), size = 30 },
        { type = "headlight", offset = Vector( 183,-28,11.5 ), dir = Vector( 1, 0, 0 ), size = 30  },	
        { type = "headlight", offset = Vector( 183,35.5,11.5 ), dir = Vector( 1, 0, 0 ), size = 30 },
        { type = "headlight", offset = Vector( 183,-35.5,11.5 ), dir = Vector( 1, 0, 0 ), size = 30  },	
-- turn signals			
		--front
		{ type = "signal_left", offset = Vector( 184,31,5 ), dir = Vector( 1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
        { type = "signal_right", offset = Vector( 184,-31,5 ), dir = Vector( 1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
		--rear
		{ type = "signal_left", offset = Vector( -347,39,4.5 ), dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
        { type = "signal_right", offset = Vector( -347,-39,4.5 ), dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },

    }
    ENT.SirenLights = {
        -- (white) lights
        { offset = Vector( 156, 0, 66 ), time = 0, color = Glide.DEFAULT_SIREN_COLOR_W },
        { offset = Vector( 156, 0, 66 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_W },

--side

        { offset = Vector( 39, 49, 51 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( 39, 49, 51 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( 39, -49, 51 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 0, -1, 0 ) },
        { offset = Vector( 39, -49, 51 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 0, -1, 0 ) },

        { offset = Vector( 126, 49, 51 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( 126, 49, 51 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( 126, -49, 51 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 0, -1, 0 ) },
        { offset = Vector( 126, -49, 51 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 0, -1, 0 ) },

        -- (red) lights
        { offset = Vector( 148, 33, 66 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( 148, 33, 66 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( 148, -33, 66 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( 148, -33, 66 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A },

        { offset = Vector( 60, 33, 66 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( 60, 33, 66 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( 60, -33, 66 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( 60, -33, 66 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A },

        { offset = Vector( -340, 42, 27 ), time = 0, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( -340, 42, 27 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( -340, -42, 27 ), time = 0, color = Glide.DEFAULT_SIREN_COLOR_A },
        { offset = Vector( -340, -42, 27 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A },		

--side

        { offset = Vector( -140, 49, 5 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( -140, 49, 5 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( -140, -49, 5 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, -1, 0 ) },
        { offset = Vector( -140, -49, 5 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, -1, 0 ) },

--front

        { offset = Vector( 184, 31, -11 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 184, -31, -11 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 184, 31, -11 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 184, -31, -11 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 184, 31, -11 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 184, -31, -11 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },


        { bodygroup = 6, time = 0.0 },
        { bodygroup = 6, time = 0.5 },
		
        { bodygroup = 7, time = 0.25 },
        { bodygroup = 7, time = 0.75 },
		
        { bodygroup = 8, time = 0.5 },
        { bodygroup = 8, time = 0.0 },
		
        { bodygroup = 9, time = 0.25 },
        { bodygroup = 9, time = 0.5 },
        { bodygroup = 9, time = 0.75 },
		
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
        self:PhysicsInit( SOLID_VPHYSICS, Vector( -45, 0, -15 ) )
    end
	
    ENT.LightBodygroups = {
        { type = "headlight", bodyGroupId = 1, subModelId = 1 },
        { type = "brake", bodyGroupId = 2, subModelId = 1 },
        { type = "signal_right", bodyGroupId = 3, subModelId = 1 },
        { type = "signal_left", bodyGroupId = 4, subModelId = 1 },
        { type = "reverse", bodyGroupId = 5, subModelId = 1 },
    }
	
    ENT.SpawnPositionOffset = Vector( 0, 0, 20 )
    ENT.ChassisMass = 1800
    ENT.IsHeavyVehicle = true
    ENT.BurnoutForce = 10
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
		
        self:SetSuspensionLength( 16 )
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

        self:CreateSeat( Vector( 126,29,-5 ), Angle( 0, -90, 0 ), Vector( 140.0,100,0 ), true )
		
        self:CreateSeat( Vector( 146, -29, 1 ), Angle( 0, -90, 18 ), Vector( 140.0,100,0 ), true )  		
        self:CreateSeat( Vector( 96,29,1 ), Angle( 0, 90, 18 ), Vector( 140.0,100,0 ), true )
        self:CreateSeat( Vector( 96, -29, 1 ), Angle( 0, 90, 18 ), Vector( 140.0,100,0 ), true )       

        self:CreateSeat( Vector( 56,22,3 ), Angle( 0, -90, 18 ), Vector( 140.0,100,0 ), true )
        self:CreateSeat( Vector( 56, -22, 3 ), Angle( 0, -90, 18 ), Vector( 140.0,100,0 ), true )       
        self:CreateSeat( Vector( 56, 0, 3 ), Angle( 0, -90, 18 ), Vector( 140.0,100,0 ), true )       

        self:CreateWheel( Vector( 111,40,-12.0 ), {
            model = "models/props_vehicles/lcp/wheel16.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.35, 1 ),
            steerMultiplier = 1,
        } )

        self:CreateWheel( Vector( 111,-40,-12.0 ), {
            model = "models/props_vehicles/lcp/wheel16.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            modelScale = Vector( 1, 0.35, 1 ),
            steerMultiplier = 1,
        } )

        self:CreateWheel( Vector( -112,43,-12.0 ), {
            model = "models/props_vehicles/lcp/wheel16a.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.5, 1 ),

        } )

        self:CreateWheel( Vector(-112,-43,-12.0 ), {
            model = "models/props_vehicles/lcp/wheel16a.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            modelScale = Vector( 1, 0.5, 1 ),

        } )   
		
        self:CreateWheel( Vector( -168,43,-12.0 ), {
            model = "models/props_vehicles/lcp/wheel16a.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.5, 1 ),

        } )

        self:CreateWheel( Vector(-168,-43,-12.0 ), {
            model = "models/props_vehicles/lcp/wheel16a.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            modelScale = Vector( 1, 0.5, 1 ),

        } )  
        self:ChangeWheelRadius( 24  )
    end
	
end

