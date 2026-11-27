this.legends_potions_expanded_mummy_priest_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.mummy_priest },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legends_potions_expanded_mummy_priest_potion";
		this.m.Name = "Last Rites Tincture";
		this.m.Description = "An ancient funerary instinct gives your killing blows a terrible finality.";
		this.m.Icon = "skills/legends_potions_expanded_mummy_priest_potion.png";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "Kills produce a valid fatality whenever the attack and target support it.";
	}

	function onUpdate(_properties)
	{
		_properties.FatalityChanceMult = ::Math.max(_properties.FatalityChanceMult, 1000.0);
	}
});
