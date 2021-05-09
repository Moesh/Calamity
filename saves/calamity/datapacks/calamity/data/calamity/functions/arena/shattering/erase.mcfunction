# Called from: calamity:arena/handler

#>--------------------------------------------------------------------------------------------------
#> Purpose: Load world blocks
#>--------------------------------------------------------------------------------------------------

# Place the structure blocks
setblock 138 0 89 minecraft:structure_block[mode=load]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"?",rotation:"NONE",posX:0,mode:"LOAD",posY:1,sizeX:48,posZ:0,integrity:1.0f,showair:0b,name:"calamity:shattering/erase1",sizeY:48,sizeZ:48,showboundingbox:1b} 
setblock 138 0 137 minecraft:structure_block[mode=load]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"?",rotation:"NONE",posX:0,mode:"LOAD",posY:1,sizeX:48,posZ:0,integrity:1.0f,showair:0b,name:"calamity:shattering/erase2",sizeY:48,sizeZ:7,showboundingbox:1b}
setblock 186 0 89 minecraft:structure_block[mode=load]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"?",rotation:"NONE",posX:0,mode:"LOAD",posY:1,sizeX:18,posZ:0,integrity:1.0f,showair:0b,name:"calamity:shattering/erase3",sizeY:48,sizeZ:48,showboundingbox:1b}
setblock 186 0 137 minecraft:structure_block[mode=load]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"?",rotation:"NONE",posX:0,mode:"LOAD",posY:1,sizeX:18,posZ:0,integrity:1.0f,showair:0b,name:"calamity:shattering/erase4",sizeY:48,sizeZ:7,showboundingbox:1b}
setblock 137 0 143 minecraft:structure_block[mode=load]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"?",rotation:"CLOCKWISE_180",posX:0,mode:"LOAD",posY:1,sizeX:48,posZ:0,integrity:1.0f,showair:0b,name:"calamity:shattering/erase1",sizeY:48,sizeZ:48,showboundingbox:1b}
setblock 137 0 95 minecraft:structure_block[mode=load]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"?",rotation:"CLOCKWISE_180",posX:0,mode:"LOAD",posY:1,sizeX:48,posZ:0,integrity:1.0f,showair:0b,name:"calamity:shattering/erase2",sizeY:48,sizeZ:7,showboundingbox:1b}
setblock 89 0 143 minecraft:structure_block[mode=load]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"?",rotation:"CLOCKWISE_180",posX:0,mode:"LOAD",posY:1,sizeX:18,posZ:0,integrity:1.0f,showair:0b,name:"calamity:shattering/erase3",sizeY:48,sizeZ:48,showboundingbox:1b}
setblock 89 0 95 minecraft:structure_block[mode=load]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"?",rotation:"CLOCKWISE_180",posX:0,mode:"LOAD",posY:1,sizeX:18,posZ:0,integrity:1.0f,showair:0b,name:"calamity:shattering/erase4",sizeY:48,sizeZ:7,showboundingbox:1b}

# Place the redstone block
setblock 138 0 88 minecraft:redstone_block
setblock 138 0 136 minecraft:redstone_block
setblock 186 0 88 minecraft:redstone_block
setblock 186 0 136 minecraft:redstone_block
setblock 137 0 142 minecraft:redstone_block
setblock 137 0 94 minecraft:redstone_block
setblock 89 0 142 minecraft:redstone_block
setblock 89 0 94 minecraft:redstone_block

#>--------------------------------------------------------------------------------------------------
#> Purpose: Erase things
#>--------------------------------------------------------------------------------------------------

# Erase level loading
fill 138 0 88 138 0 89 minecraft:air
fill 138 0 136 138 0 137 minecraft:air
fill 186 0 88 186 0 89 minecraft:air
fill 186 0 136 186 0 137 minecraft:air
fill 137 0 142 137 0 143 minecraft:air
fill 137 0 94 137 0 95 minecraft:air
fill 89 0 142 89 0 143 minecraft:air
fill 89 0 94 89 0 95 minecraft:air

# Erase data structure blocks
setblock 89 50 143 minecraft:air
setblock 137 50 143 minecraft:air
setblock 138 50 137 minecraft:air
setblock 137 50 95 minecraft:air
setblock 138 50 89 minecraft:air
setblock 186 50 89 minecraft:air
setblock 186 50 137 minecraft:air

#> Purpose: Kill all entities and ensure items are left over
#IMPORTANT: This will kill any entity markers. Run before new markers are made.
function calamity:load/kill_entities