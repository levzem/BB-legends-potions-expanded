this.legends_potions_expanded_basilisk_sentry_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.basilisk_sentry },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legends_potions_expanded_basilisk_sentry_potion";
		this.m.Name = "Unblinking Eye";
		this.m.Description = "Your unblinking eyes are used to the horrors that would freeze another person in terror.";
		this.m.Icon = "skills/legends_potions_expanded_basilisk_sentry_potion.png";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "Immune to Horrified.";
	}

	function onAdded()
	{
		this.getContainer().removeByID("effects.horrified");
	}
});
