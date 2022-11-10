/**
	 * util_cleanLoadout
	 * _loadout = (player getUnitLoadout) call util_cleanLoadout;
	 *
	 * Keeps the ammo from refilling if there are duplicate used ammo counts in one inventory container. Fix for what demellion posted
 */

private ["_loadout", "_uniform", "_type", "_vest", "_backpack"];

_loadout = _this;

// uniform
if (count (_loadout select 3) > 0) then {
	_uniform = ((_loadout select 3) select 1);
	{
		_type = (_x select 0) call BIS_fnc_itemType;
		if (((_type select 1) isEqualTo "Bullet") && {
			(_x select 1) >= 2 && {
				(_x select 2) != (getNumber(configFile >> "cfgMagazines" >> (_x select 0) >> "count"))
			}
		}) then
		{
			((_loadout select 3) select 1) set [_forEachIndex, [(_x select 0), 1, (_x select 2)]];
			for "_i" from 1 to (_x select 1)-1 do
			{
				((_loadout select 3) select 1) pushBack [(_x select 0), 1, (_x select 2)];
			};
		};
	} forEach _uniform;
};

// vest
if (count (_loadout select 4) > 0) then {
	_vest = ((_loadout select 4) select 1);
	{
		_type = (_x select 0) call BIS_fnc_itemType;
		if (((_type select 1) isEqualTo "Bullet") && {
			(_x select 1) >= 2 && {
				(_x select 2) != (getNumber(configFile >> "cfgMagazines" >> (_x select 0) >> "count"))
			}
		}) then
		{
			((_loadout select 4) select 1) set [_forEachIndex, [(_x select 0), 1, (_x select 2)]];
			for "_i" from 1 to (_x select 1)-1 do
			{
				((_loadout select 4) select 1) pushBack [(_x select 0), 1, (_x select 2)];
			};
		};
	} forEach _vest;
};

// backpack
if (count (_loadout select 5) > 0) then {
	_backpack = ((_loadout select 5) select 1);
	{
		_type = (_x select 0) call BIS_fnc_itemType;
		if (((_type select 1) isEqualTo "Bullet") && {
			(_x select 1) >= 2 && {
				(_x select 2) != (getNumber(configFile >> "cfgMagazines" >> (_x select 0) >> "count"))
			}
		}) then
		{
			((_loadout select 5) select 1) set [_forEachIndex, [(_x select 0), 1, (_x select 2)]];
			for "_i" from 1 to (_x select 1)-1 do
			{
				((_loadout select 5) select 1) pushBack [(_x select 0), 1, (_x select 2)];
			};
		};
	} forEach _backpack;
};
_loadout