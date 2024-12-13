if Config.Speed == "kmh" then
    Speedtype = "kmh"
else
    Speedtype = "mph"
end

Citizen.CreateThread(function()
    while true do
        sleep = 500

        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(PlayerPedId(),false)
        local inVeh = IsPedSittingInVehicle(ped, vehicle) 
        local driver = GetPedInVehicleSeat(vehicle, 0)
        local coords = GetEntityCoords(ped)
        local streetHash = GetStreetNameAtCoord(coords.x,coords.y, coords.z)
        local street = GetStreetNameFromHashKey(streetHash)
        local heading = GetEntityHeading(ped) 
        
        if DoesEntityExist(vehicle) then

            if Config.FuelSystem == "" or Config.FuelSystem == "none" then
                vehiclefuel = GetVehicleFuelLevel(vehicle)
            elseif Config.FuelSystem == "LegacyFuel" then
                vehiclefuel = exports["LegacyFuel"]:GetFuel(vehicle) 
            elseif Config.FuelSystem == "ox" then
                vehiclefuel = Entity(vehicle).state.fuel
            else
                print("Bad Config.fuelsystem setup")
            end
        end

        if inVeh and driver == 0 then
            sleep = 250
    

        if Config.Speed == "kmh" then
            vehiclespeed = (GetEntitySpeed(vehicle) * 3.6)
        else
            vehiclespeed = (GetEntitySpeed(vehicle) * 2.236936)
        end


        local vehiclegear = GetVehicleCurrentGear(vehicle)
        SendNuiMessage(json.encode({
            type = "car",
            streetname = street,
            vector = heading,
            inveh = inVeh,
            speed = vehiclespeed,
            speedtype = Speedtype,
            fuel = vehiclefuel,
            gear = vehiclegear,
        })) 
        else
        SendNuiMessage(json.encode({
            type = "none",
        })) 
        sleep = 500
        
        end
        Wait(sleep)
    end
end)

