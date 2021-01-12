# Called from: moesh:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Let a player quit the game early.
#---------------------------------------------------------------------------------------------------

# Place them in spectator and advise the players
execute if entity @a[team=blue,gamemode=!spectator,scores={gg=1..}] run tellraw @a {"translate":">>> %s forfeited for Blue!","with":[{"selector":"@s"}]}
execute if entity @a[team=blue,gamemode=!spectator,scores={gg=1..}] run tellraw @a {"translate":"%s Red wins!","color":"red","with":[{"text":">>>","color":"white"}]}
execute if entity @a[team=red,gamemode=!spectator,scores={gg=1..}] run tellraw @a {"translate":">>> %s forfeited for Red!","with":[{"selector":"@s"}]}
execute if entity @a[team=red,gamemode=!spectator,scores={gg=1..}] run tellraw @a {"translate":"%s Blue wins!","color":"blue","with":[{"text":">>>","color":"white"}]}

# Reset gg trigger
scoreboard players reset @a[scores={gg=1..}] gg
function moesh:game_state/end_match


