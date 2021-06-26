# Give blue rewards
scoreboard players add BluePoints gameVariable 10
tellraw @a {"translate":"system.message","with":[{"translate":"%s gains a %s point bonus!","color": "green","with":[{"translate":"spacer.middle","with":[{"translate":"team.blue","color":"blue"}, {"translate":"b","font": "calamity:icons","color":"blue"}]},{"text":"10","color":"white"}]}]}