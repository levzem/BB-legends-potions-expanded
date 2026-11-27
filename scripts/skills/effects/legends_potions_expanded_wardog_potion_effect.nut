this.legends_potions_expanded_wardog_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.wardog, InOpportunityAttack = false },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legends_potions_expanded_wardog_potion";
		this.m.Name = "Hound's Persistence";
		this.m.Description = "The urge to pursue anything that turns its back is now quite difficult to resist.";
		this.m.Icon = "skills/legends_potions_expanded_wardog_potion.png";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "+10 Melee Skill on attacks of opportunity.";
	}

	function onAnySkillUsed(_skill, _targetEntity, _properties)
	{
		if (this.m.InOpportunityAttack && _skill.isAttack() && !_skill.isRanged())
		{
			_properties.MeleeSkill += 10;
		}
	}
});
