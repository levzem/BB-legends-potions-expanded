this.legends_potions_expanded_goblin_witchdoctor_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.goblin_witchdoctor },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legends_potions_expanded_goblin_witchdoctor_potion";
		this.m.Name = "Dr. Snogg's Jungle Juice";
		this.m.Description = "Guaranteed to repel all jungle insects, or your money back.";
		this.m.Icon = "skills/legends_potions_expanded_goblin_witchdoctor_potion.png";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "Immune to Insect Swarm.";
	}

	function onAdded()
	{
		this.getContainer().removeByID("effects.insect_swarm");
	}
});
