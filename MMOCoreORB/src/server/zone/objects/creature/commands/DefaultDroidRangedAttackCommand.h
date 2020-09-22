/*
 * DefaultDroidRangedAttackCommand.h
 *
 *  Created on: Jan 14, 2013
 *      Author: root
 */

#ifndef DEFAULTDROIDRANGEDATTACKCOMMAND_H_
#define DEFAULTDROIDRANGEDATTACKCOMMAND_H_
#include "CombatQueueCommand.h"

class DefaultDroidRangedAttackCommand : public CombatQueueCommand {
public:

	DefaultDroidRangedAttackCommand(const String& name, ZoneProcessServer* server)
		: CombatQueueCommand(name, server) {
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		return doCombatAction(creature, target);
	}

};





#endif /* DEFAULTDROIDRANGEDATTACKCOMMAND_H_ */
