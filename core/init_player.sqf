btc_map_mapIllumination = ace_map_mapIllumination;
if !(isNil "btc_custom_loc") then {
    {
        _x params ["_pos", "_cityType", "_cityName", "_radius"];
        private _location = createLocation [_cityType, _pos, _radius, _radius];
        _location setText _cityName;
    } forEach btc_custom_loc;
};
btc_intro_done = [] spawn btc_fnc_intro;

[{!isNull player}, {
    [] call compile preprocessFileLineNumbers "core\doc.sqf";
    [] call compile preprocessFileLineNumbers "core\fnc\info\hostileVehicles.sqf";

    player addRating 9999;
    ["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

    [player] call btc_fnc_eh_player;

    private _arsenal_trait = player call btc_fnc_arsenal_trait;
    if (btc_p_arsenal_Restrict isEqualTo 3) then {
        [_arsenal_trait select 1] call btc_fnc_arsenal_weaponsFilter;
    };
    [] call btc_fnc_int_add_actions;
    [] call btc_fnc_int_shortcuts;

    // if (player getVariable ["interpreter", true]) then {
        player createDiarySubject ["btc_diarylog", localize "STR_BTC_HAM_CON_INFO_ASKHIDEOUT_DIARYLOG"];
    // };

    switch (btc_p_autoloadout) do {
        case 1: {
            player setUnitLoadout ([_arsenal_trait select 0] call btc_fnc_arsenal_loadout);
        };
        case 2: {
            removeAllWeapons player;
        };
        default {
        };
    };

    if (btc_debug) then {
        onMapSingleClick "vehicle player setPos _pos";
        player allowDamage false;

        [{!isNull (findDisplay 12)}, {
            ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", btc_fnc_debug_marker];
        }] call CBA_fnc_waitUntilAndExecute;
    };

    [{time > 25}, {
        private _color = "#B71C1C";
        [
            [format ["<t color='%1' align='center'>Bonjour %2</t>", _color, name player]],
            [format ["Bienvenue à toi sur le serveur du <t color='%1'>GIE</t>", _color]],
            [format ["Il y a actuellement %1 joueur(s) connecté(s). Passe un bon moment :)", (count (switchableUnits + playableUnits) - count entities "HeadlessClient_F")]],
            [format ["Afin de communiquer avec nous, nous t'invitons à rejoindre notre <t color='%1'>TS</t>:", _color]],
            ["ts.team-gie.com"],
            ["Attention, n'oublie pas qu'ici, chacune de tes action a des conséquences sur la mission :)"],
            [format ["<t color='%1' align='center'>Le Staff de Snow Devils</t>", _color]],
            false
        ] call CBA_fnc_notify;
    }] call CBA_fnc_waitUntilAndExecute; 

}] call CBA_fnc_waitUntilAndExecute;