[] spawn {
	if(!(time > missionNamespace getVariable ["GIE_tpAvailableAt", 0])) exitWith {hint "TP Impossible"};

	openMap true;
	hint "Sélectionnez l'unité sur laquelle vous voulez vous redéployer.";
	_mapEH = addMissionEventHandler ["MapSingleClick", {
		private _nearestPlayer = [_this select 1] call btc_fnc_find_nearest_player;
		private _posPlayer = getPos (_nearestPlayer select 0);
		private _pos = [_posPlayer, 250, 500, 3, 0, 20, 0] call BIS_fnc_findSafePos;
		hint "TP en cours.";
		player setPos (_pos);
		_azimuth = player getDir _posPlayer;
		openMap false;
		hint format ["Vos alliés son azimut %1", round _azimuth, "%1"];
	}];

	while{visibleMap} do {
		{
		_markerstr = createMarkerLocal [name _x,position _x];
		_markerstr setMarkerShapeLocal "ICON";
		_markerstr setMarkerTypeLocal "o_inf";
		_markerstr setMarkerTextLocal name _x;
		} forEach allPlayers;

		sleep 1;
		
		{
			deleteMarkerLocal name _x;
		} forEach allPlayers;
	};
	
	waitUntil {!visibleMap};
	removeMissionEventHandler ["MapSingleClick",_mapEH];

	{
		deleteMarkerLocal name _x;
	} forEach allPlayers;
};