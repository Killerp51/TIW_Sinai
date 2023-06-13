-- ******************************
-- THIS IS WAR (TIW) SINAI
-- Version: 0.1
-- Author: Mustang (457th vFS)
-- Contributers: Wampa (457th vFS)
-- ******************************

-- **********************************************************************************************************************************************************************************************************************************************************************
-- BEGIN CTLD
-- **********************************************************************************************************************************************************************************************************************************************************************

-- Instantiate and start a CTLD for the blue side, using helicopter groups named "Helicargo" and alias "Helicargo"
ctldList = {
   "1a. Tel Nof ↔ C-130J",
   "1a. Tel Nof ↔ UH-1H",
}
local my_ctld = CTLD:New(coalition.side.BLUE,{"Helicargo", "MEDEVAC", "UH-60L", "UH-1H", "Hercules", "C-130J", "CARGO"}, ctldList )
my_ctld:__Start(5)
my_ctld:__Load(10)

-- *************************************************************
-- ***************** Configuration Options *********************
-- *************************************************************
my_ctld.useprefix = true -- (DO NOT SWITCH THIS OFF UNLESS YOU KNOW WHAT YOU ARE DOING!) Adjust **before** starting CTLD. If set to false, *all* choppers of the coalition side will be enabled for CTLD.
my_ctld.CrateDistance = 35 -- List and Load crates in this radius only.
my_ctld.dropcratesanywhere = true -- Option to allow crates to be dropped anywhere.
my_ctld.maximumHoverHeight = 15 -- Hover max this high to load.
my_ctld.minimumHoverHeight = 4 -- Hover min this low to load.
my_ctld.forcehoverload = false -- Crates (not: troops) can **only** be loaded while hovering.
my_ctld.hoverautoloading = false -- Crates in CrateDistance in a LOAD zone will be loaded automatically if space allows.
my_ctld.smokedistance = 2000 -- Smoke or flares can be request for zones this far away (in meters).
my_ctld.movetroopstowpzone = true -- Troops and vehicles will move to the nearest MOVE zone...
my_ctld.movetroopsdistance = 5000 -- .. but only if this far away (in meters)
my_ctld.smokedistance = 2000 -- Only smoke or flare zones if requesting player unit is this far away (in meters)
my_ctld.suppressmessages = false -- Set to true if you want to script your own messages.
my_ctld.repairtime = 300 -- Number of seconds it takes to repair a unit.
my_ctld.cratecountry = country.id.USA -- ID of crates. Will default to country.id.RUSSIA for RED coalition setups.
my_ctld.allowcratepickupagain = true  -- allow re-pickup crates that were dropped.
my_ctld.enableslingload = false -- allow cargos to be slingloaded - might not work for all cargo types
my_ctld.pilotmustopendoors = false -- force opening of doors
my_ctld.SmokeColor = SMOKECOLOR.Green -- default color to use when dropping smoke from heli
my_ctld.FlareColor = FLARECOLOR.Green -- color to use when flaring from heli
my_ctld.basetype = "container_cargo" -- default shape of the cargo container
my_ctld.droppedbeacontimeout = 600 -- dropped beacon lasts 10 minutes
my_ctld.usesubcats = true -- use sub-category names for crates, adds an extra menu layer in "Get Crates", useful if you have > 10 crate types.
my_ctld.enableHercules = true
my_ctld.HercMinAngels = 155 -- for troop/cargo drop via chute in meters, ca 470 ft
my_ctld.HercMaxAngels = 2000 -- for troop/cargo drop via chute in meters, ca 6000 ft
my_ctld.HercMaxSpeed = 77 -- 77mps or 270kph or 150kn

