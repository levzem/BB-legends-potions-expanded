::LegendsPotionsExpanded.Mod.hook("scripts/skills/actives/throw_net", function (q)
{
	q.getActionPointCost = @(__original) function ()
	{
		local cost = __original();
		if (this.getContainer().hasSkill("effects.legends_potions_expanded_ancient_gladiator_potion"))
		{
			return ::Math.max(1, cost);
		}
		return cost;
	};
});
