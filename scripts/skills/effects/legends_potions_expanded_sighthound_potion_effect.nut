this.legends_potions_expanded_sighthound_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.sighthound },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legends_potions_expanded_sighthound_potion";
		this.m.Name = "Harecatcher's Draught";
		this.m.Description = "Your eyes track the slightest hesitation in your quarry's movements.";
		this.m.Icon = "skills/legends_potions_expanded_sighthound_potion.png";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "+10% melee damage against enemies with lower current Initiative.";
	}

	function onAnySkillUsed(_skill, _targetEntity, _properties)
	{
		if (_skill.isAttack() && !_skill.isRanged() && _targetEntity != null &&
			this.getContainer().getActor().getInitiative() > _targetEntity.getInitiative())
		{
			_properties.MeleeDamageMult *= 1.1;
		}
	}
});
