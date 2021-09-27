-- Created by KSUIE_Gaming for MiscreantMafia RP : Discord : https://discord.gg/vydyEUgeDw
-- Ksuie.Gaming Twitch : www.twitch.tv/ksuie
-- Thanks To RexshackGaming : Discord : https://discord.gg/8gNCwDpQPb - for Base script layout
-- RexshackGaming youtube channel : https://www.youtube.com/channel/UCikEgGfXO-HCPxV5rYHEVbA

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
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

-- buy raw meat
RegisterServerEvent('meatshop:buy')
AddEventHandler("meatshop:buy", function(price, item, lvl)
    TriggerEvent("redemrp:getPlayerFromId", source, function(user)
        local identifier = user.getIdentifier()
		local level = user.getLevel()
        local ItemInfo = data.getItemData(item) -- return info from config

        if user.getMoney() >= price then
            if level >= lvl then
                user.removeMoney(price)
				local ItemData = data.getItem(source, item)
				print(ItemData.ItemAmount)
				ItemData.AddItem(1)
                TriggerClientEvent("redemrp_notification:start", source, "Bought "..ItemInfo.label, 3, "success")
            else 
                TriggerClientEvent('redemrp_gunshop:alert', source, "You are not a high enough level!")
            end
        else
            TriggerClientEvent('redemrp_gunshop:alert', source, "You dont have enough money!")
        end
	end)
end)

-- sell raw meat
RegisterServerEvent('meatshop:sell')
AddEventHandler('meatshop:sell', function(price, meat)
    print(price.."&"..meat)
    local lookupitem = "'"..meat.."'"
    print(lookupitem)
    local _source = source
    local ItemInfo = data.getItemData(meat) -- return info from config
    TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
        local ItemData = data.getItem(_source, meat)
		print(ItemData.ItemAmount..lookupitem..ItemInfo.label)
		local totalitem = (ItemData.ItemAmount)
        print(totalitem)
		if totalitem >= 1 then
			local totalmoney = (totalitem * price)
			local totalxp = (totalitem)
			user.addMoney(totalmoney)
			user.addXP(totalxp)
            ItemData.RemoveItem(totalitem)
            TriggerClientEvent("redemrp_notification:start", _source, "You sold " .. totalitem .." "..ItemInfo.label.." for $" ..totalmoney.." and got "..totalxp.."XP", 5)
        else
            TriggerClientEvent("redemrp_notification:start", _source, 'You dont have any '..ItemInfo.label..' to sell', 5)
        end
    end)
end)

-- buy cooked meat
RegisterServerEvent('cookedmeatshop:buy')
AddEventHandler("cookedmeatshop:buy", function(price, item, lvl)
    TriggerEvent("redemrp:getPlayerFromId", source, function(user)
        local identifier = user.getIdentifier()
		local level = user.getLevel()
        local ItemInfo = data.getItemData(item) -- return info from config
        if user.getMoney() >= price then
            if level >= lvl then
                user.removeMoney(price)
				local ItemData = data.getItem(source, item)
				print(ItemData.ItemAmount)
				ItemData.AddItem(1)
                TriggerClientEvent("redemrp_notification:start", source, "Bought "..ItemInfo.label, 3, "success")
            else 
                TriggerClientEvent('redemrp_gunshop:alert', source, "You are not a high enough level!")
            end
        else
            TriggerClientEvent('redemrp_gunshop:alert', source, "You dont have enough money!")
        end
	end)
end)

-- sell cooked meat
RegisterServerEvent('cookedmeatshop:sell')
AddEventHandler('cookedmeatshop:sell', function(price, meat)
    print(price.."&"..meat)
    local lookupitem = "'"..meat.."'"
    print(lookupitem)
    local _source = source
    local ItemInfo = data.getItemData(meat) -- return info from config
    TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
        local ItemData = data.getItem(_source, meat)
		print(ItemData.ItemAmount..lookupitem..ItemInfo.label)
		local totalitem = (ItemData.ItemAmount)
        print(totalitem)
		if totalitem >= 1 then
			local totalmoney = (totalitem * price)
			local totalxp = (totalitem)
			user.addMoney(totalmoney)
			user.addXP(totalxp)
            ItemData.RemoveItem(totalitem)
            TriggerClientEvent("redemrp_notification:start", _source, "You sold " .. totalitem .." "..ItemInfo.label.." for $" ..totalmoney.." and got "..totalxp.."XP", 5)
        else
            TriggerClientEvent("redemrp_notification:start", _source, 'You dont have any '..ItemInfo.label..' to sell', 5)
        end
    end)
end)



RegisterServerEvent('ButcherFetchRawPrice')
AddEventHandler('ButcherFetchRawPrice', function()
    print("Command Received Butcher Fetch")
    local _source = source
    local biggameInfo = data.getItemData('biggame')
    print(biggameInfo.price_buy.."  "..biggameInfo.label)
    local venisonInfo = data.getItemData('venison')
    print(venisonInfo.price_buy.."  "..venisonInfo.label)
    local beefInfo = data.getItemData('beef')
    print(beefInfo.price_buy.."  "..beefInfo.label)
    local aligatormeatInfo = data.getItemData('aligatormeat')
    print(aligatormeatInfo.price_buy.."  "..aligatormeatInfo.label)
    local birdInfo = data.getItemData('bird')
    print(birdInfo.price_buy.."  "..birdInfo.label)
    local gameInfo = data.getItemData('game')
    print(gameInfo.price_buy.."  "..gameInfo.label)
    local porkInfo = data.getItemData('pork')
    print(porkInfo.price_buy.."  "..porkInfo.label)
    local fishmeatInfo = data.getItemData('fishmeat')
    print(fishmeatInfo.price_buy.."  "..fishmeatInfo.label)
    local herptileInfo = data.getItemData('herptile')
    print(herptileInfo.price_buy.."  "..herptileInfo.label)
    local stringyInfo = data.getItemData('stringy')
    print(stringyInfo.price_buy.."  "..stringyInfo.label)
    local muttonInfo = data.getItemData('mutton')
    print(muttonInfo.price_buy.."  "..muttonInfo.label)

    biggame_price = biggameInfo.price_buy
    venison_price = venisonInfo.price_buy
    beef_price = beefInfo.price_buy
    aligatormeat_price = aligatormeatInfo.price_buy
    bird_price = birdInfo.price_buy
    game_price = gameInfo.price_buy
    pork_price = porkInfo.price_buy
    fishmeat_price = fishmeatInfo.price_buy
    herptile_price = herptileInfo.price_buy
    stringy_price = stringyInfo.price_buy
    mutton_price = muttonInfo.price_buy
    print("Prices sent to client")

    TriggerClientEvent("ButcherRawPriceFetched", 
        _source,
        biggame_price,
        venison_price,
        beef_price,
        aligatormeat_price,
        bird_price,
        game_price,
        pork_price,
        fishmeat_price,
        herptile_price,
        stringy_price,
        mutton_price,
        mutton_price
        )

end)


