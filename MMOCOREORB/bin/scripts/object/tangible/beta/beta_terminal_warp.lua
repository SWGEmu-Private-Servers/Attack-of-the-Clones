--Copyright (C) 2010 <SWGEmu>


--This File is part of Core3.

--This program is free software; you can redistribute
--it and/or modify it under the terms of the GNU Lesser
--General Public License as published by the Free Software
--Foundation; either version 2 of the License,
--or (at your option) any later version.

--This program is distributed in the hope that it will be useful,
--but WITHOUT ANY WARRANTY; without even the implied warranty of
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--See the GNU Lesser General Public License for
--more details.

--You should have received a copy of the GNU Lesser General
--Public License along with this program; if not, write to
--the Free Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA

--Linking Engine3 statically or dynamically with other modules
--is making a combined work based on Engine3.
--Thus, the terms and conditions of the GNU Lesser General Public License
--cover the whole combination.

--In addition, as a special exception, the copyright holders of Engine3
--give you permission to combine Engine3 program with free software
--programs or libraries that are released under the GNU LGPL and with
--code included in the standard release of Core3 under the GNU LGPL
--license (or modified versions of such code, with unchanged license).
--You may copy and distribute such a system following the terms of the
--GNU LGPL for Engine3 and the licenses of the other code concerned,
--provided that you include the source code of that other code when
--and as the GNU LGPL requires distribution of source code.

--Note that people who make modified versions of Engine3 are not obligated
--to grant this special exception for their modified versions;
--it is their choice whether to do so. The GNU Lesser General Public License
--gives permission to release a modified version without this exception;
--this exception also makes it possible to release a modified version


object_tangible_beta_beta_terminal_warp = object_tangible_beta_shared_beta_terminal_warp:new {
	gameObjectType = 16400,
	customName = "War Renown Terminal",

	maxCondition = 0,


	templateType = CHARACTERBUILDERTERMINAL,

     suiBoxTitle = "CW Rewards",
     suiBoxText = "Welcome Soldier! Try your luck on a reward from an Ancient Krayt Dragon.",


	itemList = {
			"Black bar - Medic Training (10k)", "apply_all_dots_pay",
			"View Faction Leaderboard (Top 5)", "leaderboard_faction",
			"View PVP Leaderboard (Top 5)", "leaderboard_pvp",
			"Heal Wounds (50k)", "heal_wounds",
			"Heal Battle Fatigue (50k)", "heal_battle_fatigue",
			"[CIS] Roll Krayt Dragon loot (20,000 CW Currency)", "ancient_roll_rebel",
			"[Republic] Roll Krayt Dragon loot (20,000 CW Currency)", "ancient_roll_imperial",

			"PVP Bases",
			{
				"CIS Bases",
				{
					"CIS PVP Base 1 (10,000 CW Currency)", "base_roll_cis_01",
					"CIS PVP Base 2 (12,000 CW Currency)", "base_roll_cis_02",
					"CIS PVP Base 3 (14,000 CW Currency)", "base_roll_cis_03",
					"CIS PVP Base 4 (20,000 CW Currency)", "base_roll_cis_04",
					--"CIS PVP Base 5", "object/tangible/deed/faction_perk/hq/hq_s05_cis_pvp.iff",
				},
				"Republic Bases",
				{
					"Republic PVP Base 1 (10,000 CW Currency)", "base_roll_rep_01",
					"Republic PVP Base 2 (12,000 CW Currency)", "base_roll_rep_02",
					"Republic PVP Base 3 (14,000 CW Currency)", "base_roll_rep_03",
					"Republic PVP Base 4 (20,000 CW Currency)", "base_roll_rep_04",
				--"Republic PVP Base 5", "object/tangible/deed/faction_perk/hq/hq_s05_rep_pvp.iff",
				},
			}
	}
}

ObjectTemplates:addTemplate(object_tangible_beta_beta_terminal_warp, "object/tangible/beta/beta_terminal_warp.iff")
