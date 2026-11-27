this.legend_hexe_leader_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.hexe_leader },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legend_hexe_leader_potion";
		this.m.Name = "Defiant Heart";
		this.m.Description = "A whisper lingers in this sweet-smelling liquor. Whenever courage falters, it calls the mind back from the brink.";
		this.m.Icon = "skills/legends_potions_expanded_hexe_leader_potion.png";
		this.m.Overlay = "status_effect_148";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "Re-roll each failed morale check once";
	}

	function onUpdate(_properties)
	{
		_properties.RerollMoraleChance = 100;
	}
});
