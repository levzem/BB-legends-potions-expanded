this.legends_potions_expanded_mummy_queen_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.mummy_queen, Ready = false, Triggered = false, ProtectStep = false },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legends_potions_expanded_mummy_queen_potion";
		this.m.Name = "Draught of the Open Tomb";
		this.m.Description = "Each telling strike opens a fleeting path through the press of battle.";
		this.m.Icon = "skills/legends_potions_expanded_mummy_queen_potion.png";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "Once per turn after a successful melee hit, your next one-tile movement ignores enemy zones of control.";
	}

	function onTurnStart()
	{
		this.m.Ready = false;
		this.m.Triggered = false;
		this.m.ProtectStep = false;
	}
	function onTurnEnd()
	{
		this.m.Ready = false;
		this.m.ProtectStep = false;
	}
	function onCombatStarted()
	{
		this.onTurnStart();
	}
	function onCombatFinished()
	{
		this.onTurnStart();
	}
	function onUpdate(_properties)
	{
		if (this.m.Ready || this.m.ProtectStep)
		{
			_properties.IsImmuneToZoneOfControl = true;
		}
	}
	function onTargetHit(_skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor)
	{
		if (this.m.Triggered || _skill == null || !_skill.isAttack() || _skill.isRanged() || _skill.m.IsOffensiveToolSkill ||
			!::Tactical.TurnSequenceBar.isActiveEntity(this.getContainer().getActor()))
		{
			return;
		}
		this.m.Triggered = true;
		this.m.Ready = true;
		this.getContainer().update();
	}
});
