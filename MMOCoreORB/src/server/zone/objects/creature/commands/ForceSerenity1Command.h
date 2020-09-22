/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef FORCESERENITY1COMMAND_H_
#define FORCESERENITY1COMMAND_H_

#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/managers/player/PlayerManager.h"
#include "server/zone/managers/combat/CombatManager.h"
#include "templates/params/creature/CreatureAttribute.h"
#include "server/zone/managers/stringid/StringIdManager.h"
#include "server/zone/managers/collision/CollisionManager.h"
#include "server/zone/managers/frs/FrsManager.h"
#include "server/zone/objects/building/BuildingObject.h"

class ForceSerenity1Command : public JediQueueCommand {
public:

	ForceSerenity1Command(const String& name, ZoneProcessServer* server)
		: JediQueueCommand(name, server) {
			clientEffect = "clienteffect/pl_force_heal_self.cef";
			animationCRC = STRING_HASHCODE("force_healing_1");
	}

	int doQueueCommand(CreatureObject* player, const uint64& target, const UnicodeString& arguments) const {
		int forceCost = 500;
		int cooldownMilli = 90000; // 2mins
		int durationSec =  30; // 30 seconds
		unsigned int buffCRC = BuffCRC::FORCE_SERENITY_1;

		if (!checkStateMask(player))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(player))
			return INVALIDLOCOMOTION;

		if (player->isDead() || player->isIncapacitated())
			return INVALIDSTATE;

		ManagedReference<PlayerObject*> ghost = player->getPlayerObject();
		if( ghost == nullptr )
			return GENERALERROR;

		int currentForce = ghost->getForcePower();

		// Check player force
		if (currentForce <= forceCost) {
			player->sendSystemMessage("You do not have enough mental focus to use Serenity"); // "You do not have enough mental focus to use Serenity."
			return GENERALERROR;
		}

		// Check cooldown
		if ( !player->getCooldownTimerMap()->isPast("forceSerenityCooldown") ){
			player->sendSystemMessage("You are not ready to use Force Serenity again"); // "You are not ready to use Force Serenity again"
			return GENERALERROR;
			}
				// Build 100% CONSTITUTION, STAMINA, WILLPOWER buff
				ManagedReference<Buff*> buff = new Buff(player, buffCRC, durationSec, BuffType::OTHER);

				Locker locker(buff);

				int healthBuff = player->getBaseHAM(CreatureAttribute::CONSTITUTION) * 2;
				int actionBuff = player->getBaseHAM(CreatureAttribute::STAMINA) * 2;
				int mindBuff = player->getBaseHAM(CreatureAttribute::WILLPOWER) * 2;
				buff->setAttributeModifier(CreatureAttribute::CONSTITUTION, healthBuff);
				buff->setAttributeModifier(CreatureAttribute::STAMINA, actionBuff);
				buff->setAttributeModifier(CreatureAttribute::WILLPOWER, mindBuff);

				player->addBuff(buff);
				player->getCooldownTimerMap()->updateToCurrentAndAddMili("forceSerenityCooldown", cooldownMilli);
				//player->showFlyText("combat_effects","pet_embolden", 0, 153, 0); // "! Embolden !"

			ghost->setForcePower(currentForce - forceCost);
			player->playEffect(clientEffect, "");
			ghost->playEffect(clientEffect, "");
			player->sendSystemMessage("You are now in a serene state."); // "Your pets fight with renewed vigor"
			info(String::valueOf(forceCost), true);

		return SUCCESS;
	}

};

#endif //FORCESERENITY1COMMAND_H_
