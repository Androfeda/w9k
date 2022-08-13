local RPlayer = debug.getregistry().Player 
local REntity = debug.getregistry().Entity 
util.AddNetworkString("W9KBASE_WeaponEffect") 
util.AddNetworkString("W9KBASE_StopEffects") 
util.AddNetworkString("W9KBASE_Brass") 
util.AddNetworkString("W9KBASE_BulletTracer") 
util.AddNetworkString("W9KBASE_WorldBrass") 
util.AddNetworkString("W9KBASE_WorldEffect") 
util.AddNetworkString("W9KBASE_WorldTracerEffect") 
util.AddNetworkString("W9KBASE_StopWorldEffect") 
AddCSLuaFile("autorun/W9KBASE_SH.lua") 
AddCSLuaFile("autorun/client/W9KBASE_CL.lua") 

