/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef GmEventToolsCommand_H_
#define GmEventToolsCommand_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/managers/director/DirectorManager.h"
#include "server/zone/managers/loot/LootManager.h"

class GmEventToolsCommand : public QueueCommand {
public:

	GmEventToolsCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;


		StringTokenizer args(arguments.toString());

		if (!args.hasMoreTokens()) {
			Lua* lua = DirectorManager::instance()->getLuaInstance();

			Reference<LuaFunction*> eventTools = lua->createFunction("EventTools", "openToolsSUI", 0);
			*eventTools << creature;

			eventTools->callFunction();

		} else {
			try {
				String commandType;
				args.getStringToken(commandType);

				if (commandType.beginsWith("help")) {
					creature->sendSystemMessage("SYNTAX: /gmEventTools");
					creature->sendSystemMessage("SYNTAX: /gmEventTools eventtoken [<quantity>] [<range>]");
				}
        /*
        else if (commandType.beginsWith("eventtoken")) {

					int quantity = 1;
					if (args.hasMoreTokens())
						quantity = args.getIntToken();

					if (quantity < 1)
						quantity = 1;

					if (quantity > 50)
						quantity = 50;

					int range = 64;
					if (args.hasMoreTokens())
						range = args.getIntToken();

					if (range < 1)
						range = 32;

					if (range > 256)
						range = 256;

					Zone* zone = creature->getZone();
					if (zone == NULL)
						return GENERALERROR;

					// Find all objects in range
					SortedVector<QuadTreeEntry*> closeObjects;
					CloseObjectsVector* closeObjectsVector = (CloseObjectsVector*) creature->getCloseObjects();
					if (closeObjectsVector == NULL) {
						zone->getInRangeObjects(creature->getPositionX(), creature->getPositionY(), range, &closeObjects, true);
					} else {
						closeObjectsVector->safeCopyTo(closeObjects);
					}

					// Award loot group to all palyers in range
					for (int i = 0; i < closeObjects.size(); i++) {
						SceneObject* targetObject = static_cast<SceneObject*>(closeObjects.get(i));

						if (targetObject->isPlayerCreature() && creature->isInRange(targetObject, range)) {
							CreatureObject* targetPlayer = cast<CreatureObject*>(targetObject);
							Locker tlock(targetPlayer, creature);

							ManagedReference<TangibleObject*> object = (server->getZoneServer()->createObject(3428100657, 1)).castTo<TangibleObject*>();

							if (object == NULL)
								return INVALIDPARAMETERS;

							Locker locker(object);
							object->setUseCount(quantity);

							ManagedReference<SceneObject*> inventory = targetPlayer->getSlottedObject("inventory");
							if (inventory->transferObject(object, -1, true)) {
								inventory->broadcastObject(object, true);
								targetPlayer->sendSystemMessage("You have received an event token!");
							} else {
								object->destroyObjectFromDatabase(true);
								targetPlayer->sendSystemMessage("Error transferring event token to inventory, please contact the EC or an admin.");
							}

							tlock.release();
						}

					}

				}
        */

			} catch (Exception& e) {
				creature->sendSystemMessage("SYNTAX: /gmEventTools");
				creature->sendSystemMessage("SYNTAX: /gmEventTools eventtoken [<quantity>] [<range>]");

				return INVALIDPARAMETERS;
			}

		}

		return SUCCESS;
	}

};

#endif //GmEventToolsCommand_H_
