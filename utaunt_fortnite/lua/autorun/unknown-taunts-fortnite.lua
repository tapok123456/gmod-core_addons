local Add = hook.Add
if SERVER then
	resource.AddWorkshop("3161530501")
	local find = string.find
	Add("PlayerShouldUnknownTaunt", "Fortnite Taunts", function(ply, sequenceID)
		if find(ply:GetSequenceName(sequenceID), "^f_[%w_]+$", 1, false) ~= nil then
			return true
		end
	end)
end
if CLIENT then
	local FindSequences = uTaunt.FindSequences
	local GetPhrase = language.GetPhrase
	local format = string.format
	Add("UnknownTauntMenuSetup", "Fortnite Taunts", function(ply, add)
		local sequences, sequencesCount = { }, 0
		local _list_0 = FindSequences(ply, "^f_[%w_]+$")
		for _index_0 = 1, #_list_0 do
			local sequence = _list_0[_index_0]
			sequencesCount = sequencesCount + 1
			sequences[sequencesCount] = sequence.name
		end
		if sequencesCount == 0 then
			return
		end
		add(format(GetPhrase("#unknown_taunts.menu.taunts"), "Fortnite"), sequences)
		return
	end)
end
