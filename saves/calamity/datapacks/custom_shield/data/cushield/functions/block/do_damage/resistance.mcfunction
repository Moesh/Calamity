#calculating reduction
scoreboard players operation red= cush.main = damage= cush.main
scoreboard players operation res= cush.main = @s cush.res.amp
scoreboard players add res= cush.main 1
scoreboard players operation res= cush.main *= 20 num
scoreboard players operation red= cush.main *= res= cush.main
scoreboard players operation red= cush.main /= 100 num
scoreboard players operation damage= cush.main -= red= cush.main
execute if score damage= cush.main matches ..-1 run scoreboard players set damage= cush.main 0