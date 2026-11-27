this.legend_orc_elite_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.orc_elite },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legend_orc_elite_potion";
		this.m.Name = "Ironback Sinews";
		this.m.Description = "Dense orc sinew, reduced to a metallic syrup, strengthens the muscles that bear armor and weapons.";
		this.m.Icon = "skills/legends_potions_expanded_orc_elite_potion.png";
		this.m.Overlay = "status_effect_130";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "Reduce Fatigue and Initiative penalties from equipped headgear, body armor and held items by [color=%positive%]20%[/color]";
	}

	function onUpdate(_properties)
	{
		local items = this.getContainer().getActor().getItems();
		local penalty = ::Math.min(0, items.getStaminaModifier([::Const.ItemSlot.Head, ::Const.ItemSlot.Body, ::Const.ItemSlot.Mainhand, ::Const.ItemSlot.Offhand]));
		_properties.Stamina -= penalty * 0.2;
	}
});
