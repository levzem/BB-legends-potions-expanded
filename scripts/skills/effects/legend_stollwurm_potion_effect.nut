this.legend_stollwurm_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.stollwurm },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legend_stollwurm_potion";
		this.m.Name = "Unbroken Nerves";
		this.m.Description = "This heavy distillate reinforces the nerves with the stubborn resilience of a stollwurm. Blows can hurt, but cannot stun.";
		this.m.Icon = "skills/legends_potions_expanded_stollwurm_potion.png";
		this.m.Overlay = "status_effect_140";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "Immune to Stun";
	}

	function onUpdate(_properties)
	{
		_properties.IsImmuneToStun = true;
	}
});
