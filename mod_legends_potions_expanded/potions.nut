::LegendsPotionsExpanded.Potions <- {
	Definitions = [
		// Orcs
		{
			Key = "orc_behemoth",
			Name = "Behemoth's Fury",
			Description = "A behemoth's glands lend their brutal urgency to the drinker's blood. Summoning a burst of speed becomes far less exhausting.",
			Tooltip = "Adrenaline costs [color=%positive%]60%[/color] less Fatigue.",
			EffectScript = "scripts/skills/effects/legend_orc_behemoth_potion_effect",
			PotionFlag = "OrcBehemoth",
			EnemyTypes = [::Const.EntityType.LegendOrcBehemoth],
			IsLegendary = false,
			ResearchBook = "greenskins",
			CreatureName = "Orc Behemoth"
		},
		{
			Key = "orc_elite",
			Name = "Ironback Tonic",
			Description = "Dense orc sinew, reduced to a metallic syrup, strengthens the muscles that bear armor and weapons.",
			Tooltip = "Reduce Fatigue and Initiative penalties from equipped headgear, body armor and held items by [color=%positive%]20%[/color]",
			EffectScript = "scripts/skills/effects/legend_orc_elite_potion_effect",
			PotionFlag = "OrcElite",
			EnemyTypes = [::Const.EntityType.LegendOrcElite],
			IsLegendary = false,
			ResearchBook = "greenskins",
			CreatureName = "Orc Elite"
		},
		{
			Key = "orc_mad_berserker",
			Name = "Sweetness of Pain",
			Description = "You embrace the suck. Pain no longer brings fear.",
			Tooltip = "HP loss does not trigger morale checks.",
			EffectScript = "scripts/skills/effects/legends_potions_expanded_orc_mad_berserker_potion_effect",
			PotionFlag = "PotionsExpandedOrcMadBerserker",
			EnemyTypes = [::Const.EntityType.LegendOrcMadBerserker],
			IsLegendary = false,
			ResearchBook = "greenskins",
			CreatureName = "Orc Mad Berserker"
		},
		{
			Key = "orc_tyrant",
			Name = "Voice of Dominion",
			Description = "Your voice carries the unquestioning authority of a tyrant.",
			Tooltip = "Rally the Troops gains +15 to its bonus, costs 1 less AP and 40% less Fatigue.",
			EffectScript = "scripts/skills/effects/legends_potions_expanded_orc_tyrant_potion_effect",
			PotionFlag = "PotionsExpandedOrcTyrant",
			EnemyTypes = [::Const.EntityType.LegendOrcTyrant],
			IsLegendary = false,
			ResearchBook = "greenskins",
			CreatureName = "Orc Tyrant"
		},

		// Goblins
		{
			Key = "goblin_elite",
			Name = "Spiteful Serum",
			Description = "The sight of an enemy's wounds lends fresh energy to your spite.",
			Tooltip = "The first HP-damaging hit against an injured enemy each turn restores 5 Fatigue.",
			EffectScript = "scripts/skills/effects/legends_potions_expanded_goblin_elite_potion_effect",
			PotionFlag = "PotionsExpandedGoblinElite",
			EnemyTypes = [::Const.EntityType.LegendGoblinHarrier, ::Const.EntityType.LegendGoblinFiend, ::Const.EntityType.LegendGoblinTribeDefender],
			IsLegendary = false,
			ResearchBook = "greenskins",
			CreatureName = "Goblin Harrier, Fiend and Defender"
		},
		{
			Key = "goblin_rider",
			Name = "Running Fang Draught",
			Description = "The scent of fear brings out the predator in you.",
			Tooltip = "Deal +7.5% melee damage per negative morale level of the target.",
			EffectScript = "scripts/skills/effects/legends_potions_expanded_goblin_rider_potion_effect",
			PotionFlag = "PotionsExpandedGoblinRider",
			EnemyTypes = [::Const.EntityType.LegendGoblinDirewolfRider, ::Const.EntityType.LegendGoblinWhiteDirewolfRider],
			IsLegendary = false,
			ResearchBook = "greenskins",
			CreatureName = "Direwolf Riders"
		},
		{
			Key = "goblin_witchdoctor",
			Name = "Dr. Snogg's Jungle Juice",
			Description = "Guaranteed to repel all jungle insects, or your money back.",
			Tooltip = "Immune to Insect Swarm.",
			EffectScript = "scripts/skills/effects/legends_potions_expanded_goblin_witchdoctor_potion_effect",
			PotionFlag = "PotionsExpandedGoblinWitchdoctor",
			EnemyTypes = [::Const.EntityType.LegendGoblinWitchDoctor],
			IsLegendary = false,
			ResearchBook = "greenskins",
			CreatureName = "Goblin Witchdoctor"
		},

		// Ancient Undead
		{
			Key = "ancient_gladiator",
			Name = "Retiarius' Draught",
			Description = "Forgotten arena instincts guide the cast of a net.",
			Tooltip = "Throwing nets costs 1 less AP and 50% less Fatigue; minimum 1 AP.",
			EffectScript = "scripts/skills/effects/legends_potions_expanded_ancient_gladiator_potion_effect",
			PotionFlag = "PotionsExpandedAncientGladiator",
			EnemyTypes = [::Const.EntityType.SkeletonGladiator],
			IsLegendary = false,
			ResearchBook = "undead",
			CreatureName = "Ancient Gladiator"
		},
		{
			Key = "conqueror",
			Name = "Conqueror's Draught",
			Description = "Minerals distilled from an ancient conqueror's bones seal torn blood vessels before a wound can bleed.",
			Tooltip = "Immune to bleeding",
			EffectScript = "scripts/skills/effects/legend_conqueror_potion_effect",
			PotionFlag = "Conqueror",
			EnemyTypes = [::Const.EntityType.SkeletonBoss],
			IsLegendary = true,
			ResearchBook = "legendary",
			CreatureName = "Conqueror"
		},
		{
			Key = "mummy_infantry",
			Name = "Mummy's Curse",
			Description = "Those who strike you feel the weight of an ancient curse settle into their limbs.",
			Tooltip = "Every successful attack hit against you costs 5 additional Fatigue for the attacker.",
			EffectScript = "scripts/skills/effects/legends_potions_expanded_mummy_infantry_potion_effect",
			PotionFlag = "PotionsExpandedMummyInfantry",
			EnemyTypes = [::Const.EntityType.LegendMummyLight, ::Const.EntityType.LegendMummyMedium],
			IsLegendary = false,
			ResearchBook = "undead",
			CreatureName = "Embalmed Slave and Soldier"
		},
		{
			Key = "mummy_noble",
			Name = "Sepulchral Reach",
			Description = "The measured reach of a buried noble turns a distant blow into a stumbling retreat.",
			Tooltip = "Melee hits at two-tile range have a 20% chance to inflict Staggered for 1 target turn, respecting Stagger immunity.",
			EffectScript = "scripts/skills/effects/legends_potions_expanded_mummy_noble_potion_effect",
			PotionFlag = "PotionsExpandedMummyNoble",
			EnemyTypes = [::Const.EntityType.LegendMummyHeavy],
			IsLegendary = false,
			ResearchBook = "undead",
			CreatureName = "Embalmed Noble"
		},
		{
			Key = "mummy_priest",
			Name = "Last Rites Tincture",
			Description = "An ancient funerary instinct gives your killing blows a terrible finality.",
			Tooltip = "Kills produce a valid fatality whenever the attack and target support it.",
			EffectScript = "scripts/skills/effects/legends_potions_expanded_mummy_priest_potion_effect",
			PotionFlag = "PotionsExpandedMummyPriest",
			EnemyTypes = [::Const.EntityType.LegendMummyPriest],
			IsLegendary = false,
			ResearchBook = "undead",
			CreatureName = "Embalmed Priest"
		},
		{
			Key = "mummy_queen",
			Name = "Draught of the Open Tomb",
			Description = "Each telling strike opens a fleeting path through the press of battle.",
			Tooltip = "Once per turn after a successful melee hit, your next one-tile movement ignores enemy zones of control.",
			EffectScript = "scripts/skills/effects/legends_potions_expanded_mummy_queen_potion_effect",
			PotionFlag = "PotionsExpandedMummyQueen",
			EnemyTypes = [::Const.EntityType.LegendMummyQueen],
			IsLegendary = false,
			ResearchBook = "undead",
			CreatureName = "Embalmed Queen"
		},

		// Undead
		{
			Key = "fallen_betrayer",
			Name = "Betrayer's Bile",
			Description = "A bitter draught drawn from a heart that would not stay dead. Each blow carries a little of its crushing burden.",
			Tooltip = "Successful hits inflict [color=%positive%]50%[/color] more Fatigue",
			EffectScript = "scripts/skills/effects/legend_fallen_betrayer_potion_effect",
			PotionFlag = "FallenBetrayer",
			EnemyTypes = [::Const.EntityType.ZombieBetrayer],
			IsLegendary = false,
			ResearchBook = "undead",
			CreatureName = "Fallen Betrayer"
		},
		{
			Key = "treasure_hunter",
			Name = "Ichor of Preservation",
			Description = "The preserving ichor of an ancient tomb makes your body a little harder to destroy.",
			Tooltip = "Take 5% less damage.",
			EffectScript = "scripts/skills/effects/legends_potions_expanded_treasure_hunter_potion_effect",
			PotionFlag = "PotionsExpandedTreasureHunter",
			EnemyTypes = [::Const.EntityType.ZombieTreasureHunter],
			IsLegendary = false,
			ResearchBook = "undead",
			CreatureName = "Lost Treasure Hunter"
		},
		{
			Key = "banshee",
			Name = "Widow's Lament",
			Description = "Every wound you deliver carries an echo of the mourning dead.",
			Tooltip = "Every attack hit dealing HP damage causes a morale check with an additional -5 modifier. One check per hit, including hits below the normal HP-damage threshold.",
			EffectScript = "scripts/skills/effects/legends_potions_expanded_banshee_potion_effect",
			PotionFlag = "PotionsExpandedBanshee",
			EnemyTypes = [::Const.EntityType.LegendBanshee],
			IsLegendary = false,
			ResearchBook = "undead",
			CreatureName = "Winselmutter"
		},
		{
			Key = "wicht",
			Name = "Graveward Tincture",
			Description = "A trace of the grave clings to your flesh, softening blows that pass through armor.",
			Tooltip = "Take 20% less HP damage from attacks that completely ignore armor.",
			EffectScript = "scripts/skills/effects/legends_potions_expanded_wicht_potion_effect",
			PotionFlag = "PotionsExpandedWicht",
			EnemyTypes = [::Const.EntityType.LegendWicht],
			IsLegendary = false,
			ResearchBook = "undead",
			CreatureName = "Wicht"
		},
		{
			Key = "necrosavant_lord",
			Name = "Lord's Last Escape",
			Description = "The essence of an elder blood-drinker makes a wounded body slip through gaps no watchful enemy should permit.",
			Tooltip = "Ignore enemy Zones of Control while below [color=%negative%]50%[/color] Hitpoints",
			EffectScript = "scripts/skills/effects/legend_necrosavant_lord_potion_effect",
			PotionFlag = "NecrosavantLore",
			EnemyTypes = [::Const.EntityType.LegendVampireLord],
			IsLegendary = false,
			ResearchBook = "undead",
			CreatureName = "Necrosavant Lord"
		},
		{
			Key = "demon_hound",
			Name = "Hellhound's Breath",
			Description = "This acrid distillate makes every breath burn. When the burning subsides, the lungs recover their strength with unnatural speed.",
			Tooltip = "[color=%positive%]+3[/color] Fatigue Recovery per turn",
			EffectScript = "scripts/skills/effects/legend_demon_hound_potion_effect",
			PotionFlag = "DemonHound",
			EnemyTypes = [::Const.EntityType.LegendDemonHound],
			IsLegendary = false,
			ResearchBook = "beasts",
			CreatureName = "Demon Hound"
		},

		// Cultists
		{
			Key = "fault_finder",
			Name = "Reclaimer's Ichor",
			Description = "Dead flesh breaks down beneath your feet, returning a little of its stolen vitality.",
			Tooltip = "At the start of your turn, consume a consumable corpse on your tile to recover 5 HP and 5 Fatigue.",
			EffectScript = "scripts/skills/effects/legends_potions_expanded_fault_finder_potion_effect",
			PotionFlag = "PotionsExpandedFaultFinder",
			EnemyTypes = [::Const.EntityType.FaultFinder],
			IsLegendary = false,
			ResearchBook = "undead",
			CreatureName = "Fault Finder"
		},

		// Animals
		{
			Key = "donkey",
			Name = "Packmule's Reserve",
			Description = "Your back and shoulders bear their burdens with a mule's stubborn ease.",
			Tooltip = "Bagged items impose no maximum-Fatigue penalty, including two-handed weapons.",
			EffectScript = "scripts/skills/effects/legends_potions_expanded_donkey_potion_effect",
			PotionFlag = "PotionsExpandedDonkey",
			EnemyTypes = [::Const.EntityType.CaravanDonkey],
			IsLegendary = false,
			ResearchBook = "beasts",
			CreatureName = "Donkey"
		},
		{
			Key = "horse",
			Name = "Courser's Cordial",
			Description = "A courser's tireless stride takes hold in the muscles of your legs.",
			Tooltip = "Movement costs 25% less Fatigue.",
			EffectScript = "scripts/skills/effects/legends_potions_expanded_horse_potion_effect",
			PotionFlag = "PotionsExpandedHorse",
			EnemyTypes = [::Const.EntityType.LegendHorse],
			IsLegendary = false,
			ResearchBook = "beasts",
			CreatureName = "Horse"
		},
		{
			Key = "bear",
			Name = "Mauler's Brew",
			Description = "Your close blows carry the disorienting force of a bear's paw.",
			Tooltip = "Adjacent melee hits dealing HP damage have a 25% chance to inflict Baffled for 1 turn.",
			EffectScript = "scripts/skills/effects/legends_potions_expanded_bear_potion_effect",
			PotionFlag = "PotionsExpandedBear",
			EnemyTypes = [::Const.EntityType.LegendBear],
			IsLegendary = false,
			ResearchBook = "beasts",
			CreatureName = "Bear"
		},
		{
			Key = "wardog",
			Name = "Hound's Persistence",
			Description = "The urge to pursue anything that turns its back is now quite difficult to resist.",
			Tooltip = "+10 Melee Skill on attacks of opportunity.",
			EffectScript = "scripts/skills/effects/legends_potions_expanded_wardog_potion_effect",
			PotionFlag = "PotionsExpandedWardog",
			EnemyTypes = [::Const.EntityType.Wardog, ::Const.EntityType.Warhound],
			IsLegendary = false,
			ResearchBook = "beasts",
			CreatureName = "Wardogs and Warhounds"
		},
		{
			Key = "sighthound",
			Name = "Harecatcher's Draught",
			Description = "Your eyes track the slightest hesitation in your quarry's movements.",
			Tooltip = "+10% melee damage against enemies with lower current Initiative.",
			EffectScript = "scripts/skills/effects/legends_potions_expanded_sighthound_potion_effect",
			PotionFlag = "PotionsExpandedSighthound",
			EnemyTypes = [::Const.EntityType.LegendSighthound],
			IsLegendary = false,
			ResearchBook = "beasts",
			CreatureName = "Sighthounds"
		},

		// Basilisks
		{
			Key = "basilisk_drone",
			Name = "Ironbeak Tincture",
			Description = "An instinct for the killing blow guides your weapons toward exposed heads.",
			Tooltip = "+15% damage on head hits, with melee or ranged attacks.",
			EffectScript = "scripts/skills/effects/legends_potions_expanded_basilisk_drone_potion_effect",
			PotionFlag = "PotionsExpandedBasiliskDrone",
			EnemyTypes = [::Const.EntityType.LegendBasiliskDrone],
			IsLegendary = false,
			ResearchBook = "beasts",
			CreatureName = "Basilisk Drone"
		},
		{
			Key = "basilisk_sentry",
			Name = "Unblinking Eye",
			Description = "Your unblinking eyes are used to the horrors that would freeze another person in terror.",
			Tooltip = "Immune to Horrified.",
			EffectScript = "scripts/skills/effects/legends_potions_expanded_basilisk_sentry_potion_effect",
			PotionFlag = "PotionsExpandedBasiliskSentry",
			EnemyTypes = [::Const.EntityType.LegendBasiliskSentry],
			IsLegendary = false,
			ResearchBook = "beasts",
			CreatureName = "Basilisk Sentry"
		},

		// Beasts
		{
			Key = "white_direwolf",
			Name = "Winterfang Essence",
			Description = "A white direwolf's hunting focus survives in this pale liquid. A flurry of enemy attacks can no longer overwhelm the senses.",
			Tooltip = "Immune to Overwhelm",
			EffectScript = "scripts/skills/effects/legend_white_direwolf_potion_effect",
			PotionFlag = "WhiteDirewolf",
			EnemyTypes = [::Const.EntityType.LegendWhiteDirewolf],
			IsLegendary = false,
			ResearchBook = "beasts",
			CreatureName = "White Direwolf"
		},
		{
			Key = "rock_unhold",
			Name = "Mountainhide Elixir",
			Description = "Stone-heavy marrow hardens the flesh beneath armor, lending every plate and padded layer greater protection.",
			Tooltip = "[color=%positive%]+15%[/color] total Head and Body Armor",
			EffectScript = "scripts/skills/effects/legend_rock_unhold_potion_effect",
			PotionFlag = "RockUnhold",
			EnemyTypes = [::Const.EntityType.LegendRockUnhold],
			IsLegendary = false,
			ResearchBook = "beasts",
			CreatureName = "Rock Unhold"
		},
		{
			Key = "redback",
			Name = "Redback Venom Serum",
			Description = "New glands seep a trace of redback venom onto every weapon the drinker handles. A wound delivers enough to unmake an enemy's coordination.",
			Tooltip = "Attacks dealing at least " + ::Const.Combat.PoisonEffectMinDamage + " Hitpoints damage apply Redback Spider Poison to susceptible targets. Further hits refresh its duration without adding another stack.",
			EffectScript = "scripts/skills/effects/legend_redback_potion_effect",
			PotionFlag = "Redback",
			EnemyTypes = [::Const.EntityType.LegendRedbackSpider],
			IsLegendary = false,
			ResearchBook = "beasts",
			CreatureName = "Redback Spider"
		},
		{
			Key = "stollwurm",
			Name = "Wyrmspine Draught",
			Description = "This heavy distillate reinforces the nerves with the stubborn resilience of a stollwurm. Blows can hurt, but cannot stun.",
			Tooltip = "Immune to Stun",
			EffectScript = "scripts/skills/effects/legend_stollwurm_potion_effect",
			PotionFlag = "Stollwurm",
			EnemyTypes = [::Const.EntityType.LegendStollwurm],
			IsLegendary = false,
			ResearchBook = "beasts",
			CreatureName = "Stollwurm"
		},

		// Occult
		{
			Key = "demon_alp",
			Name = "Draught of the Watchful Eye",
			Description = "Distilled nightmare opens a sense that watches every approach at once. Even a closing circle of enemies offers no distraction.",
			Tooltip = "Enemies gain no surround bonus against this character",
			EffectScript = "scripts/skills/effects/legend_demon_alp_potion_effect",
			PotionFlag = "DemonAlp",
			EnemyTypes = [::Const.EntityType.LegendDemonAlp],
			IsLegendary = false,
			ResearchBook = "beasts",
			CreatureName = "Demon Alp"
		},
		{
			Key = "hexe_leader",
			Name = "Matriarch's Consolation",
			Description = "A whisper lingers in this sweet-smelling liquor. Whenever courage falters, it calls the mind back from the brink.",
			Tooltip = "Re-roll each failed morale check once",
			EffectScript = "scripts/skills/effects/legend_hexe_leader_potion_effect",
			PotionFlag = "HexeLeader",
			EnemyTypes = [::Const.EntityType.LegendHexeLeader],
			IsLegendary = false,
			ResearchBook = "beasts",
			CreatureName = "Hexe Leader"
		},
		{
			Key = "greenwood_schrat",
			Name = "Heartwood Infusion",
			Description = "Thick green sap teaches living flesh the patience of wood. New wounds still need healing, but their pain no longer hinders the body in battle.",
			Tooltip = "Fresh injuries have no effect during the battle in which they are received",
			EffectScript = "scripts/skills/effects/legend_greenwood_schrat_potion_effect",
			PotionFlag = "GreenwoodSchrat",
			EnemyTypes = [::Const.EntityType.LegendGreenwoodSchrat],
			IsLegendary = false,
			ResearchBook = "beasts",
			CreatureName = "Greenwood Schrat"
		},
		{
			Key = "skin_ghoul",
			Name = "Marrowseeker Tincture",
			Description = "A skin ghoul's ravenous instincts settle into the hands, guiding every strike toward the body's most fragile places.",
			Tooltip = "[color=%positive%]40%[/color] lower damage threshold to inflict injuries with melee and ranged attacks",
			EffectScript = "scripts/skills/effects/legend_skin_ghoul_potion_effect",
			PotionFlag = "Skinghoul",
			EnemyTypes = [::Const.EntityType.LegendSkinGhoul],
			IsLegendary = false,
			ResearchBook = "beasts",
			CreatureName = "Skin Ghoul"
		},
	],
	ByKey = {},

	function createItem(_potion)
	{
		return ::new("scripts/items/misc/anatomist/legends_potions_expanded_" + _potion.Key + "_potion_item");
	}

	function isAcquired(_potion)
	{
		return ::World.Statistics.getFlags().get("is" + _potion.PotionFlag + "PotionAcquired");
	}

	function isDiscovered(_potion)
	{
		return ::World.Statistics.getFlags().get("is" + _potion.PotionFlag + "PotionDiscovered");
	}

	function shouldDrop(_potion)
	{
		return ::World.Statistics.getFlags().get("shouldDrop" + _potion.PotionFlag + "Potion");
	}

	function acquire(_potion)
	{
		return ::World.Statistics.getFlags().set("is" + _potion.PotionFlag + "PotionAcquired", true);
	}

	function release(_potion)
	{
		return ::World.Statistics.getFlags().set("is" + _potion.PotionFlag + "PotionAcquired", false);
	}

	function discover(_potion)
	{
		return ::World.Statistics.getFlags().set("is" + _potion.PotionFlag + "PotionDiscovered", true);
	}

	function drop(_potion)
	{
		return ::World.Statistics.getFlags().set("shouldDrop" + _potion.PotionFlag + "Potion", true);
	}

	function clearDrop(_potion)
	{
		return ::World.Statistics.getFlags().set("shouldDrop" + _potion.PotionFlag + "Potion", false);
	}

	function onActorKilled(_actor, _killer, _combatID)
	{
		if (::Tactical.State.getStrategicProperties().IsArenaMode)
		{
			return;
		}
		if (_actor.getFaction() == ::Const.Faction.Player || _actor.getFaction() == ::Const.Faction.PlayerAnimals)
		{
			return;
		}
		foreach (potion in this.Definitions)
		{
			if (potion.EnemyTypes.find(_actor.getType()) == null)
			{
				continue;
			}
			if (!potion.IsLegendary && _killer != null && _killer.getFaction() != ::Const.Faction.Player && _killer.getFaction() != ::Const.Faction.PlayerAnimals)
			{
				return;
			}
			this.drop(potion);
			return;
		}
	}

	function onBattleWon(_combatLoot)
	{
		if (::Tactical.State.getStrategicProperties().IsArenaMode)
		{
			return;
		}
		foreach (potion in this.Definitions)
		{
			if (!this.shouldDrop(potion) || this.isAcquired(potion))
			{
				continue;
			}
			// Don't mark as acquired if inventory is full
			local item = this.createItem(potion);
			if (_combatLoot.add(item) == null)
			{
				continue;
			}
			this.acquire(potion);
			this.discover(potion);
		}
	}

	function clearPendingDrops()
	{
		foreach (potion in this.Definitions)
		{
			this.clearDrop(potion);
		}
	}
};

foreach (potion in ::LegendsPotionsExpanded.Potions.Definitions)
{
	::LegendsPotionsExpanded.Potions.ByKey[potion.Key] <- potion;
}
