::LegendsPotionsExpanded.Mod.hook("scripts/skills/perks/perk_fearsome", function (q)
{
	q.onTargetHit = @(__original) function (_skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor)
	{
		// Widow's Lament handles low-damage check
		if (this.getContainer().hasSkill("effects.legends_potions_expanded_banshee_potion"))
		{
			return;
		}
		return __original(_skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor);
	};
});