-- *************************************************************
-- ********************** Helo Options *************************
-- *************************************************************
-- E.g. update unit capabilities for testing. Please stay realistic in your mission design.
-- Make a Gazelle into a heavy truck, this type can load both crates and troops and eight of each type, up to 4000 kgs:
--my_ctld:UnitCapabilities("SA342L", true, true, 8, 8, 12, 4000)
my_ctld:UnitCapabilities("AH-64D_BLK_II", false, false, 0, 0, 17, 0)
my_ctld:UnitCapabilities("UH-1H", true, true, 1, 9, 15, 700)

-- Default unit type capabilities are: 
--["SA342Mistral"] = {type="SA342Mistral", crates=false, troops=true, cratelimit = 0, trooplimit = 4, length = 12, cargoweightlimit = 400},
--["SA342L"] = {type="SA342L", crates=false, troops=true, cratelimit = 0, trooplimit = 2, length = 12, cargoweightlimit = 400},
--["SA342M"] = {type="SA342M", crates=false, troops=true, cratelimit = 0, trooplimit = 4, length = 12, cargoweightlimit = 400},
--["SA342Minigun"] = {type="SA342Minigun", crates=false, troops=true, cratelimit = 0, trooplimit = 2, length = 12, cargoweightlimit = 400},
--["UH-1H"] = {type="UH-1H", crates=true, troops=true, cratelimit = 1, trooplimit = 8, length = 15, cargoweightlimit = 700},
--["Mi-8MT"] = {type="Mi-8MT", crates=true, troops=true, cratelimit = 2, trooplimit = 12, length = 15, cargoweightlimit = 3000},
--["Ka-50"] = {type="Ka-50", crates=false, troops=false, cratelimit = 0, trooplimit = 0, length = 15, cargoweightlimit = 0},
--["Mi-24P"] = {type="Mi-24P", crates=true, troops=true, cratelimit = 2, trooplimit = 8, length = 18, cargoweightlimit = 700},
--["Mi-24V"] = {type="Mi-24V", crates=true, troops=true, cratelimit = 2, trooplimit = 8, length = 18, cargoweightlimit = 700},
--["Hercules"] = {type="Hercules", crates=true, troops=true, cratelimit = 7, trooplimit = 64, length = 25, cargoweightlimit = 19000},
--["UH-60L"] = {type="UH-60L", crates=true, troops=true, cratelimit = 2, trooplimit = 20, length = 16, cargoweightlimit = 3500},
--["AH-64D_BLK_II"] = {type="AH-64D_BLK_II", crates=false, troops=true, cratelimit = 0, trooplimit = 2, length = 17, cargoweightlimit = 200}, 

-- Add a zone of type LOAD to our setup. Players can load any troops and crates here as defined in 1.2 above.
-- "Loadzone" is the name of the zone from the ME. Players can load, if they are inside the zone.
-- Smoke and Flare color for this zone is blue, it is active (can be used) and has a radio beacon.
my_ctld:AddCTLDZone("Tel Nof Logistics 1",CTLD.CargoZoneType.LOAD,SMOKECOLOR.Blue,true,true)
my_ctld:AddCTLDZone("Tel Nof Logistics 2",CTLD.CargoZoneType.LOAD,SMOKECOLOR.Blue,true,true)


-- Add a zone of type DROP. Players can drop crates here.
-- Smoke and Flare color for this zone is blue, it is active (can be used) and has a radio beacon.
-- NOTE: Troops can be unloaded anywhere, also when hovering in parameters.
--   my_ctld:AddCTLDZone("Dropzone",CTLD.CargoZoneType.DROP,SMOKECOLOR.Red,true,true)

-- Add two zones of type MOVE. Dropped troops and vehicles will move to the nearest one. See options.
-- Smoke and Flare color for this zone is blue, it is active (can be used) and has a radio beacon.
--   my_ctld:AddCTLDZone("Movezone",CTLD.CargoZoneType.MOVE,SMOKECOLOR.Orange,false,false)

--   my_ctld:AddCTLDZone("Movezone2",CTLD.CargoZoneType.MOVE,SMOKECOLOR.White,true,true)

