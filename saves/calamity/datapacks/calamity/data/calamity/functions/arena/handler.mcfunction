# Called from: So many places.

#>--------------------------------------------------------------------------------------------------
#> Purpose: Reset the map and player states to neutral
#>--------------------------------------------------------------------------------------------------

# Index for this handler
#   #arenaAction gameVariable 0 = Load a new arena. Default action.
#   #arenaAction gameVariable 1 = Erase the arena. Used when switching to a new arena.
#   #arenaAction gameVariable 2 = Run arena actions. Detailing and special features.
#   #arenaAction gameVariable 3 = Count ore mines
#   #arenaAction gameVariable 4 = Send welcome message
#   #arenaAction gameVariable 5 = Start match
#   #arenaAction gameVariable 6 = Additional lobby effects
#   #arenaAction gameVariable 7 = Additioanl match effects
#   #arenaAction gameVariable 8 = Give starting items
#   #arenaAction gameVariable 9 = Give items to any respawning player

# Index for arenas
#   1 = Calamity Modern
#   2 = Shattering (Calamity Modern palette shift)
#   3 = Something [reserved for Moesh]
#   4.. = Your arena?

# NOTE TO ARENA MAKERS: Each action requires an entry for your level to be accepted.

#> 1 - Calamity: Modern by Moesh
    # 0 Load a new arena
    execute if score #arenaAction gameVariable matches 0 if score #currentArena gameVariable matches 1 run function #calamity:load_arena_1_modern
    # 1 Erase the arenas
    execute if score #arenaAction gameVariable matches 1 if score #currentArena gameVariable matches 1 run function calamity:arena/calamity/erase
    # 2 Some arenas might have additional things to tick every second. It should all be stored here.
    execute if score #arenaAction gameVariable matches 2 if score #currentArena gameVariable matches 1 run function calamity:arena/calamity/actions
    # 3 Count the ore
    execute if score #arenaAction gameVariable matches 3 if score #currentArena gameVariable matches 1 run execute store result score OreLeft gameVariable run fill 130 0 181 142 67 195 minecraft:petrified_oak_slab[type=double] replace minecraft:iron_ore
    execute if score #arenaAction gameVariable matches 3 if score #currentArena gameVariable matches 1 run fill 130 0 181 142 67 195 minecraft:iron_ore replace minecraft:petrified_oak_slab
    # 4 Send welcome message
    execute if score #arenaAction gameVariable matches 4 if score #currentArena gameVariable matches 1 as @a run function calamity:arena/calamity/send_welcome_message
    # 5 Start match actions - nothing additional needed
    # 6, 7 Modern has no additional effects required. (arenaAction 6 and 7 not needed)
    # 8 Give spawn items
    execute if score #arenaAction gameVariable matches 8 if score #currentArena gameVariable matches 1 run give @a[tag=Playing] wooden_axe{RepairCost:666,Damage:45,Enchantments:[{id:"minecraft:vanishing_curse",lvl:1s}],AttributeModifiers:[{AttributeName:"generic.attack_damage",Name:"generic.attack_damage",Amount:4,Operation:0,UUID:[I;-31386206,-663338499,-1677180052,-261106179],Slot:"mainhand"},{AttributeName:"generic.attack_speed",Name:"generic.attack_speed",Amount:1,Operation:0,UUID:[I;1174657704,-1982709368,-1633494077,363317273],Slot:"mainhand"}]} 1
    # 9 Give spawn items
    execute if score #arenaAction gameVariable matches 9 if score #currentArena gameVariable matches 1 run give @a[tag=Playing,scores={timeSinceDeath=0}] wooden_axe{RepairCost:666,Damage:45,Enchantments:[{id:"minecraft:vanishing_curse",lvl:1s}],AttributeModifiers:[{AttributeName:"generic.attack_damage",Name:"generic.attack_damage",Amount:4,Operation:0,UUID:[I;-31386206,-663338499,-1677180052,-261106179],Slot:"mainhand"},{AttributeName:"generic.attack_speed",Name:"generic.attack_speed",Amount:1,Operation:0,UUID:[I;1174657704,-1982709368,-1633494077,363317273],Slot:"mainhand"}]} 1
    

#> 2 - Shattering by Panguino (edited by Moesh)
    # Load a new arena
    execute if score #arenaAction gameVariable matches 0 if score #currentArena gameVariable matches 2 run function #calamity:load_arena_2_shattering
    # Erase the arenas
    execute if score #arenaAction gameVariable matches 1 if score #currentArena gameVariable matches 2 run function calamity:arena/shattering/erase
    # Additional actions
    execute if score #arenaAction gameVariable matches 2 if score #currentArena gameVariable matches 2 run function calamity:arena/shattering/actions
    # Count the ore
    execute if score #arenaAction gameVariable matches 3 if score #currentArena gameVariable matches 2 run execute store result score OreLeft gameVariable run fill 134 4 112 140 14 120 minecraft:petrified_oak_slab[type=double] replace minecraft:iron_ore
    execute if score #arenaAction gameVariable matches 3 if score #currentArena gameVariable matches 2 run fill 134 4 112 140 14 120 minecraft:iron_ore replace minecraft:petrified_oak_slab
    # Send welcome message
    execute if score #arenaAction gameVariable matches 4 if score #currentArena gameVariable matches 2 as @a run function calamity:arena/shattering/send_welcome_message
    # 5 - Start match
    # Remove the lectern
    execute if score #arenaAction gameVariable matches 5 if score #currentArena gameVariable matches 2 run setblock 106 13 117 minecraft:air
    execute if score #arenaAction gameVariable matches 5 if score #currentArena gameVariable matches 2 run kill @e[type=area_effect_cloud,tag=menuInstructions]
    execute if score #arenaAction gameVariable matches 5 if score #currentArena gameVariable matches 2 run say I swear, I ran.
    # 6, 7 Give effects    
    execute if score #arenaAction gameVariable matches 6 if score #currentArena gameVariable matches 2 as @a run effect give @s minecraft:night_vision 999999 0 true
    execute if score #arenaAction gameVariable matches 7 if score #currentArena gameVariable matches 2 as @a run effect give @s minecraft:night_vision 999999 0 true
    # 8 Give spawn items
    execute if score #arenaAction gameVariable matches 8 if score #currentArena gameVariable matches 2 run give @a[tag=Playing] bow{Unbreakable:1b,Enchantments:[{id:"minecraft:vanishing_curse",lvl:1s}],AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:6,Operation:0,UUID:[I;-2068228233,-322420677,-1309210629,532578535],Slot:"mainhand"}]} 1
    execute if score #arenaAction gameVariable matches 8 if score #currentArena gameVariable matches 2 run give @a[tag=Playing] minecraft:arrow 16
    # 9 Give spawn items
    execute if score #arenaAction gameVariable matches 9 if score #currentArena gameVariable matches 2 run give @a[tag=Playing,scores={timeSinceDeath=0}] bow{Unbreakable:1b,Enchantments:[{id:"minecraft:vanishing_curse",lvl:1s}],AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:6,Operation:0,UUID:[I;-2068228233,-322420677,-1309210629,532578535],Slot:"mainhand"}]} 1
    execute if score #arenaAction gameVariable matches 9 if score #currentArena gameVariable matches 2 run give @a[tag=Playing,scores={timeSinceDeath=0}] minecraft:arrow 16

# Always set score to zero. Players never have access to this variable, so we can take advantage of
#   how the behavior will work.
scoreboard players set #arenaAction gameVariable 0