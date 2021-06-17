# Called from: calamity:generator/handler

#>--------------------------------------------------------------------------------------------------
#> Generate enchantments for your main hand item
#>--------------------------------------------------------------------------------------------------

# We're going to load the Enchant score early, and take it away if there is no valid item.
scoreboard players operation @a[tag=Enchant] captureScore += ScoreForEnchantedItem mapRules

# We've identified that a player is standing on a generator type called "Enchant". Now let's
#   check what item they are holding in their main hand. Then we'll enchant their mainhand
#   item right away.
tag @a[tag=Enchant] add CheckForValidItem

# Bow
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:bow", tag: {Enchantments: [{id: "minecraft:punch"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:bow"}}] minecraft:punch 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:bow", tag: {Enchantments: [{id: "minecraft:punch"}]}}}] remove CheckForValidItem

# Crossbow
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:crossbow", tag: {Enchantments: [{id: "minecraft:multishot"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:crossbow"}}] minecraft:multishot 1
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:crossbow", tag: {Enchantments: [{id: "minecraft:multishot"}]}}}] remove CheckForValidItem

# All axes
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_axe", tag: {Enchantments: [{id: "minecraft:sharpness"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:wooden_axe"}}] minecraft:sharpness 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_axe", tag: {Enchantments: [{id: "minecraft:sharpness"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_axe", tag: {Enchantments: [{id: "minecraft:sharpness"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:stone_axe"}}] minecraft:sharpness 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_axe", tag: {Enchantments: [{id: "minecraft:sharpness"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_axe", tag: {Enchantments: [{id: "minecraft:sharpness"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:golden_axe"}}] minecraft:sharpness 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_axe", tag: {Enchantments: [{id: "minecraft:sharpness"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_axe", tag: {Enchantments: [{id: "minecraft:sharpness"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:iron_axe"}}] minecraft:sharpness 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_axe", tag: {Enchantments: [{id: "minecraft:sharpness"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_axe", tag: {Enchantments: [{id: "minecraft:sharpness"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:diamond_axe"}}] minecraft:sharpness 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_axe", tag: {Enchantments: [{id: "minecraft:sharpness"}]}}}] remove CheckForValidItem

# All hoes
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_hoe", tag: {Enchantments: [{id: "minecraft:fortune"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:wooden_hoe"}}] minecraft:fortune 3
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_hoe", tag: {Enchantments: [{id: "minecraft:fortune"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_hoe", tag: {Enchantments: [{id: "minecraft:fortune"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:stone_hoe"}}] minecraft:fortune 3
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_hoe", tag: {Enchantments: [{id: "minecraft:fortune"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_hoe", tag: {Enchantments: [{id: "minecraft:fortune"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:golden_hoe"}}] minecraft:fortune 3
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_hoe", tag: {Enchantments: [{id: "minecraft:fortune"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_hoe", tag: {Enchantments: [{id: "minecraft:fortune"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:iron_hoe"}}] minecraft:fortune 3
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_hoe", tag: {Enchantments: [{id: "minecraft:fortune"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_hoe", tag: {Enchantments: [{id: "minecraft:fortune"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:diamond_hoe"}}] minecraft:fortune 3
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_hoe", tag: {Enchantments: [{id: "minecraft:fortune"}]}}}] remove CheckForValidItem

# All pickaxes
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_pickaxe", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:wooden_pickaxe"}}] minecraft:efficiency 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_pickaxe", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_pickaxe", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:stone_pickaxe"}}] minecraft:efficiency 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_pickaxe", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_pickaxe", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:golden_pickaxe"}}] minecraft:efficiency 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_pickaxe", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_pickaxe", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:iron_pickaxe"}}] minecraft:efficiency 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_pickaxe", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_pickaxe", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:diamond_pickaxe"}}] minecraft:efficiency 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_pickaxe", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] remove CheckForValidItem

# All shovels
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_shovel", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:wooden_shovel"}}] minecraft:efficiency 3
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_shovel", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_shovel", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:stone_shovel"}}] minecraft:efficiency 3
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_shovel", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_shovel", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:golden_shovel"}}] minecraft:efficiency 3
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_shovel", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_shovel", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:iron_shovel"}}] minecraft:efficiency 3
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_shovel", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_shovel", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:diamond_shovel"}}] minecraft:efficiency 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_shovel", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] remove CheckForValidItem

# Swords
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_sword", tag: {Enchantments: [{id: "minecraft:knockback"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:wooden_sword"}}] minecraft:knockback 1
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_sword", tag: {Enchantments: [{id: "minecraft:knockback"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_sword", tag: {Enchantments: [{id: "minecraft:knockback"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:stone_sword"}}] minecraft:knockback 1
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_sword", tag: {Enchantments: [{id: "minecraft:knockback"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_sword", tag: {Enchantments: [{id: "minecraft:knockback"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:golden_sword"}}] minecraft:knockback 1
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_sword", tag: {Enchantments: [{id: "minecraft:knockback"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_sword", tag: {Enchantments: [{id: "minecraft:knockback"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:iron_sword"}}] minecraft:knockback 1
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_sword", tag: {Enchantments: [{id: "minecraft:knockback"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_sword", tag: {Enchantments: [{id: "minecraft:knockback"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:diamond_sword"}}] minecraft:knockback 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_sword", tag: {Enchantments: [{id: "minecraft:knockback"}]}}}] remove CheckForValidItem

# All helmets
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:leather_helmet", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:leather_helmet"}}] minecraft:protection
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:leather_helmet", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:chainmail_helmet", tag: {Enchantments: [{id: "minecraft:thorns"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:chainmail_helmet"}}] minecraft:thorns 1
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:chainmail_helmet", tag: {Enchantments: [{id: "minecraft:thorns"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_helmet", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:iron_helmet"}}] minecraft:protection 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_helmet", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_helmet", tag: {Enchantments: [{id: "minecraft:blast_protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:golden_helmet"}}] minecraft:blast_protection 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_helmet", tag: {Enchantments: [{id: "minecraft:blast_protection"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_helmet", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:diamond_helmet"}}] minecraft:protection
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_helmet", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:netherite_helmet", tag: {Enchantments: [{id: "minecraft:fire_protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:netherite_helmet"}}] minecraft:fire_protection
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:netherite_helmet", tag: {Enchantments: [{id: "minecraft:fire_protection"}]}}}] remove CheckForValidItem

# All chestplates
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:leather_chestplate", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:leather_chestplate"}}] minecraft:protection
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:leather_chestplate", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:chainmail_chestplate", tag: {Enchantments: [{id: "minecraft:thorns"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:chainmail_chestplate"}}] minecraft:thorns 1
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:chainmail_chestplate", tag: {Enchantments: [{id: "minecraft:thorns"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_chestplate", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:iron_chestplate"}}] minecraft:protection 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_chestplate", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_chestplate", tag: {Enchantments: [{id: "minecraft:blast_protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:golden_chestplate"}}] minecraft:blast_protection 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_chestplate", tag: {Enchantments: [{id: "minecraft:blast_protection"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_chestplate", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:diamond_chestplate"}}] minecraft:protection
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_chestplate", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:netherite_chestplate", tag: {Enchantments: [{id: "minecraft:fire_protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:netherite_chestplate"}}] minecraft:fire_protection
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:netherite_chestplate", tag: {Enchantments: [{id: "minecraft:fire_protection"}]}}}] remove CheckForValidItenchant

# All leggings
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:leather_leggings", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:leather_leggings"}}] minecraft:protection
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:leather_leggings", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:chainmail_leggings", tag: {Enchantments: [{id: "minecraft:thorns"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:chainmail_leggings"}}] minecraft:thorns 1
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:chainmail_leggings", tag: {Enchantments: [{id: "minecraft:thorns"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_leggings", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:iron_leggings"}}] minecraft:protection 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_leggings", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_leggings", tag: {Enchantments: [{id: "minecraft:blast_protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:golden_leggings"}}] minecraft:blast_protection 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_leggings", tag: {Enchantments: [{id: "minecraft:blast_protection"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_leggings", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:diamond_leggings"}}] minecraft:protection
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_leggings", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:netherite_leggings", tag: {Enchantments: [{id: "minecraft:fire_protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:netherite_leggings"}}] minecraft:fire_protection
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:netherite_leggings", tag: {Enchantments: [{id: "minecraft:fire_protection"}]}}}] remove CheckForValidItem

# All boots
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:leather_boots", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:leather_boots"}}] minecraft:protection
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:leather_boots", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:chainmail_boots", tag: {Enchantments: [{id: "minecraft:thorns"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:chainmail_boots"}}] minecraft:thorns 1
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:chainmail_boots", tag: {Enchantments: [{id: "minecraft:thorns"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_boots", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:iron_boots"}}] minecraft:protection 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_boots", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_boots", tag: {Enchantments: [{id: "minecraft:blast_protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:golden_boots"}}] minecraft:blast_protection 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_boots", tag: {Enchantments: [{id: "minecraft:blast_protection"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_boots", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:diamond_boots"}}] minecraft:protection
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_boots", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:netherite_boots", tag: {Enchantments: [{id: "minecraft:fire_protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:netherite_boots"}}] minecraft:fire_protection
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:netherite_boots", tag: {Enchantments: [{id: "minecraft:fire_protection"}]}}}] remove CheckForValidItem

# ItemAlreadyEnchanted tag means the player is holding an item that already has the enchantment its trying to apply. Advise them.
tellraw @a[tag=ItemAlreadyEnchanted] {"translate":"calamity.generator.enchantedItem.alreadyEnchanted","color": "gray","italic": true}
tag @a remove ItemAlreadyEnchanted

# A player still has the Enchant tag, but does not have the CheckForValidItem tag. This means they
#   were holding a valid item and are now holding an enchanted item.
# Let the player know they got an enchanted item
tellraw @a[tag=Enchant,tag=!CheckForValidItem] {"translate":"calamity.generator.enchantedItem.valid","color": "gray","italic": true,"with":[{"translate":"calamity.enchanted.item","color":"white"}]}
# Announce it to the server
execute if entity @a[tag=Enchant,tag=!CheckForValidItem,team=blue] run tellraw @a {"translate":"calamity.generator.enchantedItem.announced","color":"blue","with":[{"translate":"calamity.enchanted.item","color":"white"},{"translate":"team.blue"},{"translate":"b","color":"blue","font": "calamity:icons"}]}
execute if entity @a[tag=Enchant,tag=!CheckForValidItem,team=red] run tellraw @a {"translate":"calamity.generator.enchantedItem.announced","color":"red","with":[{"translate":"calamity.enchanted.item","color":"white"},{"translate":"team.red"},{"translate":"r","color": "red","font": "calamity:icons"}]}

execute as @a[tag=Enchant] run playsound calamity:generator.enchantment master @a ~ ~ ~ 0.5 0.5
execute as @a[tag=Enchant,team=blue] run playsound calamity:calamity.announcer.enchanted.item master @a[team=red] ~ ~ ~ 500
execute as @a[tag=Enchant,team=red] run playsound calamity:calamity.announcer.enchanted.item master @a[team=blue] ~ ~ ~ 500

# If the CheckForValidItem tag has survived on a player this far down, then we are sure they are
#   not holding a valid item to enchant. Let's give them nothing. This isn't a charity!
#   IT'S CALAMITY!
tellraw @a[tag=Enchant,tag=CheckForValidItem] {"translate":"calamity.generator.enchantedItem.invalid","color": "gray","italic": true}
execute if entity @a[tag=Enchant,tag=CheckForValidItem,team=blue] run tellraw @a {"translate":"system.message","with":[{"translate":"calamity.generator.enchantedItem.announced.invalid","color":"blue","with":[{"translate":"team.blue"},{"translate":"b","color":"blue","font": "calamity:icons"}]}]}
execute if entity @a[tag=Enchant,tag=CheckForValidItem,team=red] run tellraw @a {"translate":"system.message","with":[{"translate":"calamity.generator.enchantedItem.announced.invalid","color":"red","with":[{"translate":"team.red"},{"translate":"r","color": "red","font": "calamity:icons"}]}]}
# Make sure the player doesn't get any score for this
scoreboard players set @a[tag=Enchant,tag=CheckForValidItem] captureScore 0
tag @a[tag=CheckForValidItem] remove Enchant
tag @a[tag=CheckForValidItem] remove CheckForValidItem

# Finally, finally remove this tag
tag @a[tag=Enchant] remove Enchant