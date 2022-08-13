local RPlayer = debug.getregistry().Player 
local REntity = debug.getregistry().Entity 


function W9KBASE_StopEffects_LIB(msg) 
local PL = net.ReadEntity() 
local WEP = net.ReadEntity() 

if not IsValid(PL) then 
return
 
end 

local MODEL

if PL == LocalPlayer() and IsValid(PL:GetViewModel()) then 
MODEL = PL:GetViewModel() 
else 

MODEL = WEP 
end 

if IsValid(MODEL) then MODEL:StopParticles() 
end 
end 

net.Receive("W9KBASE_StopEffects", W9KBASE_StopEffects_LIB) 

function W9KBASE_WeaponEffect_LIB(msg) 
local weapon = net.ReadEntity() 
local effect = net.ReadString() 
local attach = net.ReadString() 
W9KBASEWeaponEffect2(weapon, effect, attach) 
end

net.Receive("W9KBASE_WeaponEffect", W9KBASE_WeaponEffect_LIB) 


function W9KBASEWeaponEffect2(weapon, effect, attach) 
local PL = LocalPlayer() 
local WModel = PL:GetViewModel() 
if IsValid(weapon) then 
local ID = WModel:LookupAttachment(attach or "Fire_Effects") 
local Att = WModel:GetAttachment(ID) 

if Att then 
ParticleEffectAttach( effect, PATTACH_POINT_FOLLOW, WModel, ID) 
local Pos = Att.Pos + PL:EyeAngles():Forward()*3 
local LightWork = false 
local IsFireFX = false 

if (weapon.MuzzleLight and weapon.MuzzleLight_Color and weapon.MuzzleLight_Brightness and weapon.MuzzleLight_Size) then 
LightWork = true 
end 

if string.find(effect,"FireFX") then 
IsFireFX = true 
end 

if LightWork and IsFireFX then 
CreateClientLight( Pos, 0.25, weapon.MuzzleLight_Color, weapon.MuzzleLight_Size, weapon.MuzzleLight_Brightness ) 
end 
end 
end 
end 

function W9KBASE_WorldEffect_LIB(msg) 
local weapon = net.ReadEntity() 
local effect = net.ReadString() 
local attach = net.ReadString() 
W9KBASEWorldEffect2(weapon, effect, attach) 
end 

net.Receive("W9KBASE_WorldEffect", W9KBASE_WorldEffect_LIB) 

function W9KBASEWorldEffect2(weapon, effect, attach) 
local PL = LocalPlayer() 
local WModel = weapon 
local Effect = effect 
local ATT = attach 

if IsValid(WModel) and WModel:GetOwner() == PL and not PL:ShouldDrawLocalPlayer() then 
return 
end 

if IsValid(WModel) then 
local ID = WModel:LookupAttachment( ATT ) 
local AT = WModel:GetAttachment( ID ) 

if AT 
then ParticleEffectAttach( Effect, PATTACH_POINT_FOLLOW, WModel, ID) 
local Pos = AT.Pos + WModel:GetForward()*5 
local LightWork = false 
local IsFireFX = false 

if (weapon.MuzzleLight and weapon.MuzzleLight_Color and weapon.MuzzleLight_Brightness and weapon.MuzzleLight_Size) then
LightWork = true 
end 

if string.find(effect,"FireFX") then 
IsFireFX = true 
end 

if LightWork and IsFireFX then 
CreateClientLight( Pos, 0.5, weapon.MuzzleLight_Color, weapon.MuzzleLight_Size, weapon.MuzzleLight_Brightness ) 
end 
end 
end 
end 


function W9KBASE_StopWorldEffect_LIB(msg) 
local weapon = net.ReadEntity() 
W9KBASEStopWorldEffect2(weapon) 
end 

net.Receive("W9KBASE_StopWorldEffect", W9KBASE_StopWorldEffect_LIB) 

function W9KBASEStopWorldEffect2(weapon) 
local PL = LocalPlayer() 
local WModel = weapon 

if IsValid(WModel) then 
WModel:StopParticles() 
end 
end 

function W9KBASE_Brass_LIB( um ) 
local Wep = net.ReadEntity() 
local EJPort = net.ReadFloat() 
local BrassType = net.ReadFloat() 
W9KBASEBrass2( Wep, EJPort, BrassType ) 
end 

net.Receive("W9KBASE_Brass",W9KBASE_Brass_LIB) 

function W9KBASEBrass2( Wep, EJPort, BrassType ) 
local Brass = EffectData() 
Brass:SetEntity(Wep) 
Brass:SetOrigin(LocalPlayer():GetShootPos()) 
Brass:SetAttachment(EJPort) 
Brass:SetScale(BrassType) 
util.Effect("W9KBASE_Brass",Brass) 
end 

function W9KBASE_WorldBrass_LIB( um ) 
local Wep = net.ReadEntity() 
local EJPort = net.ReadFloat() 
local BrassType = net.ReadFloat()

if not IsValid(Wep) then 
return 
end 

if Wep:GetOwner() == LocalPlayer() then 
return 
end 

local Brass = EffectData() 
Brass:SetEntity(Wep) 
Brass:SetOrigin(Wep:GetPos()) 
Brass:SetAttachment(EJPort) 
Brass:SetScale(BrassType) 
util.Effect("W9KBASE_Brass",Brass) 
end 

net.Receive("W9KBASE_WorldBrass",W9KBASE_WorldBrass_LIB) 

function ClientLightThink() 
local PL = LocalPlayer() 
local CT = UnPredictedCurTime()
 
if not PL.CL_Lights then
PL.CL_Lights = {} 
end 

local LightTable = PL.CL_Lights 
local ValidLights = 0 

for _,v in pairs (LightTable) do 
local LIGHT = v[1] 
local Bright = v[2] 
local DestroyTime = v[3] 
local DTTime = v[4] 
local RSize = v[5] 
local Time = (DTTime - CT) 
local MUL = (Time/DestroyTime) 
local BMul = (Bright*MUL) 
local SMul = (RSize*MUL) 

if ( LIGHT ) and SMul > 0 then 
ValidLights = ValidLights + 1 
LIGHT.Size = SMul LIGHT.Decay = 0.1 
end 
end 

if ValidLights <= 0 then 
PL.CL_Lights = {} 
end 
end 
