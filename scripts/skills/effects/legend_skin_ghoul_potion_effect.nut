this.legend_skin_ghoul_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.skin_ghoul },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legend_skin_ghoul_potion";
		this.m.Name = "Predatory Precision";
		this.m.Description = "A skin ghoul's ravenous instincts settle into the hands, guiding every strike toward the body's most fragile places.";
		this.m.Icon = "skills/legends_potions_expanded_skin_ghoul_potion.png";
		this.m.Overlay = "status_effect_149";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "[color=%positive%]40%[/color] lower damage threshold to inflict injuries with melee and ranged attacks";
	}

	function onUpdate(_properties)
	{
		_properties.ThresholdToInflictInjuryMult *= 0.6;
	}
});
