this.legends_potions_expanded_ancient_gladiator_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.ancient_gladiator },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legends_potions_expanded_ancient_gladiator_potion";
		this.m.Name = "Retiarius' Draught";
		this.m.Description = "Forgotten arena instincts guide the cast of a net.";
		this.m.Icon = "skills/legends_potions_expanded_ancient_gladiator_potion.png";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "Throwing nets costs 1 less AP and 50% less Fatigue; minimum 1 AP.";
	}

	function onUpdate(_properties)
	{
		_properties.SkillCostAdjustments.push({ ID = "actives.throw_net", APAdjust = -1, FatigueMultAdjust = 0.5 });
	}
});
