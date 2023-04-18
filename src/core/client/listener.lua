addCommandHandler("addItem", function(_, id, amount)
  giveItemToPlayer(id, amount)
end)

addCommandHandler("setWeight", function(_, weight)
  setWeight(weight)
end)

addEventHandler("onClientRender", root, function()
  drawWeight()
end)