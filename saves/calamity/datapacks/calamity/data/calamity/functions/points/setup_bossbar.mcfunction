# Called from: calamity:game_state/start_match

#>--------------------------------------------------------------------------------------------------
#> Purpose: Creates and makes the iron ore boss bar visible to all players. It polls the current
#>--------------------------------------------------------------------------------------------------

# Create Mines boss bar
bossbar remove calamity:iron_ore
bossbar add calamity:iron_ore {"translate":"%s %s  %s %s","with":[{"translate":"3","font":"calamity:icons"},{"text":"0:00"},{"translate":"i","font":"calamity:icons","color":"white"},{"score":{"name": "OreLeft","objective": "gameVariable"}}]}
    # Counting iron ore is done per arena, so let's call the arena handler and ask for an ore count
    scoreboard players set #arenaAction gameVariable 3
    function calamity:arena/handler
    # Take the results and apply them to the boss bar
    execute store result bossbar calamity:iron_ore max run scoreboard players get OreLeft gameVariable
    bossbar set calamity:iron_ore style notched_10
    bossbar set calamity:iron_ore visible true
    bossbar set calamity:iron_ore players @a
    bossbar set calamity:iron_ore color purple
    # There's a quick animation of the bar filling up if you leave the bar empty when you make
    #   visible to players empty, then fill it up--even in the same tick. If the bar is already full
    #   before you make it visible to players, it will appear instantly full. (Notice how I am
    #   storing the ore count in max above and then in value below, after the bar is visible.)
    execute store result bossbar calamity:iron_ore value run scoreboard players get OreLeft gameVariable
    scoreboard players operation ░░░░░ displayPoints = OreLeft gameVariable