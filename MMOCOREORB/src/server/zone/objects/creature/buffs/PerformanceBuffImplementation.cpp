/*
 * PerformanceBuffImplementation.cpp
 *
 *  Created on: 04/03/2011
 *      Author: Itac
 */

#include "server/zone/objects/creature/buffs/PerformanceBuff.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "templates/params/creature/CreatureAttribute.h"
#include "server/zone/objects/creature/buffs/PerformanceBuffType.h"

void PerformanceBuffImplementation::activate(bool applyModifiers) {
	if(type == PerformanceBuffType::DANCE_MIND) {
		int mindStrength = round(strength * (float)creature.get()->getBaseHAM(CreatureAttribute::MIND));
		mindStrength = (mindStrength/4);
		setAttributeModifier(CreatureAttribute::MIND, mindStrength);
		creature.get()->sendSystemMessage("@healing:performance_enhance_dance_mind_d");

	}
	else if(type == PerformanceBuffType::MUSIC_FOCUS) {
		int focusStrength = round(strength * (float)creature.get()->getBaseHAM(CreatureAttribute::FOCUS));
		setAttributeModifier(CreatureAttribute::FOCUS, focusStrength);
		creature.get()->sendSystemMessage("@healing:performance_enhance_music_focus_d");

	}
	else if(type == PerformanceBuffType::MUSIC_WILLPOWER) {
		int willStrength = round(strength * (float)creature.get()->getBaseHAM(CreatureAttribute::WILLPOWER));
		setAttributeModifier(CreatureAttribute::WILLPOWER, willStrength);
		creature.get()->sendSystemMessage("@healing:performance_enhance_music_willpower_d");
	}
	else if(type == PerformanceBuffType::STAT_RANGED_ACC) {
		int amount = strength * 10;
		setSkillModifier("ranged_accuracy", amount);
		creature.get()->sendSystemMessage("Applying Ranged Accuracy -- +" + String::valueOf(amount));
	}
	else if(type == PerformanceBuffType::STAT_MELEE_ACC) {
		int amount = strength * 10;
		setSkillModifier("melee_accuracy", amount);
		creature.get()->sendSystemMessage("Applying Melee Accuracy -- +" + String::valueOf(amount));
	}
	else if(type == PerformanceBuffType::XP_INCREASE) {
		int amount = strength * 10;
		setSkillModifier("xp_increase", amount);
		creature.get()->sendSystemMessage("Applying XP buff -- " + String::valueOf(amount) + "%");
	}

	BuffImplementation::activate(true);

}

void PerformanceBuffImplementation::deactivate(bool removeModifiers) {
	BuffImplementation::deactivate(true);
}
