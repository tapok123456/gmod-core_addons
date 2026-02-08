local addonName = "Unknown Taunts - Team Fortress 2"
local GetSequenceName, GetRenderAngles, SetRenderAngles
do
	local _obj_0 = uTaunt
	GetSequenceName, GetRenderAngles, SetRenderAngles = _obj_0.GetSequenceName, _obj_0.GetRenderAngles, _obj_0.SetRenderAngles
end
local sub, find, format, StartsWith
do
	local _obj_0 = string
	sub, find, format, StartsWith = _obj_0.sub, _obj_0.find, _obj_0.format, _obj_0.StartsWith
end
local PRE_HOOK = PRE_HOOK or HOOK_MONITOR_HIGH
local CurTime = CurTime
local Add = hook.Add
if SERVER then
	resource.AddWorkshop("3166246769")
	local SetSequenceName, SetCycle
	do
		local _obj_0 = uTaunt
		SetSequenceName, SetCycle = _obj_0.SetSequenceName, _obj_0.SetCycle
	end
	local match = string.match
	local random = math.random
	Add("PlayerShouldUnknownTaunt", addonName, function(ply, sequenceID)
		if StartsWith(ply:GetSequenceName(sequenceID), "wos_tf2_") then
			return true
		end
	end)
	do
		local sounds = {
			{
				"^wos_tf2_%w+_taunt_mannrobics_start%d$",
				"tf2/mannrobics"
			},
			{
				"^wos_tf2_%w+_taunt_russian$",
				"tf2/cossack_sandvich"
			},
			{
				"^wos_tf2_%w+_taunt_conga$",
				"tf2/conga_sketch_167bpm_01-04"
			}
		}
		Add("UnknownTauntSound", addonName, function(ply, sequenceName, cycle)
			if not StartsWith(sequenceName, "wos_tf2_") then
				return
			end
			for _index_0 = 1, #sounds do
				local data = sounds[_index_0]
				if find(sequenceName, data[1], 1, false) ~= nil then
					return "unknown-taunts/" .. data[2] .. ".wav"
				end
			end
		end)
	end
	Add("PlayerStartedUnknownTaunt", addonName, function(ply, sequenceName, duration)
		if not StartsWith(sequenceName, "wos_tf2_") then
			return
		end
		local className, id = match(sequenceName, "^wos_tf2_(%w+)_taunt_mannrobics_start(%d)$")
		if className ~= nil then
			if id ~= 2 and random(0, 1) == 0 then
				SetSequenceName(ply, format("wos_tf2_%s_taunt_mannrobics_start2", className))
			end
			ply.m_dLastMannRobicsStart = CurTime() + duration + 2.5
		end
	end, PRE_HOOK)
	do
		local tf2patterns = {
			"^wos_tf2_(%w+)_taunt_mannrobics_straight$",
			"^wos_tf2_(%w+)_taunt_russian$",
			"^wos_tf2_(%w+)_taunt_conga$"
		}
		Add("UnknownTauntThink", addonName, function(ply, sequenceName, cycle, sequenceID)
			if not StartsWith(sequenceName, "wos_tf2_") or cycle <= 0.95 then
				return
			end
			local className = match(sequenceName, "^wos_tf2_(%w+)_taunt_mannrobics_start%d$")
			if className ~= nil then
				SetSequenceName(ply, format("wos_tf2_%s_taunt_mannrobics_straight", className))
				SetCycle(ply, 0)
				return
			end
			for _index_0 = 1, #tf2patterns do
				local pattern = tf2patterns[_index_0]
				if find(sequenceName, pattern, 1, false) ~= nil then
					SetCycle(ply, 0, sequenceID)
					return
				end
			end
		end, PRE_HOOK)
	end
	do
		local IN_ATTACK, IN_ATTACK2 = IN_ATTACK, IN_ATTACK2
		Add("KeyPress", addonName, function(ply, key)
			if key ~= IN_ATTACK and key ~= IN_ATTACK2 then
				return
			end
			local sequenceName = GetSequenceName(ply)
			if sequenceName == "" or not StartsWith(sequenceName, "wos_tf2_") then
				return
			end
			local className = match(sequenceName, "^wos_tf2_(%w+)_taunt_mannrobics_straight$")
			if className == nil then
				return
			end
			if ply.m_dLastMannRobicsStart > CurTime() then
				return
			end
			sequenceName = format("wos_tf2_%s_taunt_mannrobics_start%d", className, random(1, 2))
			local sequenceID = ply:LookupSequence(sequenceName)
			if sequenceID < 1 then
				uTaunt.Finish(ply, true)
				return
			end
			ply.m_dLastMannRobicsStart = CurTime() + ply:SequenceDuration(sequenceID) + 2.5
			SetSequenceName(ply, sequenceName)
			SetCycle(ply, 0)
			return
		end, PRE_HOOK)
	end
