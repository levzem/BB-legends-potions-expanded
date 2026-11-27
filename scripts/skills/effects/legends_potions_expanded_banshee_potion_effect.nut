this.legends_potions_expanded_banshee_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.banshee },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legends_potions_expanded_banshee_potion";
		this.m.Name = "Widow's Lament";
		this.m.Description = "Every wound you deliver carries an echo of the mourning dead.";
		this.m.Icon = "skills/legends_potions_expanded_banshee_potion.png";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "Every attack hit dealing HP damage causes a morale check with an additional -5 modifier. One check per hit, including hits below the normal HP-damage threshold.";
	}

	function onUpdate(_properties)
	{
		_properties.ThreatOnHit += 5;
	}

	function onTargetHit(_skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor)
	{
		if (_skill == null || !_skill.isAttack() || _targetEntity == null || !_targetEntity.isAlive() || _targetEntity.getHitpoints() <= 0)
		{
			return;
		}
		// Normal damage already checks at/above the threshold; Fearsome's low-damage
		// handler is suppressed for this mutation so there is exactly one check.
		if (_damageInflictedHitpoints < 1 || _damageInflictedHitpoints >= ::Const.Morale.OnHitMinDamage)
		{
			return;
		}
		if (_targetEntity.getMoraleState() == ::Const.MoraleState.Ignore || !_targetEntity.getCurrentProperties().IsAffectedByLosingHitpoints)
		{
			return;
		}
		local difficulty = ::Const.Morale.OnHitBaseDifficulty * (1.0 - _targetEntity.getHitpoints() / _targetEntity.getHitpointsMax());
		_targetEntity.checkMorale(-1, difficulty - this.getContainer().getActor().getCurrentProperties().ThreatOnHit);
	}
});
