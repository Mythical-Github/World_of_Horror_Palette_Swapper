
//	World of Horror Custom Palettes (version 1.0)
//	Author: 𝓜𝔂𝓽𝓱𝓲𝓬𝓪𝓵#4914
//	About: This is a custom ReShade filter made for easier creation of custom palettes for World of Horror

#include "ReShade.fxh"
#include "ReShadeUI.fxh"

#ifndef WoH_linear
	#define WoH_linear 1
#endif

uniform int WoH_color_reduction
<
	ui_type = "combo";
	ui_label = "On/Off Switch";
	//ui_tooltip = "On/Off Switch";
	//ui_category = "";
	ui_items = 
	"Off\0"
	"On\0"
	//"Quantize\0"
	;
> = 1;

uniform bool WoH_dither
<
	ui_label = "Palette Fix 1 (leave on usually)";
> = 1;

uniform int WoH_palette <
	ui_type = "combo";
	ui_label = "Palette";
	ui_tooltip = "Choose a palette";
	//ui_category = "";
	ui_items = 
	"Custom Palette\0"
	"Lavender\0"
	"Hacker\0"
	"October\0"
	"Watermelon\0"
	"Raspberry\0"
	"Green Tea\0"
	"Rusty\0"
	"Hoarfrost\0"
	"Mint Chip\0"
	"Cheddar\0"
	"Thunderstorm\0"
	"WoH palette 12\0"
	"WoH palette 13\0"
	"WoH palette 14\0"
	"WoH palette 15\0"
	"WoH palette 16\0"
	"WoH palette 17\0"
	"WoH palette 18\0"
	"WoH palette 19\0"
	"WoH palette 20\0"
	"WoH palette 21\0"
	"WoH palette 22\0"
	"WoH palette 23\0"
	"WoH palette 24\0"
	"WoH palette 25\0"
	"WoH palette 26\0"
	"WoH palette 27\0"
	"WoH palette 28\0"
	"WoH palette 29\0"
	"WoH palette 30\0"
	"WoH palette 31\0"
	"WoH palette 32\0"
	"WoH palette 33\0"
	"WoH palette 34\0"
	"WoH palette 35\0"
	"WoH palette 36\0"
	"WoH palette 37\0"
	"WoH palette 38\0"
	"WoH palette 39\0"
	"WoH palette 40\0"
	"WoH palette 41\0"
	"WoH palette 42\0"
	"WoH palette 43\0"
	"WoH palette 44\0"
	"WoH palette 45\0"
	"WoH palette 46\0"
	"WoH palette 47\0"
	"WoH palette 48\0"
	"WoH palette 49\0"
	"WoH palette 50\0"
	"WoH palette 51\0"
	"WoH palette 52\0"
	"WoH palette 53\0"
	"WoH palette 54\0"
	"WoH palette 55\0"
	"WoH palette 56\0"
	"WoH palette 57\0"
	"WoH palette 58\0"
	"WoH palette 59\0"
	"WoH palette 60\0"
	"WoH palette 61\0"
	"WoH palette 62\0"
	"WoH palette 63\0"
	"WoH palette 64\0"
	"WoH palette 65\0"
	"WoH palette 66\0"
	"WoH palette 67\0"
	"WoH palette 68\0"
	"WoH palette 69\0"
	"WoH palette 70\0"
	"WoH palette 71\0"
	"WoH palette 72\0"
	"WoH palette 73\0"
	"WoH palette 74\0"
	"WoH palette 75\0"
	"WoH palette 76\0"
	"WoH palette 77\0"
	"WoH palette 78\0"
	"WoH palette 79\0"
	"WoH palette 80\0"
	"WoH palette 81\0"
	"WoH palette 82\0"
	"WoH palette 83\0"
	"WoH palette 84\0"
	"WoH palette 85\0"
	"WoH palette 86\0"
	"WoH palette 87\0"
	"WoH palette 88\0"
	"WoH palette 89\0"
	"WoH palette 90\0"
	"WoH palette 91\0"
	"WoH palette 92\0"
	"WoH palette 93\0"
	"WoH palette 94\0"
	"WoH palette 95\0"
	"WoH palette 96\0"
	"WoH palette 97\0"
	"WoH palette 98\0"
	"WoH palette 99\0"
	"WoH palette 100";
> = 0;

uniform float3 WoH_color_0 < __UNIFORM_COLOR_FLOAT3
	ui_label = "Color 0";
	ui_category = "Custom palette";
> = float3(  0. ,   0. ,   0. ); //Black

uniform float3 WoH_color_1 < __UNIFORM_COLOR_FLOAT3
	ui_label = "Color 1";
	ui_category = "Custom palette"; > 
= float3(255. , 255. , 255. ) / 255.; //White

uniform float3 WoH_color_2 < __UNIFORM_COLOR_FLOAT3
	ui_label = "Color 2";
	ui_category = "Custom palette";
