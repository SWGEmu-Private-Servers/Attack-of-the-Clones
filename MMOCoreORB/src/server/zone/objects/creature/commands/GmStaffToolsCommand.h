/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.
    
Ported from TCW by Stack
    */

#ifndef GmStaffToolsCommand_H_
#define GmStaffToolsCommand_H_

#include "server/zone/managers/director/DirectorManager.h"

class GmStaffToolsCommand : public QueueCommand {
public:

	GmStaffToolsCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		Lua* lua = DirectorManager::instance()->getLuaInstance();

		Reference<LuaFunction*> staffTools = lua->createFunction("StaffTools", "openToolsSUI", 0);
		*staffTools << creature;

		staffTools->callFunction();

		return SUCCESS;
	}

};

#endif //GmStaffToolsCommand_H_
