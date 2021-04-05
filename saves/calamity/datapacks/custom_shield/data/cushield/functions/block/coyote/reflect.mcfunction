#tagging for reflect
execute unless score @s cush.cy.ref.ty matches 0 run tag @s add cushield.reflect
execute if score @s cush.cy.ref.ty matches 1 run tag @s add cushield.reflect.arrow
execute if score @s cush.cy.ref.ty matches 2 run tag @s add cushield.reflect.spectral

#reflecting
function cushield:blocked/reflect/do