-- Add a zone of type SHIP to our setup. Players can load troops and crates from this ship
-- "Tarawa" is the unitname (callsign) of the ship from the ME. Players can load, if they are inside the zone.
-- The ship is 240 meters long and 20 meters wide.
-- Note that you need to adjust the max hover height to deck height plus 5 meters or so for loading to work.
-- When the ship is moving, avoid forcing hoverload.
-- my_ctld:AddCTLDZone("Tarawa",CTLD.CargoZoneType.SHIP,SMOKECOLOR.Blue,true,true,240,20)

-- 82nd Airborne Troop/Vehicle Load Types
my_ctld:AddTroopsCargo("82nd AB Infantry Team",{"82 IFT"},CTLD_CARGO.Enum.TROOPS,4,100)
my_ctld:AddTroopsCargo("82nd AB Anti-Tank Team",{"82 IAT"},CTLD_CARGO.Enum.TROOPS,4,110)
my_ctld:AddTroopsCargo("82nd AB Anti-Air Team",{"82 IAA"},CTLD_CARGO.Enum.TROOPS,4,110)
my_ctld:AddTroopsCargo("82nd AB Infantry Squad",{"82 IFS"},CTLD_CARGO.Enum.TROOPS,10,110)
--  my_ctld:AddTroopsCargo("Wrenches",{"Engineers"},CTLD_CARGO.Enum.ENGINEERS,4, 90)
--  myctld.EngineerSearch = 2000 -- teams will search for crates in this radius.


my_ctld:AddCratesCargo("82nd AB HMMWV",{"82 HMMWV"},CTLD_CARGO.Enum.VEHICLE,2,2600,-1,"82nd AB")
my_ctld:AddCratesCargo("82nd AB HMMWV TOW",{"82 HMMWVT"},CTLD_CARGO.Enum.VEHICLE,2,2700,-1,"82nd AB")
my_ctld:AddCratesCargo("82nd AB Avenger",{"82 Avenger"},CTLD_CARGO.Enum.VEHICLE,2,2700,-1,"82nd AB")
my_ctld:AddCratesCargo("82nd AB LAV",{"82 LAV"},CTLD_CARGO.Enum.VEHICLE,4,3500,-1,"82nd AB")
my_ctld:AddCratesCargo("82nd AB Howitzer",{"82 Arty"},CTLD_CARGO.Enum.VEHICLE,1,1500,-1,"82nd AB")
my_ctld:AddCratesCargo("82nd AB M939 (Supply)",{"82 M939"},CTLD_CARGO.Enum.VEHICLE,4,3500,-1,"82nd AB")
--  my_ctld:AddCratesCargo("Forward Ops Base",{"FOB"},CTLD_CARGO.Enum.FOB,4)

-- 2nd MEF Troop Load Types
my_ctld:AddTroopsCargo("2nd MEF Infantry Team",{"2 MEF IFT"},CTLD_CARGO.Enum.TROOPS,3,100)
my_ctld:AddTroopsCargo("2nd MEF Infantry MG Team",{"2 MEF IFTH"},CTLD_CARGO.Enum.TROOPS,3,100)
my_ctld:AddTroopsCargo("2nd MEF Anti-Tank Team",{"2 MEF IAT"},CTLD_CARGO.Enum.TROOPS,3,100)
my_ctld:AddTroopsCargo("2nd MEF Anti-Air Team",{"2 MEF IFT"},CTLD_CARGO.Enum.TROOPS,3,100)
my_ctld:AddTroopsCargo("2nd MEF Infantry Squad",{"2 MEF IFS"},CTLD_CARGO.Enum.TROOPS,9,100)


