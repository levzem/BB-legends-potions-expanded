this.legends_potions_expanded_bear_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.bear },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legends_potions_expanded_bear_potion";
		this.m.Name = "Mauler's Brew";
		this.m.Description = "Your close blows carry the disorienting force of a bear's paw.";
		this.m.Icon = "skills/legends_potions_expanded_bear_potion.png";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "Adjacent melee hits dealing HP damage have a 25% chance to inflict Baffled for 1 turn.";
	}

	function onTargetHit(_skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor)
	{
		if (_skill == null || !_skill.isAttack() || _skill.isRanged() || _damageInflictedHitpoints <= 0)
		{
			return;
		}
		if (_targetEntity == null || !_targetEntity.isAlive() || _targetEntity.getHitpoints() <= 0)
		{
			return;
		}
		if (this.getContainer().getActor().getTile().getDistanceTo(_targetEntity.getTile()) != 1)
		{
			return;
		}
		if (_targetEntity.getCurrentProperties().IsImmuneToDaze || ::Math.rand(1, 100) > 25)
		{
			return;
		}
		local old = ::Legends.Effects.get(_targetEntity, ::Legends.Effect.LegendBaffled);
		local duration = 1;
		if (old != null)
		{
			duration = ::Math.max(1, old.m.TurnsLeft);
		}
		local effect = ::Legends.Effects.grant(_targetEntity, ::Legends.Effect.LegendBaffled);
		if (effect != null && !effect.isGarbage())
		{
			effect.m.TurnsLeft = duration;
		}
	}
});
