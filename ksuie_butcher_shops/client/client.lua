MenuData = {}
TriggerEvent("redemrp_menu_base:getData",function(call)
    MenuData = call
end)

local biggame_price = 0
local venison_price = 0
local beef_price = 0
local aligatormeat_price = 0
local bird_price = 0
local game_price = 0
local pork_price = 0
local fishmeat_price = 0
local herptile_price = 0
local stringy_price = 0
local mutton_price = 0


-- add butcher locations
local butchershop = {

   {x = -1322.1, y = 2438.61, z = 309.61},
	{x = 592.89, y = 1686.98, z = 187.39},
	{x = 2540.9, y = 802.33, z = 76.38},
	{x = 1876.53, y = -735.35, z = 42.66},
	{x = -1814.81, y = 653.36, z = 131.82},
   {x = -1980.1, y = -1648.22, z = 117.12},
	{x = -3551.47, y = -3013.28, z = 11.83},
	{x = -5227.56, y = -3470.52, z = -20.57},
	{x = -5179.11, y = -2112.87, z = 12.61},
	{x = -3965.42, y = -2135.54, z = -5.24},

}

RegisterNetEvent('ButcherRawPriceFetched')
AddEventHandler('ButcherRawPriceFetched', function(rawbiggame,rawvension,rawbeef,rawaligator,rawbird,rawgame,rawpork,rawfish,rawherp,rawstringy,rawmutton,blank)
   local _source = source
   biggame_price = rawbiggame
   print(rawbiggame)
   venison_price = rawvension
   print(rawvension)
   beef_price = rawbeef
   print(rawbeef)
   aligatormeat_price = rawaligator
   print(rawaligator)
   bird_price = rawbird
   print(rawbird)
   game_price = rawgame
   print(rawgame)
   pork_price = rawpork
   print(rawpork)
   fishmeat_price = rawfish
   print(rawfish)
   herptile_price = rawherp
   print(rawherp)
   stringy_price = rawstringy
   print(rawstringy)
   mutton_price = rawmutton
   print(rawmutton)

end)


--===========================================================BUTCHET SHOP START====================================================================
local active = false
local ShopPrompt
local hasAlreadyEnteredMarker, lastZone
local currentZone = nil

function SetupShopPrompt()
    Citizen.CreateThread(function()
        local str = 'Open Butcher Shop'
        ShopPrompt = PromptRegisterBegin()
        PromptSetControlAction(ShopPrompt, 0xE8342FF2)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(ShopPrompt, str)
        PromptSetEnabled(ShopPrompt, false)
        PromptSetVisible(ShopPrompt, false)
        PromptSetHoldMode(ShopPrompt, true)
        PromptRegisterEnd(ShopPrompt)

    end)
end

AddEventHandler('ksuie_trader_shops:hasEnteredMarker', function(zone)
    currentZone     = zone
end)

AddEventHandler('ksuie_trader_shops:hasExitedMarker', function(zone)
    if active == true then
        PromptSetEnabled(ShopPrompt, false)
        PromptSetVisible(ShopPrompt, false)
        active = false
    end
    WarMenu.CloseMenu()
	currentZone = nil
end)

Citizen.CreateThread(function()
    SetupShopPrompt()
    while true do
        Citizen.Wait(0)
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        local isInMarker, currentZone = false

        for k,v in ipairs(butchershop) do
            if (Vdist(coords.x, coords.y, coords.z, v.x, v.y, v.z) < 1.5) then
                isInMarker  = true
                currentZone = 'butchershop'
                lastZone    = 'butchershop'
            end
        end

		if isInMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			TriggerEvent('ksuie_trader_shops:hasEnteredMarker', currentZone)
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('ksuie_trader_shops:hasExitedMarker', lastZone)
		end

    end
end)

