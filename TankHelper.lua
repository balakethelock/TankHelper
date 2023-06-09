--         --------------------------------
--        |  Configuration                 |
--         --------------------------------

-- font
local font_size       = 14;

--         --------------------------------
--        |  Don't edit below              |
--         --------------------------------

tankhelperframe = CreateFrame("Frame","tankhelperframe",UIParent)

local backdrop = {
			edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
			bgFile = "Interface/Tooltips/UI-Tooltip-Background",
			tile="false",
			tileSize="8",
			edgeSize="8",
			insets={
				left="2",
				right="2",
				top="2",
				bottom="2"
			}
	}

-- Frame
tankhelperframe:SetWidth(160); tankhelperframe:SetHeight(50);
tankhelperframe:SetMovable(1); tankhelperframe:EnableMouse(1); tankhelperframe:EnableMouseWheel(1);
tankhelperframe:SetPoint("CENTER", UIParent, "CENTER", -100, -100);
tankhelperframe:SetFrameStrata("BACKGROUND")
tankhelperframe:SetBackdrop(backdrop)
tankhelperframe:SetBackdropColor(0,0,0,1)

-- Events
tankhelperframe:RegisterEvent("ADDON_LOADED")
tankhelperframe:RegisterEvent("PLAYER_ENTERING_WORLD");
tankhelperframe:RegisterEvent("UNIT_ATTACK_POWER");
tankhelperframe:RegisterEvent("UNIT_AURA")
tankhelperframe:RegisterEvent("PLAYER_TARGET_CHANGED")

tankhelperframe:SetScript("OnEvent", function() Stats_OnEvent(event, arg1) end)

tankhelperframe:SetScript("OnMouseDown", function() tankhelperframe:StartMoving() end);
tankhelperframe:SetScript("OnMouseUp", function() tankhelperframe:StopMovingOrSizing() end);
tankhelperframe:SetScript("OnDragStop", function() tankhelperframe:StopMovingOrSizing() end);



local mobstats = tankhelperframe:CreateFontString();
mobstats:SetFontObject(GameFontNormal);
mobstats:SetPoint("Topleft", tankhelperframe, "Topleft", 2, -3);
mobstats:SetJustifyH("LEFT")
mobstats:SetJustifyV("TOP")

local font, size, flags = GameFontNormal:GetFont();
mobstats:SetFont(font, font_size, "OUTLINE");


function Stats_OnEvent()
if(UnitCanAttack("player", "target")) then

	--Swing damage
	lowDmg, hiDmg, offlowDmg, offhiDmg, posBuff, negBuff, percentmod = UnitDamage("target");
	swingdamage = "|cffFFFFFFSwing:"..floor(lowDmg).."-"..ceil(hiDmg);
	duelwield = offlowDmg;
	swingstring = swingdamage;
	if (duelwield > 1) then -- warns when a mob is a duel wielder
		swingstring = swingdamage.." |cffFF0000DW!";
	end
	
	--Attack power
	base, buff, debuff = UnitAttackPower("target");
	currentap = base + buff + debuff;
	baseap = base;
	apstring = "|cffFFFFFFAP: "..currentap.."/"..baseap;
	if (currentap >= baseap - 100) then -- warns when mob current ap is too close to base ap (crude way of saying demo shout is not up)
		apstring = "|cffFFFFFFAP: |cffFF0000"..currentap.."|cffFFFFFF/"..baseap.." |cffFF0000DEMO!";
	end
	
	--Attack Speed
	mainSpeed = UnitAttackSpeed("target");
	currentas = string.format("%.2f", mainSpeed);
	speedstring = "|cffFFFFFFAS: "..currentas;
	
	--Estimated DPS
	dpscalc = floor(lowDmg*0.5/mainSpeed + hiDmg*0.5/mainSpeed)
	
	--Print combined text
	mobstats:SetText(swingstring.."\n"..apstring.."\n"..speedstring.." | DPS: "..dpscalc);
else mobstats:SetText(" "); --if not targeting an enemy mob, print nothing.
end
end