
AddCSLuaFile()
ENT.Type = "anim"
ENT.Base = "base_glide_car"
ENT.PrintName = "APC LC NOOSE"
ENT.GlideCategory = "LC - NOOSE"
ENT.ChassisModel = "models/props_vehicles/lcp/noose_apc/noose_apc.mdl"
ENT.ExplosionGibs = { "models/props_vehicles/lcp/noose_apc/noose_apc.mdl" }
ENT.CanSwitchSiren = true
ENT.Author = "Exidnost"
ENT.IconOverride = "gui/glide/lcp/apc_noose.png"
ENT.MaxChassisHealth = 3500
DEFINE_BASECLASS( "base_glide_car" )

function ENT:SetupDataTables()
    BaseClass.SetupDataTables( self )

    self:NetworkVar( "Entity", "Turret" )
    self:NetworkVar( "Entity", "TurretSeat" )
end

function ENT:GetPlayerSitSequence( seatIndex )
    return seatIndex == 5 and "drive_airboat" or ( seatIndex > 1 and "sit" or "drive_jeep" )
end

if CLIENT then
    ENT.HornSound = "glide/horns/car_horn_med_3.wav"
    ENT.CameraOffset = Vector( -360, 0, 120 )

    ENT.EngineSmokeStrips = {
        { offset = Vector( -108, 14, 54 ), angle = Angle( 0, 180, 0 ), width = 20 },
        { offset = Vector( -108, -14, 54 ), angle = Angle( 0, 180, 0 ), width = 20 },
    }

    ENT.EngineSmokeMaxZVel = 150

    ENT.EngineFireOffsets = {
        { offset = Vector( -108, 14, 54 ), angle = Angle() },
        { offset = Vector( -108, -14, 54 ), angle = Angle() },
    }
    ENT.Headlights = {
        { offset = Vector( 122, 36, 36 ), color = color_white, texture = "glide/effects/headlight_circle" },
        { offset = Vector( 122, -36, 36 ), color = color_white, texture = "glide/effects/headlight_circle" }
    }

    ENT.LightSprites = {
        { type = "brake", offset = Vector( -115, 40, 48 ), dir = Vector( -1, 0, 0 ), size = 50  },
        { type = "brake", offset = Vector( -115, -40, 48 ), dir = Vector( -1, 0, 0 ), size = 50  },
        { type = "taillight", offset = Vector( -115, 40, 48 ), dir = Vector( -1, 0, 0 ), size = 40 },
        { type = "taillight", offset = Vector( -115, -40, 48 ), dir = Vector( -1, 0, 0 ), size = 40 },
        { type = "headlight", offset = Vector( 122, 36, 36 ), dir = Vector( 1, 0, 0 ), color = color_white },
        { type = "headlight", offset = Vector( 122, -36, 36 ), dir = Vector( 1, 0, 0 ), color = color_white },
-- turn signals			
		--rear
		{ type = "signal_left", offset = Vector( -115, 44, 44 ), dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
        { type = "signal_right", offset = Vector( -115, -44, 44 ), dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 40 },
    }
    ENT.SirenLights = {
        -- Top (white) lights
        { offset = Vector( -30, 30, 62 ), time = 0.25, color = Glide.DEFAULT_TURN_SIGNAL_COLOR },
        { offset = Vector( -30, 30, 62 ), time = 0.5, color = Glide.DEFAULT_TURN_SIGNAL_COLOR },
        { offset = Vector( -30, 30, 62 ), time = 0.75, color = Glide.DEFAULT_TURN_SIGNAL_COLOR },
		}

    function ENT:OnCreateEngineStream( stream )
        stream:LoadPreset( "lcp_apc" )
    end
	

    function ENT:OnLocalPlayerEnter( seatIndex )
        self:DisableCrosshair()
        self.isUsingTurret = false
        local ply = LocalPlayer()
        if seatIndex == 5 then
            ply:SetNoDraw(true)
            self:EnableCrosshair( { iconType = "dot", color = Color( 0, 255, 0 ) } )
            self.isUsingTurret = true
        else
            ply:SetNoDraw(false)
            BaseClass.OnLocalPlayerEnter( self, seatIndex )
        end
    end

    function ENT:OnLocalPlayerExit()
        local ply = LocalPlayer()
        ply:SetNoDraw(false)
        self:DisableCrosshair()
        self.isUsingTurret = false
    end

    function ENT:UpdateCrosshairPosition()
        self.crosshair.origin = Glide.GetCameraAimPos()
    end

    function ENT:OnActivateMisc()
        BaseClass.OnActivateMisc( self )

        self.turretBaseBone = self:LookupBone( "turret_base" )
        self.turretWeaponBone = self:LookupBone( "turret_weapon" )
    end

    local ang = Angle()
    local offset = Vector()
    local matrix = Matrix()

    function ENT:OnUpdateAnimations()
        BaseClass.OnUpdateAnimations( self )

        local turret = self:GetTurret()
        if not IsValid( turret ) then return end

        local bodyAng = self.isUsingTurret and turret.predictedBodyAngle or turret:GetLastBodyAngle()
        local seat = self:GetTurretSeat()

        if IsValid( seat ) then
            ang[1] = 0
            ang[2] = bodyAng[2]
            ang[3] = 0

            -- Manually move/rotate the seat to match the turret angles
            local rad = math.rad( ang[2] )

            offset[1] = 45
            offset[2] = -45
            offset[3] = 0

            matrix:SetTranslation( offset )
            matrix:SetAngles( ang )
            seat:EnableMatrix( "RenderMultiply", matrix )
        end

        if not self.turretBaseBone then return end

        bodyAng[1] = math.NormalizeAngle( bodyAng[1] ) -- Stay on the -180/180 range

        ang[1] = 0
        ang[2] = bodyAng[2]
        ang[3] = 0 
        self:ManipulateBoneAngles( self.turretBaseBone, ang )
        ang[1] = 0
        ang[2] = 0
        ang[3] = -bodyAng[1] * 1.0
        self:ManipulateBoneAngles( self.turretWeaponBone, ang )
    end


    function ENT:GetCameraType( seatIndex )
        return seatIndex == 5 and 1 or 0 -- Glide.CAMERA_TYPE.TURRET or Glide.CAMERA_TYPE.CAR
    end

    function ENT:AllowFirstPersonMuffledSound( seatIndex )
        return seatIndex < 5
    end

end

	
if SERVER then
    ENT.LightBodygroups = {
        { type = "headlight", bodyGroupId = 1, subModelId = 1 },
        { type = "brake_or_taillight", bodyGroupId = 2, subModelId = 1 },
        { type = "signal_right", bodyGroupId = 3, subModelId = 1 },
        { type = "signal_left", bodyGroupId = 4, subModelId = 1 },
    }
    ENT.SpawnPositionOffset = Vector( 0, 0, 20 )
    ENT.ChassisMass = 1800
    ENT.BulletDamageMultiplier = 0.5

    ENT.FallOnCollision = false
    ENT.BurnoutForce = 12
    ENT.AirControlForce = Vector( 0.3, 0.2, 0.2 )
    function ENT:InitializePhysics()
        self:SetSolid( SOLID_VPHYSICS )
        self:SetMoveType( MOVETYPE_VPHYSICS )
        self:PhysicsInit( SOLID_VPHYSICS, Vector( 5, 0, -15 ) ) -- Center of mass (X Y Z)
    end
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

        self.engineBrakeTorque = 1200
		
        self:SetSuspensionLength( 15 )
        self:SetSpringStrength( 600 )
        self:SetSpringDamper( 2000 )


        self:SetDifferentialRatio( 2 ) 
        self:SetTransmissionEfficiency( 0.7 )
        self:SetPowerDistribution( -0.9 )
        self:SetBrakePower( 2500 )

        self:SetMinRPMTorque( 2500 )
        self:SetMaxRPMTorque( 2800 )
        self:SetMinRPM( 2000 ) 
        self:SetMaxRPM( 16000 ) 

        self:SetMaxSteerAngle( 45 )
        self:SetSteerConeChangeRate( 6 )
        self:SetSteerConeMaxSpeed( 1000 )
        self:SetSteerConeMaxAngle( 0.30 )
		self:SetCounterSteer ( 0.2 )

        self:SetForwardTractionMax( 3800 )
        self:SetSideTractionMultiplier( 40 )
        self:SetSideTractionMaxAng( 25 )
        self:SetSideTractionMax( 2400 )
        self:SetSideTractionMin( 800 )
		
		self:SetTurboCharged( false )
		self:SetFastTransmission( false ) 

        self:CreateSeat( Vector( 46,17,10 ), Angle( 0, -90, -5 ), Vector( -0.0,100,0 ), true ) -- driver
        self:CreateSeat( Vector( 70, -17, 10 ), Angle( 0, -90, 18 ), Vector( -0.0,-100,0 ), true )  
		
        self:CreateSeat( Vector( -35, 25, 10 ), Angle( 0, -90, 18 ), Vector( 0, 100, 0 ), true )
        self:CreateSeat( Vector( -35, -25, 10 ), Angle( 0, -90, 18 ), Vector( 0, -100, 0 ), true )

        local turretSeat = self:CreateSeat( Vector( 35, 45, 70 ), Angle( 0, 270, 0 ), Vector( 0, 0, 90 ), true )

        local turret = Glide.CreateTurret( self, Vector( -1, 0, 71 ), Angle( 0, 0, 0 ) )
        turret:SetFireDelay( 0.3 )
        turret:SetBulletOffset( Vector( 65, 0, 0 ) )
        turret:SetMinPitch( -40 )
        turret:SetMaxPitch( 20 )
        turret:SetSingleShotSound( "Glide.InsurgentShoot" )
        turret:SetShootLoopSound( "" )
        turret:SetShootStopSound( "" )

        turret.BulletDamage = 150

        self:SetTurret( turret )
        self:SetTurretSeat( turretSeat )

        Glide.HideEntity( turret, true )
        Glide.HideEntity( turret:GetGunBody(), true )

        -- Front left
        self:CreateWheel( Vector( 70,47,5 ), {
            model = "models/props_vehicles/lcp/wheel26.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.35, 1 ),
            steerMultiplier = 1,
        } )

        -- Front right
        self:CreateWheel( Vector( 70,-47,5 ), {
            model = "models/props_vehicles/lcp/wheel26.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            modelScale = Vector( 1, 0.35, 1 ),
            steerMultiplier = 1,
        } )

        -- Rear left 
        self:CreateWheel( Vector( -68,47,5 ), {
            model = "models/props_vehicles/lcp/wheel26.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            modelScale = Vector( 1, 0.35, 1 ),

        } )

        -- Rear right 
        self:CreateWheel( Vector(-68,-47,5 ), {
            model = "models/props_vehicles/lcp/wheel26.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            modelScale = Vector( 1, 0.35, 1 ),

        } )       

        self:ChangeWheelRadius( 26 )
    end

    function ENT:OnUpdateFeatures()
        local turret = self:GetTurret()

        if IsValid( turret ) then
            turret:UpdateUser( self:GetSeatDriver( 5 ) )
        end
    end
end
