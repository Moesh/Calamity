# Called from: calamity:game_state/start_match

#---------------------------------------------------------------------------------------------------
# Purpose: Creates and makes the iron ore boss bar visible to all players. It polls the current
#---------------------------------------------------------------------------------------------------

# Create Mines boss bar
bossbar remove calamity:iron_ore
bossbar add calamity:iron_ore {"translate":"%s %s","with":[{"translate":"i","font":"calamity:icons","color":"white"},{"score":{"name": "OreLeft","objective": "gameVariable"}}]}
    function calamity:load/count_iron_ore
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
    scoreboard players operation Goal displayPoints = OreLeft gameVariable