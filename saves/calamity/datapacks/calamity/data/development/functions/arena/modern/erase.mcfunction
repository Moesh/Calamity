# Called from: nowhere

#>--------------------------------------------------------------------------------------------------
#> Purpose: Sets the arena to development mode.
#>--------------------------------------------------------------------------------------------------

# We're actively develping Calamity, and sometimes that means changing the physical level. The level
#   is stored in structure files which are in this datapack. This means we're able to place
#   structure blocks to both place

# Place structure blocks which reference Calamity's structures

# Saving structure blocks
# Left side
setblock 141 0 87 minecraft:structure_block[mode=save]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"NONE",posX:1,mode:"SAVE",posY:0,sizeX:35,posZ:0,integrity:1.0f,showair:0b,name:"calamity:calamity/erase1",sizeY:48,sizeZ:14,showboundingbox:1b}
setblock 141 1 87 minecraft:structure_block[mode=save]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"NONE",posX:1,mode:"SAVE",posY:47,sizeX:35,posZ:0,integrity:1.0f,showair:0b,name:"calamity:calamity/erase2",sizeY:21,sizeZ:14,showboundingbox:1b}
setblock 141 0 101 minecraft:structure_block[mode=save]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"NONE",posX:1,mode:"SAVE",posY:0,sizeX:35,posZ:0,integrity:1.0f,showair:0b,name:"calamity:calamity/erase3",sizeY:48,sizeZ:48,showboundingbox:1b}
setblock 141 1 101 minecraft:structure_block[mode=save]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"NONE",posX:1,mode:"SAVE",posY:47,sizeX:35,posZ:0,integrity:1.0f,showair:0b,name:"calamity:calamity/erase4",sizeY:21,sizeZ:48,showboundingbox:1b}
setblock 141 0 149 minecraft:structure_block[mode=save]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"NONE",posX:1,mode:"SAVE",posY:0,sizeX:35,posZ:0,integrity:1.0f,showair:0b,name:"calamity:calamity/erase5",sizeY:48,sizeZ:48,showboundingbox:1b}
setblock 141 1 149 minecraft:structure_block[mode=save]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"NONE",posX:1,mode:"SAVE",posY:47,sizeX:35,posZ:0,integrity:1.0f,showair:0b,name:"calamity:calamity/erase6",sizeY:21,sizeZ:48,showboundingbox:1b}

# Mirroring structure blocks
# Right side
setblock 131 0 87 minecraft:structure_block[mode=load]{metadata:"",mirror:"LEFT_RIGHT",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"CLOCKWISE_180",posX:-1,mode:"LOAD",posY:0,sizeX:35,posZ:0,integrity:1.0f,showair:0b,name:"calamity:calamity/erase1",sizeY:48,sizeZ:14,showboundingbox:1b}
setblock 131 1 87 minecraft:structure_block[mode=load]{metadata:"",mirror:"LEFT_RIGHT",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"CLOCKWISE_180",posX:-1,mode:"LOAD",posY:47,sizeX:35,posZ:0,integrity:1.0f,showair:0b,name:"calamity:calamity/erase2",sizeY:21,sizeZ:14,showboundingbox:1b}
setblock 131 0 101 minecraft:structure_block[mode=load]{metadata:"",mirror:"LEFT_RIGHT",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"CLOCKWISE_180",posX:-1,mode:"LOAD",posY:0,sizeX:35,posZ:0,integrity:1.0f,showair:0b,name:"calamity:calamity/erase3",sizeY:48,sizeZ:48,showboundingbox:1b}
setblock 131 1 101 minecraft:structure_block[mode=load]{metadata:"",mirror:"LEFT_RIGHT",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"CLOCKWISE_180",posX:-1,mode:"LOAD",posY:47,sizeX:35,posZ:0,integrity:1.0f,showair:0b,name:"calamity:calamity/erase4",sizeY:21,sizeZ:48,showboundingbox:1b}
setblock 131 0 149 minecraft:structure_block[mode=load]{metadata:"",mirror:"LEFT_RIGHT",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"CLOCKWISE_180",posX:-1,mode:"LOAD",posY:0,sizeX:35,posZ:0,integrity:1.0f,showair:0b,name:"calamity:calamity/erase5",sizeY:48,sizeZ:48,showboundingbox:1b}
setblock 131 1 149 minecraft:structure_block[mode=load]{metadata:"",mirror:"LEFT_RIGHT",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"CLOCKWISE_180",posX:-1,mode:"LOAD",posY:47,sizeX:35,posZ:0,integrity:1.0f,showair:0b,name:"calamity:calamity/erase6",sizeY:21,sizeZ:48,showboundingbox:1b}

# Crosslane
# Save
setblock 131 0 179 minecraft:structure_block[mode=save]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"?",rotation:"NONE",posX:0,mode:"SAVE",posY:0,sizeX:11,posZ:1,integrity:1.0f,showair:0b,name:"calamity:calamity/erase7",sizeY:48,sizeZ:17,showboundingbox:1b}
setblock 131 1 179 minecraft:structure_block[mode=save]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"?",rotation:"NONE",posX:0,mode:"SAVE",posY:47,sizeX:11,posZ:1,integrity:1.0f,showair:0b,name:"calamity:calamity/erase8",sizeY:21,sizeZ:17,showboundingbox:1b}
# Load
setblock 131 3 179 minecraft:structure_block[mode=load]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"?",rotation:"NONE",posX:0,mode:"LOAD",posY:-3,sizeX:11,posZ:1,integrity:1.0f,showair:0b,name:"calamity:calamity/erase7",sizeY:48,sizeZ:17,showboundingbox:0b}
setblock 131 4 179 minecraft:structure_block[mode=load]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"?",rotation:"NONE",posX:0,mode:"LOAD",posY:44,sizeX:11,posZ:1,integrity:1.0f,showair:0b,name:"calamity:calamity/erase8",sizeY:21,sizeZ:17,showboundingbox:0b}

