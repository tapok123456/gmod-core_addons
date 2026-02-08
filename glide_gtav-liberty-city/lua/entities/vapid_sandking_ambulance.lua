AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_glide_car" 
ENT.PrintName = "Vapid Sandking Ambulance"
ENT.GlideCategory = "LC - FDLC"
ENT.ChassisModel = "models/props_vehicles/lcp/vapid_sandking/vapid_sandking_ambulance.mdl"
ENT.ExplosionGibs = { "models/props_vehicles/lcp/vapid_sandking/vapid_sandking_ambulance.mdl" }
ENT.Author = "Exidnost"
ENT.IconOverride = "gui/glide/lcp/vapid_sandking_ambulance.png"
ENT.CanSwitchSiren = true
if CLIENT then

    ENT.CameraOffset = Vector( -470, 0, 100 )
    ENT.CameraAngleOffset = Angle( 5, 0, 0 )
    ENT.ExhaustAlpha = 30
    ENT.ExhaustOffsets = {
        { pos = Vector( -68,-65,-12 ), angle = Angle( -10, 80, 0 ), scale = 2 },
    }

    ENT.EngineSmokeStrips = {
        { offset = Vector( 142, 0, 25 ), angle = Angle( -20, 0, 0 ), width = 55 },
    }

    ENT.EngineFireOffsets = {
        { offset = Vector( 142, 0, 25 ), angle = Angle( 0, 90, 0 ) }, 
    }

    ENT.Headlights = {
        { offset = Vector( 126,38,28 ) },
        { offset = Vector( 126,-38,28 ) },
    }

    ENT.LightSprites = {
-- reverse lights
        { type = "reverse", offset = Vector( -178,14.5,0.5 ), dir = Vector( -1, 0, 0 ), size = 40, color = COLOR_REARLIGHT },
        { type = "reverse", offset = Vector( -178,-14.5,0.5 ), dir = Vector( -1, 0, 0 ), size = 40, color = COLOR_REARLIGHT },	
-- brake lights
        { type = "brake", offset = Vector( -178,45,1.5 ), dir = Vector( -1, 0, 0 ), size = 60 },
        { type = "brake", offset = Vector( -178,-45,1.5 ), dir = Vector( -1, 0, 0 ), size = 60 },             		
-- rear lights 
		{ type = "taillight", offset = Vector( -178,37,1.5 ), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50 },   
		{ type = "taillight", offset = Vector( -178,-37,1.5 ), dir = Vector( -1, 0, 0 ), color = COLOR_REARLIGHT, size = 50},	
-- headlights		
        { type = "headlight", offset = Vector( 126,38,28 ), dir = Vector( 1, 0, 0 ), size = 30 },
        { type = "headlight", offset = Vector( 126,-38,28 ), dir = Vector( 1, 0, 0 ), size = 30  },	
        { type = "headlight", offset = Vector( 126,38,21 ), dir = Vector( 1, 0, 0 ), size = 30 },
        { type = "headlight", offset = Vector( 126,-38,21 ), dir = Vector( 1, 0, 0 ), size = 30  },	
-- turn signals			
		--front
		{ type = "signal_left", offset = Vector( 123,45,28 ), dir = Vector( 1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
        { type = "signal_right", offset = Vector( 123,-45,28 ), dir = Vector( 1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
		{ type = "signal_left", offset = Vector( 124,45,22 ), dir = Vector( 1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
        { type = "signal_right", offset = Vector( 124,-45,22 ), dir = Vector( 1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
		--rear
		{ type = "signal_left", offset = Vector( -178,53,1.5 ), dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
        { type = "signal_right", offset = Vector( -178,-53,1.5 ), dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
    }
    ENT.SirenLights = {

        -- (white) lights
		
-- (white) front
        { offset = Vector( 17, 21, 86 ), time = 0.4, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 17, 21, 86 ), time = 0.6, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 17, -21, 86 ), time = 0.4, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 17, -21, 86 ), time = 0.6, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 1, 0, 0 ) },

-- (white) side 

        { offset = Vector( -129, 60, 85 ), time = 0.2, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( -129, 60, 85 ), time = 0.4, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( -129, -60, 85 ), time = 0.2, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 0, -1, 0 ) },
        { offset = Vector( -129, -60, 85 ), time = 0.4, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 0, -1, 0 ) },
        { offset = Vector( -45, 60, 85 ), time = 0.2, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( -45, 60, 85 ), time = 0.4, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( -68, -60, 85 ), time = 0.2, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 0, -1, 0 ) },
        { offset = Vector( -68, -60, 85 ), time = 0.4, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( 0, -1, 0 ) },

-- (white) back

        { offset = Vector( -180, 37, 96 ), time = 0.2, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -180, 37, 96 ), time = 0.4, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -180, -37, 96 ), time = 0.2, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -180, -37, 96 ), time = 0.4, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -180, 13, 96 ), time = 0.6, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -180, 13, 96 ), time = 0.8, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -180, -13, 96 ), time = 0.6, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -180, -13, 96 ), time = 0.8, color = Glide.DEFAULT_SIREN_COLOR_W, dir = Vector( -1, 0, 0 ) },

