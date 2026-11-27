this.legends_potions_expanded_horse_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.horse },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legends_potions_expanded_horse_potion";
		this.m.Name = "Courser's Cordial";
		this.m.Description = "A courser's tireless stride takes hold in the muscles of your legs.";
		this.m.Icon = "skills/legends_potions_expanded_horse_potion.png";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "Movement costs 25% less Fatigue.";
	}

	function onUpdate(_properties)
	{
		_properties.MovementFatigueCostMult *= 0.75;
	}
});
