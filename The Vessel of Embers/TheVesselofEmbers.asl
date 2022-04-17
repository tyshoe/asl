//refined by tysh

state("UnrealSpringJam2020-Win64-Shipping")
{
    byte5    Towers : 0x3560418, 0x170, 0x178, 0x0;
    string32 Map    : 0x3560418, 0x410, 0x16;
}

startup
{
    for (int i = 0; i < 4; i++)
        settings.Add("tower" + i, true, "Split on Tower " + (i + 1));
}

update
{
    // if map is null, don't update its value
    if (string.IsNullOrEmpty(current.Map))
        current.Map = old.Map;
}

start
{
    return old.Map == "MainMenu" && current.Map == "Intro";
}

split
{
    // end split
    if (old.Map == "Game" && current.Map == "Epilogue")
        return true;

    if (old.Towers == null || current.Towers == null) return;

    // tower splits
    for (int i = 0; i < 4; i++)
    {
        if (old.Towers[i] == 0 && current.Towers[i] == 1)
            return settings["tower" + i];
    }
}

reset
{
    return old.Map != "MainMenu" && current.Map == "MainMenu";
}
