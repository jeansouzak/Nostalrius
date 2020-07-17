local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onCastSpell(creature, variant)
	if checkSpellCd(creature, 101099, 1) == false then return false end
	creature:removeCondition(CONDITION_POISON)
	return combat:execute(creature, variant)
end
