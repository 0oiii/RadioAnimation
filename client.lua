local playerCurrentlyAnimated = false
local playerCurrentlyHasProp = false
local playerCurrentlyHasWalkstyle = false
local surrendered = false
local firstAnim = true
local playerPropList = {}
local LastAD


local animKeyRegistered = GetControlInstructionalButton(0, 0x70F34582, 1)
local keyMapping = "startAnimation"
local isDoingEmote = false

-- List of mask variations to check
local maskVariationsToCheck = {} -- Add the mask variations you want to check here
local maskVariationsAreEarpiece = {} -- Set the masks in list to use the earpeice animation
local maskVariationsAreChestMic = {} -- Set the masks in list to use the chest radio animation
local maskVariationsAreShoulderMic = {} -- Set the masks in list to use the shoulder animation

-- List of shirt or accessory variations to check if mask is not worn
local shirtOrAccessoryVariationsToCheck = {} -- Add the shirt or accessory variations you want to check here
local shirtOrAccessoryAreEarpiece = {} -- Set the shirt or accessory in list to use the earpeice animation
local shirtOrAccessoryAreChestMic = {} -- Set the shirt or accessory in list to use the chest radio animation
local shirtOrAccessoryAreShoulderMic = {} -- Set the shirt or accessory in list to use the shoulder animation
-- List of body armor types to check
local bodyArmorVariationsToCheck = {} -- Add the body armor types you want to check here
local bodyArmorVariationsAreEarpiece = {} -- Set the body armor in list to use the earpeice animation
local bodyArmorVariationsAreChestMic = {} -- Set the body armor in list to use the chest radio animation
local bodyArmorVariationsAreShoulderMic = {} -- Set the body armor in list to use the shoulder animation

