# Called from: calamity:arena/handler

#>--------------------------------------------------------------------------------------------------
#> Purpose: Erase the whole level and marker entities
#>--------------------------------------------------------------------------------------------------

# Place empty structure blocks
# Left side
setblock 141 0 87 minecraft:structure_block[mode=load]{metadata: "", mirror: "NONE", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "Moesh", rotation: "NONE", posX: 1, mode: "LOAD", posY: 0, sizeX: 35, posZ: 0, integrity: 1.0f, showair: 0b, name: "calamity:calamity/erase1", sizeY: 48, sizeZ: 12, showboundingbox: 1b}
setblock 141 1 87 minecraft:structure_block[mode=load]{metadata: "", mirror: "NONE", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "Moesh", rotation: "NONE", posX: 1, mode: "LOAD", posY: 47, sizeX: 35, posZ: 0, integrity: 1.0f, showair: 0b, name: "calamity:calamity/erase2", sizeY: 27, sizeZ: 12, showboundingbox: 1b}
setblock 141 0 101 minecraft:structure_block[mode=load]{metadata: "", mirror: "NONE", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "Moesh", rotation: "NONE", posX: 1, mode: "LOAD", posY: 0, sizeX: 35, posZ: 0, integrity: 1.0f, showair: 0b, name: "calamity:calamity/erase3", sizeY: 48, sizeZ: 48, showboundingbox: 1b}
setblock 141 1 101 minecraft:structure_block[mode=load]{metadata: "", mirror: "NONE", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "Moesh", rotation: "NONE", posX: 1, mode: "LOAD", posY: 47, sizeX: 35, posZ: 0, integrity: 1.0f, showair: 0b, name: "calamity:calamity/erase4", sizeY: 27, sizeZ: 48, showboundingbox: 1b}
setblock 141 0 149 minecraft:structure_block[mode=load]{metadata: "", mirror: "NONE", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "Moesh", rotation: "NONE", posX: 1, mode: "LOAD", posY: 0, sizeX: 35, posZ: 0, integrity: 1.0f, showair: 0b, name: "calamity:calamity/erase5", sizeY: 48, sizeZ: 48, showboundingbox: 1b}
setblock 141 1 149 minecraft:structure_block[mode=load]{metadata: "", mirror: "NONE", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "Moesh", rotation: "NONE", posX: 1, mode: "LOAD", posY: 47, sizeX: 35, posZ: 0, integrity: 1.0f, showair: 0b, name: "calamity:calamity/erase6", sizeY: 27, sizeZ: 48, showboundingbox: 1b}
# Right side
setblock 131 0 87 minecraft:structure_block[mode=load]{metadata: "", mirror: "LEFT_RIGHT", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "Moesh", rotation: "CLOCKWISE_180", posX: -1, mode: "LOAD", posY: 0, sizeX: 35, posZ: 0, integrity: 1.0f, showair: 0b, name: "calamity:calamity/erase1", sizeY: 48, sizeZ: 12, showboundingbox: 1b}
setblock 131 1 87 minecraft:structure_block[mode=load]{metadata: "", mirror: "LEFT_RIGHT", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "Moesh", rotation: "CLOCKWISE_180", posX: -1, mode: "LOAD", posY: 47, sizeX: 35, posZ: 0, integrity: 1.0f, showair: 0b, name: "calamity:calamity/erase2", sizeY: 27, sizeZ: 12, showboundingbox: 1b}
setblock 131 0 101 minecraft:structure_block[mode=load]{metadata: "", mirror: "LEFT_RIGHT", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "Moesh", rotation: "CLOCKWISE_180", posX: -1, mode: "LOAD", posY: 0, sizeX: 35, posZ: 0, integrity: 1.0f, showair: 0b, name: "calamity:calamity/erase3", sizeY: 48, sizeZ: 48, showboundingbox: 1b}
setblock 131 1 101 minecraft:structure_block[mode=load]{metadata: "", mirror: "LEFT_RIGHT", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "Moesh", rotation: "CLOCKWISE_180", posX: -1, mode: "LOAD", posY: 47, sizeX: 35, posZ: 0, integrity: 1.0f, showair: 0b, name: "calamity:calamity/erase4", sizeY: 27, sizeZ: 48, showboundingbox: 1b}
setblock 131 0 149 minecraft:structure_block[mode=load]{metadata: "", mirror: "LEFT_RIGHT", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "Moesh", rotation: "CLOCKWISE_180", posX: -1, mode: "LOAD", posY: 0, sizeX: 35, posZ: 0, integrity: 1.0f, showair: 0b, name: "calamity:calamity/erase5", sizeY: 48, sizeZ: 48, showboundingbox: 1b}
setblock 131 1 149 minecraft:structure_block[mode=load]{metadata: "", mirror: "LEFT_RIGHT", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "Moesh", rotation: "CLOCKWISE_180", posX: -1, mode: "LOAD", posY: 47, sizeX: 35, posZ: 0, integrity: 1.0f, showair: 0b, name: "calamity:calamity/erase6", sizeY: 27, sizeZ: 48, showboundingbox: 1b}
# Crosslane
setblock 131 3 179 minecraft:structure_block[mode=load]{metadata: "", mirror: "NONE", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "Moesh", rotation: "NONE", posX: 0, mode: "LOAD", posY: -3, sizeX: 13, posZ: 1, integrity: 1.0f, showair: 0b, name: "calamity:calamity/erase7", sizeY: 48, sizeZ: 15, showboundingbox: 1b}
setblock 131 4 179 minecraft:structure_block[mode=load]{metadata: "", mirror: "NONE", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "Moesh", rotation: "NONE", posX: 0, mode: "LOAD", posY: 44, sizeX: 13, posZ: 1, integrity: 1.0f, showair: 0b, name: "calamity:calamity/erase8", sizeY: 27, sizeZ: 15, showboundingbox: 1b}
# Lobby
setblock 117 33 26 minecraft:structure_block[mode=load]{metadata: "", mirror: "NONE", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "?", rotation: "NONE", posX: 0, mode: "LOAD", posY: 2, sizeX: 39, posZ: 0, integrity: 1.0f, showair: 0b, name: "calamity:calamity/erase_lobby1", sizeY: 33, sizeZ: 48, showboundingbox: 1b}
setblock 117 33 74 minecraft:structure_block[mode=load]{metadata: "", mirror: "NONE", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "?", rotation: "NONE", posX: 0, mode: "LOAD", posY: 2, sizeX: 39, posZ: 0, integrity: 1.0f, showair: 0b, name: "calamity:calamity/erase_lobby2", sizeY: 33, sizeZ: 3, showboundingbox: 1b}
# Logo
setblock 109 67 74 minecraft:structure_block[mode=load]{metadata: "", mirror: "NONE", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "Moesh", rotation: "NONE", posX: 0, mode: "LOAD", posY: 2, sizeX: 48, posZ: 0, integrity: 1.0f, showair: 0b, name: "calamity:calamity/erase_logo1", sizeY: 12, sizeZ: 7, showboundingbox: 1b}
setblock 157 67 74 minecraft:structure_block[mode=load]{metadata: "", mirror: "NONE", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "Moesh", rotation: "NONE", posX: 0, mode: "LOAD", posY: 2, sizeX: 7, posZ: 0, integrity: 1.0f, showair: 0b, name: "calamity:calamity/erase_logo2", sizeY: 12, sizeZ: 7, showboundingbox: 1b}

