# Called from: #moesh:load

#---------------------------------------------------------------------------------------------------
# Purpose: Moesh wants to test stuff. This file doesn't ever ship.
#---------------------------------------------------------------------------------------------------
team join blue @a
tellraw @a {"translate":"Moesh join the %s team.","color":"green","with":[{"translate":"Blue","color":"blue"}]}
scoreboard objectives setdisplay sidebar PointTimer