# In bounds data blocks
# data1
setblock 141 251 87 minecraft:structure_block[mode=save]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"",rotation:"NONE",posX:1,mode:"SAVE",posY:0,sizeX:35,posZ:0,integrity:1.0f,showair:0b,name:"calamity:calamity/erase_data1",sizeY:5,sizeZ:14,showboundingbox:1b}
# data2
setblock 141 251 101 minecraft:structure_block[mode=save]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"",rotation:"NONE",posX:1,mode:"SAVE",posY:0,sizeX:35,posZ:0,integrity:1.0f,showair:0b,name:"calamity:calamity/erase_data2",sizeY:5,sizeZ:48,showboundingbox:1b}
# data3
setblock 141 251 149 minecraft:structure_block[mode=save]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"",rotation:"NONE",posX:1,mode:"SAVE",posY:0,sizeX:35,posZ:0,integrity:1.0f,showair:0b,name:"calamity:calamity/erase_data3",sizeY:5,sizeZ:48,showboundingbox:1b}
# data4 (crosslane)
setblock 131 251 179 minecraft:structure_block[mode=save]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:1b,seed:0L,author:"?",rotation:"NONE",posX:0,mode:"SAVE",posY:0,sizeX:11,posZ:1,integrity:1.0f,showair:0b,name:"calamity:calamity/erase_data4",sizeY:5,sizeZ:17,showboundingbox:1b}
# data3 mirrored
setblock 131 251 149 minecraft:structure_block[mode=load]{metadata:"",mirror:"LEFT_RIGHT",ignoreEntities:1b,powered:0b,seed:0L,author:"",rotation:"CLOCKWISE_180",posX:-1,mode:"LOAD",posY:0,sizeX:35,posZ:0,integrity:1.0f,showair:0b,name:"calamity:calamity/erase_data3",sizeY:5,sizeZ:48,showboundingbox:1b}
# data2 mirrored
setblock 131 251 101 minecraft:structure_block[mode=load]{metadata:"",mirror:"LEFT_RIGHT",ignoreEntities:1b,powered:0b,seed:0L,author:"",rotation:"CLOCKWISE_180",posX:-1,mode:"LOAD",posY:0,sizeX:35,posZ:0,integrity:1.0f,showair:0b,name:"calamity:calamity/erase_data2",sizeY:5,sizeZ:48,showboundingbox:1b}
# data5 (red spawn)
setblock 95 251 87 minecraft:structure_block[mode=load]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"?",rotation:"NONE",posX:1,mode:"LOAD",posY:0,sizeX:35,posZ:0,integrity:1.0f,showair:0b,name:"calamity:calamity/erase_data5",sizeY:5,sizeZ:14,showboundingbox:1b}

# Lobby
# Save structure blocks
setblock 117 34 26 minecraft:structure_block[mode=save]{metadata: "", mirror: "NONE", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "?", rotation: "NONE", posX: 0, mode: "SAVE", posY: 1, sizeX: 39, posZ: 0, integrity: 1.0f, showair: 0b, name: "calamity:calamity/erase_lobby1", sizeY: 33, sizeZ: 48, showboundingbox: 1b}
setblock 117 34 74 minecraft:structure_block[mode=save]{metadata: "", mirror: "NONE", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "?", rotation: "NONE", posX: 0, mode: "SAVE", posY: 1, sizeX: 39, posZ: 0, integrity: 1.0f, showair: 0b, name: "calamity:calamity/erase_lobby2", sizeY: 33, sizeZ: 5, showboundingbox: 1b}
# Load structure blocks
setblock 117 33 26 minecraft:structure_block[mode=load]{metadata: "", mirror: "NONE", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "?", rotation: "NONE", posX: 0, mode: "LOAD", posY: 2, sizeX: 39, posZ: 0, integrity: 1.0f, showair: 0b, name: "calamity:calamity/erase_lobby1", sizeY: 33, sizeZ: 48, showboundingbox: 1b}
setblock 117 33 74 minecraft:structure_block[mode=load]{metadata: "", mirror: "NONE", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "?", rotation: "NONE", posX: 0, mode: "LOAD", posY: 2, sizeX: 39, posZ: 0, integrity: 1.0f, showair: 0b, name: "calamity:calamity/erase_lobby2", sizeY: 33, sizeZ: 5, showboundingbox: 1b}
# Big logo
setblock 109 67 74 minecraft:structure_block[mode=save]{metadata: "", mirror: "NONE", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "Moesh", rotation: "NONE", posX: 0, mode: "SAVE", posY: 2, sizeX: 48, posZ: 0, integrity: 1.0f, showair: 0b, name: "calamity:calamity/erase_logo1", sizeY: 12, sizeZ: 7, showboundingbox: 1b}
setblock 157 67 74 minecraft:structure_block[mode=save]{metadata: "", mirror: "NONE", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "Moesh", rotation: "NONE", posX: 0, mode: "SAVE", posY: 2, sizeX: 7, posZ: 0, integrity: 1.0f, showair: 0b, name: "calamity:calamity/erase_logo2", sizeY: 12, sizeZ: 7, showboundingbox: 1b}


