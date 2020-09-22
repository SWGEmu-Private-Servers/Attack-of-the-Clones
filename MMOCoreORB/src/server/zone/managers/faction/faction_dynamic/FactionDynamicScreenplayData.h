/*
 * FactionDynamicScreenplayData.h
 *	Defines a faction dynamic screenplay data object that will be used to spawn and
 *  Created on: 7/31/2020
 *      Author: Stack
 */



#include "engine/engine.h"

class FactionDynamicScreenplayData : public Object {

public:
	String screenplayName;
	String serverMessage;

	FactionDynamicScreenplayData() : Object() {
		screenplayName = "";
		serverMessage = "";
	}

	FactionDynamicScreenplayData(const String& spName, const String& svMessage) : Object() {
		screenplayName = spName;
		serverMessage = svMessage;
	}

};
