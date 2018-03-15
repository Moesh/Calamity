scoreboard players tag @s add Resetting
scoreboard players operation @s counter = MajorResettingTime gameRules

execute @s ~ ~ ~ blockdata ~ ~ ~-6 {Text2:"{\"translate\":\"resourcePoint.sign.activated\"}"}
scoreboard players tag @s remove Output