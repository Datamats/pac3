local PART = {}

PART.ClassName = "sprite"

pac.StartStorableVars()
	pac.GetSet(PART, "SizeX", 1)
	pac.GetSet(PART, "SizeY", 1)
	pac.GetSet(PART, "Size", 1)
	pac.GetSet(PART, "Color", Vector(255, 255, 255))
	pac.GetSet(PART, "Alpha", 1)
	pac.GetSet(PART, "SpritePath", "sprites/grip")
pac.EndStorableVars()

function PART:SetColor(v)
	self.ColorC = self.ColorC or Color(255, 255, 255, 255)
	
	self.ColorC.r = v.r
	self.ColorC.g = v.g
	self.ColorC.b = v.b
	
	self.Color = v
end

function PART:SetAlpha(n)
	self.ColorC = self.ColorC or Color(255, 255, 255, 255)
	
	self.ColorC.a = n * 255
	
	self.Alpha = n
end

function PART:Initialize()
	self:SetSpritePath(self.SpritePath)
end

function PART:SetSpritePath(var)
	self:SetMaterial(var)
end

function PART:SetMaterial(var)
	if type(var) == "string" then
		self.Sprite = Material(var)
	elseif type(var) == "IMaterial" then
		self.Sprite = var
	end

	self.SpritePath = var
end

function PART:OnDraw(owner, pos, ang)
	if self.Sprite then
		render.SetMaterial(self.Sprite)
		render.DrawSprite(pos, self.SizeX * self.Size, self.SizeY * self.Size, self.ColorC)
	end
end

function PART:OnRestore(data)
	self:SetMaterial(data.SpritePath)
end

pac.RegisterPart(PART)