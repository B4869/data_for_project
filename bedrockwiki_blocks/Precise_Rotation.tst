# Precise Rotation
 
 *FORMAT & MIN ENGINE VERSION 1.21.60
 This tutorial assumes an advanced understanding of blocks and scripting. Check out the blocks guide before starting.

This tutorial guides you through making a block with sub-cardinal rotation (e.g. creeper heads and signs), providing examples of a "shell" block with this rotation type.
Looking for regular rotation? Learn about it Rotatable Blocks!

Features:
 - Can be placed on the top of blocks, with 16 possible rotations
 - Can be placed on the side faces of blocks (north, east, south & west)
 - Rotation behaves the same as vanilla mob heads - without the performance hit from block entities!

## Block Model ​
To allow for more precise rotation, your block's model will need a few extra bones.

There are 4 bones required for precise ground rotation, 
each with different Y axis rotations:

- up_0 (Y rotation = 0)
- up_22_5 (Y rotation = 22.5)
- up_45 (Y rotation = 45)
- up_67_5 (Y rotation = 67.5)

These rotations are in a clockwise direction.
The bones will likely be duplicates of each other, excluding rotation change.

 * TIP
 Keep your bones' pivots set to [0, 0, 0] so that their rotation is around the middle of the block.

In addition, a side bone will be necessary for placement on side faces.
The following model for a "shell" block can be used as a reference:

