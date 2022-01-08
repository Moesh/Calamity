# Called from: calamity:game_state/tick_match

#>--------------------------------------------------------------------------------------------------
#> Purpose: Tick these functions during the lobby stage
#>--------------------------------------------------------------------------------------------------

# Tick timer down. We always tick time in game ticks (20 ticks a second) for a reasonable accuracy.
scoreboard players add MatchTimeInTicks gameVariable 1

# Do some math that is similar to math we do other places. Load the variables into their slots and
#   then run the math function!
scoreboard players operation #InSeconds gameVariable = MatchTimeInTicks gameVariable
scoreboard players operation #Every20Ticks gameVariable = MatchTimeInTicks gameVariable
function calamity:math/divide_by_twenty

# We'll likely only ever these math commands in this function, which is why they are not in their
#   own function. By dividing (/=) #InSeconds by 60, we get a whole number that is the minutes which
#   are left in the game. By finding the modulus (%=) of #InSeconds, we get a whole number output of
#   the seconds left in the current minute. We'll use this to get a human readable timer output.
#   Displaying the time in seconds left doesn't feel as professional. I want players and spectators
#   to quickly parse the time and then focus on other things.
execute if score #Every20Ticks gameVariable matches 0 run scoreboard players operation displayMinute gameVariable = #InSeconds gameVariable
execute if score #Every20Ticks gameVariable matches 0 run scoreboard players operation displayMinute gameVariable /= 60 CONST
execute if score #Every20Ticks gameVariable matches 0 run scoreboard players operation displaySecond gameVariable = #InSeconds gameVariable
execute if score #Every20Ticks gameVariable matches 0 run scoreboard players operation displaySecond gameVariable %= 60 CONST

# We just updated the time. Let's also update the displays, yeah?
function calamity:player/update_displays