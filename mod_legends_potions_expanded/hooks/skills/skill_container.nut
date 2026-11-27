::LegendsPotionsExpanded.Mod.hook("scripts/skills/skill_container", function (q)
{
	q.add = @(__original) function (_skill, _order = 0)
	{
		if (_skill.getID() == "effects.horrified" && this.hasSkill("effects.legends_potions_expanded_basilisk_sentry_potion"))
		{
			return;
		}
		if (_skill.getID() == "effects.insect_swarm" && this.hasSkill("effects.legends_potions_expanded_goblin_witchdoctor_potion"))
		{
			return;
		}

		return __original(_skill, _order);
	};
});
