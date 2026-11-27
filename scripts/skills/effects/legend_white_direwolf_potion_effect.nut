this.legend_white_direwolf_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.white_direwolf },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legend_white_direwolf_potion";
		this.m.Name = "Unshaken Instinct";
		this.m.Description = "A white direwolf's hunting focus survives in this pale liquid. A flurry of enemy attacks can no longer overwhelm the senses.";
		this.m.Icon = "skills/legends_potions_expanded_white_direwolf_potion.png";
		this.m.Overlay = "status_effect_139";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "Immune to Overwhelm";
	}

	function onUpdate(_properties)
	{
		_properties.IsImmuneToOverwhelm = true;
	}
});
