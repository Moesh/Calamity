# Called from: #moesh:load

#---------------------------------------------------------------------------------------------------
# Purpose: Game rules control global elements of the game.
#---------------------------------------------------------------------------------------------------
# Removing and readding objectives complete wipes the set data and sets these values.
scoreboard objectives remove gameRules
scoreboard objectives add gameRules dummy
    # PointChargeTime: Point refers to resource points, a physical location on the map where players
    #   can gain  resources or status effects for their team. ChargeTime refers to how much time
    #   must pass before resources or status effects are given. ResetTime refers to how much time
    #   must passes before the the resource point can be used again. 
    # 20 redstone ticks = 1 second
    # 400/20 = 20 seconds
	scoreboard players set PointChargeTime gameRules 400
	scoreboard players set PointResetTime gameRules 400