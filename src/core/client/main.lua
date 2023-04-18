function checkItemType(id)

  if not(id) then 
    return nil
  end

  if (idList[tonumber(id)].type == "weapon") then
    return 0
  elseif (idList[tonumber(id)].type == "misc") then
    return 1
  elseif (idList[tonumber(id)].type == "ammo")
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
    print(weight)
  end
end

function drawWeight()
  local sx, sy = guiGetScreenSize()
  local color = tocolor(50, 255, 0, 255)

  if (weight >= 12) then
    color = tocolor(255, 194, 34, 255)
  end

  if (weight >= 16) then
    color = tocolor(255, 14, 14, 255)
  end

  dxDrawRectangle(
    sx / 2, sy / 2,
    10, -weight, color
  )
end

