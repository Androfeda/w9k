 EFFECT.Models = {} 
 EFFECT.Models[1] = { MDL = Model( "models/shells/shell_small.mdl" ), BGROUP = 0 } 
 EFFECT.Models[2] = { MDL = Model( "models/shells/shell_medium.mdl" ), BGROUP = 0 } 
 EFFECT.Models[3] = { MDL = Model( "models/shells/shell_large.mdl" ), BGROUP = 0 }  
 EFFECT.Models[4] = { MDL = Model( "models/shells/trenchgun_shell.mdl" ), BGROUP = 0 } 
 EFFECT.Sounds = {} EFFECT.Sounds[1] = { Pitch = 100, Wavs = { "Magenta/Casing/Bullet_Casing1.wav", "Casing/Bullet_Casing2.wav", "Casing/Bullet_Casing3.wav", "Casing/Bullet_Casing4.wav" } } 
 EFFECT.Sounds[2] = { Pitch = 80, Wavs = { "Casing/Bullet_Casing1.wav", "Casing/Bullet_Casing2.wav", "Casing/Bullet_Casing3.wav", "Casing/Bullet_Casing4.wav" } } 
 EFFECT.Sounds[3] = { Pitch = 70, Wavs = { "Casing/Bullet_Casing1.wav", "Casing/Bullet_Casing2.wav", "Casing/Bullet_Casing3.wav", "Casing/Bullet_Casing4.wav" } } 
 EFFECT.Sounds[4] = { Pitch = 55, Wavs = { "Casing/Bullet_Casing1.wav", "Casing/Bullet_Casing2.wav", "Casing/Bullet_Casing3.wav", "Casing/Bullet_Casing4.wav" } } 
 EFFECT.Skins = {} 
 EFFECT.Skins[1] = false 
 EFFECT.Skins[2] = false 
 EFFECT.Skins[3] = false 
 EFFECT.Skins[4] = false 
 EFFECT.Scales = {} 
 EFFECT.Scales[1] = 0.55 
 EFFECT.Scales[2] = 0.6 
 EFFECT.Scales[3] = 0.4 
 EFFECT.Scales[4] = 0.55 
 EFFECT.Effects = {} 
 EFFECT.Effects[1] = "Weaponry_ShellSmoke" 
 EFFECT.Effects[2] = "Weaponry_ShellSmoke_Medium" 
 EFFECT.Effects[3] = "Weaponry_ShellSmoke_Large" 
 EFFECT.Effects[4] = "Weaponry_ShellSmoke_Large" 
 EFFECT.Blur = {} 
 EFFECT.Blur[1] = true 
 EFFECT.Blur[2] = true 
 EFFECT.Blur[3] = true 
 EFFECT.Blur[4] = true 
 local W9KBASEBrassLife = CreateClientConVar( "W9K_BrassLifeTime", 15, true, false ) function EFFECT:Init( data ) if not IsSB() then return end local Bullet_Type = data:GetScale() self.Bullet_Type = Bullet_Type if not IsValid( data:GetEntity() ) then self:SetModel( "models/shells/shell_small.mdl" ) self.RemoveMe = true return end self.Scale = self.Scales[Bullet_Type] if self.Skins[Bullet_Type] then self:SetSkin( self.Skins[Bullet_Type] ) end if data:GetEntity():GetOwner() != LocalPlayer() then self.Scale = self.Scale*1.25 end self.GotoScale_Delay = CurTime() + 0.32 self.GotoScale = self.Scale*1.25 local angle, pos = self:GetBulletEjectPos( data:GetOrigin(), data:GetEntity(), data:GetAttachment() ) local direction = angle:Forward() local ang = angle local pvel = LocalPlayer():GetVelocity()*1 self:SetPos( pos ) self:SetModel( self.Models[Bullet_Type].MDL ) self:SetBodygroup( 0, self.Models[Bullet_Type].BGROUP ) self:PhysicsInitBox( Vector(-0.5,-0.5,-0.8), Vector(0.5,0.5,0.8) ) self:SetRenderMode( RENDERMODE_TRANSALPHA ) self:SetCollisionGroup( COLLISION_GROUP_WORLD ) self:SetCollisionBounds( Vector( -10, -10, -10 ), Vector( 10, 10, 10 ) ) local phys = self:GetPhysicsObject() if IsValid( phys ) then phys:Wake() phys:SetMass(0.01) phys:SetDamping( 1.85, 2.1 ) phys:SetVelocity( direction * math.random( 100, 150 ) + pvel ) phys:AddAngleVelocity( ( VectorRand() * 1000 ) ) phys:SetMaterial( "gmod_silent" ) end local SAng = Angle(0,0,0) SAng = Angle(0,90,0) self:SetAngles( ang + SAng ) self.HitSound = table.Random( self.Sounds[Bullet_Type].Wavs ) self.HitPitch = self.Sounds[Bullet_Type].Pitch + math.random(-5,5) self.SoundTime = CurTime() + 0.2 self.LifeTime = CurTime() + W9KBASEBrassLife:GetFloat() self.Alpha = 255 if self.Effects[Bullet_Type] then ParticleEffectAttach( self.Effects[Bullet_Type], PATTACH_ABSORIGIN_FOLLOW, self, 0 ) end end function EFFECT:GetBulletEjectPos( Position, Ent, Attachment ) if (!Ent:IsValid()) then return Angle(), Position end if (!Ent:IsWeapon()) then return Angle(), Position end if ( Ent:IsCarriedByLocalPlayer() && GetViewEntity() == LocalPlayer() ) then local ViewModel = LocalPlayer():GetViewModel() if ( ViewModel:IsValid() ) then local att = ViewModel:GetAttachment( Attachment ) if ( att ) then return att.Ang, att.Pos end end end return Angle(), Position end function EFFECT:Think( ) if self.RemoveMe then return false end local CT = CurTime() if not self.Alpha then self.Alpha = 255 end if self.SoundTime and CT >= self.SoundTime then local TR = {} TR.start = self:GetPos() TR.endpos = self:GetPos() - Vector(0,0,10) TR.filter = self TR.mask = MASK_PLAYERSOLID TR.mins = Vector(-0.5,-0.5,-0.8) TR.maxs = Vector(0.5,0.5,0.8) local Trace = util.TraceHull(TR) if Trace.Hit then self.SoundTime = nil local RAND = math.random(-2,2) sound.Play( self.HitSound, self:GetPos(), 70, self.HitPitch + RAND, 1 ) else self.SoundTime = CT + 0.075 end end if self.LifeTime and CT >= self.LifeTime then self.Alpha = math.Clamp(( self.Alpha or 255 ) - 2,0,255) self:SetColor( Color(255, 255, 255, self.Alpha) ) end return self.Alpha > 0 end local mat = Material("sprites/heatwave") function EFFECT:Render() local CT = CurTime() local RFT = RealFrameTime() if self.Scale then if self.GotoScale_Delay and CT >= self.GotoScale_Delay and self.Scale < self.GotoScale then self.Scale = math.Clamp( self.Scale + RFT*0.4, 0, self.GotoScale ) end self:SetModelScale( self.Scale, 0 ) end if self.Blur[self.Bullet_Type] then local BLENDVELOCITY = math.Clamp( (self:GetVelocity():Length()/100)*2.5, 0, (self.Scale*2.5)) self:SetMaterial("") self:SetModelScale( self.Scale, 0 ) self:DrawModel() self:SetMaterial("sprites/heatwave") self:SetModelScale( self.Scale*BLENDVELOCITY, 0 ) self:DrawModel() self:SetMaterial("") self:SetModelScale( self.Scale, 0 ) else self:DrawModel() end end
 
-- Hey there, You've unpacked this gma.
-- For what purpose? I don't know, I can't read your mind, As much as id'e like to.
-- Past the point, you shouldn't be in here, I really don't like it when people decompile my work.

--fuck you magenta as much as i hate you i like your particle effects and the way you have written this ejection effect