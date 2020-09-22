/*
 * WearableObjectMenuComponent.cpp
 *
 *  Created on: 10/30/2011
 *      Author: kyle
 */

#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/objects/player/sui/colorbox/SuiColorBox.h"
#include "server/zone/objects/player/sui/callbacks/ColorArmorSuiCallback.h"
#include "server/zone/ZoneServer.h"
#include "client/zone/objects/scene/SceneObject.h"
#include "WearableObjectMenuComponent.h"
#include "server/zone/packets/object/ObjectMenuResponse.h"
#include "templates/customization/AssetCustomizationManagerTemplate.h"

void WearableObjectMenuComponent::fillObjectMenuResponse(SceneObject* sceneObject, ObjectMenuResponse* menuResponse, CreatureObject* player) const {
	if (!sceneObject->isTangibleObject())
		return;

	TangibleObject* tano = cast<TangibleObject*>(sceneObject);
	if (tano == nullptr)
		return;

	if (tano->getConditionDamage() > 0 && tano->canRepair(player)) {
		menuResponse->addRadialMenuItem(70, 3, "@sui:repair"); // Slice
	}

	TangibleObjectMenuComponent::fillObjectMenuResponse(sceneObject, menuResponse, player);

	menuResponse->addRadialMenuItem(71, 3, "Color Clothing"); // Slice


	// Stack - adding in coloration for clothing
	menuResponse->addRadialMenuItemToRadialID(71, 72, 3, "Color 1 (if avail)");
	menuResponse->addRadialMenuItemToRadialID(71, 73, 3, "Color 2 (if avail)");
	menuResponse->addRadialMenuItemToRadialID(71, 74, 3, "Color 3 (if avail)");
}

int WearableObjectMenuComponent::handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* player, byte selectedID) const {
	if (!sceneObject->isASubChildOf(player))
		return 0;

	if (selectedID == 70) {
		if(!sceneObject->isTangibleObject())
			return 0;

		TangibleObject* tano = cast<TangibleObject*>(sceneObject);
		if(tano == nullptr)
			return 0;

		tano->repair(player);

		return 1;
	}
	else if (selectedID == 72 || selectedID == 73 || selectedID == 74)
	{

		SceneObject* inventory = player->getSlottedObject("inventory");
		if (inventory == nullptr) {
			player->sendSystemMessage("You need a 'Clothing dye' in order to change clothing appearance");
			return 0;
		}

		// Stack - only allow coloring if you have a dye. Check for dyes --
		// change to whatever object you want to be consumed when you select any of the coloration options
		uint32 dyePathCRC = STRING_HASHCODE("object/tangible/furniture/cheap/dyekit.iff");
		SceneObject* dye = (player->getZoneServer()->createObject(dyePathCRC, 2)).castTo<SceneObject*>();

		if (dye == nullptr) {
			info("Could not find dye object to be created", true);
			return 0;
		}


		bool hasObject = false;
		for (int i = 0; i < inventory->getContainerObjectsSize(); ++i) {
			SceneObject* sceno = inventory->getContainerObject(i);

			if (sceno->getServerObjectCRC() == dye->getServerObjectCRC()) {
				Locker locker(sceno);
				sceno->destroyObjectFromWorld(true);
				sceno->destroyObjectFromDatabase(true);
				hasObject = true;

				locker.release();

				player->sendSystemMessage("Consumed 'Clothing Dye' from inventory");
				break;
			}
		}

		// Clean up the created dye object.
		Locker locker2(dye);
		dye->destroyObjectFromWorld(true);
		dye->destroyObjectFromDatabase(true);

		locker2.release();

		if (!hasObject) {
			player->sendSystemMessage("You need a 'Clothing dye' in order to change clothing appearance");
			return 0;
		}

		// The color index.
		String appearanceFilename = sceneObject->getObjectTemplate()->getAppearanceFilename();
		VectorMap<String, Reference<CustomizationVariable*> > variables;
		AssetCustomizationManagerTemplate::instance()->getCustomizationVariables(appearanceFilename.hashCode(), variables, false);

		ZoneServer* server = player->getZoneServer();

		// The Sui Box.
		ManagedReference<SuiColorBox*> cbox = new SuiColorBox(player, SuiWindowType::COLOR_ARMOR);
		cbox->setCallback(new ColorArmorSuiCallback(server));

		int colorIndex = 0;
		if(selectedID == 73)
		{
			if(variables.size() - 1 > 1)
			{
				colorIndex = 1;
			}
			else
			{
				return 0;
			}
		}
		else if (selectedID == 74)
		{
			if(variables.size() - 1 > 2)
			{
				colorIndex = 2;
			}
			else
			{
				return 0;
			}
		}

		cbox->setColorPalette(variables.elementAt(colorIndex).getKey());
		cbox->setUsingObject(sceneObject);

		// Add to player.
		ManagedReference<PlayerObject*> ghost = player->getPlayerObject();
		ghost->addSuiBox(cbox);
		player->sendMessage(cbox->generateMessage());

	}

	return TangibleObjectMenuComponent::handleObjectMenuSelect(sceneObject, player, selectedID);
}
