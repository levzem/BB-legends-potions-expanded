this.legends_potions_expanded_potion_item <- this.inherit("scripts/items/misc/anatomist/anatomist_potion_item", {
	m = { Potion = null },

	function create()
	{
		this.anatomist_potion_item.create();
		local potion = this.m.Potion;
		this.m.ID = "misc.legends_potions_expanded_" + potion.Key + "_potion";
		this.m.Name = potion.Name;
		this.m.Description = potion.Description;
		this.m.Icon = "consumables/legends_potions_expanded_" + potion.Key + "_potion.png";
		this.m.IconLarge = "";
		this.m.Value = 0;
	}

	function getTooltip()
	{
		local result = this.anatomist_potion_item.getTooltip();
		result.push({ id = 11, type = "text", icon = "ui/icons/special.png", text = this.m.Potion.Tooltip });
		result.push({
			id = 65, type = "text",
			text = "Right-click or drag onto the currently selected character in order to drink. This item will be consumed in the process."
		});
		result.push({
			id = 65, type = "hint", icon = "ui/tooltips/warning.png",
			text = "Mutates the body, causing sickness"
		});
		return result;
	}

	function onUse(_actor, _item = null)
	{
		_actor.getSkills().add(this.new(this.m.Potion.EffectScript));
		return this.anatomist_potion_item.onUse(_actor, _item);
	}
});
