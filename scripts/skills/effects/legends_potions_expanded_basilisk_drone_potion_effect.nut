this.legends_potions_expanded_basilisk_drone_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.basilisk_drone },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legends_potions_expanded_basilisk_drone_potion";
		this.m.Name = "Ironbeak Tincture";
		this.m.Description = "An instinct for the killing blow guides your weapons toward exposed heads.";
		this.m.Icon = "skills/legends_potions_expanded_basilisk_drone_potion.png";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "+15% damage on head hits, with melee or ranged attacks.";
	}

	function onBeforeTargetHit(_skill, _targetEntity, _hitInfo)
	{
		if (_skill != null && _skill.isAttack() && _hitInfo.BodyPart == ::Const.BodyPart.Head)
		{
			_hitInfo.DamageRegular *= 1.15;
			_hitInfo.DamageArmor *= 1.15;
		}
	}
});