my_ctld:AddCratesCargo("2nd MEF HMMWV",{"2 MEF HMMWV"},CTLD_CARGO.Enum.VEHICLE,2,2600,-1,"2nd MEF")
my_ctld:AddCratesCargo("2nd MEF HMMWV TOW",{"2 MEF HMMWVT"},CTLD_CARGO.Enum.VEHICLE,2,2700,-1,"2nd MEF")
my_ctld:AddCratesCargo("2nd MEF Avenger",{"2 MEF Avenger"},CTLD_CARGO.Enum.VEHICLE,2,2700,-1,"2nd MEF")
my_ctld:AddCratesCargo("2nd MEF AAV",{"2 MEF AAV"},CTLD_CARGO.Enum.VEHICLE,4,3500,-1,"2nd MEF")
my_ctld:AddCratesCargo("2nd MEF M939 (Supply)",{"2 MEF M939"},CTLD_CARGO.Enum.VEHICLE,4,3500,-1,"2nd MEF")

-- Repairable Assets
my_ctld:AddCratesRepair("Humvee Repair","Humvee",CTLD_CARGO.Enum.REPAIR,1)
--  my_ctld:AddCratesRepair("FOB Repair","FOB",CTLD_CARGO.Enum.REPAIR,1)

-- Save CTLD
my_ctld.enableLoadSave = true -- allow auto-saving and loading of files
my_ctld.saveinterval = 600 -- save every 10 minutes
my_ctld.filename = "TIW_PGv0.1.csv"
my_ctld.filepath = "\\Saves" 
my_ctld.eventoninject = true -- fire OnAfterCratesBuild and OnAfterTroopsDeployed events when loading (uses Inject functions)
my_ctld.useprecisecoordloads = true -- Instead if slightly varyiing the group position, try to maintain it as is

-- **********************************************************************************************************************************************************************************************************************************************************************
-- End CTLD
-- **********************************************************************************************************************************************************************************************************************************************************************

-- **********************************************************************************************************************************************************************************************************************************************************************
-- BEGIN A2A Dispatcher
-- **********************************************************************************************************************************************************************************************************************************************************************

 -- Setup the Detection, using DETECTION_AREAS.
    -- First define the SET of GROUPs that are defining the EWR network.
    -- Here with prefixes DF CCCP AWACS, DF CCCP EWR.
    DetectionSetGroup_Red = SET_GROUP:New()
    DetectionSetGroup_Red:FilterPrefixes( { "EAF AWACS", "EAF EWR" } )
    DetectionSetGroup_Red:FilterStart()

    -- Define the DETECTION_AREAS, using the DetectionSetGroup, with a 30km grouping radius.
    Detection_Red = DETECTION_AREAS:New( DetectionSetGroup_Red, 30000 )

    -- Now Setup the A2A dispatcher, and initialize it using the Detection object.
    A2ADispatcher_Red = AI_A2A_DISPATCHER:New( Detection_Red )

    -- Set 100km as the radius to engage any target by airborne friendlies.
    A2ADispatcher_Red:SetEngageRadius() -- 100000 is the default value.

    -- Set 200km as the radius to ground control intercept.
    A2ADispatcher_Red:SetGciRadius() -- 200000 is the default value.

    -- Setup the squadrons.
    --A2ADispatcher_Red:SetSquadron( "IRIAF Bandar Abbas F-14A", "Bandar Abbas Intl", { "IRIAF Bandar Abbas F-14A" }, 41 )
    --A2ADispatcher_Red:SetSquadron( "IRIAF Jask F-5E", "Bandar-e-Jask", { "IRIAF Jask F-5E" }, 8 )
    --A2ADispatcher_Red:SetSquadron( "IRIAF Kerman MiG-29A", "Kerman", { "IRIAF Kerman MiG-29A" }, 44 )
   
    -- Setup the Takeoff methods
    -- The default takeoff
    A2ADispatcher_Red:SetDefaultTakeoffFromParkingCold()

    -- Setup the Landing methods
    -- The default landing
    A2ADispatcher_Red:SetDefaultLandingAtEngineShutdown()

    -- Set Squadron Groupings (ie flight size)
    --A2ADispatcher_Red:SetSquadronGrouping("IRIAF Bandar Abbas F-14A", 2)
    --A2ADispatcher_Red:SetSquadronGrouping("IRIAF Jask F-5E", 2)
   -- A2ADispatcher_Red:SetSquadronGrouping("IRIAF Kerman MiG-29A", 2)

    -- Set Squadron Overhead (ie planes per target)
    --A2ADispatcher_Red:SetSquadronOverhead("IRIAF Bandar Abbas F-14A", 1)
    --A2ADispatcher_Red:SetSquadronOverhead("IRIAF Jask F-5E", 2)
    --A2ADispatcher_Red:SetSquadronOverhead("IRIAF Kerman MiG-29A", 1)

    -- CAP Squadron execution.
    --BandarCAPSouth = ZONE:New( "Bandar CAP South", GROUP:FindByName( "Bandar CAP South" ) )
    --A2ADispatcher_Red:SetSquadronCap( "IRIAF Bandar Abbas F-14A", BandarCAPSouth, 4000, 10000, 500, 600, 800, 900, "BARO" )
    --A2ADispatcher_Red:SetSquadronCapInterval( "IRIAF Bandar Abbas F-14A", 1, 30, 60 )
    --KermanCAP = ZONE:New( "Kerman CAP", GROUP:FindByName( "Kerman CAP") )
    --A2ADispatcher_Red:SetSquadronCap( "IRIAF Kerman MiG-29A", KermanCAP, 4000, 10000, 500, 600, 800, 900, "BARO" )
    --A2ADispatcher_Red:SetSquadronCapInterval( "IRIAF Kerman MiG-29A", 1 )

    -- Setup Squadrons for GCI
    --A2ADispatcher_Red:SetSquadronGci( "IRIAF Bandar Abbas F-14A", 900, 1200 )
    --A2ADispatcher_Red:SetSquadronGci( "IRIAF Jask F-5E", 900, 1200 )
    --A2ADispatcher_Red:SetSquadronGci( "IRIAF Kerman MiG-29A", 900, 1200 )

