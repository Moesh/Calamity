# Give red rewards
scoreboard players add RedPoints gameVariable 10
tellraw @a {"translate":"system.message","with":[{"translate":"%s gains a %s point bonus!","color": "green","with":[{"translate":"spacer.middle","with":[{"translate":"team.red","color":"red"}, {"translate":"r","font": "calamity:icons","color":"red"}]}]}]}