-- menu start
Citizen.CreateThread(function()
    WarMenu.CreateMenu('butchershop', "Butcher Shop")
    WarMenu.SetSubTitle('butchershop', 'Buy and Sell Meat')
    WarMenu.CreateSubMenu('buy', 'butchershop', 'Buy Meat')
    WarMenu.CreateSubMenu('sell', 'butchershop', 'Sell Meat')
    WarMenu.CreateSubMenu('buycooked', 'butchershop', 'Buy Cooked Meat')
    WarMenu.CreateSubMenu('sellcooked', 'butchershop', 'Sell Cooked Meat')

    while true do

        if WarMenu.IsMenuOpened('butchershop') then
            if WarMenu.MenuButton('Buy Raw Meat', 'buy') then
            end
            if WarMenu.MenuButton('Sell Raw Meat', 'sell') then
            end
            if WarMenu.MenuButton('Buy Cooked Meat', 'buycooked') then
            end
            if WarMenu.MenuButton('Sell Cooked Meat', 'sellcooked') then
            end

            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('buy') then
            if WarMenu.Button('Buy Big Game Meat for ~pa~$'..biggame_price) then
               TriggerServerEvent("meatshop:buy", biggame_price, "biggame", 0)  
            elseif WarMenu.Button('Buy Venison for ~pa~$'..venison_price) then
               TriggerServerEvent("meatshop:buy", venison_price, "venison", 0)
            elseif WarMenu.Button('Buy Beef for ~pa~$'..beef_price) then
               TriggerServerEvent("meatshop:buy", beef_price, "beef", 0)
            elseif WarMenu.Button('Buy Alligator Meat for ~pa~$'..aligatormeat_price) then
               TriggerServerEvent("meatshop:buy", aligatormeat_price, "aligatormeat", 0)
            elseif WarMenu.Button('Buy Bird Meat for ~pa~$'..bird_price) then
               TriggerServerEvent("meatshop:buy", bird_price, "bird", 0)
            elseif WarMenu.Button('Buy Game Meat for ~pa~$'..game_price) then
               TriggerServerEvent("meatshop:buy", game_price, "game", 0)
            elseif WarMenu.Button('Buy Pork for ~pa~$'..pork_price) then
               TriggerServerEvent("meatshop:buy", pork_price, "pork", 0)
            elseif WarMenu.Button('Buy Fish Meat for ~pa~$'..fishmeat_price) then
               TriggerServerEvent("meatshop:buy", fishmeat_price, "fishmeat", 0)
            elseif WarMenu.Button('Buy Herptile Meat for ~pa~$'..herptile_price) then
               TriggerServerEvent("meatshop:buy", herptile_price, "herptile", 0)
            elseif WarMenu.Button('Buy Stringy Meat for ~pa~$'..stringy_price) then
               TriggerServerEvent("meatshop:buy", stringy_price, "stringy", 0)
            elseif WarMenu.Button('Buy Mutton for ~pa~$'..mutton_price) then
               TriggerServerEvent("meatshop:buy", mutton_price, "mutton", 0)
            end
            WarMenu.Display()
			
        elseif WarMenu.IsMenuOpened('sell') then
            if WarMenu.Button('Sell your Big Game Meat for ~pa~$'..(math.floor(biggame_price*.75*100)/100)..' each') then
               TriggerServerEvent("meatshop:sell", (math.floor(biggame_price*.75*100)/100), "biggame")  
            elseif WarMenu.Button('Sell your Venison for ~pa~$'..(math.floor(venison_price*.75*100)/100)..' each') then
               TriggerServerEvent("meatshop:sell", (math.floor(venison_price*.75*100)/100), "venison")
            elseif WarMenu.Button('Sell your Beef for ~pa~$'..(math.floor(beef_price*.75*100)/100)..' each') then
               TriggerServerEvent("meatshop:sell", (math.floor(beef_price*.75*100)/100), "beef")
            elseif WarMenu.Button('Sell your Alligator Meat for ~pa~$'..(math.floor(aligatormeat_price*.75*100)/100)..' each') then
               TriggerServerEvent("meatshop:sell", (math.floor(aligatormeat_price*.75*100)/100), "aligatormeat")
            elseif WarMenu.Button('Sell your Bird Meat for ~pa~$'..(math.floor(bird_price*.75*100)/100)..' each') then
               TriggerServerEvent("meatshop:sell", (math.floor(bird_price*.75*100)/100), "bird")
            elseif WarMenu.Button('Sell your Game Meat for ~pa~$'..(math.floor(game_price*.75*100)/100)..' each') then
               TriggerServerEvent("meatshop:sell", (math.floor(game_price*.75*100)/100), "game")
            elseif WarMenu.Button('Sell your Pork for ~pa~$'..(math.floor(pork_price*.75*100)/100)..' each') then
               TriggerServerEvent("meatshop:sell", (math.floor(pork_price*.75*100)/100), "pork")
            elseif WarMenu.Button('Sell your Fish Meat for ~pa~$'..(math.floor(fishmeat_price*.75*100)/100)..' each') then
               TriggerServerEvent("meatshop:sell", (math.floor(fishmeat_price*.75*100)/100), "fishmeat")
            elseif WarMenu.Button('Sell your Herptile Meat for ~pa~$'..(math.floor(herptile_price*.75*100)/100)..' each') then
               TriggerServerEvent("meatshop:sell", (math.floor(herptile_price*.75*100)/100), "herptile")
            elseif WarMenu.Button('Sell your Stringy Meat for ~pa~$'..(math.floor(stringy_price*.75*100)/100)..' each') then
               TriggerServerEvent("meatshop:sell", (math.floor(stringy_price*.75*100)/100), "stringy")
            elseif WarMenu.Button('Sell your Mutton for ~pa~$'..(math.floor(mutton_price*.75*100)/100)..' each') then
               TriggerServerEvent("meatshop:sell", (math.floor(mutton_price*.75*100)/100), "mutton")
            end
            WarMenu.Display()

         elseif WarMenu.IsMenuOpened('buycooked') then
            if WarMenu.Button('Buy Big Game Meat for ~pa~$'..(math.floor(biggame_price*1.65*100)/100)) then
               TriggerServerEvent("cookedmeatshop:buy", (math.floor(biggame_price*1.65*100)/100), "cookedbiggame", 0)
            elseif WarMenu.Button('Buy Venison for ~pa~$'..(math.floor(venison_price*1.65*100)/100)) then
               TriggerServerEvent("cookedmeatshop:buy", (math.floor(venison_price*1.65*100)/100), "cookedvenison", 0)
            elseif WarMenu.Button('Buy Beef for ~pa~$'..(math.floor(beef_price*1.65*100)/100)) then
               TriggerServerEvent("cookedmeatshop:buy", (math.floor(beef_price*1.65*100)/100), "cookedbeef", 0)
            elseif WarMenu.Button('Buy Alligator Meat for ~pa~$'..(math.floor(aligatormeat_price*1.65*100)/100)) then
               TriggerServerEvent("cookedmeatshop:buy", (math.floor(aligatormeat_price*1.65*100)/100), "cookedaligatormeat", 0)
            elseif WarMenu.Button('Buy Bird Meat for ~pa~$'..(math.floor(bird_price*1.65*100)/100)) then
               TriggerServerEvent("cookedmeatshop:buy", (math.floor(bird_price*1.65*100)/100), "cookedbird", 0)
            elseif WarMenu.Button('Buy Game Meat for ~pa~$'..(math.floor(game_price*1.65*100)/100)) then
               TriggerServerEvent("cookedmeatshop:buy", (math.floor(game_price*1.65*100)/100), "cookedgame", 0)
            elseif WarMenu.Button('Buy Pork for ~pa~$'..(math.floor(pork_price*1.65*100)/100)) then
               TriggerServerEvent("cookedmeatshop:buy", (math.floor(pork_price*1.65*100)/100), "cookedpork", 0)
            elseif WarMenu.Button('Buy Fish Meat for ~pa~$'..(math.floor(fishmeat_price*1.65*100)/100)) then
               TriggerServerEvent("cookedmeatshop:buy", (math.floor(fishmeat_price*1.65*100)/100), "cookedfishmeat", 0)
            elseif WarMenu.Button('Buy Herptile Meat for ~pa~$'..(math.floor(herptile_price*1.65*100)/100)) then
               TriggerServerEvent("cookedmeatshop:buy", (math.floor(herptile_price*1.65*100)/100), "cookedherptile", 0)
            elseif WarMenu.Button('Buy Stringy Meat for ~pa~$'..(math.floor(stringy_price*1.65*100)/100)) then
               TriggerServerEvent("cookedmeatshop:buy", (math.floor(stringy_price*1.65*100)/100), "cookedstringy", 0)
            elseif WarMenu.Button('Buy Mutton for ~pa~$'..(math.floor(mutton_price*1.65*100)/100)) then
               TriggerServerEvent("cookedmeatshop:buy", (math.floor(mutton_price*1.65*100)/100), "cookedmutton", 0)
            end
            WarMenu.Display()

        elseif WarMenu.IsMenuOpened('sellcooked') then
            if WarMenu.Button('Sell your Big Game Meat for ~pa~$'..biggame_price..' each') then
               TriggerServerEvent("cookedmeatshop:sell", biggame_price, "cookedbiggame")  
            elseif WarMenu.Button('Sell your Venison for ~pa~$'..venison_price..' each') then
               TriggerServerEvent("cookedmeatshop:sell", venison_price, "cookedvenison")
            elseif WarMenu.Button('Sell your Beef for ~pa~$'..beef_price..' each') then
               TriggerServerEvent("cookedmeatshop:sell", beef_price, "cookedbeef")
            elseif WarMenu.Button('Sell your Alligator Meat for ~pa~$'..aligatormeat_price..' each') then
               TriggerServerEvent("cookedmeatshop:sell", aligatormeat_price, "cookedaligatormeat")
            elseif WarMenu.Button('Sell your Bird Meat for ~pa~$'..bird_price..' each') then
               TriggerServerEvent("cookedmeatshop:sell", bird_price, "cookedbird")
            elseif WarMenu.Button('Sell your Game Meat for ~pa~$'..game_price..' each') then
               TriggerServerEvent("cookedmeatshop:sell", game_price, "cookedgame")
            elseif WarMenu.Button('Sell your Pork for ~pa~$'..pork_price..' each') then
               TriggerServerEvent("cookedmeatshop:sell", pork_price, "cookedpork")
            elseif WarMenu.Button('Sell your Fish Meat for ~pa~$'..fishmeat_price..' each') then
               TriggerServerEvent("cookedmeatshop:sell", fishmeat_price, "cookedfishmeat")
            elseif WarMenu.Button('Sell your Herptile Meat for ~pa~$'..herptile_price..' each') then
               TriggerServerEvent("cookedmeatshop:sell", herptile_price, "cookedherptile")
            elseif WarMenu.Button('Sell your Stringy Meat for ~pa~$'..stringy_price..' each') then
               TriggerServerEvent("cookedmeatshop:sell", stringy_price, "cookedstringy")
            elseif WarMenu.Button('Sell your Mutton for ~pa~$'..mutton_price..' each') then
               TriggerServerEvent("cookedmeatshop:sell", mutton_price, "cookedmutton")
            end
            WarMenu.Display()

        end
        Citizen.Wait(0)
    end
end)
-- menu stop

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)
        if currentZone then
            if active == false then
                PromptSetEnabled(ShopPrompt, true)
                PromptSetVisible(ShopPrompt, true)
                active = true
            end
            if PromptHasHoldModeCompleted(ShopPrompt) then
               TriggerServerEvent('ButcherFetchRawPrice')
               Citizen.Wait(1000)
				WarMenu.OpenMenu('butchershop')
                WarMenu.Display()
                PromptSetEnabled(ShopPrompt, false)
                PromptSetVisible(ShopPrompt, false)
                active = false

				currentZone = nil
			end
        else
			Citizen.Wait(500)
		end
	end
end)

--===========================================================BUTCHER SHOP END====================================================================





RegisterNetEvent('ksuie_butcher_shops:alert')	
AddEventHandler('ksuie_butcher_shops:alert', function(txt)
    SetTextScale(0.5, 0.5)
    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", txt, Citizen.ResultAsLong())
    Citizen.InvokeNative(0xFA233F8FE190514C, str)
    Citizen.InvokeNative(0xE9990552DEC71600)
end)

