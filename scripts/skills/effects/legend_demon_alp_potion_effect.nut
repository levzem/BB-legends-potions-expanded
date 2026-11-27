this.legend_demon_alp_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.demon_alp },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legend_demon_alp_potion";
		this.m.Name = "Unblinking Awareness";
		this.m.Description = "Distilled nightmare opens a sense that watches every approach at once. Even a closing circle of enemies offers no distraction.";
		this.m.Icon = "skills/legends_potions_expanded_demon_alp_potion.png";
		this.m.Overlay = "status_effect_147";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "Enemies gain no surround bonus against this character";
	}

	function onUpdate(_properties)
	{
		_properties.IsImmuneToSurrounding = true;
	}
});
