-- by andu from OTLand
-- Passive rune spells - 101099
-- Agressive rune spells - 101098
-- Agressive  instant spells - 101097
function getPlayerCd(cid, cooldownId)
    return getPlayerStorageValue(cid, cooldownId)-os.time()
end

function doPlayerSayCd(cid, cooldownId)
    local mini = ""
    local text = ""
    if getPlayerStorageValue(cid, cooldownId)-os.time() > 59 and getPlayerStorageValue(cid, cooldownId)-os.time() < 3600 then
        local saytime = math.ceil((getPlayerStorageValue(cid, cooldownId)-os.time())/60)
        if saytime ~= 1 then
            mini = "s"
        end
        
    elseif getPlayerStorageValue(cid, cooldownId)-os.time() > 3599 then
        local saytime = math.ceil((getPlayerStorageValue(cid, cooldownId)-os.time())/3600)
        if saytime ~= 1 then
            mini = "s"
        end
        
    else
        
    end
    doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
    return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, text)
end

function setPlayerCd(cid, cooldownId, value)
    if getPlayerAccess(cid) >= 4 then
        value = 0
    end
    return setPlayerStorageValue(cid, cooldownId, os.time()+value)
end

function checkSpellCd(cid, id, time)
    if getPlayerGroupId(cid) == 3 then
        return setPlayerCd(cid, id, time)    
    end
    if getPlayerCd(cid, id) > 0 then
        doPlayerSayCd(cid, id)
        return false
    end
    return setPlayerCd(cid, id, time)
end