local combat = Combat()
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
combat:setParameter(COMBAT_PARAM_CREATEITEM, 2128)

function onCastSpell(creature, variant, isHotkey)
	if checkSpellCd(creature, 101098, 2) == false then return false end
	return combat:execute(creature, variant)
end