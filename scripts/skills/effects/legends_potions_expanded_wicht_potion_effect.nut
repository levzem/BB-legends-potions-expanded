this.legends_potions_expanded_wicht_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.wicht },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legends_potions_expanded_wicht_potion";
		this.m.Name = "Graveward Tincture";
		this.m.Description = "A trace of the grave clings to your flesh, softening blows that pass through armor.";
		this.m.Icon = "skills/legends_potions_expanded_wicht_potion.png";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "Take 20% less HP damage from attacks that completely ignore armor.";
	}

	function onBeforeDamageReceived(_attacker, _skill, _hitInfo, _properties)
	{
		if (_skill != null && _skill.isAttack() && _hitInfo.DamageDirect >= 1.0)
		{
			_properties.DamageReceivedRegularMult *= 0.8;
		}
	}
});
