# Godot LightmapGI Tests

The project consists of several test scenes to verify the correctness of LightmapGI generation and display, as well as the lighting of dynamic objects through LightmapProbes.

3D objects are imported directly from .blend files that have been made in Blender 4.0, so "filesystem/import/blender/enabled" (Project Settings) and "filesystem/import/blender/blender_path" (Editor Settings) are required to open the project.

## Test 01

![](https://raw.githubusercontent.com/patwork/Godot-LightmapGI-Tests/master/scenes/test01/screen.jpg)

The scene includes two blocks composed of several smaller adjacent pieces. The green block consists of 11 elements of different heights. The pink block consists of 12 identical cubes.

When the lightmap is baked, the seams between the objects of which the blocks are composed become visible.

The scene is lit using only the WorldEnvironment with ProceduralSkyMaterial. For better visibility Background Energy Multiplayer is increased to 2.


## Test 02

![](https://raw.githubusercontent.com/patwork/Godot-LightmapGI-Tests/master/scenes/test02/screen.jpg)

The scene is used to verify the correct lighting of dynamic objects by LightmapProbes. The animation changes the position of objects so that they fall within the range of different probes, both those outside and inside the pink box.

The "One mesh" element is a single object, while "Separate meshes" is a group of independent objects.

The scene is lit using only WorldEnvironment with ProceduralSkyMaterial set. Probes are generated with Subdiv set to 16.


## Test 03

![](https://raw.githubusercontent.com/patwork/Godot-LightmapGI-Tests/master/scenes/test03/screen.jpg)

The scene is used to verify the existence of lightmaps leaks after baking. Each of the four boxes has a different geometry. The first is a simple cube with normals pointing inward. The second consists of six separate cubes touching but not overlapping. The third consists of separate cubes but overlapping. The fourth is made up of separate cubes spaced apart so that they touch only with their edges.

Using the buttons in the lower right corner, you can switch between the cameras inside each box.

The scene is lit only with WorldEnvironment with Clear Color set. Ambient Light and Reflected Light are Disabled. For better effect, the image is brightened in Tonemap with Exposure set to 5.


## Test 04

![](https://raw.githubusercontent.com/patwork/Godot-LightmapGI-Tests/master/scenes/test04/screen.jpg)

The scene is used to verify the generation of lightmaps of objects consisting of single walls. Each of the three boxes was created from a single cube with the front face removed. The first box has the material with cull mode set to back and normals pointing inside. The second box has material with cull mode off and normals pointing outside. The third box differs from the second only in that its material has an additional transparency set to 50%. In the middle of each box is a model with glowing material due to emission energy at 5.

The scene is lit using WorldEnvironment with Clear Color set. Ambient Light and Reflected Light are Disabled. The image is brightened in Tonemap with Exposure set to 3. In addition, the scene is lit with DirectionalLight3D with Bake Mode set to Static. Lightmap denoising is disabled.


## Status
- Test 01
  - Godot 4.3-dev4 (failed)
- Test 02
  - Godot 4.3-dev4 (failed)
- Test 03
  - Godot 4.3-dev4 (failed)
- Test 04
  - Godot 4.3-dev4 (failed)
