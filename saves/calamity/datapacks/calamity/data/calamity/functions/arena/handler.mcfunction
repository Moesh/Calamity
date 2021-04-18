# Called from: 

#---------------------------------------------------------------------------------------------------
# Purpose: Reset the map and player states to neutral
#---------------------------------------------------------------------------------------------------

# Index for this handler
#   #arenaAction gameVariable 0 = Load a new arena. Default action.
#   #arenaAction gameVariable 1 = Erase the arena. Used when switching to a new arena.
#   #arenaAction gameVariable 2 = Run arena actions. Detailing and special features.
#   #arenaAction gameVariable 3 = Count ore mines

# Index for arenas
#   1 = Calamity Modern
#   2 = Shattering (Calamity Modern palette shift)
#   3 = Something [reserved for Moesh]
#   4.. = Your arena?

# NOTE TO ARENA MAKERS: Each action requires an entry for your level to be accepted.

# 1 - Calamity: Modern by Moesh
    # Load a new arena
    execute if score #arenaAction gameVariable matches 0 if score #currentArena gameVariables matches 1 run function #calamity:load_arena_1_modern
    # Erase the arenas
    execute if score #arenaAction gameVariable matches 1 if score #currentArena gameVariable matches 1 run function calamity:arena/calamity/erase
    # Some arenas might have additional things to tick every second. It should all be stored here.
    execute if score #arenaAction gameVariable matches 2 if score #currentArena gameVariable matches 1 run function calamity:arena/calamity/actions
    # Count the ore
    execute if score #arenaAction gameVariable matches 3 if score #currentArena gameVariable matches 1 run execute store result score OreLeft gameVariable run fill 130 0 181 142 67 195 minecraft:petrified_oak_slab[type=double] replace minecraft:iron_ore
    execute if score #arenaAction gameVariable matches 3 if score #currentArena gameVariable matches 1 run fill 142 67 181 130 0 195 minecraft:iron_ore replace minecraft:petrified_oak_slab

# 2 - Shattering by Moesh
    # Load a new arena
    execute if score #arenaAction gameVariable matches 0 if score #currentArena gameVariables matches 2 run function #calamity:load_arena_2_shattering
    # Erase the arenas
    execute if score #arenaAction gameVariable matches 1 if score #currentArena gameVariable matches 2 run function calamity:arena/shattering/erase
    # Additional actions
    execute if score #arenaAction gameVariable matches 2 if score #currentArena gameVariable matches 2 run function calamity:arena/shattering/actions
    # Count the ore
    execute if score #arenaAction gameVariable matches 3 if score #currentArena gameVariable matches 2 run execute store result score OreLeft gameVariable run fill 130 0 181 142 67 195 minecraft:petrified_oak_slab[type=double] replace minecraft:iron_ore
    execute if score #arenaAction gameVariable matches 3 if score #currentArena gameVariable matches 2 run fill 142 67 181 130 0 195 minecraft:iron_ore replace minecraft:petrified_oak_slab

# Always set score to zero. Players never have access to this variable, so we can take advantage of
#   how the behavior will work.
scoreboard players set #arenaAction gameVariable 0