-- (red) lights

-- (red) side

        { offset = Vector( -163, 60, 85 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( -163, 60, 85 ), time = 0.2, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( -163, -60, 85 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, -1, 0 ) },
        { offset = Vector( -163, -60, 85 ), time = 0.2, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, -1, 0 ) },
        { offset = Vector( -10, 60, 85 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( -10, 60, 85 ), time = 0.2, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, 1, 0 ) },
        { offset = Vector( -10, -60, 85 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, -1, 0 ) },
        { offset = Vector( -10, -60, 85 ), time = 0.2, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 0, -1, 0 ) },

-- (red) front

        { offset = Vector( 7, 46, 86 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 7, 46, 86 ), time = 0.2, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 7, -46, 86 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 7, -46, 86 ), time = 0.2, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 12, 34, 86 ), time = 0.2, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 12, 34, 86 ), time = 0.4, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 12, -34, 86 ), time = 0.2, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 12, -34, 86 ), time = 0.4, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 17, 7, 86 ), time = 0.6, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 17, 7, 86 ), time = 0.8, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 17, -7, 86 ), time = 0.6, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 17, -7, 86 ), time = 0.8, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },


        { offset = Vector( 140, 15, 22 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 140, -15, 22 ), time = 0.25, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 140, 15, 22 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 140, -15, 22 ), time = 0.5, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 140, 15, 22 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },
        { offset = Vector( 140, -15, 22 ), time = 0.75, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( 1, 0, 0 ) },


-- (red) back

        { offset = Vector( -180, 49, 96 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -180, 49, 96 ), time = 0.2, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -180, -49, 96 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -180, -49, 96 ), time = 0.2, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -180, 26, 96 ), time = 0.4, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -180, 26, 96 ), time = 0.6, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -180, -26, 96 ), time = 0.4, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -180, -26, 96 ), time = 0.6, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -180, 0, 96 ), time = 0.8, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -180, 0, 96 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -178, 46, 58 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -178, 46, 58 ), time = 0.2, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -178, -46, 58 ), time = 0.0, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -178, -46, 58 ), time = 0.2, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -178, 46, 88 ), time = 0.4, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -178, 46, 88 ), time = 0.6, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -178, -46, 88 ), time = 0.4, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },
        { offset = Vector( -178, -46, 88 ), time = 0.6, color = Glide.DEFAULT_SIREN_COLOR_A, dir = Vector( -1, 0, 0 ) },


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
        { type = "brake", bodyGroupId = 2, subModelId = 1 },
        { type = "signal_right", bodyGroupId = 3, subModelId = 1 },
        { type = "signal_left", bodyGroupId = 4, subModelId = 1 },
        { type = "reverse", bodyGroupId = 5, subModelId = 1 },
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
		self:SetColor( Color( 255, 255, 255, 255 ) )
        local randomSkin = math.random(0, 1)
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

        self:CreateSeat( Vector( 16,22,9 ), Angle( 0, -90, 0 ), Vector( 40.0,100,50 ), true )
		
        self:CreateSeat( Vector( 26, -22, 11 ), Angle( 0, -90, 18 ), Vector( 40.0,-100,50 ), true )       
		self:CreateSeat( Vector( -160, -39, 14 ), Angle( 0, 0, 0 ), Vector( -240.0,-30,50 ), true )
		self:CreateSeat( Vector( -160, 39, 14 ), Angle( 0, 180, 0 ), Vector( -240.0,30,50  ), true )

        self:CreateWheel( Vector( 98,44,6 ), {
            model = "models/props_vehicles/lcp/wheel14.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.4, 1 ),
            steerMultiplier = 1,
        } )

        self:CreateWheel( Vector( 98,-44,6 ), {
            model = "models/props_vehicles/lcp/wheel14.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            modelScale = Vector( 1, 0.4, 1 ),
            steerMultiplier = 1,
        } )

        self:CreateWheel( Vector( -95,51,6 ), {
            model = "models/props_vehicles/lcp/wheel14a.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.55, 1 ),

        } )

        self:CreateWheel( Vector(-95,-51,6 ), {
            model = "models/props_vehicles/lcp/wheel14a.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            modelScale = Vector( 1, 0.55, 1 ),

        } )        

        self:ChangeWheelRadius( 20  )
    end
	
end