-- **********************************************************************************************************************************************************************************************************************************************************************
-- END A2A Dispatcher
-- **********************************************************************************************************************************************************************************************************************************************************************

-- **********************************************************************************************************************************************************************************************************************************************************************
-- BEGIN ZONE CAPTURE SCRIPT
-- **********************************************************************************************************************************************************************************************************************************************************************

	-- List of capturable zones
	SdeDovCapture = ZONE:New("Sde Dov")
	BenGurionCapture = ZONE:New("Ben-Gurion")
	TelNofCapture = ZONE:New("Tel Nof")
   PalmahimCapture = ZONE:New("Palmahim")
   HatzorCapture = ZONE:New("Hatzor")

   -- Zone Colors
   local Color_Blue = {0,0,255}
   local Color_Red = {255,0,0}
   local Color_Green = {0,255,0}
   local Color_Gray = {128,128,128}

   -- Zone Initialization
   -- Blue
   BenGurionCoalition = ZONE_CAPTURE_COALITION:New( BenGurionCapture, coalition.side.BLUE):DrawZone(-1, Color_Blue, 1, Color_Blue, .5, 1, true):SetMarkZone( false ) -- Uncapturable
   TelNofCoalition = ZONE_CAPTURE_COALITION:New( TelNofCapture, coalition.side.BLUE):DrawZone(-1, Color_Blue, 1, Color_Blue, .5, 1, true):SetMarkZone( false ) -- Uncapturable

   -- Red
   SdeDovCoalition = ZONE_CAPTURE_COALITION:New( SdeDovCapture, coalition.side.RED):SetMarkZone( false ):DrawZone(-1, Color_Gray, 1, Color_Gray, .5, 1, true):Start() -- Empty and Capturable
   PalmahimCoalition = ZONE_CAPTURE_COALITION:New( PalmahimCapture, coalition.side.RED):SetMarkZone( false ):DrawZone(-1, Color_Gray, 1, Color_Gray, .5, 1, true):Start() -- Empty and Capturable
   HatzorCoalition = ZONE_CAPTURE_COALITION:New( HatzorCapture, coalition.side.RED):SetMarkZone( true ):DrawZone(-1, Color_Gray, 1, Color_Gray, .5, 1, true):Start() -- Guarded and Capturable


   -- Command Center Initialization

   -- Events

   function SdeDovCoalition:OnEnterEmpty()
      SdeDovCoalition:DrawZone(-1, Color_Gray, 1, Color_Gray, .5, 1, true)
   
   end

   function PalmahimCoalition:OnEnterEmpty()
      PalmahimCoalition:DrawZone(-1, Color_Gray, 1, Color_Gray, .5, 1, true)
   end

   function HatzorCoalition:OnEnterEmpty()
      HatzorCoalition:DrawZone(-1, Color_Gray, 1, Color_Gray, .5, 1, true)
   end

   function HatzorCoalition:OnEnterGuarded( From, Event, To )
      if From ~= To then
         local Coalition = self:GetCoalition()
         self:E( { Coalition = Coalition } )
         if Coalition == coalition.side.BLUE then
            HatzorCoalition:DrawZone(-1, Color_Blue, 1, Color_Blue, .5, 1, true)
         else
            HatzorCoalition:DrawZone(-1, Color_Red, 1, Color_Red, .5, 1, true)
         end
      end
   end

   

