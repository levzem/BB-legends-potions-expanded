# Legends: Potions Expanded

Adds 35 Anatomist potions to Legends.

Works with Anatomists and campaigns using Always Anatomists.

## Installation

Requires Legends 19.4.0+, Modern Hooks 0.7.0+, and the Of Flesh and Faith DLC.

Copy `mod_legends_potions_expanded-1.0.0.zip` into the game's `data` folder.

## Potions

| Enemy | Potion | Permanent effect |
| --- | --- | --- |
| Orc Behemoth | Behemoth's Fury | Adrenaline costs 60% less Fatigue. Does not grant Adrenaline. |
| Orc Elite | Ironback Tonic | 20% lower Fatigue and Initiative penalties from equipped armor and held items. |
| Orc Mad Berserker | Sweetness of Pain | HP loss does not trigger morale checks. |
| Orc Tyrant | Voice of Dominion | Rally gains +15 to its bonus, including charm/sleep removal, and costs 1 less AP and 40% less Fatigue. Does not grant Rally. |
| Goblin Harrier, Fiend and Defender | Spiteful Serum | The first HP-damaging hit against an injured enemy each turn restores 5 Fatigue. |
| Direwolf Riders | Running Fang Draught | +7.5% melee damage per negative morale level of the target: Wavering +7.5%, Breaking +15%, Fleeing +22.5%. |
| Goblin Witchdoctor | Dr. Snogg's Jungle Juice | Immune to Insect Swarm. |
| Ancient Gladiator | Retiarius' Draught | Throwing nets costs 1 less AP and 50% less Fatigue; minimum 1 AP. |
| Conqueror | Conqueror's Draught | Immune to bleeding. |
| Embalmed Slave and Soldier | Mummy's Curse | Each attack that hits you inflicts 5 Fatigue on the attacker, including ranged and armor-only hits. |
| Embalmed Noble | Sepulchral Reach | Melee hits at two-tile range have a 20% chance to inflict Staggered for 1 turn. |
| Embalmed Priest | Last Rites Tincture | Kills cause a fatality when the attack and target allow it. |
| Embalmed Queen | Draught of the Open Tomb | After a successful melee hit on your turn, your next one-tile movement ignores enemy zones of control. Normal AP and Fatigue costs; once per turn, expires at turn end. |
| Fallen Betrayer | Betrayer's Bile | Successful hits inflict 50% more Fatigue. |
| Lost Treasure Hunter | Ichor of Preservation | Take 5% less damage. |
| Winselmutter | Widow's Lament | Every HP-damaging hit causes a morale check with an extra -5 modifier. One check per hit, including with Fearsome. |
| Wicht | Graveward Tincture | Take 20% less HP damage from attacks that completely ignore armor. |
| Necrosavant Lord | Lord's Last Escape | Ignore enemy zones of control below 50% HP. |
| Demon Hound | Hellhound's Breath | +3 Fatigue Recovery per turn. |
| Fault Finder | Reclaimer's Ichor | Consume an eligible corpse on your tile at turn start to recover 5 HP and 5 Fatigue. |
| Donkey | Packmule's Reserve | Bagged items impose no maximum-Fatigue penalty, including two-handed weapons. |
| Horse | Courser's Cordial | Movement costs 25% less Fatigue. |
| Bear | Mauler's Brew | Adjacent melee hits dealing HP damage have a 25% chance to inflict Baffled for 1 turn: -15% damage, maximum Fatigue and Initiative. |
| Wardogs and Warhounds | Hound's Persistence | +10 Melee Skill on attacks of opportunity. |
| Sighthounds | Harecatcher's Draught | +10% melee damage against enemies with lower current Initiative. |
| Basilisk Drone | Ironbeak Tincture | +15% damage on head hits. |
| Basilisk Sentry | Unblinking Eye | Immune to Horrified. |
| White Direwolf | Winterfang Essence | Immune to Overwhelm. |
| Rock Unhold | Mountainhide Elixir | +15% total Head and Body Armor. |
| Redback Spider | Redback Venom Serum | Hits dealing at least 6 HP damage apply Legends' Redback Spider Poison, including its normal trait, perk, and antidote interactions. Further hits refresh the duration without adding a stack. |
| Stollwurm | Wyrmspine Draught | Immune to Stun. |
| Demon Alp | Draught of the Watchful Eye | Immune to enemy surround bonuses. |
| Hexe Leader | Matriarch's Consolation | Re-roll each failed morale check once. |
| Greenwood Schrat | Heartwood Infusion | Ignore fresh injuries for the rest of the battle. |
| Skin Ghoul | Marrowseeker Tincture | 40% lower injury threshold. |

## Development

Run from the mod folder:

```sh
just zip          # Build the archive in dist/
just install      # Build and copy to BB_DATA_DIR (set in .env)
just test         # Set SQUIRREL_BIN and MODERN_HOOKS_ZIP as described below
```

For artwork, run `just art-setup` once. See the [art guide](art/potions/README.txt)
for layers and settings.

Origin addons can enable expanded drops and research entries after this mod loads:

```squirrel
::LegendsPotionsExpanded.Origins["scenario.your_origin"] <- true;
```
