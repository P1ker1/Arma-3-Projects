class CfgPatches
{
	class TFV_FACES
	{
		author="P1ker1";
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
class CfgFaces
{
	class Default
	{
		class Custom;
	};
	class Man_A3: Default
	{
		class Default;
		class WhiteHead_01;
		class AfricanHead_01;
		class AsianHead_A3_01;
		class GreekHead_A3_01;
		class TanoanHead_A3_01;
		class Miller: Default
		{
			displayname="Miller";
			head="Miller";
			disabled=1;
			author="$STR_A3_Bohemia_Interactive";
		};
		class TanoanBossHead: TanoanHead_A3_01
		{
			author="$STR_A3_Bohemia_Interactive";
			displayName="Maru";
			disabled=0;
			DLC="Expansion";
		};

		class Kerry: Default
		{
			displayname="Kerry";
			head="KerryHead_A3";
			disabled=0;
			author="$STR_A3_Bohemia_Interactive";
		};
		class kerry_A_F: Kerry
		{
			displayname="Kerry (Copy)";
			head="KerryHead_A3";
			disabled=1;
			author="$STR_A3_Bohemia_Interactive";
		};
		class kerry_B1_F: Kerry
		{
			displayname="Kerry (2)";
			author="$STR_A3_Bohemia_Interactive";
			disabled=0;
		};
		class kerry_B2_F: Kerry
		{
			displayname="Kerry (3)";
			author="$STR_A3_Bohemia_Interactive";
			disabled=0;
		};
		class Kerry_C_F: Kerry
		{
			displayname="Kerry (4)";
			author="$STR_A3_Bohemia_Interactive";
			disabled=0;
		};
		class IG_Leader: Default
		{
			disabled=0;
			displayname="Stavrou";
			head="IG_Leader";
			author="$STR_A3_Bohemia_Interactive";
		};
		class O_Colonel: Default
		{
			disabled=0;
			displayname="Namdar";
			author="$STR_A3_Bohemia_Interactive";
			head="PersianHead_A3";
		};
		class Nikos: GreekHead_A3_01
		{
			displayname="Nikos";
			head="Nikos";
			disabled=0;
			author="$STR_A3_Bohemia_Interactive";
		};
		class TFVFACE_p1ker1_a3: WhiteHead_01
		{
			displayname="P1ker1";
			texture="TFV_FACES\data\P1ker1_co.paa";
			head="NATOHead_A3";
			identityTypes[]=
			{
				"Head_TFV"
			};
			author="P1ker1";
			material="\A3\Characters_F\Heads\Data\m_White_06.rvmat";
			materialWounded1="A3\Characters_F\Heads\Data\m_White_06_injury.rvmat";
			materialWounded2="A3\Characters_F\Heads\Data\m_White_06_injury.rvmat";
		};
		class TFVFACE_P1ker1_wl__a3: WhiteHead_01
		{
			displayname="P1ker1 (WL Camo)";
			texture="TFV_FACES\data\P1ker1_wl2_co.paa";
			head="NATOHead_A3";
			identityTypes[]=
			{
				"Head_TFV"
			};
			author="P1ker1";
			material="\TFV_FACES\data\P1ker1_camo.rvmat";
			materialWounded1="A3\Characters_F_Mark\Heads\Data\m_camo_White_06_injury.rvmat";
			materialWounded2="A3\Characters_F_Mark\Heads\Data\m_camo_White_06_injury.rvmat";
			textureHL="\A3\Characters_F\Heads\Data\hl_White_hairy_1_co.paa";
			materialHL="\A3\Characters_F\Heads\Data\hl_White_hairy_muscular.rvmat";
			textureHL2="\A3\Characters_F\Heads\Data\hl_White_hairy_1_co.paa";
			materialHL2="\A3\Characters_F\Heads\Data\hl_White_hairy_muscular.rvmat";
			DLC="Mark";
		};
	};
};
class CfgMusicClasses
{
	class UMC_yeet
	{
		displayName = "UMC - Unofficial Extras";
	};
};
class CfgMusic
{
	class chernaanthem
	{
		name = "Chernarussian anthem";
		sound[] = {"\TFV_FACES\data\audio\chernaanthem.ogg",1,1};
		duration = "128";
		musicClass = "UMC_yeet";
	};
	class indiansummer
	{
		name = "Indian Summer";
		sound[] = {"\TFV_FACES\data\audio\indiansummer.ogg",1,1};
		duration = "102";
		musicClass = "UMC_yeet";
	};
};