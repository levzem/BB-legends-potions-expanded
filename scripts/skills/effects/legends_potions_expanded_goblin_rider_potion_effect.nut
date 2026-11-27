this.legends_potions_expanded_goblin_rider_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.goblin_rider },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legends_potions_expanded_goblin_rider_potion";
		this.m.Name = "Running Fang Draught";
		this.m.Description = "The scent of fear brings out the predator in you.";
		this.m.Icon = "skills/legends_potions_expanded_goblin_rider_potion.png";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "Deal +7.5% melee damage per negative morale level of the target.";
	}

	function onAnySkillUsed(_skill, _targetEntity, _properties)
	{
		if (_targetEntity == null || !_skill.isAttack() || _skill.isRanged() || _skill.m.IsOffensiveToolSkill)
		{
			return;
		}
		local morale = _targetEntity.getMoraleState();
		if (morale != ::Const.MoraleState.Ignore && morale < ::Const.MoraleState.Steady)
		{
			_properties.MeleeDamageMult *= 1.0 + 0.075 * (::Const.MoraleState.Steady - morale);
		}
	}
});
