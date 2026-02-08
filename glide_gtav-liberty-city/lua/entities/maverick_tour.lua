AddCSLuaFile()

if not Glide then return end
ENT.PrintName = "Maverick Tour"
ENT.GlideCategory = "LC - Services"
ENT.Type = "anim"
ENT.Base = "base_glide_heli"
ENT.Author = "Exidnost"
ENT.IconOverride = "gui/glide/lcp/maverick_tour.png"

ENT.MainRotorOffset = Vector( 0, 0, 105 )
ENT.TailRotorOffset = Vector( -335, 5, 64.7 )

if CLIENT then
    ENT.CameraOffset = Vector( -700, 0, 150 )

    ENT.ExhaustPositions = {
        Vector( -37, 15, 97 ),
        Vector( -37, -15, 97 )
    }

    ENT.EngineFireOffsets = {
        { offset = Vector( 0, 0, 97 ), angle = Angle( 300, 0, 0 ) }
    }

    ENT.StrobeLights = {
        { offset = Vector( -370, 0, 128 ), blinkTime = 0 },
        { offset = Vector( -251, 57, 93 ), blinkTime = 0.1 },
        { offset = Vector( -251, -57, 93 ), blinkTime = 0.6 }
    }

    ENT.RotorBeatInterval = 0.09
end

if SERVER then
    ENT.ChassisMass = 500
    ENT.ChassisModel = "models/props_vehicles/lcp/maverick/maverick.mdl"

    ENT.MainRotorRadius = 310
    ENT.TailRotorRadius = 45

    ENT.MainRotorModel = "models/props_vehicles/lcp/maverick/rotor_main_slow.mdl"
    ENT.MainRotorFastModel = "models/props_vehicles/lcp/maverick/rotor_main_fast.mdl"

    ENT.TailRotorModel = "models/props_vehicles/lcp/maverick/rotor_rear_slow.mdl"
    ENT.TailRotorFastModel = "models/props_vehicles/lcp/maverick/rotor_rear_fast.mdl"


    function ENT:CreateFeatures()
		self:SetColor( Color( 255, 190, 50, 255 ) )
        self:CreateSeat( Vector( 73, 21, -5 ), nil, Vector( 76, 80, 0 ), true )
        self:CreateSeat( Vector( 73, -21, -5 ), nil, Vector( 76, -80, 0 ), true )
        self:CreateSeat( Vector( -38, 24, -5 ), nil, Vector( 20, 90, 0 ), true )
        self:CreateSeat( Vector( -38, -24, -5 ), nil, Vector( -20, -90, 0 ), true )
        self:CreateSeat( Vector( -38, 0, -5 ), nil, Vector( -20, -110, 0 ), true )
    end
end
