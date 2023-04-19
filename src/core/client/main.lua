local tick = getTickCount()
local currentWeight = 0
local initialWeight = currentWeight
local finalWeight = currentWeight


function checkItemType(id)

  if not(id) then 
    return nil
  end

  if (idList[tonumber(id)].type == "weapon") then
    return 0
  elseif (idList[tonumber(id)].type == "misc") then
    return 1
  end
end

function giveItemToPlayer(id, amount)
  local alive = getElementHealth(localPlayer)
  local amount = amount or 1
  local convertPrompt = tonumber(prompt)

  setWeight(idList[tonumber(id)].weight * amount)

  if (not(id)) then end

  if (alive > 0) then
    if (checkItemType(id) == 0) then
      triggerServerEvent("giveWeapon", localPlayer, idList[tonumber(id)].prompt)
      print(idList[tonumber(id)].prompt)
    end
  end
  
  print(id, checkItemType(id), amount)
end

function setWeight(addweight)
  if (not(addweight)) then end

  if ((weight + addweight) > max_weight) then
    print("overload")
    print(weight)
  else
    weight = weight + addweight
    tick = getTickCount()
    print(weight)
  end
end

function drawWeight()

  local color = tocolor(0, 255, 0, 255)
  local progress = (getTickCount() - tick) / 2500

  currentWeight = interpolateBetween(initialWeight, 0, 0, finalWeight, 0, 0, progress, 'Linear')
  initialWeight = currentWeight
  finalWeight = weight

  if weight >= 8 then
    color = tocolor(255, 255, 0, 255)
  end

  if weight >= 12 then
    color = tocolor(255, 0, 0, 255)
  end

  dxDrawRectangle(
    1880, 1050,
    30, -max_weight * 6, tocolor(11, 11, 11, 150)
  )

  dxDrawRectangle(
    1880, 1050,
    30, -currentWeight * 6, color
  )
end