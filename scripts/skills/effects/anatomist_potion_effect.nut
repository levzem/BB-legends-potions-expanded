this.anatomist_potion_effect <- this.inherit("scripts/skills/skill", {
	m = { Potion = null },

	function create()
	{
		this.m.IconMini = "";
		this.m.Type = ::Const.SkillType.StatusEffect;
		this.m.Order = ::Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsSerialized = true;
		this.m.IsRemovedAfterBattle = false;
	}

	function getTooltip()
	{
		return [
		{ id = 1, type = "title", text = this.getName() },
		{ id = 2, type = "description", text = this.getDescription() },
		{ id = 11, type = "text", icon = "ui/icons/special.png", text = this.getActorHoverTooltip(null) },
		{ id = 12, type = "hint", icon = "ui/tooltips/warning.png", text = "Further mutations cause a longer period of sickness" }
		];
	}

	function onDeath(_fatalityType)
	{
		if (_fatalityType != ::Const.FatalityType.Unconscious)
		{
			::LegendsPotionsExpanded.Potions.release(this.m.Potion);
		}
	}

	function onDismiss()
	{
		::LegendsPotionsExpanded.Potions.release(this.m.Potion);
	}
});
