#decrementing wait score
scoreboard players remove @s[scores={cush.wait=1..}] cush.wait 1

#generating display values
scoreboard players operation display= cush.main = @s cush.wait
scoreboard players operation display= cush.main *= 11 num
scoreboard players operation display= cush.main /= @s cush.wait.max

#displaying text
execute if score display= cush.main matches 11.. run title @s actionbar {"text":"0","font":"shield:icon"}
execute if score display= cush.main matches 10 run title @s actionbar {"text":"1","font":"shield:icon"}
execute if score display= cush.main matches 9 run title @s actionbar {"text":"2","font":"shield:icon"}
execute if score display= cush.main matches 8 run title @s actionbar {"text":"3","font":"shield:icon"}
execute if score display= cush.main matches 7 run title @s actionbar {"text":"4","font":"shield:icon"}
execute if score display= cush.main matches 6 run title @s actionbar {"text":"5","font":"shield:icon"}
execute if score display= cush.main matches 5 run title @s actionbar {"text":"6","font":"shield:icon"}
execute if score display= cush.main matches 4 run title @s actionbar {"text":"7","font":"shield:icon"}
execute if score display= cush.main matches 3 run title @s actionbar {"text":"8","font":"shield:icon"}
execute if score display= cush.main matches 2 run title @s actionbar {"text":"9","font":"shield:icon"}
execute if score display= cush.main matches 1 run title @s actionbar {"text":"a","font":"shield:icon"}
execute if score display= cush.main matches ..0 run title @s actionbar {"text":"b","font":"shield:icon"}