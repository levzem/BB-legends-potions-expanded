this.legend_fallen_betrayer_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.fallen_betrayer },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legend_fallen_betrayer_potion";
		this.m.Name = "Exhausting Blows";
		this.m.Description = "A bitter draught drawn from a heart that would not stay dead. Each blow carries a little of its crushing burden.";
		this.m.Icon = "skills/legends_potions_expanded_fallen_betrayer_potion.png";
		this.m.Overlay = "status_effect_136";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "Successful hits inflict [color=%positive%]50%[/color] more Fatigue";
	}

	function onUpdate(_properties)
	{
		_properties.FatigueDealtPerHitMult *= 1.5;
	}
});
