
SWEP.Base								= "w9k"

SWEP.Category							= "W9K"
SWEP.Spawnable							= true

--
-- Weapon configuration
--
SWEP.PrintName							= "Colt M1911"
SWEP.Slot								= 1

--
-- Appearance
--
SWEP.ViewModel				= "models/w9k/m1911/viewmodel.mdl"
SWEP.WorldModel				= "models/weapons/s_dmgf_co1911.mdl"
SWEP.ViewModelFOVBase		= 74
SWEP.UseHands				= true

-- Sound
SWEP.ShootSound							= ")weapons/dmg_colt1911/deagle-1.wav"
SWEP.ShootSound_Level					= 80
SWEP.ShootAmb_Level						= 160
SWEP.ShootAmbInt						= "weapons/pistol/pistol_fire3.wav"
SWEP.ShootAmbExt						= ")w9k/fesiug/distant_pistol.ogg"

-- Recoil
SWEP.RecoilUp							= 2 -- degrees punched
SWEP.RecoilUpDrift						= 0.5 -- how much will be smooth recoil
SWEP.RecoilUpDecay						= 10 -- how much recoil to remove per second
SWEP.RecoilSide							= 4 -- degrees punched, in either direction (-100% to 100%)
SWEP.RecoilSideDrift					= 0.3 -- how much will be smooth recoil
SWEP.RecoilSideDecay					= 10 -- how much recoil to remove per second
SWEP.RecoilFlipChance					= ( 1 / 3 ) -- chance to flip recoil direction
SWEP.RecoilADSMult						= ( 1 / 3 ) -- multiply shot recoil by this amount when ads'd

-- Spread
SWEP.SpreadHip							= 1 -- spread from the hip
SWEP.SpreadSight						= 0 -- spread in sights
SWEP.SpreadMoving						= 2 -- spread when normal walking
SWEP.SpreadSprint						= 5 -- spread when running
SWEP.SpreadShot							= 0.5 -- spread per shot
SWEP.SpreadShotDecay					= 6 -- how much to deaay per second
SWEP.SpreadShotDelay					= 0.04 -- time before spread decays after shot
SWEP.SpreadShotSight					= ( 2 / 3 ) -- multiply shot spread by this amount when ads'd

-- Damage
SWEP.DamageNear							= 35
SWEP.DamageFar							= 25
SWEP.RangeNear							= 15
SWEP.RangeFar							= 30

-- Ability
SWEP.Primary.ClipSize					= 7
SWEP.Primary.Ammo						= "pistol"
SWEP.Firemodes = {
	{
		Count = 1,
		Delay = ( 60 / 450 ),
		PostBurstDelay = 0,
	}
}

SWEP.IronSights = {
	Pos = Vector(-2.6004, -1.3877, 1.189) * 1.33337,
	Ang = Angle(0.3756, -0.0032, 0.103),
	Mag = 1.1,
}

SWEP.RunPose = {
	Pos = Vector(3.444, -7.823, -6.27) * 1.33337,
	Ang = Angle(60.695, 0, 0),
}

-- Thirdperson
SWEP.TPAnim_Reload						= ACT_HL2MP_GESTURE_RELOAD_PISTOL
SWEP.TPAnim_Fire						= ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL
SWEP.HoldTypeHip						= "pistol"
SWEP.HoldTypeSight						= "revolver"
SWEP.HoldTypeSprint						= "normal"

SWEP.Animations = {
	["idle"] = {
		Source = ACT_VM_IDLE,
	},
	["draw"] = {
		Source = ACT_VM_DRAW,
	},
	["fire"] = {
		Source = ACT_VM_PRIMARYATTACK,
		Mult = 1,
	},
	["reload"] = {
		Source = ACT_VM_RELOAD,
		Mult = 1,
		StopSightTime = 1.6,
		LoadIn = 1.2,
	},
}