end
if CLIENT then
	local FindSequences = uTaunt.FindSequences
	local GetPhrase = language.GetPhrase
	Add("UnknownTauntMenuSetup", addonName, function(ply, add)
		local sequences, sequencesCount = { }, 0
		local _list_0 = FindSequences(ply, "^wos_tf2_[%w_]+$")
		for _index_0 = 1, #_list_0 do
			local sequence = _list_0[_index_0]
			local sequenceName = sequence.name
			if find(sequenceName, "^wos_tf2_%w+_taunt_mannrobics_", 1, false) ~= nil and find(sequenceName, "_start1$", 1, false) == nil then
				goto _continue_0
			end
			sequencesCount = sequencesCount + 1
			sequences[sequencesCount] = sequenceName
			::_continue_0::
		end
		if sequencesCount == 0 then
			return
		end
		add(format(GetPhrase("#unknown_taunts.menu.dances"), "Team Fortress 2"), sequences)
		return
	end)
end
local IN_MOVELEFT, IN_MOVERIGHT = IN_MOVELEFT, IN_MOVERIGHT
local IN_FORWARD, IN_BACK = IN_FORWARD, IN_BACK
do
	local buttons = 0
	local length = 0
	Add("TauntStartCommand", addonName, function(ply, cmd, sequenceName)
		if sequenceName == "" or not StartsWith(sequenceName, "wos_tf2_") then
			return
		end
		cmd:ClearMovement()
		length = #sequenceName
		if sub(sequenceName, length - 6, length - 1) == "_start" then
			return 0
		end
		buttons = 0
		if cmd:KeyDown(IN_FORWARD) then
			buttons = buttons + IN_FORWARD
		end
		if cmd:KeyDown(IN_BACK) then
			buttons = buttons + IN_BACK
		end
		if cmd:KeyDown(IN_MOVELEFT) then
			buttons = buttons + IN_MOVELEFT
		end
		if cmd:KeyDown(IN_MOVERIGHT) then
			buttons = buttons + IN_MOVERIGHT
		end
		return buttons
	end)
end
local FrameTime = FrameTime
local forward = 0
local setAngles
setAngles = function(ply, angles, length)
	local _update_0 = 2
	angles[_update_0] = angles[_update_0] + (length * FrameTime())
	if angles[2] > 180 then
		angles[2] = -180
	elseif angles[2] < -180 then
		angles[2] = 180
	end
	if SERVER then
		return SetRenderAngles(ply, angles)
	end
end
Add("Move", addonName, function(self, mv)
	local sequenceName = GetSequenceName(self)
	if sequenceName == "" or not StartsWith(sequenceName, "wos_tf2_") then
		return
	end
	local angles = GetRenderAngles(self)
	if mv:KeyDown(IN_MOVELEFT) then
		setAngles(self, angles, 45)
	end
	if mv:KeyDown(IN_MOVERIGHT) then
		setAngles(self, angles, -45)
	end
	forward = 0
	if find(sequenceName, "^wos_tf2_(%w+)_taunt_conga$") ~= nil then
		forward = 1
	elseif find(sequenceName, "^wos_tf2_%w+_taunt_mannrobics_start%d$") == nil then
		if mv:KeyDown(IN_FORWARD) then
			forward = forward + 1
		end
		if mv:KeyDown(IN_BACK) then
			forward = forward - 1
		end
	end
	if forward == 0 then
		mv:SetForwardSpeed(0)
		mv:SetSideSpeed(0)
		return
	end
	local force = (mv:GetMoveAngles() - angles):Forward() * (self:GetSlowWalkSpeed() * forward)
	mv:SetForwardSpeed(force[1])
	mv:SetSideSpeed(force[2])
	return
end, PRE_HOOK)
