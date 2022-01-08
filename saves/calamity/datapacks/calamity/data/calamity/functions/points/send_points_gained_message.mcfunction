# Called from: calamity:points/sequencer
#
#>--------------------------------------------------------------------------------------------------
#> Purpose: Send an timestamped message with points gained
#>--------------------------------------------------------------------------------------------------

# Player has gained points, send an updated message
    # 0..9 seconds
execute if score @s streakLevel matches 0 if score displaySecond gameVariable matches 0..9 run tellraw @a { "translate":"system.timestamped.message", "color":"gray", "with":[{"translate":"%s:0%s","hoverEvent":{"action":"show_text","contents":[{"translate":"calamity.hover.sessionID","with":[{"score":{"name":"SessionID","objective":"gameVariable"}}]},"\n",{"translate":"calamity.hover.matchTime","with":[{"score":{"name":"MatchTimeInTicks","objective":"gameVariable"}}]}]},"color":"white","with":[{"score":{"name":"displayMinute", "objective":"gameVariable"} },{"score":{"name":"displaySecond", "objective":"gameVariable"}}]}, { "translate":"spacer.middle", "with":[ {"selector": "@s"}, { "translate":"calamity.points", "color":"gray", "with":[ {"score": {"name":"@s","objective":"prepScore"},"color": "white"},{"score":{"name":"@s","objective": "streakPoints"},"color": "white"},{"translate":"s","font":"calamity:icons"} ] } ] } ] }
execute if score @s streakLevel matches 1 if score displaySecond gameVariable matches 0..9 run tellraw @a { "translate":"system.timestamped.message", "color":"gray", "with":[{"translate":"%s:0%s","hoverEvent":{"action":"show_text","contents":[{"translate":"calamity.hover.sessionID","with":[{"score":{"name":"SessionID","objective":"gameVariable"}}]},"\n",{"translate":"calamity.hover.matchTime","with":[{"score":{"name":"MatchTimeInTicks","objective":"gameVariable"}}]}]},"color":"white","with":[{"score":{"name":"displayMinute", "objective":"gameVariable"} },{"score":{"name":"displaySecond", "objective":"gameVariable"}}]}, { "translate":"spacer.middle", "with":[ {"selector": "@s"}, { "translate":"calamity.points.streak", "color":"dark_aqua", "with":[ {"score": {"name":"@s","objective":"prepScore"},"color": "white"},{"score":{"name":"@s","objective": "streakPoints"},"color": "white"},{"translate":"s","font":"calamity:icons"} ] } ] } ] }
execute if score @s streakLevel matches 2 if score displaySecond gameVariable matches 0..9 run tellraw @a { "translate":"system.timestamped.message", "color":"gray", "with":[{"translate":"%s:0%s","hoverEvent":{"action":"show_text","contents":[{"translate":"calamity.hover.sessionID","with":[{"score":{"name":"SessionID","objective":"gameVariable"}}]},"\n",{"translate":"calamity.hover.matchTime","with":[{"score":{"name":"MatchTimeInTicks","objective":"gameVariable"}}]}]},"color":"white","with":[{"score":{"name":"displayMinute", "objective":"gameVariable"} },{"score":{"name":"displaySecond", "objective":"gameVariable"}}]}, { "translate":"spacer.middle", "with":[ {"selector": "@s"}, { "translate":"calamity.points.streak", "color":"aqua", "with":[ {"score": {"name":"@s","objective":"prepScore"},"color": "white"},{"score":{"name":"@s","objective": "streakPoints"},"color": "white"},{"translate":"s","font":"calamity:icons"} ] } ] } ] }
execute if score @s streakLevel matches 3 if score displaySecond gameVariable matches 0..9 run tellraw @a { "translate":"system.timestamped.message", "color":"gray", "with":[{"translate":"%s:0%s","hoverEvent":{"action":"show_text","contents":[{"translate":"calamity.hover.sessionID","with":[{"score":{"name":"SessionID","objective":"gameVariable"}}]},"\n",{"translate":"calamity.hover.matchTime","with":[{"score":{"name":"MatchTimeInTicks","objective":"gameVariable"}}]}]},"color":"white","with":[{"score":{"name":"displayMinute", "objective":"gameVariable"} },{"score":{"name":"displaySecond", "objective":"gameVariable"}}]}, { "translate":"spacer.middle", "with":[ {"selector": "@s"}, { "translate":"calamity.points.streak", "color":"white", "with":[ {"score": {"name":"@s","objective":"prepScore"},"color": "white"},{"score":{"name":"@s","objective": "streakPoints"},"color": "white"},{"translate":"s","font":"calamity:icons"} ] } ] } ] }
execute if score @s streakLevel matches 4 if score displaySecond gameVariable matches 0..9 run tellraw @a { "translate":"system.timestamped.message", "color":"gray", "with":[{"translate":"%s:0%s","hoverEvent":{"action":"show_text","contents":[{"translate":"calamity.hover.sessionID","with":[{"score":{"name":"SessionID","objective":"gameVariable"}}]},"\n",{"translate":"calamity.hover.matchTime","with":[{"score":{"name":"MatchTimeInTicks","objective":"gameVariable"}}]}]},"color":"white","with":[{"score":{"name":"displayMinute", "objective":"gameVariable"} },{"score":{"name":"displaySecond", "objective":"gameVariable"}}]}, { "translate":"spacer.middle", "with":[ {"selector": "@s"}, { "translate":"calamity.points.streak", "color":"yellow", "with":[ {"score": {"name":"@s","objective":"prepScore"},"color": "white"},{"score":{"name":"@s","objective": "streakPoints"},"color": "white"},{"translate":"s","font":"calamity:icons"} ] } ] } ] }
execute if score @s streakLevel matches 5.. if score displaySecond gameVariable matches 0..9 run tellraw @a { "translate":"system.timestamped.message", "color":"gray", "with":[{"translate":"%s:0%s","hoverEvent":{"action":"show_text","contents":[{"translate":"calamity.hover.sessionID","with":[{"score":{"name":"SessionID","objective":"gameVariable"}}]},"\n",{"translate":"calamity.hover.matchTime","with":[{"score":{"name":"MatchTimeInTicks","objective":"gameVariable"}}]}]},"color":"white","with":[{"score":{"name":"displayMinute", "objective":"gameVariable"} },{"score":{"name":"displaySecond", "objective":"gameVariable"}}]}, { "translate":"spacer.middle", "with":[ {"selector": "@s"}, { "translate":"calamity.points.streak", "color":"gold", "with":[ {"score": {"name":"@s","objective":"prepScore"},"color": "white"},{"score":{"name":"@s","objective": "streakPoints"},"color": "white"},{"translate":"s","font":"calamity:icons"} ] } ] } ] }
    # 10.. seconds