> = float3(192. ,   192. ,   192. ) / 255.; //Light Grey

uniform float3 WoH_color_3 < __UNIFORM_COLOR_FLOAT3
	ui_label = "Color 3";
	ui_category = "Custom palette";
> = float3(128. , 128. , 128. ) / 255.; //Dark Grey

/*
uniform bool WoH_linear
<
	ui_label = "Linear";
	//ui_category = "Color options";
> = 0;
*/

sampler Linear
{
	Texture = ReShade::BackBufferTex;
	SRGBTexture = true;
};

float3 PS_WoH(float4 vpos : SV_Position, float2 texcoord : TEXCOORD) : SV_Target
{
	float3 color;
	int colorCount = 4;

	#if WoH_linear == 1
		color = tex2D(Linear, texcoord.xy).rgb;
	#else
		color = tex2D(Linear, texcoord.xy).rgb;
	#endif
	

	if (WoH_color_reduction)
	{
		float3 palette[4] = //Custom Palette
		{
			WoH_color_0,
			WoH_color_1,
			WoH_color_2,
			WoH_color_3
		};

		if (WoH_palette == 1) //WoH palette 1//Lavender
		{
			palette[0] = float3(0,0,0);
			palette[1] = float3(0.890196078431373,0.117647058823529,0.376470588235294);
			palette[2] = float3(0.376470588235294,0.305882352941176,0.741176470588235);
			palette[3] = float3(1,0.266666666666667,0.992156862745098);
		}

		if (WoH_palette == 2) //WoH palette 2//Hacker
		{
			palette[0] 	= float3(0,0.874510,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0.443137,0);
			palette[3] 	= float3(0.062745,0.254902,0);
		}
	
		if (WoH_palette == 3) //WoH palette 3//October
		{
			palette[0] = float3(0.898039,0.458824,0);
			palette[1] = float3(0,0,0);
			palette[2] = float3(0.666667,0.333333,0);
			palette[3] = float3(0.223529,0,0.443137);
		}

		if (WoH_palette == 4) //WoH palette 4 //Watermelon
		{
			palette[0] = float3(0.121924,0.421569,0.139550);
			palette[1] = float3(0,0,0);
			palette[2] = float3(0,0,0);
			palette[3] = float3(0.632353,0.139490,0.139490);
		}

		if (WoH_palette == 5) //WoH palette 5 //Raspberry
		{
			palette[0] = float3(0.250000,0.025735,0.109835);
			palette[1] = float3(0,0,0);
			palette[2] = float3(0.929166,0.077953,0.077953);
			palette[3] = float3(0.702526,0.000000,0.078783);
		}
		
		if (WoH_palette == 6) //WoH palette 6 //Green Tea
		{
			palette[0] = float3(0,0,0);
			palette[1] = float3(0.318627,0.057790,0.265270);
			palette[2] = float3(0.446078,0.100586,0.222294);
			palette[3] = float3(0.045776,0.622549,0.229294);
		}
		
		if (WoH_palette == 7) //WoH palette 7 //Rusty
		{
			palette[0] = float3(0,0,0);
			palette[1] = float3(0.831005,0.223662,0.135356);
			palette[2] = float3(0.671146,0.335573,0);
			palette[3] = float3(0.784314,0.370836,0.084583);
		}
		
		if (WoH_palette == 8) //WoH palette 8 //Smurfy
		{
			palette[0] = float3(0.000000,0.484330,0.617647);
			palette[1] = float3(0.241134,0.041450,0.563725);
			palette[2] = float3(0.132858,0.137180,0.279412);
			palette[3] = float3(0,0,0);
		}
		
		if (WoH_palette == 9) //WoH palette 9// Mint Chip
		{
			palette[0] = float3(0.271863,0.943397,0.485789);
			palette[1] = float3(0.138673,0.357843,0.031574);
			palette[2] = float3(0.470588,0.252239,0.161476);
			palette[3] = float3(0,0,0);
		}
		
		if (WoH_palette == 10) //WoH palette 10// Cheddar
		{
			palette[0] = float3(0.764706,0.408422,0);
			palette[1] = float3(0.514706,0.075692,0.075692);
			palette[2] = float3(0.225490,0.022107,0.022107);
			palette[3] = float3(0.656863,0.135236,0.135236);
		}
		
		if (WoH_palette == 11) //WoH palette 11//Thunderstorm
		{
			palette[0] = float3(0.191553,0.290278,0.780976);
			palette[1] = float3(1.000000,0.634659,0.000000);
			palette[2] = float3(0.887011,0.035248,0.480701);
			palette[3] = float3(0.000100,0.000100,0.000100);
		}
		
		if (WoH_palette == 12) //WoH palette 12//
		{
			palette[0] = float3(0,0,0);
			palette[1] = float3(0,0,0);
			palette[2] = float3(0,0,0);
			palette[3] = float3(0,0,0);
		}
		
		if (WoH_palette == 13) //WoH palette 13//
		{
			palette[0] = float3(0,0,0);
			palette[1] = float3(0,0,0);
			palette[2] = float3(0,0,0);
			palette[3] = float3(0,0,0);
		}


		if (WoH_palette == 14) //WoH palette 14//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}
		
		
		if (WoH_palette == 15) //WoH palette 15//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 16) //WoH palette 16//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 17) //WoH palette 17//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 18) //WoH palette 18//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 19) //WoH palette 19//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 20) //WoH palette 20//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 21) //WoH palette 21//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 22) //WoH palette 22//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 23) //WoH palette 23//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 24) //WoH palette 24//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 25) //WoH palette 25//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}

		if (WoH_palette == 26) //WoH palette 26//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 27) //WoH palette 27//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 28) //WoH palette 28//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 29) //WoH palette 29//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 30) //WoH palette 30//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 31) //WoH palette 31//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 32) //WoH palette 32//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 33) //WoH palette 33//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 34) //WoH palette 34//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 35) //WoH palette 35//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 36) //WoH palette 36//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}

		if (WoH_palette == 37) //WoH palette 37//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 38) //WoH palette 38//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 39) //WoH palette 39//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 40) //WoH palette 40//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 41) //WoH palette 41//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 42) //WoH palette 42//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 43) //WoH palette 43//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 44) //WoH palette 44//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 45) //WoH palette 45//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 46) //WoH palette 46//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 47) //WoH palette 47//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}

		if (WoH_palette == 48) //WoH palette 48//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 49) //WoH palette 49//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 50) //WoH palette 50//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 51) //WoH palette 51//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 52) //WoH palette 52//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 53) //WoH palette 53//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 54) //WoH palette 54//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 55) //WoH palette 55//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 56) //WoH palette 56//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 57) //WoH palette 57/
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 58) //WoH palette 58//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}

		if (WoH_palette == 59) //WoH palette 59//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 60) //WoH palette 60//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 61) //WoH palette 61//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 62) //WoH palette 62//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 63) //WoH palette 63//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 64) //WoH palette 64//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 65) //WoH palette 65//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 66) //WoH palette 66//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 67) //WoH palette 67//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 68) //WoH palette 68//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 69) //WoH palette 69//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}

		if (WoH_palette == 70) //WoH palette 70//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 71) //WoH palette 71//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 72) //WoH palette 72//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 73) //WoH palette 73//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 74) //WoH palette 74//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 75) //WoH palette 75//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 76) //WoH palette 76//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 77) //WoH palette 77//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 78) //WoH palette 78//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 79) //WoH palette 79//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 80) //WoH palette 80//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}

		if (WoH_palette == 81) //WoH palette 81//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 82) //WoH palette 82//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 83) //WoH palette 83//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 84) //WoH palette 84//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 85) //WoH palette 85//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 86) //WoH palette 86//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 87) //WoH palette 87//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 88) //WoH palette 88//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 89) //WoH palette 89//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 90) //WoH palette 90//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 91) //WoH palette 91//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}

		if (WoH_palette == 92) //WoH palette 92//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 93) //WoH palette 93//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 94) //WoH palette 94//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 95) //WoH palette 95//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 96) //WoH palette 96//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 97) //WoH palette 97//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 98) //WoH palette 98//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_palette == 99) //WoH palette 99//
		{
			palette[0] 	= float3(0,0,0);
			palette[1] 	= float3(0,0,0);
			palette[2] 	= float3(0,0,0);
			palette[3] 	= float3(0,0,0);
		}


		if (WoH_dither == 1)
		{
			float grid_position = frac(dot(texcoord, BUFFER_SCREEN_SIZE * 0.5) + 0.25);
			float dither_shift = (0.25) * (1.0 / (pow(2,2.0) - 1.0));
			float3 dither_shift_RGB = float3(dither_shift, dither_shift, dither_shift);
			dither_shift_RGB = lerp(2.0 * dither_shift_RGB, -2.0 * dither_shift_RGB, grid_position);
			color.rgb += dither_shift_RGB;
		}
		
		float3 diff = color - palette[0];
		float dist = dot(diff,diff);
		float closest_dist = dist;
		float3 closest_color = palette[0];
		for (int i = 1 ; i < colorCount ; i++)
		{
			diff = color - palette[i];
		
			dist = dot(diff,diff);
		
			if (dist < closest_dist)
			{ 
				closest_dist = dist;
				closest_color = palette[i];
			}
		}
		
		color = closest_color;
	}
	
	return color;
}

technique WoH_Palette
{
	pass WoHPass
	{
		VertexShader = PostProcessVS;
		PixelShader = PS_WoH;
		
		#if WoH_linear == 1
			SRGBWriteEnable = true;
		#endif	
		
		ClearRenderTargets = false;
	}
}
