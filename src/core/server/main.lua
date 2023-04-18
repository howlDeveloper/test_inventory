function giveWeaponToPlayer(id)
  giveWeapon(source, id)
end

addEvent("giveWeapon", true)
addEventHandler("giveWeapon", root, giveWeaponToPlayer)