execute if score @s streakLevel matches 0 if score displaySecond gameVariable matches 10.. run tellraw @a { "translate":"system.timestamped.message", "color":"gray", "with":[{"translate":"%s:%s","hoverEvent":{"action":"show_text","contents":[{"translate":"calamity.hover.sessionID","with":[{"score":{"name":"SessionID","objective":"gameVariable"}}]},"\n",{"translate":"calamity.hover.matchTime","with":[{"score":{"name":"MatchTimeInTicks","objective":"gameVariable"}}]}]},"color":"white","with":[{"score":{"name":"displayMinute", "objective":"gameVariable"} },{"score":{"name":"displaySecond", "objective":"gameVariable"}}]}, { "translate":"spacer.middle", "with":[ {"selector": "@s"}, { "translate":"calamity.points", "color":"gray", "with":[ {"score": {"name":"@s","objective":"prepScore"},"color": "white"},{"score":{"name":"@s","objective": "streakPoints"},"color": "white"},{"translate":"s","font":"calamity:icons"} ] } ] } ] }
execute if score @s streakLevel matches 1 if score displaySecond gameVariable matches 10.. run tellraw @a { "translate":"system.timestamped.message", "color":"gray", "with":[{"translate":"%s:%s","hoverEvent":{"action":"show_text","contents":[{"translate":"calamity.hover.sessionID","with":[{"score":{"name":"SessionID","objective":"gameVariable"}}]},"\n",{"translate":"calamity.hover.matchTime","with":[{"score":{"name":"MatchTimeInTicks","objective":"gameVariable"}}]}]},"color":"white","with":[{"score":{"name":"displayMinute", "objective":"gameVariable"} },{"score":{"name":"displaySecond", "objective":"gameVariable"}}]}, { "translate":"spacer.middle", "with":[ {"selector": "@s"}, { "translate":"calamity.points.streak", "color":"dark_aqua", "with":[ {"score": {"name":"@s","objective":"prepScore"},"color": "white"},{"score":{"name":"@s","objective": "streakPoints"},"color": "white"},{"translate":"s","font":"calamity:icons"} ] } ] } ] }
execute if score @s streakLevel matches 2 if score displaySecond gameVariable matches 10.. run tellraw @a { "translate":"system.timestamped.message", "color":"gray", "with":[{"translate":"%s:%s","hoverEvent":{"action":"show_text","contents":[{"translate":"calamity.hover.sessionID","with":[{"score":{"name":"SessionID","objective":"gameVariable"}}]},"\n",{"translate":"calamity.hover.matchTime","with":[{"score":{"name":"MatchTimeInTicks","objective":"gameVariable"}}]}]},"color":"white","with":[{"score":{"name":"displayMinute", "objective":"gameVariable"} },{"score":{"name":"displaySecond", "objective":"gameVariable"}}]}, { "translate":"spacer.middle", "with":[ {"selector": "@s"}, { "translate":"calamity.points.streak", "color":"aqua", "with":[ {"score": {"name":"@s","objective":"prepScore"},"color": "white"},{"score":{"name":"@s","objective": "streakPoints"},"color": "white"},{"translate":"s","font":"calamity:icons"} ] } ] } ] }
execute if score @s streakLevel matches 3 if score displaySecond gameVariable matches 10.. run tellraw @a { "translate":"system.timestamped.message", "color":"gray", "with":[{"translate":"%s:%s","hoverEvent":{"action":"show_text","contents":[{"translate":"calamity.hover.sessionID","with":[{"score":{"name":"SessionID","objective":"gameVariable"}}]},"\n",{"translate":"calamity.hover.matchTime","with":[{"score":{"name":"MatchTimeInTicks","objective":"gameVariable"}}]}]},"color":"white","with":[{"score":{"name":"displayMinute", "objective":"gameVariable"} },{"score":{"name":"displaySecond", "objective":"gameVariable"}}]}, { "translate":"spacer.middle", "with":[ {"selector": "@s"}, { "translate":"calamity.points.streak", "color":"white", "with":[ {"score": {"name":"@s","objective":"prepScore"},"color": "white"},{"score":{"name":"@s","objective": "streakPoints"},"color": "white"},{"translate":"s","font":"calamity:icons"} ] } ] } ] }
execute if score @s streakLevel matches 4 if score displaySecond gameVariable matches 10.. run tellraw @a { "translate":"system.timestamped.message", "color":"gray", "with":[{"translate":"%s:%s","hoverEvent":{"action":"show_text","contents":[{"translate":"calamity.hover.sessionID","with":[{"score":{"name":"SessionID","objective":"gameVariable"}}]},"\n",{"translate":"calamity.hover.matchTime","with":[{"score":{"name":"MatchTimeInTicks","objective":"gameVariable"}}]}]},"color":"white","with":[{"score":{"name":"displayMinute", "objective":"gameVariable"} },{"score":{"name":"displaySecond", "objective":"gameVariable"}}]}, { "translate":"spacer.middle", "with":[ {"selector": "@s"}, { "translate":"calamity.points.streak", "color":"yellow", "with":[ {"score": {"name":"@s","objective":"prepScore"},"color": "white"},{"score":{"name":"@s","objective": "streakPoints"},"color": "white"},{"translate":"s","font":"calamity:icons"} ] } ] } ] }
execute if score @s streakLevel matches 5.. if score displaySecond gameVariable matches 10.. run tellraw @a { "translate":"system.timestamped.message", "color":"gray", "with":[{"translate":"%s:%s","hoverEvent":{"action":"show_text","contents":[{"translate":"calamity.hover.sessionID","with":[{"score":{"name":"SessionID","objective":"gameVariable"}}]},"\n",{"translate":"calamity.hover.matchTime","with":[{"score":{"name":"MatchTimeInTicks","objective":"gameVariable"}}]}]},"color":"white","with":[{"score":{"name":"displayMinute", "objective":"gameVariable"} },{"score":{"name":"displaySecond", "objective":"gameVariable"}}]}, { "translate":"spacer.middle", "with":[ {"selector": "@s"}, { "translate":"calamity.points.streak", "color":"gold", "with":[ {"score": {"name":"@s","objective":"prepScore"},"color": "white"},{"score":{"name":"@s","objective": "streakPoints"},"color": "white"},{"translate":"s","font":"calamity:icons"} ] } ] } ] }