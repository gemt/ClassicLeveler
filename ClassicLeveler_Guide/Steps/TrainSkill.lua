--[[
PlaceAction(actionbarindex)
ClearCursor()

bookType String - Either BOOKTYPE_SPELL ("spell") or BOOKTYPE_PET ("pet").
]]
CLGuide_PlaceSpellQueue = {}
-- automatically finds the highest rank of the spell
function CLGuide_GetSpellBookId(spellname)
    local a = 1
    local b = GetSpellName(a, "BOOKTYPE_SPELL")
    local c = nil
    while b do
	    if b == spellname and GetSpellName(a+1, "BOOKTYPE_SPELL") ~= spellname then 
            c = a
		end
        a = a + 1
        b = GetSpellName(a, "BOOKTYPE_SPELL")
	end
	return c
end    


function CLGuide_PlaceSpell(spellname, actionBarIndex)
    local spellIdx = CLGuide_GetSpellBookId(spellname)
    if spellIdx == nil then 
        GuidePrint("CLGuide_PlaceSpell spell <"..spellname.."> not found.")
        return 
    end
    ClearCursor()
    PickupSpell(spellIdx, "BOOKTYPE_SPELL")
    PlaceAction(actionBarIndex)
    ClearCursor()
end


local function OnTrainerShow()
    -- setting filters such that we don't see unavailable spells (cheaper), 
    -- but do see already trained skills (indexes wont change after we train a spell
    SetTrainerServiceTypeFilter("available", 1);
    SetTrainerServiceTypeFilter("unavailable", 0);
    SetTrainerServiceTypeFilter("used", 1);
    CLGuide_AssertOnClassic("check return values of GetTrainerServiceInfo(). After 4.x it did not return rank anymore")
    
    for spellIdx=1, GetNumTrainerServices() do
        if GetTrainerServiceCost(spellIdx) < GetMoney() then
            local name, rank, category, expanded = GetTrainerServiceInfo(spellIdx)
            name = string.lower(name)
            rank = string.lower(rank)
            if category == "available" then
                for gidx = 1, getn(CLGuide_CurrentStepTable.TrainSkill) do
                    local stepskill = CLGuide_CurrentStepTable.TrainSkill[gidx]
                    if string.lower(stepskill.n) == name then
                        if stepskill.r == nil or string.lower(stepskill.r) == rank then
                            BuyTrainerService(spellIdx)
                            if stepskill.Actionbar ~= nil then
                                -- queueing delayed placement on actionbars
                                table.insert(CLGuide_PlaceSpellQueue, {Spell=stepskill,Time=GetTime()+2})
                            end
                            table.remove(CLGuide_CurrentStepTable.TrainSkill, gidx)
                            break;
                        end
                    end
                end
            end
        end
    end
    
    GuidePrint("Could not train the following spells:")

    for gidx = 1, getn(CLGuide_CurrentStepTable.TrainSkill) do
        if CLGuide_CurrentStepTable.TrainSkill[gidx].r ~= nil then
            GuidePrint("    "..CLGuide_CurrentStepTable.TrainSkill[gidx].n.." ("..CLGuide_CurrentStepTable.TrainSkill[gidx].r..")")
        else
            GuidePrint("    "..CLGuide_CurrentStepTable.TrainSkill[gidx].n)
        end
    end
    CLGuide_CompleteCurrentStep()
end

function CLGuide_TrainSkillOnUpdate()
    for i=getn(CLGuide_PlaceSpellQueue), 1, -1 do
        if GetTime() > CLGuide_PlaceSpellQueue[i].Time then
            CLGuide_PlaceSpell(CLGuide_PlaceSpellQueue[i].Spell.n, CLGuide_PlaceSpellQueue[i].Spell.Actionbar)
            table.remove(CLGuide_PlaceSpellQueue,i)
        end
    end
end

function CLGuide_TrainSkill()
    if CLGuide_CurrentStepTable.TrainSkill == nil then return end
    if IsShiftKeyDown() then return end

    if event == "GOSSIP_SHOW" then
        local trainerIndex = CLGuide_GetGossipIndex("trainer")
        if trainerIndex ~= nil then
            SelectGossipOption(trainerIndex)
        end
    elseif event == "TRAINER_SHOW" then
        OnTrainerShow()
    end
end