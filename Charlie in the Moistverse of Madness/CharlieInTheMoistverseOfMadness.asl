//sloppy but written by TY

state("MoistCriticalGame-Win64-Shipping")
{
    int boss_health: 0x5238F00, 0x118, 0x2D0, 0x2B0, 0x320, 0x2C0, 0x504;
    int character_count: 0x050F12F0, 0x2F0, 0x20, 0x528;
    int player_health: 0x052355A0, 0x8, 0x8, 0xFC0, 0x70, 0x524;
}

startup
{
    settings.Add("split_discord", false, "Discord");
    settings.Add("split_chad", false, "Chad");
    settings.Add("split_dog", false, "Dog");
    settings.SetToolTip("split_discord", "Check this box if you would like to split when obtaining Discord Mod Charlie");
    settings.SetToolTip("split_chad", "Check this box if you would like to split when obtaining Chad Charlie");
    settings.SetToolTip("split_dog", "Check this box if you would like to split when obtaining Dog Charlie");
}

start
{
    if(current.player_health == 100)
    {
        return true;
    }
}

split
{
    if(current.character_count == 2 && old.character_count == 1 && settings["split_discord"])
    {
        return true;
    }
    if(current.character_count == 3 && old.character_count == 2 && settings["split_chad"])
    {
        return true;
    }
    if(current.character_count == 4 && old.character_count == 3 && settings["split_dog"])
    {
        return true;
    }
    //final split
    if(current.boss_health == 0 && current.character_count != 1 && current.player_health > 0)
    {
        return true;
    }
}

reset
{
    if(current.character_count == 0)
    {
        return true;
    }
}
