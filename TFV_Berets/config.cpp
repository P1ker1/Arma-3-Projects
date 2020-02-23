class CfgPatches
{
	class TFV_BERETS
	{
		author="TFV";
		hideName=0;
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"A3_Characters_F",
			"A3_Characters_F_beta",
			"A3_Characters_F_epa",
			"A3_Characters_F_epb",
			"A3_Characters_F_epc",
			"A3_Characters_F_exp"
		};
	};
};
class CfgWeapons
{
	class H_Beret_Colonel;
	class TFV_Beret_Black: H_Beret_Colonel
	{
		author = "P1ker1";
		displayname = "Beret (TFV / Black)";
		picture = "\A3\characters_f_EPB\BLUFOR\Data\UI\icon_H_beret02_ca.paa";
		model = "\A3\Characters_F_EPB\BLUFOR\headgear_beret02";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\TFV_BERETS\data\tfvberet_black_ca.paa"};
		mass = 1;
		uniformModel = "\A3\Characters_F_EPB\BLUFOR\headgear_beret02";
		scope = 2
	};
	class TFV_Beret_Blue: H_Beret_Colonel
	{
		author = "P1ker1";
		displayname = "Beret (TFV / Blue)";
		picture = "\A3\characters_f_EPB\BLUFOR\Data\UI\icon_H_beret02_ca.paa";
		model = "\A3\Characters_F_EPB\BLUFOR\headgear_beret02";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\TFV_BERETS\data\tfvberet_blue_ca.paa"};
		mass = 1;
		uniformModel = "\A3\Characters_F_EPB\BLUFOR\headgear_beret02";
		scope = 2
	};
	class TFV_Beret_Blue2: H_Beret_Colonel
	{
		author = "P1ker1";
		displayname = "Beret (TFV / Blue2)";
		picture = "\A3\characters_f_EPB\BLUFOR\Data\UI\icon_H_beret02_ca.paa";
		model = "\A3\Characters_F_EPB\BLUFOR\headgear_beret02";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\TFV_BERETS\data\tfvberet_blue2_ca.paa"};
		mass = 1;
		uniformModel = "\A3\Characters_F_EPB\BLUFOR\headgear_beret02";
		scope = 2
	};
	class TFV_Beret_Black2: H_Beret_Colonel
	{
		author = "P1ker1";
		displayname = "Beret (TFV / Black2)";
		picture = "\A3\characters_f_EPB\BLUFOR\Data\UI\icon_H_beret02_ca.paa";
		model = "\A3\Characters_F_EPB\BLUFOR\headgear_beret02";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\TFV_BERETS\data\tfvberet_black2_ca.paa"};
		mass = 1;
		uniformModel = "\A3\Characters_F_EPB\BLUFOR\headgear_beret02";
		scope = 2
	};
};
