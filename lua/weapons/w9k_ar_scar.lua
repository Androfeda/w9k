
SWEP.Base								= "w9k"

SWEP.Category							= "W9K"
SWEP.Spawnable							= true

--
-- Weapon configuration
--
SWEP.PrintName							= "FN SCAR-H"
SWEP.Slot								= 2

--
-- Appearance
--
SWEP.ViewModel				= "models/weapons/v_fnscarh.mdl"
SWEP.WorldModel				= "models/weapons/w_fn_scar_h.mdl"
SWEP.ViewModelFOVBase		= 74

-- Sound
SWEP.ShootSound							= {
	"w9k/weapons/scar/fire1.wav",
	"w9k/weapons/scar/fire2.wav",
	"w9k/weapons/scar/fire3.wav"
}
SWEP.ShootSound_Level					= 80
SWEP.ShootAmb_Level						= 160
SWEP.ShootAmbInt						= "weapons/pistol/pistol_fire3.wav"
SWEP.ShootAmbExt						= "w9k/fesiug/distant_rifle.ogg"

-- Recoil
SWEP.RecoilUp							= 2 -- degrees punched
SWEP.RecoilUpDrift						= 0.8 -- how much will be smooth recoil
SWEP.RecoilUpDecay						= 20 -- how much recoil to remove per second
SWEP.RecoilSide							= 3 -- degrees punched, in either direction (-100% to 100%)
SWEP.RecoilSideDrift					= 0.8 -- how much will be smooth recoil
SWEP.RecoilSideDecay					= 20 -- how much recoil to remove per second
SWEP.RecoilFlipChance					= ( 1 / 7 ) -- chance to flip recoil direction
SWEP.RecoilADSMult						= ( 1 / 3 ) -- multiply shot recoil by this amount when ads'd

-- Spread
SWEP.SpreadHip							= 1 -- spread from the hip
SWEP.SpreadSight						= 0 -- spread in sights
SWEP.SpreadMoving						= 4 -- spread when normal walking
SWEP.SpreadSprint						= 5 -- spread when running
SWEP.SpreadShot							= 0.5 -- spread per shot
SWEP.SpreadShotDecay					= 6 -- how much to deaay per second
SWEP.SpreadShotDelay					= 0.04 -- time before spread decays after shot
SWEP.SpreadShotSight					= ( 2 / 3 ) -- multiply shot spread by this amount when ads'd

-- Damage
SWEP.DamageNear							= 35
SWEP.DamageFar							= 22
SWEP.RangeNear							= 30
SWEP.RangeFar							= 100

-- Ability
SWEP.Primary.ClipSize					= 20
SWEP.Primary.Ammo						= "ar2"
SWEP.Firemodes = {
	{
		Count = math.huge,
		Delay = ( 60 / 625 ),
		PostBurstDelay = 0,
	},
	{
		Count = 1,
		Delay = ( 60 / 500 ),
		PostBurstDelay = 0,
	},
}

-- Thirdperson
SWEP.TPAnim_Reload						= ACT_HL2MP_GESTURE_RELOAD_AR2
SWEP.TPAnim_Fire						= ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.HoldTypeHip						= "ar2"
SWEP.HoldTypeSight						= "rpg"
SWEP.HoldTypeSprint						= "passive"

SWEP.IronSights = {
	Pos = Vector(-2.652, 0.187, -0.003),
	Ang = Angle(2.565, 0.034, 0),
	Mag = 1.3,
}

SWEP.RunPose = {
	Pos = Vector(6.063, -1.969, 0),
	Ang = Angle(-11.655, 57.597, 3.582),
}

SWEP.Animations = {
	["idle"] = {
		Source = ACT_VM_IDLE,
	},
	["fire"] = {
		Source = ACT_VM_PRIMARYATTACK,
	},
	["draw"] = {
		Source = ACT_VM_DRAW,
	},
	["reload"] = {
		Source = ACT_VM_RELOAD,
		Mult = 1,
		StopSightTime = 2.8,
		LoadIn = 2.2,
	},
}