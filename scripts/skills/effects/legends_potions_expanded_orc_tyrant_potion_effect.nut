this.legends_potions_expanded_orc_tyrant_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.orc_tyrant },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legends_potions_expanded_orc_tyrant_potion";
		this.m.Name = "Voice of Dominion";
		this.m.Description = "Your voice carries the unquestioning authority of a tyrant.";
		this.m.Icon = "skills/legends_potions_expanded_orc_tyrant_potion.png";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "Rally the Troops gains +15 to its bonus, costs 1 less AP and 40% less Fatigue.";
	}

	function onUpdate(_properties)
	{
		// Float rounding makes ceil(25 * 0.6) charge 16; stay just below that boundary.
		_properties.SkillCostAdjustments.push({ ID = "actives.rally_the_troops", APAdjust = -1, FatigueMultAdjust = 0.5999999 });
	}
});
