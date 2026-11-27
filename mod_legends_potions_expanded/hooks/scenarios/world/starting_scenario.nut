::LegendsPotionsExpanded.Mod.hookTree("scripts/scenarios/world/starting_scenario", function (q)
{
	q.onActorKilled = @(__original) function (_actor, _killer, _combatID)
	{
		local result = __original(_actor, _killer, _combatID);
		if (::LegendsPotionsExpanded.isEnabled(this))
		{
			::LegendsPotionsExpanded.Potions.onActorKilled(_actor, _killer, _combatID);
		}
		return result;
	};

	q.onBattleWon = @(__original) function (_combatLoot)
	{
		local result = __original(_combatLoot);
		if (::LegendsPotionsExpanded.isEnabled(this))
		{
			::LegendsPotionsExpanded.Potions.onBattleWon(_combatLoot);
		}
		return result;
	};

	q.onCombatFinished = @(__original) function ()
	{
		local result = __original();
		::LegendsPotionsExpanded.Potions.clearPendingDrops();
		return result;
	};

	q.onSpawnAssets = @(__original) function ()
	{
		local result = __original();
		::LegendsPotionsExpanded.Potions.clearPendingDrops();
		return result;
	};
});
