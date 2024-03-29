btc_map_mapIllumination = ace_map_mapIllumination;
if !(isNil "btc_custom_loc") then {
    {
        _x params ["_pos", "_cityType", "_cityName", "_radius"];
        private _location = createLocation [_cityType, _pos, _radius, _radius];
        _location setText _cityName;
    } forEach btc_custom_loc;
};
btc_intro_done = [] spawn btc_respawn_fnc_intro;

[{!isNull player}, {
    [] call compileScript ["core\doc.sqf"];

    btc_respawn_marker setMarkerPosLocal player;
    player addRating 9999;
    ["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

    [player] call btc_eh_fnc_player;

    private _arsenal_trait = player call btc_arsenal_fnc_trait;
    if (btc_p_arsenal_Restrict isEqualTo 3) then {
        [_arsenal_trait select 1] call btc_arsenal_fnc_weaponsFilter;
    };
    [] call btc_int_fnc_add_actions;
    [] call btc_int_fnc_shortcuts;

    if (player getVariable ["interpreter", false]) then {
        player createDiarySubject ["btc_diarylog", localize "STR_BTC_HAM_CON_INFO_ASKHIDEOUT_DIARYLOG", '\A3\ui_f\data\igui\cfg\simpleTasks\types\talk_ca.paa'];
    };

    switch (btc_p_autoloadout) do {
        case 1: {
            player setUnitLoadout ([_arsenal_trait select 0] call btc_arsenal_fnc_loadout);
        };
        case 2: {
            removeAllWeapons player;
        };
        default {
        };
    };

    [] call btc_respawn_fnc_screen;

    if (btc_debug) then {
        addMissionEventHandler ["MapSingleClick", {
            params ["_units", "_pos", "_alt", "_shift"];
            if (
                alive player &&
                !_alt &&
                !_shift
            ) then {
                vehicle player setPos _pos;
            };
        }];
        player allowDamage false;

        [{!isNull (findDisplay 12)}, {
            ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", btc_debug_fnc_marker];
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
            [format ["<t color='%1' align='center'>Le Staff</t>", _color]],
            false
        ] call CBA_fnc_notify;

        [] spawn gie_presence_fnc_init;
    }] call CBA_fnc_waitUntilAndExecute;

}] call CBA_fnc_waitUntilAndExecute;