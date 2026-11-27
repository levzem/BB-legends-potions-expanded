this.legends_potions_expanded_fault_finder_potion_effect <- this.inherit("scripts/skills/effects/anatomist_potion_effect", {
	m = { Potion = ::LegendsPotionsExpanded.Potions.ByKey.fault_finder, LastRound = -1 },

	function create()
	{
		this.anatomist_potion_effect.create();
		this.m.ID = "effects.legends_potions_expanded_fault_finder_potion";
		this.m.Name = "Reclaimer's Ichor";
		this.m.Description = "Dead flesh breaks down beneath your feet, returning a little of its stolen vitality.";
		this.m.Icon = "skills/legends_potions_expanded_fault_finder_potion.png";
	}

	function getActorHoverTooltip(_activeEntity, _stacks = 1)
	{
		return "At the start of your turn, consume a consumable corpse on your tile to recover 5 HP and 5 Fatigue.";
	}

	function onCombatStarted()
	{
		this.m.LastRound = -1;
	}
	function onCombatFinished()
	{
		this.m.LastRound = -1;
	}
	function onTurnStart()
	{
		local actor = this.getContainer().getActor();
		if (!actor.isPlacedOnMap() || this.m.LastRound == ::Time.getRound())
		{
			return;
		}
		this.m.LastRound = ::Time.getRound();
		local tile = actor.getTile();
		if (!tile.IsCorpseSpawned || !tile.Properties.has("Corpse") || !tile.Properties.get("Corpse").IsConsumable)
		{
			return;
		}
		::Tactical.Entities.removeCorpse(tile);
		tile.clear(::Const.Tactical.DetailFlag.Corpse);
		tile.Properties.remove("Corpse");
		tile.Properties.remove("IsSpawningFlies");
		actor.setHitpoints(::Math.min(actor.getHitpointsMax(), actor.getHitpoints() + 5));
		actor.setFatigue(::Math.max(0, actor.getFatigue() - 5));
	}
});
