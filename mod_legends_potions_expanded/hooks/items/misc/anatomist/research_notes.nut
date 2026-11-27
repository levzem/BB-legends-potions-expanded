local hookBook = function (_book)
{
	::LegendsPotionsExpanded.Mod.hook("scripts/items/misc/anatomist/research_notes_" + _book + "_item", function (q)
	{
		q.getTooltip = @(__original) function ()
		{
			local ret = __original();
			if (!::LegendsPotionsExpanded.isEnabled(::World.Assets.getOrigin()))
			{
				return ret;
			}
			foreach (potion in ::LegendsPotionsExpanded.Potions.Definitions)
			{
				if (potion.ResearchBook != _book)
				{
					continue;
				}
				local potionName = "???";
				if (::LegendsPotionsExpanded.Potions.isDiscovered(potion))
				{
					potionName = potion.Name;
				}
				ret.push({
					id = 200 + ret.len(), type = "text", icon = "ui/icons/papers.png",
					text = potion.CreatureName + ": " + potionName
				});
			}
			return ret;
		};
	});
};
foreach (book in ["beasts", "greenskins", "undead", "legendary"])
{
	hookBook(book);
}
