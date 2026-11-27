this.legends_potions_expanded_mummy_noble_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.mummy_noble },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legends_potions_expanded_mummy_noble_potion";
		this.m.Name = "Sepulchral Reach";
		this.m.Description = "The measured reach of a buried noble turns a distant blow into a stumbling retreat.";
		this.m.Icon = "skills/legends_potions_expanded_mummy_noble_potion.png";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "Melee hits at two-tile range have a 20% chance to inflict Staggered for 1 target turn, respecting Stagger immunity.";
	}

	function onTargetHit(_skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor)
	{
		if (_skill == null || !_skill.isAttack() || _skill.isRanged())
		{
			return;
		}
		if (_targetEntity == null || !_targetEntity.isAlive() || _targetEntity.getHitpoints() <= 0)
		{
			return;
		}
		if (this.getContainer().getActor().getTile().getDistanceTo(_targetEntity.getTile()) != 2)
		{
			return;
		}
		if (_targetEntity.getFlags().get("CanNotBeStaggered") || ::Math.rand(1, 100) > 20)
		{
			return;
		}
		local old = ::Legends.Effects.get(_targetEntity, ::Legends.Effect.Staggered);
		local duration = 1;
		if (old != null)
		{
			duration = ::Math.max(1, old.m.TurnsLeft);
		}
		local effect = ::Legends.Effects.grant(_targetEntity, ::Legends.Effect.Staggered);
		if (effect != null && !effect.isGarbage())
		{
			effect.m.TurnsLeft = duration;
		}
	}
});
