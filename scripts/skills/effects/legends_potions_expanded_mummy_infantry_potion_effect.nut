this.legends_potions_expanded_mummy_infantry_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.mummy_infantry },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legends_potions_expanded_mummy_infantry_potion";
		this.m.Name = "Mummy's Curse";
		this.m.Description = "Those who strike you feel the weight of an ancient curse settle into their limbs.";
		this.m.Icon = "skills/legends_potions_expanded_mummy_infantry_potion.png";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "Every successful attack hit against you costs 5 additional Fatigue for the attacker.";
	}
});
