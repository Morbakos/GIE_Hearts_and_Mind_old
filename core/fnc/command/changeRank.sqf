
/* ----------------------------------------------------------------------------
Function: btc_fnc_command_changeRank

Description:
    Add vehicle to the wreck system.

Parameters:
    _player - Player to change rank. [Object]
	_rank - Rank number [Number]
	_commander - Player who ordered the level up

Returns:

Examples:
    (begin example)
        [cursorObject, 2, player] remoteExecCall [btc_fnc_command_changeRank, 2];
    (end)

Author:
    Gavin "Morbakos" Sertix

---------------------------------------------------------------------------- */

params [
	["_player", objNull, [objNull]],
	["_rank", "PRIVATE", [""]],
	["_commander", objNull, [objNull]]
];

if (!isServer) exitWith {
	[_player, _rank, _commander] remoteExecCall ["btc_fnc_command_changeRank", 2];
};

if ((isNull _player) OR (isNull _commander)) exitWith {
};

private _playerRank = [rank _player] call btc_fnc_command_rankId;
private _commanderRank = [rank _commander] call btc_fnc_command_rankId;

// Check if user can upgrade rank
// V1, player need to be at least lieutenant 
if !(_commanderRank in [4,5,6,7]) exitWith {
	[format [localize "STR_BTC_CANT_PROMOTE", name _commander]] remoteExecCall ["CBA_fnc_notify", _player];
	[format [localize "STR_BTC_CANT_PROMOTE_SELF", name _player]] remoteExecCall ["CBA_fnc_notify", _commander];
};

// If player rank >= commander rank, don't do anything
if (_playerRank >= _commanderRank) exitWith {
};

// Only major or colonel can promote to lieutenant and more
if ((_rank >=4) && !(_commanderRank in [6,7])) exitWith {
};

// Do the promotion
_player setUnitRank _rank;

private _playerAlreadyExist = btc_playersRanks select {(_x select 0) isEqualTo (getPlayerUID _player)} select 0; 
if (_playerAlreadyExist isEqualTo []) then { // Create a new entry
 	btc_playersRanks pushBack [getPlayerUID _player, _rank]; 
} else { // Update entry
	_playerAlreadyExist set [1, _rank];
	private _pos = btc_playersRanks findIf {_x select 0 == getPlayerUID _player};
	btc_playersRanks set [_pos,_playerAlreadyExist];
}