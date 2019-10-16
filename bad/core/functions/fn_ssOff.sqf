#include "script_component.hpp"

FUNC(toggleSS) = {

if !(isServer) exitWith {};

[false] call potato_safestart_fnc_togglesafestart;

};