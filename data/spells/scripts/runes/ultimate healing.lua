local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
-- combat:setParameter(COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onGetFormulaValues(player, level, maglevel)
	return healingFormula(level, maglevel, 250, 0, 100)
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant, isHotkey)
	if checkSpellCd(creature, 101099, 1) == false then return false end
	local healed = variantToNumber(variant)
	local pos = variantToPosition(variant)
	local tile = Tile(pos)
	print(tile)
	doRemoveCondition(topCreature, CONDITION_PARALYZE) 	
	return combat:execute(topCreature, variant)
	
	
end