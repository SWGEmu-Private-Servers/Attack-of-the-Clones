local ObjectManager = require("managers.object.object_manager")

local QuestManager = {}

local QUEST_ACTIVE = 1
local QUEST_COMPLETED = 1

-- Activate the quest for the player.
-- @param pCreatureObject pointer to the creature object of the player.
-- @param quest the index number for the quest to activate.
function QuestManager.activateQuest(pCreatureObject, quest)
	local pGhost = CreatureObject(pCreatureObject):getPlayerObject()

	if (pGhost == nil) then
		return
	end

	if (QuestManager.shouldSendSystemMessage(pCreatureObject, quest)) then
		CreatureObject(pCreatureObject):sendSystemMessage("@quest/quests:quest_journal_updated")
	end

	PlayerObject(pGhost):setActiveQuestsBit(quest, QUEST_ACTIVE)
end

-- Checks if the player has a quest active.
-- @param pCreatureObject pointer to the creature object of the player.
-- @param quest the index number for the quest to check if it is active.
function QuestManager.hasActiveQuest(pCreatureObject, quest)
	local pGhost = CreatureObject(pCreatureObject):getPlayerObject()

	if (pGhost == nil) then
		return false
	end

	return PlayerObject(pGhost):hasActiveQuestBitSet(quest)
end

-- Complete the quest for the player.
-- @param pCreatureObject pointer to the creature object of the player.
-- @param quest the index number for the quest to complete.
function QuestManager.completeQuest(pCreatureObject, quest)
	local pGhost = CreatureObject(pCreatureObject):getPlayerObject()

	if (pGhost == nil) then
		return
	end

	if (QuestManager.shouldSendSystemMessage(pCreatureObject, quest)) then
		local summary = QuestManager.getJournalSummary(quest)

		if (summary ~= "") then
			CreatureObject(pCreatureObject):sendSystemMessage(summary)
		end

		CreatureObject(pCreatureObject):sendSystemMessage("@quest/quests:task_complete")
	end

	PlayerObject(pGhost):clearActiveQuestsBit(quest)
	PlayerObject(pGhost):setCompletedQuestsBit(quest, QUEST_COMPLETED)
end

-- Un-Complete the quest for the player and set quest active again.
-- @param pCreatureObject pointer to the creature object of the player.
-- @param quest the index number for the quest to complete.
function QuestManager.uncompleteQuest(pCreatureObject, quest)
	local pGhost = CreatureObject(pCreatureObject):getPlayerObject()

	if (pGhost == nil) then
		return
	end

	PlayerObject(pGhost):clearCompletedQuestsBit(quest)
	PlayerObject(pGhost):setActiveQuestsBit(quest, QUEST_ACTIVE)
end

-- Checks if the player has a quest completed.
-- @param pCreatureObject pointer to the creature object of the player.
-- @param quest the index number for the quest to check if it is completed.
function QuestManager.hasCompletedQuest(pCreatureObject, quest)
	local pGhost = CreatureObject(pCreatureObject):getPlayerObject()

	if (pGhost == nil) then
		return false
	end

	return PlayerObject(pGhost):hasCompletedQuestsBitSet(quest)
end

-- Reset the quest for the player.
-- @param pCreatureObject pointer to the creature object of the player.
-- @param quest the index number for the quest to reset.
function QuestManager.resetQuest(pCreatureObject, quest)
	local pGhost = CreatureObject(pCreatureObject):getPlayerObject()

	if (pGhost == nil) then
		return
	end

	PlayerObject(pGhost):clearActiveQuestsBit(quest)
	PlayerObject(pGhost):clearCompletedQuestsBit(quest)
end

function QuestManager.failQuest(pCreatureObject, quest)
	if (QuestManager.shouldSendSystemMessage(pCreatureObject, quest)) then
		CreatureObject(pCreatureObject):sendSystemMessage("@quest/quests:task_failure")
	end

	QuestManager.resetQuest(pCreatureObject, quest)
end

function QuestManager.shouldSendSystemMessage(pCreatureObject, quest)
	local pQuest = getQuestInfo(quest)

	if (pQuest == nil) then
		return false
	end

	return LuaQuestInfo(pQuest):shouldSendSystemMessage()
end

function QuestManager.getQuestName(questID)
	local pQuest = getQuestInfo(questID)

	if (pQuest == nil) then
		return ""
	end

	return LuaQuestInfo(pQuest):getQuestName()
end

function QuestManager.getJournalSummary(questID)
	local pQuest = getQuestInfo(questID)

	if (pQuest == nil) then
		return ""
	end

	return LuaQuestInfo(pQuest):getJournalSummary()
end

function QuestManager.getCurrentQuestID(pPlayer)
	local id = tonumber(readScreenPlayData(pPlayer, "VillageJediProgression", "CurrentQuestID"))

	if (id == nil) then
		id = -1
	end

	return id
end

function QuestManager.setCurrentQuestID(pPlayer, qid)
	return writeScreenPlayData(pPlayer, "VillageJediProgression", "CurrentQuestID", qid)
end

function QuestManager.getStoredVillageValue(pPlayer, key)
	return readScreenPlayData(pPlayer, "VillageJediProgression", key)
