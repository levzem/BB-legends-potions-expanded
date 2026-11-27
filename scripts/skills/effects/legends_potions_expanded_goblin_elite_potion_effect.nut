this.legends_potions_expanded_goblin_elite_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.goblin_elite, Triggered = false },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legends_potions_expanded_goblin_elite_potion";
		this.m.Name = "Spiteful Serum";
		this.m.Description = "The sight of an enemy's wounds lends fresh energy to your spite.";
		this.m.Icon = "skills/legends_potions_expanded_goblin_elite_potion.png";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "The first HP-damaging hit against an injured enemy each turn restores 5 Fatigue.";
	}

	function onTurnStart()
	{
		this.m.Triggered = false;
	}
	function onCombatStarted()
	{
		this.m.Triggered = false;
	}
	function onCombatFinished()
	{
		this.m.Triggered = false;
	}
	function onTargetHit(_skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor)
	{
		if (this.m.Triggered || _skill == null || !_skill.isAttack() || _damageInflictedHitpoints <= 0 || _targetEntity == null)
		{
			return;
		}
		if (_targetEntity.getSkills().getAllSkillsOfType(::Const.SkillType.Injury).len() == 0)
		{
			return;
		}
		this.m.Triggered = true;
		local actor = this.getContainer().getActor();
		actor.setFatigue(::Math.max(0, actor.getFatigue() - 5));
	}
});
