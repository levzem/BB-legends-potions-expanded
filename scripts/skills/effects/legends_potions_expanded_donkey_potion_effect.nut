this.legends_potions_expanded_donkey_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.donkey },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legends_potions_expanded_donkey_potion";
		this.m.Name = "Packmule's Reserve";
		this.m.Description = "Your back and shoulders bear their burdens with a mule's stubborn ease.";
		this.m.Icon = "skills/legends_potions_expanded_donkey_potion.png";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "Bagged items impose no maximum-Fatigue penalty, including two-handed weapons.";
	}

	// The bag_fatigue hook disables bag penalties while this mutation is active.
});
