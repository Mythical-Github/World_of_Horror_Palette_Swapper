# World_of_Horror_Palette_Swapper
A ReShade filter for adding and using alternative palettes in World of Horror
Made by Mythical
You can contact me via Discord at 𝓜𝔂𝓽𝓱𝓲𝓬𝓪𝓵#4914 to have me add your palettes in or for whatever other reason

Operating System Compatibility List:
Windows: Yes (Atleast 7 and up)
Linux: Yes (requires WINE)
Mac: No (Reshade isn't compatible with Mac)

How to Install:
Step 1: Download World_of_Horror_Palette_Swapper
Step 2: locate your World of Horror .exe file
Step 3: Place the files you downloaded where your World of Horror .exe is located (there are some extra files placed for optimal feng shui
Step 4: Boot the game
Step 5: Hit the Home key to toggle the menu. (You can change the key in the menu settings)
Step 6: Enjoy your new palettes!

How to Create a New Palette:
Step 1: Already have installed World_of_Horror_Palette_Swapper
Step 2: with the palette labelled "Custom Palette" enabled modify the color values (I suggest setting them all to black and working from there)
Step 3: Once you've found a combination you like go to your World of Horror .exe location and open the "DefaultPreset.ini"
Step 4: Copy the values under "[World of Horror Custom Palettes.fx]" to a separate location, then you can close World of Horror and the "DefaultPreset.ini"

Example (before):
WoH_color_0=0.000000,0.000000,0.000000
WoH_color_1=1.000000,1.000000,1.000000
WoH_color_2=0.752941,0.752941,0.752941
WoH_color_3=0.501961,0.501961,0.501961

Step 5: Modify these to look like so

Example (after):
(0.000000,0.000000,0.000000);
(1.000000,1.000000,1.000000);
(0.752941,0.752941,0.752941);
(0.501961,0.501961,0.501961);

Step 6:

Credits:
Thanks to Crosire for his work on ReShade and the plugin(s) I based this off of.
Thanks to Dae for his help tracking down that float bug! 