-- **********************************************************************************************************************************************************************************************************************************************************************
-- END ZONE CAPTURE SCRIPT
-- **********************************************************************************************************************************************************************************************************************************************************************

-- **********************************************************************************************************************************************************************************************************************************************************************
-- BEGIN MOOSE ATIS
-- **********************************************************************************************************************************************************************************************************************************************************************

-- ISRAEL --
   -- ATIS Ben-Gurion LLBG Airport on 121.55 MHz AM.
   atisLLBG=ATIS:New("Ben-Gurion", 121.55)
   atisLLBG:SetRadioRelayUnitName("Radio Relay Ben-Gurion")
   -- atisLLBG:SetActiveRunway("31R")
   atisLLBG:SetSubtitleDuration(0)
   atisLLBG:Start()

   -- ATIS Tel Nof LLEK Airport on 258.7 MHz AM (fictional).
   atisLLEK=ATIS:New("Tel Nof", 258.7)
   atisLLEK:SetRadioRelayUnitName("Radio Relay Tel Nof")
   -- atisLLEK:SetActiveRunway("31")
   atisLLEK:SetSubtitleDuration(0)
   atisLLEK:Start()

   -- ATIS Minhad OMDM Airport on 224.9 MHz AM (fictional)
   --atisOMDM=ATIS:New("Al Minhad AFB", 224.9)
   --atisOMDM:SetRadioRelayUnitName("Radio Relay Minhad")
   --atisOMDM:SetActiveRunway("27")
   --atisOMDM:SetSubtitleDuration(0)
   --atisOMDM:Start()

-- EGYPT --
   -- ATIS Khasab OOKB Airport on 125.00 MHz AM (fictional).
   --atisOOKB=ATIS:New("Khasab", 125.00)
   --atisOOKB:SetRadioRelayUnitName("Radio Relay Khasab")
   --atisOOKB:SetActiveRunway("19")
   --atisOOKB:SetSubtitleDuration(0)
   --atisOOKB:Start()

-- JORDAN --


-- **********************************************************************************************************************************************************************************************************************************************************************
-- END MOOSE ATIS
-- **********************************************************************************************************************************************************************************************************************************************************************

-- Script Test
-- If this shows in the mission, the entire script is running
testMessage = MESSAGE:New( "The TIW Script Is Working!", 30):ToAll()