end

function QuestManager.setStoredVillageValue(pPlayer, key, value)
	return writeScreenPlayData(pPlayer, "VillageJediProgression", key, value)
end

QuestManager.quests = {}

QuestManager.quests.TEST_SIMPLE 						= 0
QuestManager.quests.TEST_GOTO_01 						= 1
QuestManager.quests.TEST_GOTO_02 						= 2
QuestManager.quests.TEST_GOTO_03 						= 3
QuestManager.quests.TEST_FIND_01 						= 4
QuestManager.quests.TEST_ENCOUNTER_01 					= 5
QuestManager.quests.TEST_DESTROY_01 					= 6
QuestManager.quests.TEST_ESCORT_01 						= 7
QuestManager.quests.TEST_ESCORT_LOCATION 				= 8
QuestManager.quests.TEST_RANDOM 						= 9
QuestManager.quests.TEST_GIVE 							= 10
QuestManager.quests.SCT1 								= 11
QuestManager.quests.SCT2 								= 12
QuestManager.quests.SCT3 								= 13
QuestManager.quests.SCT4 								= 14
QuestManager.quests.FS_QUESTS_SAD_TASKS 				= 15
QuestManager.quests.FS_QUESTS_SAD_TASK1 				= 16
QuestManager.quests.FS_QUESTS_SAD_RETURN1 				= 17
QuestManager.quests.FS_QUESTS_SAD_TASK2 				= 18
QuestManager.quests.FS_QUESTS_SAD_RETURN2 				= 19
QuestManager.quests.FS_QUESTS_SAD_TASK3 				= 20
QuestManager.quests.FS_QUESTS_SAD_RETURN3 				= 21
QuestManager.quests.FS_QUESTS_SAD_TASK4 				= 22
QuestManager.quests.FS_QUESTS_SAD_RETURN4 				= 23
QuestManager.quests.FS_QUESTS_SAD_TASK5 				= 24
QuestManager.quests.FS_QUESTS_SAD_RETURN5 				= 25
QuestManager.quests.FS_QUESTS_SAD_TASK6 				= 26
QuestManager.quests.FS_QUESTS_SAD_RETURN6 				= 27
QuestManager.quests.FS_QUESTS_SAD_TASK7 				= 28
QuestManager.quests.FS_QUESTS_SAD_RETURN7 				= 29
QuestManager.quests.FS_QUESTS_SAD_TASK8 				= 30
QuestManager.quests.FS_QUESTS_SAD_RETURN8 				= 31
QuestManager.quests.FS_QUESTS_SAD_FINISH 				= 32
QuestManager.quests.FS_QUESTS_SAD2_TASKS 				= 33
QuestManager.quests.FS_QUESTS_SAD2_TASK1				= 34
QuestManager.quests.FS_QUESTS_SAD2_RETURN1 				= 35
QuestManager.quests.FS_QUESTS_SAD2_TASK2 				= 36
QuestManager.quests.FS_QUESTS_SAD2_RETURN2 				= 37
QuestManager.quests.FS_QUESTS_SAD2_TASK3 				= 38
QuestManager.quests.FS_QUESTS_SAD2_RETURN3 				= 39
QuestManager.quests.FS_QUESTS_SAD2_TASK4 				= 40
QuestManager.quests.FS_QUESTS_SAD2_RETURN4 				= 41
QuestManager.quests.FS_QUESTS_SAD2_TASK5 				= 42
QuestManager.quests.FS_QUESTS_SAD2_RETURN5 				= 43
QuestManager.quests.FS_QUESTS_SAD2_TASK6 				= 44
QuestManager.quests.FS_QUESTS_SAD2_RETURN6 				= 45
QuestManager.quests.FS_QUESTS_SAD2_TASK7 				= 46
QuestManager.quests.FS_QUESTS_SAD2_RETURN7 				= 47
QuestManager.quests.FS_QUESTS_SAD2_TASK8 				= 48
QuestManager.quests.FS_QUESTS_SAD2_RETURN8 				= 49
QuestManager.quests.FS_QUESTS_SAD2_FINISH 				= 50
QuestManager.quests.FS_MEDIC_PUZZLE_QUEST_01 			= 51
QuestManager.quests.FS_MEDIC_PUZZLE_QUEST_02 			= 52
QuestManager.quests.FS_MEDIC_PUZZLE_QUEST_03 			= 53
QuestManager.quests.FS_PHASE_2_CRAFT_DEFENSES_02 		= 54
QuestManager.quests.FS_PHASE_3_CRAFT_SHIELDS_02 		= 55
QuestManager.quests.FS_REFLEX_RESCUE_QUEST_00 			= 56
QuestManager.quests.FS_REFLEX_RESCUE_QUEST_01 			= 57
QuestManager.quests.FS_REFLEX_RESCUE_QUEST_02 			= 58
QuestManager.quests.FS_REFLEX_RESCUE_QUEST_03 			= 59
QuestManager.quests.FS_REFLEX_RESCUE_QUEST_04 			= 60
QuestManager.quests.FS_REFLEX_RESCUE_QUEST_05 			= 61
QuestManager.quests.FS_REFLEX_RESCUE_QUEST_06 			= 62
QuestManager.quests.FS_REFLEX_FETCH_QUEST_00 			= 63
QuestManager.quests.FS_REFLEX_FETCH_QUEST_01 			= 64
QuestManager.quests.FS_REFLEX_FETCH_QUEST_02 			= 65
QuestManager.quests.FS_REFLEX_FETCH_QUEST_03 			= 66
QuestManager.quests.FS_REFLEX_FETCH_QUEST_04 			= 67
QuestManager.quests.FS_REFLEX_FETCH_QUEST_05 			= 68
QuestManager.quests.FS_REFLEX_FETCH_QUEST_06 			= 69
QuestManager.quests.FS_CRAFT_PUZZLE_QUEST_00 			= 70
QuestManager.quests.FS_CRAFT_PUZZLE_QUEST_01 			= 71
QuestManager.quests.FS_CRAFT_PUZZLE_QUEST_02 			= 72
QuestManager.quests.FS_CRAFT_PUZZLE_QUEST_03 			= 73
QuestManager.quests.OLD_MAN_INITIAL 					= 74
QuestManager.quests.FS_THEATER_CAMP 					= 75
QuestManager.quests.DO_NOT_USE_BAD_SLOT 				= 76
QuestManager.quests.FS_GOTO_DATH 						= 77
QuestManager.quests.FS_VILLAGE_ELDER 					= 78
QuestManager.quests.OLD_MAN_FORCE_CRYSTAL 				= 79
QuestManager.quests.FS_DATH_WOMAN 						= 80
QuestManager.quests.FS_PATROL_QUEST_1 					= 81
QuestManager.quests.FS_PATROL_QUEST_2 					= 82
QuestManager.quests.FS_PATROL_QUEST_3 					= 83
QuestManager.quests.FS_PATROL_QUEST_4 					= 84
QuestManager.quests.FS_PATROL_QUEST_5 					= 85
QuestManager.quests.FS_PATROL_QUEST_6 					= 86
QuestManager.quests.FS_PATROL_QUEST_7 					= 87
QuestManager.quests.FS_PATROL_QUEST_8 					= 88
QuestManager.quests.FS_PATROL_QUEST_9 					= 89
QuestManager.quests.FS_PATROL_QUEST_10 					= 90
QuestManager.quests.FS_PATROL_QUEST_11 					= 91
QuestManager.quests.FS_PATROL_QUEST_12 					= 92
QuestManager.quests.FS_PATROL_QUEST_13 					= 93
QuestManager.quests.FS_PATROL_QUEST_14 					= 94
QuestManager.quests.FS_PATROL_QUEST_15 					= 95
QuestManager.quests.FS_PATROL_QUEST_16 					= 96
QuestManager.quests.FS_PATROL_QUEST_17 					= 97
QuestManager.quests.FS_PATROL_QUEST_18 					= 98
QuestManager.quests.FS_PATROL_QUEST_19 					= 99
QuestManager.quests.FS_PATROL_QUEST_20 					= 100
QuestManager.quests.FS_COMBAT_HEALING_1 				= 101
QuestManager.quests.FS_COMBAT_HEALING_2 				= 102
QuestManager.quests.FS_DEFEND_SET_FACTION 				= 103
QuestManager.quests.FS_DEFEND_01 						= 104
QuestManager.quests.FS_DEFEND_02 						= 105
QuestManager.quests.FS_DEFEND_REwARD_01 				= 106
QuestManager.quests.FS_DEFEND_03 						= 107
QuestManager.quests.FS_DEFEND_04 						= 108
QuestManager.quests.FS_CS_INTRO 						= 109
QuestManager.quests.FS_CS_KILL5_GUARDS 					= 110
QuestManager.quests.FS_CS_ENSURE_CAPTURE 				= 111
QuestManager.quests.FS_CS_LAST_CHANCE 					= 112
QuestManager.quests.FS_CS_ESCORT_COMMANDER_PRI 			= 113
QuestManager.quests.FS_CS_ESCORT_COMMANDER_SEC 			= 114
QuestManager.quests.FS_CS_QUEST_DONE 					= 115
QuestManager.quests.FS_THEATER_FINAL 					= 116
QuestManager.quests.OLD_MAN_FINAL 						= 117
QuestManager.quests.FS_CRAFTING4_QUEST_00 				= 118
QuestManager.quests.FS_CRAFTING4_QUEST_01 				= 119
QuestManager.quests.FS_CRAFTING4_QUEST_02 				= 120
QuestManager.quests.FS_CRAFTING4_QUEST_03 				= 121
QuestManager.quests.FS_CRAFTING4_QUEST_04 				= 122
QuestManager.quests.FS_CRAFTING4_QUEST_05 				= 123
QuestManager.quests.FS_CRAFTING4_QUEST_06 				= 124
QuestManager.quests.FS_CRAFTING4_QUEST_07 				= 125
QuestManager.quests.TWO_MILITARY 						= 126
QuestManager.quests.FS_DEFEND_REwARD_02 				= 127
QuestManager.quests.FS_DEFEND_REwARD_03 				= 128
QuestManager.quests.SURVEY_PHASE2_MAIN 					= 129
QuestManager.quests.SURVEY_PHASE2_01 					= 130
QuestManager.quests.SURVEY_PHASE2_02 					= 131
QuestManager.quests.SURVEY_PHASE2_03 					= 132
QuestManager.quests.SURVEY_PHASE2_04 					= 133
QuestManager.quests.SURVEY_PHASE2_05 					= 134
QuestManager.quests.SURVEY_PHASE2_06 					= 135
QuestManager.quests.SURVEY_PHASE2_07 					= 136
QuestManager.quests.SURVEY_PHASE2_08 					= 137
QuestManager.quests.SURVEY_PHASE3_MAIN 					= 138
QuestManager.quests.SURVEY_PHASE3_01 					= 139
QuestManager.quests.SURVEY_PHASE3_02 					= 140
QuestManager.quests.SURVEY_PHASE3_03 					= 141
QuestManager.quests.SURVEY_PHASE3_04 					= 142
QuestManager.quests.SURVEY_PHASE3_05 					= 143
QuestManager.quests.SURVEY_PHASE3_06 					= 144
QuestManager.quests.SURVEY_PHASE3_07 					= 145
QuestManager.quests.SURVEY_PHASE3_08 					= 146
QuestManager.quests.FS_SURVEY_SPECIAL_RESOURCE_01 		= 147
QuestManager.quests.FS_SURVEY_SPECIAL_RESOURCE_02 		= 148
QuestManager.quests.FS_SURVEY_SPECIAL_RESOURCE_03 		= 149
QuestManager.quests.FS_SURVEY_SPECIAL_RESOURCE_04 		= 150
QuestManager.quests.FS_SURVEY_SPECIAL_RESOURCE_05 		= 151
QuestManager.quests.FS_SURVEY_SPECIAL_RESOURCE_06 		= 152
QuestManager.quests.FS_SURVEY_SPECIAL_RESOURCE_07 		= 153
QuestManager.quests.FS_SURVEY_SPECIAL_RESOURCE_08 		= 154
QuestManager.quests.FS_SURVEY_SPECIAL_RESOURCE_09 		= 155
QuestManager.quests.FS_SURVEY_SPECIAL_RESOURCE_10 		= 156
QuestManager.quests.FS_SURVEY_SPECIAL_RESOURCE_11 		= 157
QuestManager.quests.FS_SURVEY_SPECIAL_RESOURCE_12 		= 158
QuestManager.quests.FS_SURVEY_SPECIAL_RESOURCE_13 		= 159
QuestManager.quests.FS_SURVEY_SPECIAL_RESOURCE_14 		= 160
QuestManager.quests.FS_SURVEY_SPECIAL_RESOURCE_15 		= 161
QuestManager.quests.FS_SURVEY_SPECIAL_RESOURCE_16 		= 162
QuestManager.quests.FS_DATH_wOMAN_TALK 					= 163
QuestManager.quests.FS_PATROL_QUEST_START 				= 164
QuestManager.quests.FS_REFLEX_RESCUE_QUEST_07 			= 165
QuestManager.quests.FS_SURVEY_PHASE2_REwARD 			= 166
QuestManager.quests.FS_SURVEY_PHASE3_REwARD 			= 167
QuestManager.quests.FS_DEFEND_SET_FACTION_02 			= 168
QuestManager.quests.LOOT_DATAPAD_1 						= 169
QuestManager.quests.GOT_DATAPAD 						= 170
QuestManager.quests.FS_PHASE_2_CRAFT_DEFENSES_01 		= 171
QuestManager.quests.FS_PHASE_3_CRAFT_SHIELDS_01 		= 172
QuestManager.quests.FS_PHASE_2_CRAFT_DEFENSES_MAIN 		= 173
QuestManager.quests.FS_PHASE_3_CRAFT_SHIELDS_MAIN 		= 174
QuestManager.quests.LOOT_DATAPAD_2 						= 175
QuestManager.quests.GOT_DATAPAD_2 						= 176
QuestManager.quests.FS_CS_QUEST_FAILED_ESCORT 			= 177
QuestManager.quests.FS_PATROL_QUEST_FINISH 				= 178
QuestManager.quests.FS_MEDIC_PUZZLE_QUEST_FINISH 		= 179
QuestManager.quests.FS_COMBAT_HEALING_FINISH 			= 180
QuestManager.quests.FS_COMBAT_REWARD_PHASE2 			= 181
QuestManager.quests.FS_REFLEX_REWARD_PHASE3 			= 182
QuestManager.quests.FS_DEFEND_WAIT_01 					= 183
QuestManager.quests.FS_DEFEND_WAIT_02 					= 184
QuestManager.quests.FS_CRAFTING4_QUEST_FINISH 			= 185
QuestManager.quests.FS_CRAFT_PUZZLE_QUEST_04 			= 186
QuestManager.quests.FS_CS_QUEST_DONE_NOTIFYONLY 		= 187
QuestManager.quests.WOD_PROLOGUE_WALKABOUT				= 188
QuestManager.quests.WOD_PROLOGUE_WALKABOUT_01			= 189
QuestManager.quests.WOD_PROLOGUE_WALKABOUT_02			= 190
QuestManager.quests.WOD_PROLOGUE_WALKABOUT_03			= 191
QuestManager.quests.WOD_PROLOGUE_WALKABOUT_04			= 192
QuestManager.quests.WOD_PROLOGUE_WALKABOUT_05			= 193
QuestManager.quests.WOD_PROLOGUE_WALKABOUT_06			= 194
QuestManager.quests.WOD_PROLOGUE_WALKABOUT_07			= 195
QuestManager.quests.WOD_PROLOGUE_WALKABOUT_08			= 196
QuestManager.quests.WOD_PROLOGUE_MEET_MYSTERIOUS_WITCH	= 197
QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING			= 198
QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_01		= 199
QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_02		= 200
QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_03		= 201
QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_04		= 202
QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_05		= 203
QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_06		= 204
QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_07		= 205
QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_08		= 206
QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_09		= 207
QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR			= 208
QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR_01			= 209
QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR_02			= 210
QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR_03			= 211
QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR_04			= 212
QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR_05			= 213
QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR_06			= 214
QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN		= 215
QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN_01	= 216
QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN_02	= 217
QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN_03	= 218
QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN_04	= 219
QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN_05	= 220
QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN_06	= 221
QuestManager.quests.WOD_PROLOGUE_OUTCAST_1 				= 222
QuestManager.quests.WOD_PROLOGUE_OUTCAST_1_01			= 223
QuestManager.quests.WOD_PROLOGUE_OUTCAST_1_02			= 224
QuestManager.quests.WOD_PROLOGUE_OUTCAST_1_03			= 225
QuestManager.quests.WOD_PROLOGUE_OUTCAST_2 				= 226
QuestManager.quests.WOD_PROLOGUE_OUTCAST_2_01			= 227
QuestManager.quests.WOD_PROLOGUE_OUTCAST_2_02			= 228
QuestManager.quests.WOD_PROLOGUE_OUTCAST_2_03			= 229
QuestManager.quests.WOD_PROLOGUE_OUTCAST_3 				= 230
QuestManager.quests.WOD_PROLOGUE_OUTCAST_3_01			= 231
QuestManager.quests.WOD_PROLOGUE_OUTCAST_3_02			= 232
QuestManager.quests.WOD_PROLOGUE_OUTCAST_3_03			= 233
QuestManager.quests.WOD_PROLOGUE_OUTCAST_4 				= 234
QuestManager.quests.WOD_PROLOGUE_OUTCAST_4_01			= 235
QuestManager.quests.WOD_PROLOGUE_OUTCAST_4_02			= 236
QuestManager.quests.WOD_PROLOGUE_OUTCAST_4_03			= 237
QuestManager.quests.WOD_PROLOGUE_OUTCAST_5 				= 238
QuestManager.quests.WOD_PROLOGUE_OUTCAST_5_01			= 239
QuestManager.quests.WOD_PROLOGUE_OUTCAST_5_02			= 240
QuestManager.quests.WOD_PROLOGUE_OUTCAST_5_03			= 241
QuestManager.quests.WOD_PROLOGUE_OUTCAST_6 				= 242
QuestManager.quests.WOD_PROLOGUE_OUTCAST_6_01			= 243
QuestManager.quests.WOD_PROLOGUE_OUTCAST_6_02			= 244
QuestManager.quests.WOD_PROLOGUE_OUTCAST_6_03			= 245
QuestManager.quests.WOD_PROLOGUE_OUTCAST_7			 	= 246
QuestManager.quests.WOD_PROLOGUE_OUTCAST_7_01			= 247
QuestManager.quests.WOD_PROLOGUE_OUTCAST_7_02			= 248
QuestManager.quests.WOD_PROLOGUE_OUTCAST_7_03			= 249
QuestManager.quests.WOD_RUBINA_GOTO_NS					= 250
QuestManager.quests.WOD_NS_REPAIR_ALTAR_01				= 251
QuestManager.quests.WOD_NS_REPAIR_ALTAR_01_01			= 252
QuestManager.quests.WOD_NS_REPAIR_ALTAR_01_02			= 253
QuestManager.quests.WOD_NS_REPAIR_ALTAR_01_03			= 254
QuestManager.quests.WOD_NS_REPAIR_ALTAR_01_04			= 255
QuestManager.quests.WOD_NS_REPAIR_ALTAR_02				= 256
QuestManager.quests.WOD_NS_REPAIR_ALTAR_02_01			= 257
QuestManager.quests.WOD_NS_REPAIR_ALTAR_02_02			= 258
QuestManager.quests.WOD_NS_REPAIR_ALTAR_02_03			= 259
QuestManager.quests.WOD_NS_REPAIR_ALTAR_02_04			= 260
QuestManager.quests.WOD_NS_REPAIR_ALTAR_03				= 261
QuestManager.quests.WOD_NS_REPAIR_ALTAR_03_01			= 262
QuestManager.quests.WOD_NS_REPAIR_ALTAR_03_02			= 263
QuestManager.quests.WOD_NS_REPAIR_ALTAR_03_03			= 264
QuestManager.quests.WOD_NS_REPAIR_ALTAR_03_04			= 265
QuestManager.quests.WOD_NS_REPAIR_ALTAR_04				= 266
QuestManager.quests.WOD_NS_REPAIR_ALTAR_04_01			= 267
QuestManager.quests.WOD_NS_REPAIR_ALTAR_04_02			= 268
QuestManager.quests.WOD_NS_REPAIR_ALTAR_04_03			= 269
QuestManager.quests.WOD_NS_REPAIR_ALTAR_04_04			= 270
QuestManager.quests.WOD_NS_LOST_E01						= 271
QuestManager.quests.WOD_NS_LOST_E01_01					= 272
QuestManager.quests.WOD_NS_LOST_E01_02					= 273
QuestManager.quests.WOD_NS_LOST_E01_03					= 274
QuestManager.quests.WOD_NS_LOST_E01_04					= 275
QuestManager.quests.WOD_NS_LOST_E01_05					= 276
QuestManager.quests.WOD_NS_LOST_E02						= 277
QuestManager.quests.WOD_NS_LOST_E02_01					= 278
QuestManager.quests.WOD_NS_LOST_E02_02					= 279
QuestManager.quests.WOD_NS_LOST_E02_03					= 280
QuestManager.quests.WOD_NS_LOST_E02_04					= 281
QuestManager.quests.WOD_NS_EHS							= 282
QuestManager.quests.WOD_NS_EHS_01						= 283
QuestManager.quests.WOD_NS_EHS_02						= 284
QuestManager.quests.WOD_NS_EHS_03						= 285
QuestManager.quests.WOD_NS_EHS_04						= 286
QuestManager.quests.WOD_NS_QUEEN_MOTHER_FIGHT			= 287
QuestManager.quests.WOD_NS_QUEEN_MOTHER_FIGHT_01		= 288
QuestManager.quests.WOD_NS_QUEEN_MOTHER_FIGHT_02		= 289
QuestManager.quests.WOD_NS_QUEEN_MOTHER_FIGHT_03		= 290
QuestManager.quests.WOD_NS_HUNTING						= 291
QuestManager.quests.WOD_NS_HUNTING_01					= 292
QuestManager.quests.WOD_NS_HUNTING_02					= 293
QuestManager.quests.WOD_NS_FISHING						= 294
QuestManager.quests.WOD_NS_FISHING_01					= 295
QuestManager.quests.WOD_NS_FISHING_02					= 296
QuestManager.quests.WOD_NS_HERB_GATHERING				= 297
QuestManager.quests.WOD_NS_HERB_GATHERING_01 			= 298
QuestManager.quests.WOD_NS_HERB_GATHERING_02			= 299
QuestManager.quests.WOD_NS_HERB_GATHERING_03 			= 300
QuestManager.quests.WOD_NS_HERB_GATHERING_04 			= 301
QuestManager.quests.WOD_NS_HERB_GATHERING_05 			= 302
QuestManager.quests.WOD_NS_HERB_GATHERING_06 			= 303
QuestManager.quests.WOD_NS_HERB_GATHERING_07 			= 304
QuestManager.quests.WOD_NS_HERB_GATHERING_08			= 305
QuestManager.quests.WOD_NS_WHOLE_TRUTH					= 306
QuestManager.quests.WOD_NS_WHOLE_TRUTH_01				= 307
QuestManager.quests.WOD_NS_WHOLE_TRUTH_02				= 308
QuestManager.quests.WOD_NS_WHOLE_TRUTH_03				= 309
QuestManager.quests.WOD_NS_WHOLE_TRUTH_04				= 310
QuestManager.quests.WOD_NS_WHOLE_TRUTH_05				= 311
QuestManager.quests.WOD_NS_WHOLE_TRUTH_06				= 312
QuestManager.quests.WOD_NS_KYRISA_BOSS_FIGHT 			= 313
QuestManager.quests.WOD_NS_KYRISA_BOSS_FIGHT_01			= 314
QuestManager.quests.WOD_NS_KYRISA_BOSS_FIGHT_02			= 315
QuestManager.quests.WOD_NS_KYRISA_BOSS_FIGHT_03			= 316
QuestManager.quests.WOD_NS_RANCOR_TAMER					= 317
QuestManager.quests.WOD_NS_RANCOR_TAMER_01 				= 318
QuestManager.quests.WOD_NS_RANCOR_TAMER_02 				= 319
QuestManager.quests.WOD_NS_RANCOR_TAMER_03 				= 320
QuestManager.quests.WOD_NS_RANCOR_TAMER_04				= 321
QuestManager.quests.WOD_NS_KILL_CLAN					= 322
QuestManager.quests.WOD_NS_KILL_CLAN_01					= 323
QuestManager.quests.WOD_NS_KILL_CLAN_02					= 324
QuestManager.quests.WOD_NS_KILL_SPIDERCLAN				= 325
QuestManager.quests.WOD_NS_KILL_SPIDERCLAN_01			= 326
QuestManager.quests.WOD_NS_KILL_SPIDERCLAN_02			= 327
QuestManager.quests.WOD_NS_RECON						= 328
QuestManager.quests.WOD_NS_RECON_01 					= 329
QuestManager.quests.WOD_NS_RECON_02						= 330
QuestManager.quests.WOD_NS_SISTER1						= 331
QuestManager.quests.WOD_NS_SISTER1_01 					= 332
QuestManager.quests.WOD_NS_SISTER1_02					= 333
QuestManager.quests.WOD_NS_SISTER1_03 					= 334
QuestManager.quests.WOD_NS_SISTER1_04 					= 335
QuestManager.quests.WOD_NS_SISTER1_05					= 336
QuestManager.quests.WOD_NS_SISTER2						= 337
QuestManager.quests.WOD_NS_SISTER2_01 					= 338
QuestManager.quests.WOD_NS_SISTER2_02					= 339
QuestManager.quests.WOD_NS_SISTER2_03 					= 340
QuestManager.quests.WOD_NS_SISTER2_04 					= 341
QuestManager.quests.WOD_NS_SISTER2_05 					= 342
QuestManager.quests.WOD_NS_SISTER2_06 					= 343
QuestManager.quests.WOD_NS_SISTER2_07 					= 344
QuestManager.quests.WOD_NS_SISTER2_08					= 345
QuestManager.quests.WOD_NS_SISTER3						= 346
QuestManager.quests.WOD_NS_SISTER3_01 					= 347
QuestManager.quests.WOD_NS_SISTER3_02					= 348
QuestManager.quests.WOD_NS_SISTER3_03 					= 349
QuestManager.quests.WOD_NS_GHOST_REWARD					= 350
QuestManager.quests.WOD_RUBINA_GOTO_SM					= 351
QuestManager.quests.WOD_SM_REPAIR_ALTAR_01				= 352
QuestManager.quests.WOD_SM_REPAIR_ALTAR_01_01			= 353
QuestManager.quests.WOD_SM_REPAIR_ALTAR_01_02			= 354
QuestManager.quests.WOD_SM_REPAIR_ALTAR_01_03			= 355
QuestManager.quests.WOD_SM_REPAIR_ALTAR_01_04			= 356
QuestManager.quests.WOD_SM_REPAIR_ALTAR_02				= 357
QuestManager.quests.WOD_SM_REPAIR_ALTAR_02_01			= 358
QuestManager.quests.WOD_SM_REPAIR_ALTAR_02_02			= 359
QuestManager.quests.WOD_SM_REPAIR_ALTAR_02_03			= 360
QuestManager.quests.WOD_SM_REPAIR_ALTAR_02_04			= 361
QuestManager.quests.WOD_SM_REPAIR_ALTAR_03				= 362
QuestManager.quests.WOD_SM_REPAIR_ALTAR_03_01			= 363
QuestManager.quests.WOD_SM_REPAIR_ALTAR_03_02			= 364
QuestManager.quests.WOD_SM_REPAIR_ALTAR_03_03			= 365
QuestManager.quests.WOD_SM_REPAIR_ALTAR_03_04			= 366
QuestManager.quests.WOD_SM_REPAIR_ALTAR_04				= 367
QuestManager.quests.WOD_SM_REPAIR_ALTAR_04_01			= 368
QuestManager.quests.WOD_SM_REPAIR_ALTAR_04_02			= 369
QuestManager.quests.WOD_SM_REPAIR_ALTAR_04_03			= 370
QuestManager.quests.WOD_SM_REPAIR_ALTAR_04_04			= 371
QuestManager.quests.WOD_SM_LOST_E01						= 372
QuestManager.quests.WOD_SM_LOST_E01_01					= 373
QuestManager.quests.WOD_SM_LOST_E01_02					= 374
QuestManager.quests.WOD_SM_LOST_E01_03					= 375
QuestManager.quests.WOD_SM_LOST_E01_04					= 376
QuestManager.quests.WOD_SM_LOST_E01_05					= 377
QuestManager.quests.WOD_SM_LOST_E02						= 378
QuestManager.quests.WOD_SM_LOST_E02_01					= 379
QuestManager.quests.WOD_SM_LOST_E02_02					= 380
QuestManager.quests.WOD_SM_LOST_E02_03					= 381
QuestManager.quests.WOD_SM_LOST_E02_04					= 382
QuestManager.quests.WOD_SM_EHS							= 383
QuestManager.quests.WOD_SM_EHS_01						= 384
QuestManager.quests.WOD_SM_EHS_02						= 385
QuestManager.quests.WOD_SM_EHS_03						= 386
QuestManager.quests.WOD_SM_EHS_04						= 387
QuestManager.quests.WOD_SM_QUEEN_MOTHER_FIGHT			= 388
QuestManager.quests.WOD_SM_QUEEN_MOTHER_FIGHT_01		= 389
QuestManager.quests.WOD_SM_QUEEN_MOTHER_FIGHT_02		= 390
QuestManager.quests.WOD_SM_QUEEN_MOTHER_FIGHT_03		= 391
QuestManager.quests.WOD_SM_HUNTING						= 392
QuestManager.quests.WOD_SM_HUNTING_01					= 393
QuestManager.quests.WOD_SM_HUNTING_02					= 394
QuestManager.quests.WOD_SM_FISHING						= 395
QuestManager.quests.WOD_SM_FISHING_01					= 396
QuestManager.quests.WOD_SM_FISHING_02					= 397
QuestManager.quests.WOD_SM_HERB_GATHERING				= 398
QuestManager.quests.WOD_SM_HERB_GATHERING_01 			= 399
QuestManager.quests.WOD_SM_HERB_GATHERING_02			= 400
QuestManager.quests.WOD_SM_HERB_GATHERING_03 			= 401
QuestManager.quests.WOD_SM_HERB_GATHERING_04 			= 402
QuestManager.quests.WOD_SM_HERB_GATHERING_05 			= 403
QuestManager.quests.WOD_SM_HERB_GATHERING_06 			= 404
QuestManager.quests.WOD_SM_HERB_GATHERING_07 			= 405
QuestManager.quests.WOD_SM_HERB_GATHERING_08			= 406
QuestManager.quests.WOD_SM_WHOLE_TRUTH					= 407
QuestManager.quests.WOD_SM_WHOLE_TRUTH_01				= 408
QuestManager.quests.WOD_SM_WHOLE_TRUTH_02				= 409
QuestManager.quests.WOD_SM_WHOLE_TRUTH_03				= 410
QuestManager.quests.WOD_SM_WHOLE_TRUTH_04				= 411
QuestManager.quests.WOD_SM_WHOLE_TRUTH_05				= 412
QuestManager.quests.WOD_SM_WHOLE_TRUTH_06				= 413
QuestManager.quests.WOD_SM_KYRISA_BOSS_FIGHT 			= 414
QuestManager.quests.WOD_SM_KYRISA_BOSS_FIGHT_01			= 415
QuestManager.quests.WOD_SM_KYRISA_BOSS_FIGHT_02			= 416
QuestManager.quests.WOD_SM_KYRISA_BOSS_FIGHT_03			= 417
QuestManager.quests.WOD_SM_RANCOR_TAMER					= 418
QuestManager.quests.WOD_SM_RANCOR_TAMER_01 				= 419
QuestManager.quests.WOD_SM_RANCOR_TAMER_02 				= 420
QuestManager.quests.WOD_SM_RANCOR_TAMER_03 				= 421
QuestManager.quests.WOD_SM_RANCOR_TAMER_04				= 422
QuestManager.quests.WOD_SM_KILL_CLAN					= 423
QuestManager.quests.WOD_SM_KILL_CLAN_01					= 424
QuestManager.quests.WOD_SM_KILL_CLAN_02					= 425
QuestManager.quests.WOD_SM_KILL_SPIDERCLAN				= 426
QuestManager.quests.WOD_SM_KILL_SPIDERCLAN_01			= 427
QuestManager.quests.WOD_SM_KILL_SPIDERCLAN_02			= 428
QuestManager.quests.WOD_SM_RECON						= 429
QuestManager.quests.WOD_SM_RECON_01 					= 430
QuestManager.quests.WOD_SM_RECON_02						= 431
QuestManager.quests.WOD_SM_SISTER1						= 432
QuestManager.quests.WOD_SM_SISTER1_01 					= 433
QuestManager.quests.WOD_SM_SISTER1_02					= 434
QuestManager.quests.WOD_SM_SISTER1_03 					= 435
QuestManager.quests.WOD_SM_SISTER1_04 					= 436
QuestManager.quests.WOD_SM_SISTER1_05					= 437
QuestManager.quests.WOD_SM_SISTER2						= 438
QuestManager.quests.WOD_SM_SISTER2_01 					= 439
QuestManager.quests.WOD_SM_SISTER2_02					= 440
QuestManager.quests.WOD_SM_SISTER2_03 					= 441
QuestManager.quests.WOD_SM_SISTER2_04 					= 442
QuestManager.quests.WOD_SM_SISTER2_05 					= 443
QuestManager.quests.WOD_SM_SISTER2_06 					= 444
QuestManager.quests.WOD_SM_SISTER2_07 					= 445
QuestManager.quests.WOD_SM_SISTER2_08					= 446
QuestManager.quests.WOD_SM_SISTER3						= 447
QuestManager.quests.WOD_SM_SISTER3_01 					= 448
QuestManager.quests.WOD_SM_SISTER3_02					= 449
QuestManager.quests.WOD_SM_SISTER3_03 					= 450
QuestManager.quests.WOD_SM_GHOST_REWARD					= 451
QuestManager.quests.WOD_RUBINA_CHEST					= 452
QuestManager.quests.WOD_LEFT_BEHIND						= 453
QuestManager.quests.WOD_LEFT_BEHIND_01					= 454
QuestManager.quests.WOD_LEFT_BEHIND_02					= 455
QuestManager.quests.WOD_LEFT_BEHIND_03					= 456
QuestManager.quests.REPUBLIC_RESTUSS_OP					= 457
QuestManager.quests.REPUBLIC_RESTUSS_OP_TASK					= 458
QuestManager.quests.REPUBLIC_RESTUSS_OP_RETURN					= 459

return QuestManager
