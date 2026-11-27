this.legend_necrosavant_lord_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.necrosavant_lord },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legend_necrosavant_lord_potion";
		this.m.Name = "Bloodmist Reflex";
		this.m.Description = "The essence of an elder blood-drinker makes a wounded body slip through gaps no watchful enemy should permit.";
		this.m.Icon = "skills/legends_potions_expanded_necrosavant_lord_potion.png";
		this.m.Overlay = "status_effect_133";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "Ignore enemy Zones of Control while below [color=%negative%]50%[/color] Hitpoints";
	}

	function onUpdate(_properties)
	{
		local actor = this.getContainer().getActor();
		if (actor.getHitpoints() < actor.getHitpointsMax() * 0.5)
		{
			_properties.IsImmuneToZoneOfControl = true;
		}
	}
});
