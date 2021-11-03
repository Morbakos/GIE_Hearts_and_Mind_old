
/* ----------------------------------------------------------------------------
Function: btc_fnc_command_rankId

Description:
    Add vehicle to the wreck system.

Parameters:
    _rank - Player to change rank. [String]

Returns:

Examples:
    (begin example)
        ["PRIVATE"] call btc_fnc_command_rankId;
    (end)

Author:
    Gavin "Morbakos" Sertix

---------------------------------------------------------------------------- */

params [
	["_rank", "", [""]]
];

if (!(_rank in ["PRIVATE","CORPORAL","SERGEANT","LIEUTENANT","CAPTAIN","MAJOR","COLONEL"])) exitWith {
};

private _id = switch (_rank) do {
	case "PRIVATE": { 1 };
	case "CORPORAL": { 2 };
	case "SERGEANT": { 3 };
	case "LIEUTENANT": { 4 };
	case "CAPTAIN": { 5 };
	case "MAJOR": { 6 };
	case "COLONEL": { 7 };
	default { 1 };
};

_id;