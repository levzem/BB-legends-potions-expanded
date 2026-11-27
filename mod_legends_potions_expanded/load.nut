::include("mod_legends_potions_expanded/potions.nut");

local files = ::IO.enumerateFiles("mod_legends_potions_expanded/hooks");
files.sort();
foreach (file in files)
{
	::include(file);
}
