this.legend_orc_behemoth_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.orc_behemoth },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legend_orc_behemoth_potion";
		this.m.Name = "Unchained Adrenaline";
		this.m.Description = "A behemoth's glands lend their brutal urgency to the drinker's blood. Summoning a burst of speed becomes far less exhausting.";
		this.m.Icon = "skills/legends_potions_expanded_orc_behemoth_potion.png";
		this.m.Overlay = "status_effect_129";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "Adrenaline costs [color=%positive%]60%[/color] less Fatigue.";
	}

	function onUpdate(_properties)
	{
		_properties.SkillCostAdjustments.push({ ID = "actives.adrenaline", FatigueMultAdjust = 0.4 });
	}
});
