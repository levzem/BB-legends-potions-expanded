this.legend_greenwood_schrat_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.greenwood_schrat },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legend_greenwood_schrat_potion";
		this.m.Name = "Living Heartwood";
		this.m.Description = "Thick green sap teaches living flesh the patience of wood. New wounds still need healing, but their pain no longer hinders the body in battle.";
		this.m.Icon = "skills/legends_potions_expanded_greenwood_schrat_potion.png";
		this.m.Overlay = "status_effect_146";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "Fresh injuries have no effect during the battle in which they are received";
	}

	function onUpdate(_properties)
	{
		_properties.IsAffectedByFreshInjuries = false;
	}
});