- Example shell Model 
    RP/models/blocks/shell.geo.json
                
        {
            "format_version": "1.21.60",
            "minecraft:geometry": [
                {
                    "description": {
                        "identifier": "geometry.shell",
                        "texture_width": 16,
                        "texture_height": 16
                    },
                    "bones": [
                        {
                            "name": "shell",
                            "pivot": [0, 0, 0]
                        },
                        {
                            "name": "up_0",
                            "parent": "shell",
                            "pivot": [0, 0, 0],
                            "cubes": [
                                {
                                    "origin": [-3, 0, -3],
                                    "size": [6, 3, 6],
                                    "uv": {
                                        "north": { "uv": [0, 6], "uv_size": [6, 3] },
                                        "east": { "uv": [0, 6], "uv_size": [6, 3] },
                                        "south": { "uv": [0, 6], "uv_size": [6, 3] },
                                        "west": { "uv": [0, 6], "uv_size": [6, 3] },
                                        "up": { "uv": [6, 6], "uv_size": [-6, -6] },
                                        "down": { "uv": [6, 6], "uv_size": [-6, -6] }
                                    }
                                }
                            ]
                        },
                        {
                            "name": "up_22_5",
                            "parent": "shell",
                            "pivot": [0, 0, 0],
                            "rotation": [0, 22.5, 0],
                            "cubes": [
                                {
                                    "origin": [-3, 0, -3],
                                    "size": [6, 3, 6],
                                    "uv": {
                                        "north": { "uv": [0, 6], "uv_size": [6, 3] },
                                        "east": { "uv": [0, 6], "uv_size": [6, 3] },
                                        "south": { "uv": [0, 6], "uv_size": [6, 3] },
                                        "west": { "uv": [0, 6], "uv_size": [6, 3] },
                                        "up": { "uv": [6, 6], "uv_size": [-6, -6] },
                                        "down": { "uv": [6, 6], "uv_size": [-6, -6] }
                                    }
                                }
                            ]
                        },
                        {
                            "name": "up_45",
                            "parent": "shell",
                            "pivot": [0, 0, 0],
                            "rotation": [0, 45, 0],
                            "cubes": [
                                {
                                    "origin": [-3, 0, -3],
                                    "size": [6, 3, 6],
                                    "uv": {
                                        "north": { "uv": [0, 6], "uv_size": [6, 3] },
                                        "east": { "uv": [0, 6], "uv_size": [6, 3] },
                                        "south": { "uv": [0, 6], "uv_size": [6, 3] },
                                        "west": { "uv": [0, 6], "uv_size": [6, 3] },
                                        "up": { "uv": [6, 6], "uv_size": [-6, -6] },
                                        "down": { "uv": [6, 6], "uv_size": [-6, -6] }
                                    }
                                }
                            ]
                        },
                        {
                            "name": "up_67_5",
                            "parent": "shell",
                            "pivot": [0, 0, 0],
                            "rotation": [0, 67.5, 0],
                            "cubes": [
                                {
                                    "origin": [-3, 0, -3],
                                    "size": [6, 3, 6],
                                    "uv": {
                                        "north": { "uv": [0, 6], "uv_size": [6, 3] },
                                        "east": { "uv": [0, 6], "uv_size": [6, 3] },
                                        "south": { "uv": [0, 6], "uv_size": [6, 3] },
                                        "west": { "uv": [0, 6], "uv_size": [6, 3] },
                                        "up": { "uv": [6, 6], "uv_size": [-6, -6] },
                                        "down": { "uv": [6, 6], "uv_size": [-6, -6] }
                                    }
                                }
                            ]
                        },
                        {
                            "name": "side",
                            "parent": "shell",
                            "pivot": [0, 5, 8],
                            "rotation": [90, 0, 0],
                            "cubes": [
                                {
                                    "origin": [-3, 5, 8],
                                    "size": [6, 3, 6],
                                    "uv": {
                                        "north": { "uv": [0, 6], "uv_size": [6, 3] },
                                        "east": { "uv": [0, 6], "uv_size": [6, 3] },
                                        "south": { "uv": [0, 6], "uv_size": [6, 3] },
                                        "west": { "uv": [0, 6], "uv_size": [6, 3] },
                                        "up": { "uv": [6, 6], "uv_size": [-6, -6] },
                                        "down": { "uv": [6, 6], "uv_size": [-6, -6] }
                                    }
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    
## Initial Block JSON ​
Below is the base "shell" block we will be adding advanced rotation to.

- Example shell Block
    BP/blocks/shell.json

        {
            "format_version": "1.21.60",
            "minecraft:block": {
                "description": {
                    "identifier": "wiki:shell",
                    "menu_category": {
                        "category": "nature"
                    }
                },
                "components": {
                    // `up` face collision/selection boxes
                    "minecraft:collision_box": {
                        "origin": [-3, 0, -3],
                        "size": [6, 3, 6]
                    },
                    "minecraft:selection_box": {
                        "origin": [-3, 0, -3],
                        "size": [6, 3, 6]
                    },
                    "minecraft:material_instances": {
                        "*": {
                            "texture": "wiki:shell" // Shortname defined in `RP/textures/terrain_texture.json`
                        }
                    },
                    // Prevent block from being placed on `down` face
                    "minecraft:placement_filter": {
                        "conditions": [
                            {
                                "allowed_faces": ["up", "side"]
                            }
                        ]
                    }
                }
            }
        } ​

## Block States ​
For head-like rotation, you need to add 2 states to your block:

- Example shell States 
    minecraft:block

        "description": {
        ...
        "traits": {
            // Face block is placed on - default is `down` (which won't be accessible through placement)
            "minecraft:placement_position": {
            "enabled_states": ["minecraft:block_face"]
            }
        },
        "states": {
            // Precise rotation of block when placed on `up` face
            "wiki:rotation": {
            "values": { "min": 0, "max": 15 } // An alternative state value format to define larger integer ranges easily
            }
        }
        }

## Initial Script ​
Before we start writing our script, make sure you have it linked to your pack manifest by importing it into your entry file.

- Example Initial Script 1
    BP/scripts/main.js

        import "./shell.js";

Now, in our shell.js file, we need to import the world object from @minecraft/server:

- Example Initial Script 2
    BP/scripts/shell.js

        import { world } from "@minecraft/server";

## Rotation Calculation ​

Rather than manually typing bounds for each wiki:rotation value, you can use some division and rounding to return the values desired!
Add the following function to your script:

- Example Rotatable Calculation Shell 
    BP/scripts/shell.js

        /** @param {number} playerYRotation */
        function getPreciseRotation(playerYRotation) {
            // Transform player's head Y rotation to a positive
            if (playerYRotation < 0) playerYRotation += 360;
            // How many 16ths of 360 is the head rotation? - rounded
            const rotation = Math.round(playerYRotation / 22.5);

            // 0 and 16 represent duplicate rotations (0 degrees and 360 degrees), so 0 is returned if the value of `rotation` is 16
            return rotation !== 16 ? rotation : 0;
        }

## Setting Rotation ​
Time to use this function to set the block state you have added!
We will update our block state before the block is placed by using custom components and, more specifically, the beforeOnPlayerPlace hook. 
This means that, in our event handler, we have access to the player's rotation.
Add the following to your script to register a custom wiki:shell_rotation component:

 * TIP
 Think of a unique custom component identifier. There can't be duplicate custom components between packs!

- Example Setting Rotation shell
    BP/scripts/shell.js

        /** @type {import("@minecraft/server").BlockCustomComponent} */
        const ShellRotationBlockComponent = {
            beforeOnPlayerPlace(event) {
                const { player } = event;
                if (!player) return; // Exit if the player is undefined

                const blockFace = event.permutationToPlace.getState("minecraft:block_face");
                if (blockFace !== "up") return; // Exit if the block hasn't been placed on the top of another block

                // Get the rotation using the function from earlier
                const playerYRotation = player.getRotation().y;
                const rotation = getPreciseRotation(playerYRotation);

                // Tell Minecraft to place the correct `wiki:rotation` value
                event.permutationToPlace = event.permutationToPlace.withState("wiki:rotation", rotation);
            },
        };

        world.beforeEvents.worldInitialize.subscribe(({ blockComponentRegistry }) => {
            blockComponentRegistry.registerCustomComponent(
                "wiki:shell_rotation",
                ShellRotationBlockComponent
            );
        });

Now you can apply this custom component to your block!

- Example custom component block shell
    minecraft:block

        "components": {
        ...
        "minecraft:custom_components": ["wiki:shell_rotation"]
        }

## Rotation Permutations ​
Then, use permutations to define the base cardinal rotations which will be expanded by the precise bones in our model.
Insert the following permutations into your block JSON (in the presented order):

- Example Rotation Permutations 
    minecraft:block

        "permutations": [
        {
            "condition": "q.block_state('wiki:rotation') >= 4 || q.block_state('minecraft:block_face') == 'east'",
            "components": {
            "minecraft:transformation": { "rotation": [0, -90, 0] }
            }
        },
        {
            "condition": "q.block_state('wiki:rotation') >= 8 || q.block_state('minecraft:block_face') == 'south'",
            "components": {
            "minecraft:transformation": { "rotation": [0, 180, 0] }
            }
        },
        {
            "condition": "q.block_state('wiki:rotation') >= 12 || q.block_state('minecraft:block_face') == 'west'",
            "components": {
            "minecraft:transformation": { "rotation": [0, 90, 0] }
            }
        }
        ]

## Rotation Bone Visibility ​
Not all bones in your model should be visible, so we make use of the bone visibility minecraft:geometry property to ensure that only the required bones are rendered. The reason behind having multiple bones is that minecraft:transformation only supports multiples of 90 degrees, while precise rotation requires 22.5 degree steps.
Add the following component to your block:

- Example Rotation Bone Shell
    minecraft:block > components

        "minecraft:geometry": {
        "identifier": "geometry.shell", // Model created in first step
        "bone_visibility": {
            "up_0": "q.block_state('minecraft:block_face') == 'up' && math.mod(q.block_state('wiki:rotation'), 4) == 0",
            "up_22_5": "q.block_state('minecraft:block_face') == 'up' && math.mod(q.block_state('wiki:rotation'), 4) == 1",
            "up_45": "q.block_state('minecraft:block_face') == 'up' && math.mod(q.block_state('wiki:rotation'), 4) == 2",
            "up_67_5": "q.block_state('minecraft:block_face') == 'up' && math.mod(q.block_state('wiki:rotation'), 4) == 3",
            "side": "q.block_state('minecraft:block_face') != 'up'"
        }
        }

## Collision/Selection Boxes ​
If you would like your block to have a different collision/selection box when placed on the side of a block, as with my "shell" block, add something similar to this permutation:

- Example Collision Shell
    minecraft:block > permutations

        {
            "condition": "q.block_state('minecraft:block_face') != 'up'",
            "components": {
                // Add your collision/selection boxes
                "minecraft:collision_box": {
                    "origin": [-3, 5, 5],
                    "size": [6, 6, 3]
                },
                "minecraft:selection_box": {
                    "origin": [-3, 5, 5],
                    "size": [6, 6, 3]
                }
            }
        }

## Final Block JSON & Script ​
Your block JSON and script files after the above steps should look similar to those below:

- Example Shell Block JSON
    BP/blocks/shell.json

        {
            "format_version": "1.21.60",
            "minecraft:block": {
                "description": {
                    "identifier": "wiki:shell",
                    "menu_category": {
                        "category": "nature"
                    },
                    "traits": {
                        "minecraft:placement_position": {
                            "enabled_states": ["minecraft:block_face"]
                        }
                    },
                    "states": {
                        "wiki:rotation": {
                            "values": { "min": 0, "max": 15 }
                        }
                    }
                },
                "components": {
                    "minecraft:collision_box": {
                        "origin": [-3, 0, -3],
                        "size": [6, 3, 6]
                    },
                    "minecraft:selection_box": {
                        "origin": [-3, 0, -3],
                        "size": [6, 3, 6]
                    },
                    "minecraft:geometry": {
                        "identifier": "geometry.shell",
                        "bone_visibility": {
                            "up_0": "q.block_state('minecraft:block_face') == 'up' && math.mod(q.block_state('wiki:rotation'), 4) == 0",
                            "up_22_5": "q.block_state('minecraft:block_face') == 'up' && math.mod(q.block_state('wiki:rotation'), 4) == 1",
                            "up_45": "q.block_state('minecraft:block_face') == 'up' && math.mod(q.block_state('wiki:rotation'), 4) == 2",
                            "up_67_5": "q.block_state('minecraft:block_face') == 'up' && math.mod(q.block_state('wiki:rotation'), 4) == 3",
                            "side": "q.block_state('minecraft:block_face') != 'up'"
                        }
                    },
                    "minecraft:material_instances": {
                        "*": {
                            "texture": "wiki:shell"
                        }
                    },
                    "minecraft:placement_filter": {
                        "conditions": [
                            {
                                "allowed_faces": ["up", "side"]
                            }
                        ]
                    },
                    "minecraft:custom_components": ["wiki:shell_rotation"]
                },
                "permutations": [
                    {
                        "condition": "q.block_state('wiki:rotation') >= 4 || q.block_state('minecraft:block_face') == 'east'",
                        "components": {
                            "minecraft:transformation": { "rotation": [0, -90, 0] }
                        }
                    },
                    {
                        "condition": "q.block_state('wiki:rotation') >= 8 || q.block_state('minecraft:block_face') == 'south'",
                        "components": {
                            "minecraft:transformation": { "rotation": [0, 180, 0] }
                        }
                    },
                    {
                        "condition": "q.block_state('wiki:rotation') >= 12 || q.block_state('minecraft:block_face') == 'west'",
                        "components": {
                            "minecraft:transformation": { "rotation": [0, 90, 0] }
                        }
                    },
                    {
                        "condition": "q.block_state('minecraft:block_face') != 'up'",
                        "components": {
                            "minecraft:collision_box": {
                                "origin": [-3, 5, 5],
                                "size": [6, 6, 3]
                            },
                            "minecraft:selection_box": {
                                "origin": [-3, 5, 5],
                                "size": [6, 6, 3]
                            }
                        }
                    }
                ]
            }
        }

- Example Shell Script
    BP/scripts/shell.js

        import { world } from "@minecraft/server";

        /** @param {number} playerYRotation */
        function getPreciseRotation(playerYRotation) {
            if (playerYRotation < 0) playerYRotation += 360;
            const rotation = Math.round(playerYRotation / 22.5);

            return rotation !== 16 ? rotation : 0;
        }

        /** @type {import("@minecraft/server").BlockCustomComponent} */
        const ShellRotationBlockComponent = {
            beforeOnPlayerPlace(event) {
                const { player } = event;
                if (!player) return;

                const blockFace = event.permutationToPlace.getState("minecraft:block_face");
                if (blockFace !== "up") return;

                const playerYRotation = player.getRotation().y;
                const rotation = getPreciseRotation(playerYRotation);

                event.permutationToPlace = event.permutationToPlace.withState("wiki:rotation", rotation);
            },
        };

        world.beforeEvents.worldInitialize.subscribe(({ blockComponentRegistry }) => {
            blockComponentRegistry.registerCustomComponent(
                "wiki:shell_rotation",
                ShellRotationBlockComponent
            );
        });

