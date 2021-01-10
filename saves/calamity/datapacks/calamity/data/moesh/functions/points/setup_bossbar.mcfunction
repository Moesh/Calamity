# Called from: moesh:game_state/start_match

#---------------------------------------------------------------------------------------------------
# Purpose: Creates and makes the iron ore boss bar visible to all players. It polls the current
#---------------------------------------------------------------------------------------------------

# Create Mines boss bar
bossbar add moesh:iron_ore {"translate":"Ore Left (%s)","with":[{"score":{"name": "OreLeft","objective": "gameVariable"}}]}
    execute store result bossbar moesh:iron_ore max run scoreboard players get Phase1 mapRules
    bossbar set moesh:iron_ore style notched_10
    bossbar set moesh:iron_ore visible true
    bossbar set moesh:iron_ore players @a
    # There's a quick animation of the bar filling up if you leave the bar empty when you make
    #   visible to players empty, then fill it up--even in the same tick. If the bar is already full
    #   before you make it visible to players, it will appear instantly full. (Notice how I am
    #   storing the ore count in max above and then in value below, after the bar is visible.)
    execute store result bossbar moesh:iron_ore value run scoreboard players get Phase1 mapRules

