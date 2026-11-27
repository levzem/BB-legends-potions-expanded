this.legend_demon_hound_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.demon_hound },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legend_demon_hound_potion";
		this.m.Name = "Furnace Lungs";
		this.m.Description = "This acrid distillate makes every breath burn. When the burning subsides, the lungs recover their strength with unnatural speed.";
		this.m.Icon = "skills/legends_potions_expanded_demon_hound_potion.png";
		this.m.Overlay = "status_effect_137";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "[color=%positive%]+3[/color] Fatigue Recovery per turn";
	}

	function onUpdate(_properties)
	{
		_properties.FatigueRecoveryRate += 3;
	}
});
