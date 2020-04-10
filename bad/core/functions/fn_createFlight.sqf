#include "script_component.hpp"
/* 
FUNCTION : getFlight :
DESCRIPTION : 
INPUTS :
OUTPUTS : 
*/

FUNC(getFlight) = {
	params["_player"];
    private _practiceStatus = missionNamespace getVariable "PV_playerPracticeStatus";
    private _index = _practiceStatus findif {_x select 0 == _player};
	private _playerCurrentFlight = _practiceStatus select 3;
	_playerCurrentFlight;
};


/* 
FUNCTION : updateFlightLeader :
DESCRIPTION : This will take the infromation in ICD 1083 and make that player the first position in the flight players array.
INPUTS :
OUTPUTS : 
*/
FUNC(updateFlightLeader) = {

};
/* 
FUNCTION : updateFlightName :
DESCRIPTION : This will change the name of the flight in the PV_flights array
INPUTS :
OUTPUTS : 
*/
FUNC(updateFlightName) = {

};
/* 
FUNCTION : moveToFlight :
DESCRIPTION : This will move a player into the flight player array in PV_flights
INPUTS :
OUTPUTS : 
*/
FUNC(moveToFlight) = {

};
/* 
FUNCTION : activateFlightPractice :
DESCRIPTION : 
INPUTS :
OUTPUTS : 
*/
FUNC(activateFlightPractice) = {

};
