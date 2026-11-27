::LegendsPotionsExpanded.Mod.hook("scripts/entity/tactical/actor", function (q)
{
	q.m.PotionsExpandedWalkingSteps <- [];
	q.m.PotionsExpandedQueenPath <- false;
	q.onDamageReceived = @(__original) function (_attacker, _skill, _hitInfo)
	{
		local attacker = _attacker;
		if (typeof attacker == "instance")
		{
			attacker = attacker.get();
		}
		if (this.isAlive() && this.isPlacedOnMap() && (_hitInfo.DamageRegular != 0 || _hitInfo.DamageArmor != 0)
			&& attacker != null && attacker.isAlive() && _skill != null && _skill.isAttack()
			&& this.getSkills().hasSkill("effects.legends_potions_expanded_mummy_infantry_potion"))
		{
			attacker.setFatigue(::Math.min(attacker.getFatigueMax(), attacker.getFatigue() + 5));
		}
		return __original(_attacker, _skill, _hitInfo);
	};

	q.onAttackOfOpportunity = @(__original) function (_entity, _isOnEnter)
	{
		local hound = this.getSkills().getSkillByID("effects.legends_potions_expanded_wardog_potion");
		if (hound == null)
		{
			return __original(_entity, _isOnEnter);
		}
		hound.m.InOpportunityAttack = true;
		local result = __original(_entity, _isOnEnter);
		hound.m.InOpportunityAttack = false;
		return result;
	};

	q.onMovementStart = @(__original) function (_tile, _numTiles)
	{
		this.m.PotionsExpandedWalkingSteps = [];
		this.m.PotionsExpandedQueenPath = false;
		return __original(_tile, _numTiles);
	};

	q.onMovementStep = @(__original) function (_tile, _levelDifference)
	{
		// Stop the queued path after the protected tile so later steps use normal ZoC rules.
		if (this.m.PotionsExpandedQueenPath)
		{
			return false;
		}
		local voluntary = this.m.CurrentMovementType == ::Const.Tactical.MovementType.Default && ::Tactical.TurnSequenceBar.isActiveEntity(this);
		local queen = this.getSkills().getSkillByID("effects.legends_potions_expanded_mummy_queen_potion");
		local disengage = voluntary && queen != null && queen.m.Ready;
		local result = __original(_tile, _levelDifference);
		if (!result || !voluntary)
		{
			return result;
		}
		this.m.PotionsExpandedWalkingSteps.push({ Disengage = disengage });
		if (disengage)
		{
			queen.m.Ready = false;
			queen.m.ProtectStep = true;
			this.m.PotionsExpandedQueenPath = true;
		}
		return result;
	};

	q.onMovementUndo = @(__original) function (_tile, _levelDifference)
	{
		__original(_tile, _levelDifference);
		if (this.m.PotionsExpandedWalkingSteps.len() == 0)
		{
			return;
		}
		local step = this.m.PotionsExpandedWalkingSteps.pop();
		if (step.Disengage)
		{
			local queen = this.getSkills().getSkillByID("effects.legends_potions_expanded_mummy_queen_potion");
			if (queen != null)
			{
				queen.m.Ready = true;
				queen.m.ProtectStep = false;
			}
			this.m.PotionsExpandedQueenPath = false;
			this.getSkills().update();
		}
	};

	q.onMovementFinish = @(__original) function (_tile)
	{
		__original(_tile);
		local queen = this.getSkills().getSkillByID("effects.legends_potions_expanded_mummy_queen_potion");
		if (queen != null && queen.m.ProtectStep)
		{
			queen.m.ProtectStep = false;
			this.getSkills().update();
		}
		this.m.PotionsExpandedQueenPath = false;
	};
});
