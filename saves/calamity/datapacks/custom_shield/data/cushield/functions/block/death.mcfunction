#ending block
function cushield:block/unblock_all

#death
execute store result score dm= cush.main run gamerule showDeathMessages
gamerule showDeathMessages false
kill @s
execute if score dm= cush.main matches 1 run gamerule showDeathMessages true

#determining message to use - 0 generic, 1 explosion, 2 fire, 3 magic, 4 projectile, 5 lightning, 6 fall damage?, 7 void, 8 starvation
execute store success score attacker= cush.main if entity @e[tag=entityid.attacker]
execute if entity @s[advancements={entityid:entity_hurt_player={typeless=true}}] run scoreboard players set type= cush.main 0
execute if entity @s[advancements={entityid:entity_hurt_player={bypasses_armor=true}}] run scoreboard players set type= cush.main 6
execute if entity @s[advancements={entityid:entity_hurt_player={is_explosion=true}}] run scoreboard players set type= cush.main 1
execute if entity @s[advancements={entityid:entity_hurt_player={is_fire=true}}] run scoreboard players set type= cush.main 2
execute if entity @s[advancements={entityid:entity_hurt_player={is_magic=true}}] run scoreboard players set type= cush.main 3
execute if entity @s[advancements={entityid:entity_hurt_player={is_projectile=true}}] run scoreboard players set type= cush.main 4
execute if entity @s[advancements={entityid:entity_hurt_player={is_lightning=true}}] run scoreboard players set type= cush.main 5
execute if entity @s[advancements={entityid:entity_hurt_player={bypasses_invulnerability=true}}] run scoreboard players set type= cush.main 7
execute if entity @s[advancements={entityid:entity_hurt_player={bypasses_magic=true}}] run scoreboard players set type= cush.main 8
execute if entity @s[advancements={entityid:entity_hurt_player={typeless=true,bypasses_armor=true}}] run scoreboard players set type= cush.main 9

#messages
#attackerless
execute if score type= cush.main matches 9 run tellraw @a {"translate":"death.attack.generic","with":[{"selector":"@s"}]}
execute if score type= cush.main matches 8 run tellraw @a {"translate":"death.attack.starve","with":[{"selector":"@s"}]}
execute if score type= cush.main matches 7 run tellraw @a {"translate":"death.attack.outOfWorld","with":[{"selector":"@s"}]}
execute if score type= cush.main matches 6 if score @s cush.fall matches 1.. run tellraw @a {"translate":"death.attack.fall","with":[{"selector":"@s"}]}
execute if score type= cush.main matches 6 unless score @s cush.fall matches 1.. run tellraw @a {"translate":"death.attack.generic","with":[{"selector":"@s"}]}
execute if score type= cush.main matches 5 run tellraw @a {"translate":"death.attack.lightningBolt","with":[{"selector":"@s"}]}

#type 0
execute if score attacker= cush.main matches 0 if score type= cush.main matches 0 run tellraw @a {"translate":"death.attack.generic","with":[{"selector":"@s"}]}
execute if score attacker= cush.main matches 1 if score type= cush.main matches 0 run tellraw @a {"translate":"death.attack.mob","with":[{"selector":"@s"},{"selector":"@e[tag=entityid.attacker]"}]}
#type 1
execute if score attacker= cush.main matches 0 if score type= cush.main matches 1 run tellraw @a {"translate":"death.attack.explosion","with":[{"selector":"@s"}]}
execute if score attacker= cush.main matches 1 if score type= cush.main matches 1 run tellraw @a {"translate":"death.attack.explosion.player","with":[{"selector":"@s"},{"selector":"@e[tag=entityid.attacker]"}]}
#type 2
execute if score attacker= cush.main matches 0 if score type= cush.main matches 2 run tellraw @a {"translate":"death.attack.onFire","with":[{"selector":"@s"}]}
execute if score attacker= cush.main matches 1 if score type= cush.main matches 2 run tellraw @a {"translate":"death.attack.onFire.player","with":[{"selector":"@s"},{"selector":"@e[tag=entityid.attacker]"}]}
#type 3
execute if score attacker= cush.main matches 0 if score type= cush.main matches 3 run tellraw @a {"translate":"death.attack.magic","with":[{"selector":"@s"}]}
execute if score attacker= cush.main matches 1 if score type= cush.main matches 3 run tellraw @a {"translate":"death.attack.magic.player","with":[{"selector":"@s"},{"selector":"@e[tag=entityid.attacker]"}]}
#type 4
execute if score attacker= cush.main matches 0 if score type= cush.main matches 4 run tellraw @a {"translate":"death.attack.arrow","with":[{"selector":"@s"},"an unidentified foe"]}
execute if score attacker= cush.main matches 1 if score type= cush.main matches 4 run tellraw @a {"translate":"death.attack.arrow","with":[{"selector":"@s"},{"selector":"@e[tag=entityid.attacker]"}]}