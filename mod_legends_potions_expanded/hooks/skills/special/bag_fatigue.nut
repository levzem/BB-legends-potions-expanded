::LegendsPotionsExpanded.Mod.hook("scripts/skills/special/bag_fatigue", function (q)
{
	q.onUpdate = @(__original) function (_properties)
	{
		if (this.getContainer().hasSkill("effects.legends_potions_expanded_donkey_potion"))
		{
			return;
		}
		return __original(_properties);
	};
});
