this.legend_redback_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.redback },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legend_redback_potion";
		this.m.Name = "Venomous Secretions";
		this.m.Description = "New glands seep a trace of redback venom onto every weapon the drinker handles. A wound delivers enough to unmake an enemy's coordination.";
		this.m.Icon = "skills/legends_potions_expanded_redback_potion.png";
		this.m.Overlay = "status_effect_144";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return this.m.Potion.Tooltip;
	}

	function onTargetHit(_skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor)
	{
		if (_skill == null || !_skill.isAttack())
		{
			return;
		}
		if (_targetEntity == null || !_targetEntity.isAlive() || _targetEntity.getHitpoints() <= 0)
		{
			return;
		}
		if (_targetEntity.getCurrentProperties().IsImmuneToPoison || _damageInflictedHitpoints < ::Const.Combat.PoisonEffectMinDamage)
		{
			return;
		}
		local actor = this.getContainer().getActor();
		local poison = ::Legends.Effects.get(_targetEntity, ::Legends.Effect.LegendRedbackSpiderPoison);
		if (poison == null)
		{
			::Legends.Effects.grant(_targetEntity, ::Legends.Effect.LegendRedbackSpiderPoison, function (_effect)
			{
				_effect.setActor(actor);
			});
		}
		else
		{
			poison.setActor(actor);
			poison.resetTime();
		}
	}
});
