
--
-- W9K. Murderthon 9000 Stay Winning Forever. GOTY.
--

-- W9K is installed if this exists
W9K = {}

W9K.Ammo = {
	["45acp"] = {
		dnear = 40,
		dfar = 25,
	},
	["357sig"] = {
		dnear = 30,
		dfar = 20,
	},
	["9x19mm"] = {
		dnear = 26,
		dfar = 20,
	},
}

W9K.LimbCompensation = {
	[1] = {
		[HITGROUP_HEAD]     = 1 / 2,
		[HITGROUP_LEFTARM]  = 1 / 0.25,
		[HITGROUP_RIGHTARM] = 1 / 0.25,
		[HITGROUP_LEFTLEG]  = 1 / 0.25,
		[HITGROUP_RIGHTLEG] = 1 / 0.25,
		[HITGROUP_GEAR]     = 1 / 0.25,
	},
	["terrortown"] = {
		[HITGROUP_HEAD]     = 1 / 2.5, -- ArcCW's sh_ttt.lua line 5!!!
		[HITGROUP_LEFTARM]  = 1 / 0.55,
		[HITGROUP_RIGHTARM] = 1 / 0.55,
		[HITGROUP_LEFTLEG]  = 1 / 0.55,
		[HITGROUP_RIGHTLEG] = 1 / 0.55,
		[HITGROUP_GEAR]     = 1 / 0.55,
	},
}

W9K.BodyDamageMults = {
	[HITGROUP_HEAD] = 2,
}

if CLIENT then
	CreateClientConVar("w9k_cl_toggleads", 0, true, true, nil, 0, 1)
	hook.Add("PopulateToolMenu", "W9K_MenuOptions", function()
		spawnmenu.AddToolMenuOption("Options", "W9K", "W9K", "Client", "", "", function(panel)
			panel:AddControl("header", {
				description = "Clientside options for W9K"
			})

			panel:AddControl("checkbox", {
				label = "Toggle Aim",
				command = "w9k_cl_toggleads"
			})
			panel:ControlHelp("Tap once to aim down sights")
		end)
	end)
end