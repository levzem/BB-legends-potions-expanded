::LegendsPotionsExpanded.Mod.hook("scripts/skills/actives/rally_the_troops", function (q)
{
	q.getBonus = @(__original) function ()
	{
		local bonus = __original();
		if (this.getContainer().hasSkill("effects.legends_potions_expanded_orc_tyrant_potion"))
		{
			bonus += 15;
		}
		return bonus;
	};
});