RegisterCommand('+radioAni', function()
    local player = PlayerPedId()
    if (DoesEntityExist(player) and not IsEntityDead(player)) then
        local maskVariation = GetPedDrawableVariation(player, 1) -- Assuming mask variation is in slot 1
        local maskEquipped = false
        for _, mask in ipairs(maskVariationsToCheck) do
            if maskVariation == mask then -- Check if the mask variation is in the list
                for _, mask in ipairs(maskVariationsAreEarpiece) do
                    if maskVariation == mask then -- Check if the mask variation is in the list
                        maskEquipped = true
                        isDoingEmote = true
                        loadAnimDict("cellphone@")
                        TaskPlayAnim(player, "cellphone@", "cellphone_call_listen_base", 2.0, 2.5, -1, 49, 0, 0, 0, 0)
                        RemoveAnimDict("cellphone@")
                        break -- Stop iterating once we find a matching mask
                    end
                end
                for _, mask in ipairs(maskVariationsAreChestMic) do
                    if maskVariation == mask then
                        maskEquipped = true
                        isDoingEmote = true
                        loadAnimDict("anim@cop_mic_pose_002")
                        TaskPlayAnim(player, "anim@cop_mic_pose_002", "chest_mic", 2.0, 2.5, -1, 49, 0, 0, 0, 0)
                        RemoveAnimDict("anim@cop_mic_pose_002")
                        break -- Stop iterating once we find a matching mask
                    end
                end
                for _, mask in ipairs(maskVariationsAreShoulderMic) do
                    if maskVariation == mask then
                        maskEquipped = true
                        isDoingEmote = true
                        loadAnimDict("random@arrests")
                        TaskPlayAnim(player, "random@arrests", "generic_radio_chatter", 2.0, 2.5, -1, 49, 0, 0, 0, 0)
                        RemoveAnimDict("random@arrests")
                        break -- Stop iterating once we find a matching mask
                    end
                end
            end
        end

        if not maskEquipped then
            local shirtOrAccessoryVariation = GetPedDrawableVariation(player, 8) -- Assuming shirt or accessory variation is in slot 8
            for _, variation in ipairs(shirtOrAccessoryVariationsToCheck) do
                if shirtOrAccessoryVariation == variation then -- Check if the shirt or accessory variation is in the list
                    for _, variation in ipairs(shirtOrAccessoryAreEarpiece) do
                        if shirtOrAccessoryVariation == variation then
                            isDoingEmote = true
                            loadAnimDict("cellphone@")
                            TaskPlayAnim(player, "cellphone@", "cellphone_call_listen_base", 2.0, 2.5, -1, 49, 0, 0, 0, 0)
                            RemoveAnimDict("cellphone@")
                            break -- Stop iterating once we find a matching shirt or accessory
                        end
                    end
                    for _, variation in ipairs(shirtOrAccessoryAreChestMic) do
                        if shirtOrAccessoryVariation == variation then
                            isDoingEmote = true
                            loadAnimDict("anim@cop_mic_pose_002")
                            TaskPlayAnim(player, "anim@cop_mic_pose_002", "chest_mic", 2.0, 2.5, -1, 49, 0, 0, 0, 0)
                            RemoveAnimDict("anim@cop_mic_pose_002")
                            break -- Stop iterating once we find a matching shirt or accessory
                        end
                    end
                    for _, variation in ipairs(shirtOrAccessoryAreShoulderMic) do
                        if shirtOrAccessoryVariation == variation then
                            isDoingEmote =
                            loadAnimDict("random@arrests")
                            TaskPlayAnim(player, "random@arrests", "generic_radio_chatter", 2.0, 2.5, -1, 49, 0, 0, 0, 0)
                            RemoveAnimDict("random@arrests")
                            break -- Stop iterating once we find a matching shirt or accessory
                        end
                    end
                end
            end
        end
        
        if not maskEquipped then
            local bodyArmorVariation = GetPedDrawableVariation(player, 9) -- Assuming shirt or accessory variation is in slot 8
            for _, variation in ipairs(bodyArmorVariationsToCheck) do
                for _, variation in ipairs(bodyArmorVariationsAreEarpiece) do
                    if bodyArmorVariation == variation then
                        isDoingEmote =
                        loadAnimDict("cellphone@")
                        TaskPlayAnim(player, "cellphone@", "cellphone_call_listen_base", 2.0, 2.5, -1, 49, 0, 0, 0, 0)
                        RemoveAnimDict("cellphone@")
                        break -- Stop iterating once we find a matching shirt or accessory
                    end
                end
                for _, variation in ipairs(bodyArmorVariationsAreChestMic) do
                    if bodyArmorVariation == variation then
                        isDoingEmote =
                        loadAnimDict("anim@cop_mic_pose_002")
                        TaskPlayAnim(player, "anim@cop_mic_pose_002", "chest_mic", 2.0, 2.5, -1, 49, 0, 0, 0, 0)
                        RemoveAnimDict("anim@cop_mic_pose_002")
                        break -- Stop iterating once we find a matching shirt or accessory
                    end
                end
                for _, variation in ipairs(bodyArmorVariationsAreShoulderMic) do
                    if bodyArmorVariation == variation then
                        isDoingEmote =
                        loadAnimDict("random@arrests")
                        TaskPlayAnim(player, "random@arrests", "generic_radio_chatter", 2.0, 2.5, -1, 49, 0, 0, 0, 0)
                        RemoveAnimDict("random@arrests")
                        break -- Stop iterating once we find a matching shirt or accessory
                    end
                end
            end
        end
    end
end, false)

RegisterCommand('-radioAni', function()
    local player = PlayerPedId()
    if IsEntityPlayingAnim(player, "random@arrests", "generic_radio_chatter", 3) then
        ClearPedSecondaryTask(player)
        isDoingEmote = false
    end
    if IsEntityPlayingAnim(player, "cellphone@", "cellphone_call_listen_base", 3) then
        ClearPedSecondaryTask(player)
        isDoingEmote = false
    end
    if IsEntityPlayingAnim(player, "anim@cop_mic_pose_002", "chest_mic", 3) then
        ClearPedSecondaryTask(player)
        isDoingEmote = false
    end
end, false)

RegisterKeyMapping('+radioAni', 'Hand on Radio Animation', 'keyboard', 'F6')

function loadAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(500)
    end
end

function loadPropDict(model)
    RequestModel(GetHashKey(model))
    while not HasModelLoaded(GetHashKey(model)) do
        Citizen.Wait(500)
    end
end

function RequestWalking(ad)
    RequestAnimSet(ad)
    while (not HasAnimSetLoaded(ad)) do
        Citizen.Wait(500)
    end
end

function vehiclecheck()
    local player = PlayerPedId()
    if IsPedInAnyVehicle(player, false) then
        return false
    end
    return true
end
