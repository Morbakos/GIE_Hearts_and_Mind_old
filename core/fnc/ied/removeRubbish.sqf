
/* ----------------------------------------------------------------------------
Function: btc_fnc_ied_removeRubbish

Description:
    Remove rubbish (without vehicle).

Parameters:
    _rubbish - Rubbish to remove. [Object]

Returns:

Examples:
    (begin example)
        _result = _rubbish call btc_fnc_ied_removeRubbish;
    (end)

Author:
    Gavin "Morbakos" Sertix

---------------------------------------------------------------------------- */

params ["_wreck"];

[
	10, 
	[_wreck, player],
	{
		params ["_args"];
		_args params ["_wreck", "_player"];
		deleteVehicle _wreck;
		[btc_rep_bonus_IEDCleanUp, _player] remoteExecCall ["btc_fnc_rep_change", 2];
	}, 
	{
		
	}, 
	"Suppression des déchets"
] call ace_common_fnc_progressBar;