# Activate the structure blocks!
# Left side
setblock 141 0 86 minecraft:redstone_block
setblock 141 1 86 minecraft:redstone_block
setblock 141 0 100 minecraft:redstone_block
setblock 141 1 100 minecraft:redstone_block
setblock 141 0 148 minecraft:redstone_block
setblock 141 1 148 minecraft:redstone_block
# Right side
setblock 131 0 86 minecraft:redstone_block
setblock 131 1 86 minecraft:redstone_block
setblock 131 0 100 minecraft:redstone_block
setblock 131 1 100 minecraft:redstone_block
setblock 131 0 148 minecraft:redstone_block
setblock 131 1 148 minecraft:redstone_block
# Crosslane
setblock 131 3 178 minecraft:redstone_block
setblock 131 4 178 minecraft:redstone_block
# Lobby
setblock 117 32 26 minecraft:redstone_block
setblock 117 32 74 minecraft:redstone_block
setblock 109 67 73 minecraft:redstone_block
setblock 157 67 73 minecraft:redstone_block

#>--------------------------------------------------------------------------------------------------
#> Purpose: Erase structure and redstone blocks
#>--------------------------------------------------------------------------------------------------
# Lobby
fill 117 32 26 117 34 26 minecraft:air
fill 117 32 74 117 34 74 minecraft:air
# Logo
fill 109 67 73 109 67 74 minecraft:air
fill 157 67 73 157 67 74 minecraft:air

# We treat this level like a giant U-shape, starting on the left side and moving down the lane until
#   we reach the crosslane, then move backwards up the right side.
# Save/load calamity1, calamity2
fill 141 0 86 141 1 87 minecraft:air
# Save/load calamity3, calamity4
fill 141 0 100 141 1 101 minecraft:air
# Save calamity5, calamity6
fill 141 0 148 141 1 149 minecraft:air
# Save calamity7, calamity8
fill 131 0 179 131 1 179 minecraft:air
# Protection barrier block generator
fill 141 0 178 141 1 179 minecraft:air
# Mirror iron mines left to right (when facing south)
fill 137 0 179 135 1 179 minecraft:air
# Save iron mines
fill 131 0 179 131 1 179 minecraft:air
# Load iron mines
fill 131 3 178 131 4 179 minecraft:air
# Load calamity5, calamity6
fill 131 0 148 131 1 149 minecraft:air
# Load calamity3, calamity4
fill 131 0 100 131 1 101 minecraft:air
# Load calamity1, calamity2
fill 131 0 86 131 1 87 minecraft:air

# Erase data (large chunks)
fill 95 251 87 176 255 165 minecraft:air
fill 96 251 166 176 255 196 minecraft:air

# Kill all entities to ensure no drops or other things are left over.
function calamity:load/kill_entities