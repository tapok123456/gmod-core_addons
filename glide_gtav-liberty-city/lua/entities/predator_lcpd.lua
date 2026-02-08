AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_glide_boat"
ENT.PrintName = "Predator LCPD"
ENT.GlideCategory = "LC - LCPD"
ENT.ChassisModel = "models/props_vehicles/lcp/predator/predator_lcpd.mdl"
ENT.ExplosionGibs = { "models/props_vehicles/lcp/predator/predator_lcpd.mdl" }
ENT.Author = "Exidnost"
ENT.IconOverride = "gui/glide/lcp/predator_lcpd.png"

-- Override the default first person offset
function ENT:GetFirstPersonOffset( _, localEyePos )
    localEyePos[1] = localEyePos[1] + 5
    localEyePos[3] = localEyePos[3] + 10

    return localEyePos
end

if CLIENT then
    local POSE_DATA = {

        ["ValveBiped.Bip01_L_Thigh"] = Angle( -20, 90, -30 ),			

        ["ValveBiped.Bip01_R_Thigh"] = Angle( 20, 90, 30 ),	

        ["ValveBiped.Bip01_L_Calf"] = Angle( -10, -50, 20 ),			

        ["ValveBiped.Bip01_R_Calf"] = Angle( 10, -50, -20 ),	

        ["ValveBiped.Bip01_L_Foot"] = Angle( -0, 10, 0 ),			

        ["ValveBiped.Bip01_R_Foot"] = Angle( 0, 10, -0 ),	
    }

	
    function ENT:GetSeatBoneManipulations( seatIndex )
        if seatIndex == 1 then
            return POSE_DATA
		else
			return POSE_DATA_PASS
        end
    end

    ENT.CameraOffset = Vector( -600, 0, 100 )

    ENT.PropellerPositions = {
        Vector( -220, 18, -15 ),
        Vector( -220, -18, -15 )
    }

    ENT.EngineFireOffsets = {
        { offset = Vector( -155, 16, 32 ), angle = Angle( 0, 90, 0 ), scale = 1 },
        { offset = Vector( -155, -16, 32 ), angle = Angle( 0, 90, 0 ), scale = 1 }
    }

    ENT.EngineSmokeStrips = {
        { offset = Vector( -154, 16, 32 ), angle = Angle( 0, 180, 0 ), width = 15 },
        { offset = Vector( -154, -16, 32 ), angle = Angle( 0, 180, 0 ), width = 15 }
    }

    ENT.Headlights = {
        { offset = Vector( -17, 0, 79 ) },
    }

    ENT.LightSprites = {
        { type = "headlight", offset = Vector( -17, 0, 79 ), dir = Vector( 1, 0, 0 ) },
    }

    function ENT:OnCreateEngineStream( stream )
        stream:LoadPreset( "asea" )
    end

    function ENT:OnActivateMisc()
        self.propellerL = self:LookupBone( "propeller_l" )
        self.propellerR = self:LookupBone( "propeller_r" )
    end

    DEFINE_BASECLASS( "base_glide_boat" )

    local spinAng = Angle()

    -- Override this function to animate the propellers.
    function ENT:OnUpdateAnimations()
        -- Call the base class' `OnUpdateAnimations`
        -- to automatically update the steering pose parameter.
        BaseClass.OnUpdateAnimations( self )

        if not self.propellerL then return end

        local spinSpeed = self:GetEngineThrottle() + self:GetEnginePower()

        spinAng[1] = ( spinAng[1] + FrameTime() * spinSpeed * 2000 ) % 360

        self:ManipulateBoneAngles( self.propellerL, spinAng )
        self:ManipulateBoneAngles( self.propellerR, spinAng )
    end
end

if SERVER then
    function ENT:InitializePhysics()
        self:SetSolid( SOLID_VPHYSICS )
        self:SetMoveType( MOVETYPE_VPHYSICS )
        self:PhysicsInit( SOLID_VPHYSICS, Vector( 0, 0, -25 ) )
    end
    ENT.SpawnPositionOffset = Vector( 0, 0, 0 )

    ENT.LightBodygroups = {
        { type = "headlight", bodyGroupId = 1, subModelId = 1 }
    }
    ENT.BoatParams = {
        engineForce = 800,
    }
    function ENT:CreateFeatures()
		self:SetColor( Color( 255, 255, 255, 255 ) )

        self:CreateSeat( Vector( -56, 25, 12 ), Angle( 0, 270, 0 ), Vector( -115, 0, 25 ), true )
        self:CreateSeat( Vector( -188, 20, -6 ), Angle( 0, 270, 0 ), Vector( -170, 10, 25 ), true )
        self:CreateSeat( Vector( -188, -20, -6 ), Angle( 0, 270, 0 ), Vector( -170, -10, 25 ), true )
    end
end
