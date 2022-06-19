# Called from: calamity:tick

#>--------------------------------------------------------------------------------------------------
#> Purpose: Send players stats for the current match 
#>--------------------------------------------------------------------------------------------------

tellraw @s {"translate":"calamity.stats.divider","color": "dark_green"}
execute if score GameState gameVariable matches 1 run tellraw @s {"translate":"calamity.stats.match.id","color": "dark_green","with":[{"score":{"name": "#CurrentMatchID","objective": "gameVariable"},"color": "white"}]}
execute unless score GameState gameVariable matches 1 run tellraw @s {"translate":"calamity.stats.match.id","color": "dark_green","with":[{"score":{"name": "#LastMatchID","objective": "gameVariable"},"color": "white"}]}
tellraw @s {"translate":"calamity.stats.goal","color": "dark_green","with":[{"translate":"calamity.goal","color": "white"}]}

# Announce arena name
scoreboard players set #arenaAction gameVariable 10
execute as @s at @s run function calamity:arena/handler
# Output game status. Is it in progress or completed?
execute if score GameState gameVariable matches 1 run tellraw @s {"translate":"calamity.stats.match.status","color": "dark_green","with":[{"translate":"calamity.stats.match.status.inProgress","color": "gray","italic": true}]}
execute if score GameState gameVariable matches 0 run tellraw @s {"translate":"calamity.stats.match.status","color": "dark_green","with":[{"translate":"calamity.stats.match.status.ended","color": "green"}]}
execute if score GameState gameVariable matches 2 run tellraw @s {"translate":"calamity.stats.match.status","color": "dark_green","with":[{"translate":"calamity.stats.match.status.ended","color": "green"}]}
# Output match time 
execute if score displaySecond gameVariable matches 0..9 run tellraw @s {"translate":"calamity.stats.match.time","color": "dark_green","with":[{"translate":"%s:0%s","color": "white","with":[{"score":{"name":"displayMinute", "objective":"gameVariable"} },{"score":{"name":"displaySecond", "objective":"gameVariable"}}]},{"score":{"name": "MatchTimeInTicks","objective": "gameVariable"},"color": "white"}]}
execute if score displaySecond gameVariable matches 10.. run tellraw @s {"translate":"calamity.stats.match.time","color": "dark_green","with":[{"translate":"%s:%s","color": "white","with":[{"score":{"name":"displayMinute", "objective":"gameVariable"} },{"score":{"name":"displaySecond", "objective":"gameVariable"}}]},{"score":{"name": "MatchTimeInTicks","objective": "gameVariable"},"color": "white"}]}
# Output score with winner on left-hand size. We'll use Blue as the default message if there is a tie.
execute if score BluePoints gameVariable >= RedPoints gameVariable run tellraw @s {"translate":"calamity.stats.score","color": "dark_green","with":[{"translate":"team.blue","color":"blue"}, {"translate":"b","font": "calamity:icons","color":"blue"},{"score":{"name": "BluePoints","objective": "gameVariable"},"color": "white"},{"translate":"team.red","color":"red"}, {"translate":"r","font": "calamity:icons","color":"red"},{"score":{"name": "RedPoints","objective": "gameVariable"},"color": "white"}]}
execute if score RedPoints gameVariable > BluePoints gameVariable run tellraw @s {"translate":"calamity.stats.score","color": "dark_green","with":[{"translate":"team.red","color":"red"}, {"translate":"r","font": "calamity:icons","color":"red"},{"score":{"name": "RedPoints","objective": "gameVariable"},"color": "white"},{"translate":"team.blue","color":"blue"}, {"translate":"b","font": "calamity:icons","color":"blue"},{"score":{"name": "BluePoints","objective": "gameVariable"},"color": "white"}]}
tellraw @s {"translate":"calamity.stats.oreLeft","color": "dark_green","with":[{"score":{"name": "#LM_OreLeft","objective": "gameVariable"},"color": "white"}]}
tellraw @s {"translate":"calamity.stats.divider","color": "dark_green"}