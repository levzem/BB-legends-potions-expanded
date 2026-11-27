this.legends_potions_expanded_treasure_hunter_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.treasure_hunter },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legends_potions_expanded_treasure_hunter_potion";
		this.m.Name = "Ichor of Preservation";
		this.m.Description = "The preserving ichor of an ancient tomb makes your body a little harder to destroy.";
		this.m.Icon = "skills/legends_potions_expanded_treasure_hunter_potion.png";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "Take 5% less damage.";
	}

	function onUpdate(_properties)
	{
		_properties.DamageReceivedTotalMult *= 0.95;
	}
});
