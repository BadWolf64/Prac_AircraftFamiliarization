setViewDistance 2500;
player createDiarySubject ["autoRot","AUTOROTATION"];
player createDiaryRecord ["autoRot", ["Tips and Tricks", "I will get around to filling this up.... eventually."]];
player createDiaryRecord ["autoRot", ["Solo Practice", "Once you have enabled the Autorotation Practice you will be able to enable the solo practice in the <marker name='autoRotMenu'>Autorotation Practice</marker> Menu.<br/><br/>This means that you are able to go about practicing your autorotations without the requirement that someone else in the Helicopter triggers it. <br/><br/>This is a random occurance. Once you get into the Heli, you will need to climb to 75m. Anywhere between 15 secs and 90 secs the damage will be applied. The damage will be to the engine OR both the engine and anti-troque system.<br/><br/>Once you have successfully landed, you will need to exit the heli and then get back in to repair any damage (to the heli and yourself).<br/><br/>Remember --- Any landing you can walk away from is a successful landing!!!"]];
player createDiaryRecord ["autoRot", ["The Practice Menu", "To enable the practice menu, you must go to the laptop at the <marker name='autoRotMenu'>Autorotation Practice</marker>. Here you can enable Autorotation Practice and also Solo Practice.<br/><br/>Once you have enabled Autorotation Proactice you are free to jump in a heli and start practicing... with a friend. The Menu can only be brought up by those who are not the pilot. This is a deliberate design choice as for any pilot practicing their interations should be exactly the same as in mission.<br/><br/>If you are in any position in the heli that is not the pilot, you can bring up the menu by using you ACE Interact Key.<br/><br/>Once the autorotation menu is disabled it will be removed from your ACE interact, and you will have to return to the <marker name='autoRotMenu'>Autorotation Practice</marker> laptop to enable it again. This will also cancel any Solo Practice previously started."]];
player createDiarySubject ["tolMenu","TO and LANDING"];
player createDiaryRecord ["tolMenu",["Tips and Tricks","If at any point you need to heal either the vic or yourself, you need only to exit the helicopter (recommended that you do this on the ground).<br/><br/>If you die whilst practicing a landing you will be respawned and the LZ will be removed from the mep. You need only to spawn a new heli and get in as pilot to continue."]];
player createDiaryRecord ["tolMenu",["Take Off","After you have been given the prompt to leave the LZ, the next LZ will only be assigned after you move out of the AO. This is 500m didstance."]];
player createDiaryRecord ["tolMenu",["Landing","When Landing make sure and get as close to the LZ as possible. You will only get the prompt to take off when you are within 50m of the LZ. This should be kept in mind if you plan on doing formation plandings as the lead pilot should within that 50m."]];
player createDiaryRecord ["tolMenu",["The Practice Menu","Open the menu at the laptop in the starting area. <marker name='landingMenu'>Take off and Landing</marker><br/><br/>This menu will allow you to set up the practice that you want to carry out. The default practice is Open Landing Zonce with no opposition and not teleport to the LZ AO. <br/><br/> OPPOSITION: If you enable opposition, it will spawn 2 groups of EI that will spawn at 2 random locations within the AO.<br/><br/>TELEPORT: If enabled you will be spawned at a random location on a radius of roughly 2km form the LZ. If diabled you will be required to fly to the LZ from your current position.<br/><br/>OPEN and CLOSED LZ: Open LZ's are a little less challenging than the Tight LZs. They are good for practicing formation landings or if you are very new to Helis. Tight LZs are more meant for a single ship and are generally for the more advanced pilot.<br/><br/>GROUP PRACTICE: If you plan on practicing LZ's as a group, only the lead pilot need enable the menu otherwise all other pilots will be assigned different LZ's. Also do not enable Teleport as only the lead pilot will be teleported and everyone else will have to move to the lead pilots position."]];
if (hasInterface) then {
    [] spawn {
        waitUntil {alive player};
        player addEventHandler ["Respawn", {
            [] spawn {
                sleep 0.5;
                systemChat "you are respawned and will get gear set";
                [player] call potato_assignGear_fnc_assignGearMan;
            };
        }];
    };
};

[] call bad_fnc_fullHeal;
[] call bad_fnc_rearm;
[] call bad_fnc_repairVic;