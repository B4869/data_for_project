# Vanilla Block Models
Although custom blocks are unable to make use of vanilla block shapes, Mojang provides several minecraft namespaced models that replicate their look!

 * HARDCODED
 Currently, vanilla block models are not data-driven, so cannot be modified nor found as JSON files in the vanilla resource pack.This also means that they are not compatible with the bone_visibility and culling parameters of the geometry component.

## Applying Vanilla Models ​
Vanilla block models are applied in the same way as custom block models, using the geometry component, with textures defined through material instances:

- Example Vanilla Models 
    minecraft:block > components

        "minecraft:geometry": "minecraft:geometry.full_block",
        "minecraft:material_instances": {
            "*": {
                "texture": "cobblestone"
            }
        }

- List of Vanilla Models ​

+------------------------------+-----------------------------------------------------------------------------------------------------------------------------+
| Identifier                   | Additional Notes                                                                                                           |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------+
| minecraft:geometry.cross     | When used on a block, ambient_occlusion and face_dimming should be set to false in any material instances.                 |
|                              |                                                                                                                             |
|                              | Before 1.21.70, this model should only be used with render methods that do not have backface culling                       |
|                              | (alpha_test and double_sided) to avoid invisible faces.                                                                    |
|                              |                                                                                                                             |
|                              | After 1.21.70, this model should only be used with render methods that have backface culling                              |
|                              | (alpha_test_single_sided, blend, and opaque) to avoid texture flickering.                                                 |
|                              |                                                                                                                             |
| minecraft:geometry.full_block | When used for a block with the opaque render method, faces of adjacent blocks will cull against the block.                |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------+




























































