function CLGuide_LevelReached()

end

--[[
/script local e=UnitXP("player"); local m=UnitXPMax("player"); local b=m/20; local rba=floor((e/b)*10+0.5)/10; local rbb=floor((20-(e/b))*10+0.5)/10; SendChatMessage("I am "..rba.." bars into "..UnitLevel("player").." ("..rbb.." bars left)","SAY",nil);

]]