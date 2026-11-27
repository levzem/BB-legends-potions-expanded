this.legend_rock_unhold_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.rock_unhold },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legend_rock_unhold_potion";
		this.m.Name = "Mountainhide";
		this.m.Description = "Stone-heavy marrow hardens the flesh beneath armor, lending every plate and padded layer greater protection.";
		this.m.Icon = "skills/legends_potions_expanded_rock_unhold_potion.png";
		this.m.Overlay = "status_effect_145";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "[color=%positive%]+15%[/color] total Head and Body Armor";
	}

	function onUpdate(_properties)
	{
		_properties.ArmorMult[::Const.BodyPart.Head] *= 1.15;
		_properties.ArmorMult[::Const.BodyPart.Body] *= 1.15;
	}
});
