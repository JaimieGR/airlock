print("airlock online...")
doortime = 3
doorevent = 0
limegreendoor = true
magentadoor = true
while (true) do
	--LIME GREEN SET
	green = colors.test(redstone.getBundledInput("back"), colors.green)
	limegreendoorScan = colors.test(redstone.getBundledInput("back"), colors.lime_green)
	yellow = colors.test(redstone.getBundledInput("back"), colors.yellow)
	
	--MAGENTA SET
	blue = colors.test(redstone.getBundledInput("back"), colors.blue) 
	magentadoorScan = colors.test(redstone.getBundledInput("back"), colors.magenta)
	red = colors.test(redstone.getBundledInput("back"), colors.red)
	
	--SETS DOORS
	if limegreendoor and magentadoor then
		colors.test(redstone.setBundledOutput("back"), colors.magenta + colors.lime_green)
	elseif limegreendoor
		redstone.setBundledOutput("back", colors.lime_green)
		--Magenta door is open
		if (os.clock() >= doorevent + doortime) then
			magentadoor = true
		end
		
	elseif magentadoor
		redstone.setBundledOutput("back", colors.magenta)
		--Lime door is open
		if (os.clock() >= doorevent + doortime) then
			limegreendoor = true
		end
		
	else
		redstone.setBundledOutput("back", 0)
	end
	
	--CHECKS BUTTONS
	if ((blue or red) and limegreendoor)
		magentadoor = false
		doorevent = os.clock()
	elseif ((green or yellow) and magentadoor)
		limegreendoor = false
		doorevent = os.clock()
	end
	
	--
	
end
