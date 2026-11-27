this.legend_conqueror_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.conqueror },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legend_conqueror_potion";
		this.m.Name = "Ossified Flesh";
		this.m.Description = "Minerals distilled from an ancient conqueror's bones seal torn blood vessels before a wound can bleed.";
		this.m.Icon = "skills/legends_potions_expanded_conqueror_potion.png";
		this.m.Overlay = "status_effect_132";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "Immune to bleeding";
	}

	function onUpdate(_properties)
	{
		_properties.IsImmuneToBleeding = true;
	}
});
