
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
                for gidx = 1, getn(CLGuide_CurrentStep.TrainSkill) do
                    if string.lower(CLGuide_CurrentStep.TrainSkill[gidx].n) == name 
                    and string.lower(CLGuide_CurrentStep.TrainSkill[gidx].r) == rank then
                        BuyTrainerService(spellIdx)
                        table.remove(CLGuide_CurrentStep.TrainSkill, gidx)
                        break;
                    end
                end
            end
        end
    end
    
    GuidePrint("Could not train the following spells:")
    for gidx = 1, getn(CLGuide_CurrentStep.TrainSkill) do
        GuidePrint("    "..CLGuide_CurrentStep.TrainSkill[gidx].n.." ("..CLGuide_CurrentStep.TrainSkill[gidx].r..")")
    end
    CLGuide_CompleteCurrentStep()
end


function CLGuide_TrainSkill()
    if CLGuide_CurrentStep.TrainSkill == nil then return end
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