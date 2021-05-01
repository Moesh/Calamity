# Called from: #calamity:load, calamity:arena/handler

#>--------------------------------------------------------------------------------------------------
#> Purpose: Load world blocks
#>--------------------------------------------------------------------------------------------------

# Place the structure blocks
setblock 138 0 89 minecraft:structure_block[mode=load]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"?",rotation:"NONE",posX:0,mode:"LOAD",posY:1,sizeX:48,posZ:0,integrity:1.0f,showair:0b,name:"calamity:shattering/shattering1",sizeY:48,sizeZ:48,showboundingbox:1b} 
setblock 138 0 137 minecraft:structure_block[mode=load]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"?",rotation:"NONE",posX:0,mode:"LOAD",posY:1,sizeX:48,posZ:0,integrity:1.0f,showair:0b,name:"calamity:shattering/shattering2",sizeY:48,sizeZ:7,showboundingbox:1b}
setblock 186 0 89 minecraft:structure_block[mode=load]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"?",rotation:"NONE",posX:0,mode:"LOAD",posY:1,sizeX:18,posZ:0,integrity:1.0f,showair:0b,name:"calamity:shattering/shattering3",sizeY:48,sizeZ:48,showboundingbox:1b}
setblock 186 0 137 minecraft:structure_block[mode=load]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"?",rotation:"NONE",posX:0,mode:"LOAD",posY:1,sizeX:18,posZ:0,integrity:1.0f,showair:0b,name:"calamity:shattering/shattering4",sizeY:48,sizeZ:7,showboundingbox:1b}
setblock 137 0 143 minecraft:structure_block[mode=load]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"?",rotation:"CLOCKWISE_180",posX:0,mode:"LOAD",posY:1,sizeX:48,posZ:0,integrity:1.0f,showair:0b,name:"calamity:shattering/shattering1",sizeY:48,sizeZ:48,showboundingbox:1b}
setblock 137 0 95 minecraft:structure_block[mode=load]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"?",rotation:"CLOCKWISE_180",posX:0,mode:"LOAD",posY:1,sizeX:48,posZ:0,integrity:1.0f,showair:0b,name:"calamity:shattering/shattering2",sizeY:48,sizeZ:7,showboundingbox:1b}
setblock 89 0 143 minecraft:structure_block[mode=load]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"?",rotation:"CLOCKWISE_180",posX:0,mode:"LOAD",posY:1,sizeX:18,posZ:0,integrity:1.0f,showair:0b,name:"calamity:shattering/shattering3",sizeY:48,sizeZ:48,showboundingbox:1b}
setblock 89 0 95 minecraft:structure_block[mode=load]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"?",rotation:"CLOCKWISE_180",posX:0,mode:"LOAD",posY:1,sizeX:18,posZ:0,integrity:1.0f,showair:0b,name:"calamity:shattering/shattering4",sizeY:48,sizeZ:7,showboundingbox:1b}

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

fill 138 0 88 138 0 89 minecraft:air
fill 138 0 136 138 0 137 minecraft:air
fill 186 0 88 186 0 89 minecraft:air
fill 186 0 136 186 0 137 minecraft:air
fill 137 0 142 137 0 143 minecraft:air
fill 137 0 94 137 0 95 minecraft:air
fill 89 0 142 89 0 143 minecraft:air
fill 89 0 94 89 0 95 minecraft:air

#> Purpose: Kill all entities and ensure items are left over
#IMPORTANT: This will kill any entity markers. Run before new markers are made.
function calamity:load/kill_entities

#>--------------------------------------------------------------------------------------------------
#> Purpose: Define the map height
#>--------------------------------------------------------------------------------------------------

summon minecraft:area_effect_cloud 136 68 87 {CustomName: '{"text":"ArenaHeight"}', Tags: ["marker", "arenaHeight"], CustomNameVisible: 0b, Duration: 2147483647}
execute store result score #arenaHeight gameVariable run data get entity @e[type=minecraft:area_effect_cloud,tag=marker,tag=arenaHeight,limit=1] Pos[1]

#>--------------------------------------------------------------------------------------------------
#> Purpose: Place spawnpoint markers
#>--------------------------------------------------------------------------------------------------

summon minecraft:area_effect_cloud 101 13 116 {CustomName: '{"text":"LobbySpawnpoint"}', Tags: ["FacingSouth", "Spawnpoint"], CustomNameVisible: 0b, Duration: 2147483647, Rotation: [0.0f, 0.0f]}
summon minecraft:area_effect_cloud 198 13 116 {CustomName: '{"text":"BlueSpawnpoint"}', Tags: ["FacingSouth", "Spawnpoint"], CustomNameVisible: 0b, Duration: 2147483647, Rotation: [0.0f, 0.0f]}
summon minecraft:area_effect_cloud 77 13 115 {CustomName: '{"text":"RedSpawnpoint"}', Tags: ["FacingSouth", "Spawnpoint"], CustomNameVisible: 0b, Duration: 2147483647, Rotation: [0.0f, 0.0f]}

#>--------------------------------------------------------------------------------------------------
#> Purpose: Place generators
#>--------------------------------------------------------------------------------------------------

#> Lobby
# Blue team generators only appear on the blue lane
summon minecraft:area_effect_cloud 169 42 118 {CustomName: '{"text":"Generator"}', Tags: ["Point", "FacingWest", "TeamBlue", "Resource", "Scaffolding"], CustomNameVisible: 0b, Duration: 2147483647, Rotation: [90.0f, -0.0f]}


#>--------------------------------------------------------------------------------------------------
#> Purpose: Place main menu tables
#>--------------------------------------------------------------------------------------------------

