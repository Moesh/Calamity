# Called from: calamity:game_state/timer

#---------------------------------------------------------------------------------------------------
# Run math to determine is a full second has passed
#---------------------------------------------------------------------------------------------------
scoreboard players operation #InSeconds gameVariable /= 20 CONST
scoreboard players operation #Every20Ticks gameVariable %= 20 CONST
# This line above is uses something called a modulus. That means "absolute value". The %= operator
# means I'm taking the remainder of #Every20Ticks/20 (or TWENTY CONST as the script requires).
# If it is not a perfect zero, I know it's not a whole number, and therefore a second has not
# passed on that particular game tick. This can be further modified to work every two seconds
# (FOURTY CONST, if you set it up right in load.mcfunction)


# For context: This is a function pulled from an attack/defend map. I left this note in because
# I love it so.

# Pull up a chair, let me tell you about game ticks and stuff...
#
# ....
#
# OK, so Minecraft updates 20 times a second. Pretty much. It's not an exact science. Things go
# or go fast. Sometimes magic happens. It's normal. This function here is designed to update
# both objective points at the same time. This is because I hate updating one thing in two or more
# places. It sucks. Don't do it. You'll probably forget to update one of the bunch of things you
# need to update and then spend more time fixing bugs. Or maybe you'll spend the same amount of
# time. It's difficult to say.
#
# Anyways, I write my functions to have the least amount of lines as possible. I want to reuse
# functions whenever I can. This means I spent a lot of time thinking about logistics of functions,
# and less time doing "fun stuff" like, uh, finishing the damn map.
#
# ...
#
# These functions, right here. These functions are proof I can find time to waste while still having
# a ton of fun just tinkering around with Minecraft's weird scripting language. It should be the
# only place where you need to update things related to updating the objective bossbars while the
# game is running.