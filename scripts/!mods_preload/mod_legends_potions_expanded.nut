::LegendsPotionsExpanded <- {
	ID = "mod_legends_potions_expanded",
	Name = "Legends: Potions Expanded",
	Version = "1.0.0",
	Origins = { ["scenario.anatomists"] = true },

	function isEnabled(_origin)
	{
		if ("State" in ::Tactical && ::Tactical.State != null && ::Tactical.State.isScenarioMode())
		{
			return false;
		}
		return _origin != null && (_origin.getID() in this.Origins || "modAlwaysAnatomists" in getroottable());
	}
};

::LegendsPotionsExpanded.Mod <- ::Hooks.register(::LegendsPotionsExpanded.ID, ::LegendsPotionsExpanded.Version, ::LegendsPotionsExpanded.Name);
::LegendsPotionsExpanded.Mod.require("mod_legends >= 19.4.0", "mod_modern_hooks >= 0.7.0", "dlc_paladins");
::LegendsPotionsExpanded.Mod.queue(">mod_legends", function ()
{
	::include("mod_legends_potions_expanded/load.nut");
	::logInfo(::LegendsPotionsExpanded.Name + " " + ::LegendsPotionsExpanded.Version + " loaded.");
});
