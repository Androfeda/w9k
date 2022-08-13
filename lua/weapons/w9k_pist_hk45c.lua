
SWEP.Base								= "w9k"

SWEP.Category							= "W9K"
SWEP.Spawnable							= true

--
-- Weapon configuration
--
SWEP.PrintName							= "H&K HK45C"
SWEP.Slot								= 1

--
-- Appearance
--
SWEP.ViewModel				= "models/weapons/v_pist_hk45.mdl"--"models/w9k/hk45c/viewmodel.mdl"
SWEP.WorldModel				= "models/weapons/w_sig_229r.mdl"
SWEP.ViewModelFOVBase		= 64
SWEP.UseHands				= false--true

-- Sound
SWEP.ShootSound							= ")w9k/weapons/hk45c/fire.wav"
SWEP.ShootSound_Level					= 80
SWEP.ShootAmb_Level						= 160
SWEP.ShootAmbInt						= "weapons/pistol/pistol_fire3.wav"
SWEP.ShootAmbExt						= ")w9k/fesiug/distant_pistol.ogg"

-- Recoil
SWEP.RecoilUp							= 2 -- degrees punched
SWEP.RecoilUpDrift						= 0.5 -- how much will be smooth recoil
SWEP.RecoilUpDecay						= 10 -- how much recoil to remove per second
SWEP.RecoilSide							= 4 -- degrees punched, in either direction (-100% to 100%)
SWEP.RecoilSideDrift					= 0.5 -- how much will be smooth recoil
SWEP.RecoilSideDecay					= 10 -- how much recoil to remove per second
SWEP.RecoilFlipChance					= ( 1 / 3 ) -- chance to flip recoil direction
SWEP.RecoilADSMult						= ( 1 / 3 ) -- multiply shot recoil by this amount when ads'd

-- Damage
SWEP.DamageNear							= 35
SWEP.DamageFar							= 25
SWEP.RangeNear							= 15
SWEP.RangeFar							= 30

-- Ability
SWEP.Primary.ClipSize					= 8
SWEP.Primary.Ammo						= "pistol"
SWEP.Firemodes = {
	{
		Count = 1,
		Delay = ( 60 / 450 ),
		PostBurstDelay = 0,
	}
}




SWEP.IronSights = {
	Pos = Vector(-2.32, 0, 0.86),
	Ang = Angle(0, 0, 0),
	Mag = 1.1,
}

SWEP.RunPose = {
	Pos = Vector(3.444, -7.823, -6.27),
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
		Mult = 1.3,
		StopSightTime = 2.6,
		LoadIn = 1.7,
	},
}