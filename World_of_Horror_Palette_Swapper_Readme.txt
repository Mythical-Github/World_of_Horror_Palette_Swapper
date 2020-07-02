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

Step 6: Name the palette
Step 7: Open "World of Horror Custom Palette.fx" and find the list of palette names.
Step 8: Find an unused slot and edit your name in
Step 9: find the corresponding palette (if you replaced WoH Palette 25 you can search for "WoH Palette 25" to find it.
Step 10: Replace the color values to match the given pattern using the values you obtained then modified in Step 5.
Step 11: Save your "World of Horror Custom Palette.fx" and replace the one in your World of Horror install if you were editing a backup
Step 12: Launch the game and enjoy your new custom palette!

How to add a palette to the list in this release:
Step 1: Follow steps 1-6 of "How to Create a New Palette"
Step 2: Send me the name of the palette and the values from Step 5 on discord (𝓜𝔂𝓽𝓱𝓲𝓬𝓪𝓵#4914) (pictures preferred)
Step 3) Wait for new release to see your palette in the official list!

Credits:
Thanks to Crosire for his work on ReShade and the plugin(s) I based this off of.
Thanks to Dae for his help tracking down that float bug! 
Thanks to RacWade for their Hacker and October color palettes
