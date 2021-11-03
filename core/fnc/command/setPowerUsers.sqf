btc_playersRanks = [];

// Specific loop for power users
btc_playersRanks = [];
{
    _x params ["_playerId", "_rank"];
    btc_playersRanks pushBack [_playerId, _rank];
} forEach [
    ["76561198058210193", "COLONEL"], // Morba
    ["76561198076440513", "COLONEL"], // Pipper
    ["76561198128861864", "COLONEL"], // Stians
    ["76561198160359584", "COLONEL"], // Kaddosh
    ["76561197979323799", "COLONEL"], // Ledoc
    ["76561198083886996", "COLONEL"] // Jack
];