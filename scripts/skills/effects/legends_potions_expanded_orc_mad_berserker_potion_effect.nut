this.legends_potions_expanded_orc_mad_berserker_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.orc_mad_berserker },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legends_potions_expanded_orc_mad_berserker_potion";
		this.m.Name = "Sweetness of Pain";
		this.m.Description = "You embrace the suck. Pain no longer brings fear.";
		this.m.Icon = "skills/legends_potions_expanded_orc_mad_berserker_potion.png";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "HP loss does not trigger morale checks.";
	}

	function onUpdate(_properties)
	{
		_properties.IsAffectedByLosingHitpoints = false;
	}
});
