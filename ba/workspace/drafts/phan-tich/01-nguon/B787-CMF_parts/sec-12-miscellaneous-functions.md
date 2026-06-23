## **12 Miscellaneous Functions** 

This section describes the miscellaneous functions that the AMI implements. 

## **12.1 Airports Processing** 

The Airports Processing function ensures that the CMF origin and destination airport parameters follow the FMF origin and destination airport parameters as appropriate. 

## **12.1.1 Logic Unit** 

```
-- ----------------------------------------------------------------------------
```

```
--
-- Version F001  M. Matyas  29-SEP-2020
--     Logic from 777 for CMF origin and destination airport parameters to
--         follow equivalent FMF parameters as appropriate.
--
-- ----------------------------------------------------------------------------
```

```
-- Origin station:
if (OOOI_STATE = IN and not valid (EOF_TIMER))
or OOOI_STATE = OUT then                                   -- Before takeoff
    if not valid (INIT_ORIG_STA) then
        if valid (FMF_ACTRTEORIGIN) then
            INIT_ORIG_STA := FMF_ACTRTEORIGIN;
        end_if;
    else
        if valid (FMF_ACTRTEORIGIN) then
            if (INIT_ORIG_STA != FMF_ACTRTEORIGIN) then
                INIT_ORIG_STA := FMF_ACTRTEORIGIN;
            end_if;
        end_if;
    end_if;
else_if OOOI_STATE = OFF or OOOI_STATE = ON
or (OOOI_STATE = IN and valid (EOF_TIMER)) then            -- After takeoff
    if OOOI_STATE = OFF then
        if not valid (OFF_STA) then
            OFF_STA := FMF_ACTRTEORIGIN;
        end_if;
```

293 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

```
    end_if;
    if not valid (INIT_ORIG_STA) then
        if valid (OFF_STA) then
            INIT_ORIG_STA := OFF_STA;
        end_if;
    else
        if valid (OFF_STA) then
            if (INIT_ORIG_STA != OFF_STA) then
                INIT_ORIG_STA := OFF_STA;
            end_if;
        end_if;
    end_if;
end_if;
-- ----------------------------------------------------------------------------
--
-- Destination station:
if (OOOI_STATE = IN and not valid (EOF_TIMER))
or OOOI_STATE = OUT or OOOI_STATE = OFF then               -- Before landing
    if not valid (INIT_DEST_STA) then
        if valid (FMF_ACTRTEDEST) then
            INIT_DEST_STA := FMF_ACTRTEDEST;
        end_if;
    else
        if valid (FMF_ACTRTEDEST) then
            if (INIT_DEST_STA != FMF_ACTRTEDEST) then
                INIT_DEST_STA := FMF_ACTRTEDEST;
            end_if;
        end_if;
    end_if;
else_if OOOI_STATE = ON
or (OOOI_STATE = IN and valid (EOF_TIMER)) then            -- After landing
    if OOOI_STATE = ON
    and (not FUEL_SW_L_CUTOFF) and (not FUEL_SW_R_CUTOFF) then
        if not valid (ON_STA)
        or (valid (ON_STA) and ON_STA != FMF_ACTRTEDEST) then
            ON_STA := FMF_ACTRTEDEST;
        end_if;
    end_if;
```

D613Z019-06 294 of 378 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

```
    if not valid (INIT_DEST_STA) then
        if valid (ON_STA) then
            INIT_DEST_STA := ON_STA;
        end_if;
    else
        if valid (ON_STA) then
            if (INIT_DEST_STA != ON_STA) then
                INIT_DEST_STA := ON_STA;
            end_if;
        end_if;
    end_if;
end_if;
-- ----------------------------------------------------------------------------
--
-- END
```

## **12.2 End-of-Flight Processing** 

The End-of-Flight Processing function copies and resets the values of certain user-defined parameters in preparation for the next flight.  This function automatically operates 9 minutes and 50 seconds after an In event (before the CMF automatic end of flight reset occurs 10 minutes after the airplane has transitioned from the in-air state to the on-ground state and at least one door has been opened). 

## **12.2.1 Logic Unit** 

```
-- ----------------------------------------------------------------------
```

```
--
-- VERSION C000 - New versioning - no change in logic
--
-- VERSION D002
--         Added default data for OOOI data
--         Added more comments
--
-- Version E001  M. Matyas  11-FEB-2019
--     Added "set_default (FUEL_ON_BOARD)".
--     Removed unnecessary "set_default (ESB_DELAY_SEL)",
--         "set_default (ARR_LNDG_PILOT)", "set_default (DIV_CODE)", and
--         "set_default (WXR_RQST_TYPE)".
--     Added logic for flight and block times and fuels.
--
-- Version F001  M. Matyas  29-SEP-2020
```

295 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

```
--     Added "set_default (EOF_TIMER)", "set_default (OFF_STA)",
--         "set_default (ON_STA)", and "set_default (AHM_INIT_FLAG)".
--     Updated references from INIT_DEPT_STA to INIT_ORIG_STA and
--         from PREV_DEPT_STA to PREV_ORIG_STA.
--
-- ----------------------------------------------------------------------
--
if CURRENT_DATE_TIME reached (EOF_TIMER)
   and valid (EOF_TIMER) then
    -- Move current flight data to previous flight data:
    PREV_FLIGHT_NUMBER  := ENTERED_FLTNO;
    PREV_ORIG_STA       := INIT_ORIG_STA;
    PREV_DEST_STA       := INIT_DEST_STA;
    PREV_BOARDED_FUEL   := INIT_BOARDED_FUEL;
    PREV_OUT_TIME       := OUT_TIME;
    PREV_OUT_FOB        := OUT_FOB;
    PREV_OFF_TIME       := OFF_TIME;
    PREV_OFF_FOB        := OFF_FOB;
    PREV_ON_TIME        := ON_TIME;
    PREV_ON_FOB         := ON_FOB;
    PREV_IN_TIME        := IN_TIME;
    PREV_IN_FOB         := IN_FOB;
    PREV_BLOCK_TIME     := BLOCK_TIME;
    PREV_BLOCK_FUEL     := BLOCK_FUEL;
    PREV_FLIGHT_TIME    := FLIGHT_TIME;
    PREV_FLIGHT_FUEL    := FLIGHT_FUEL;
    -- Initialization parameters:
    set_default (ENTERED_FLTNO);
    set_default (FUEL_ON_BOARD);
    set_default (INIT_SKED_DATE);
    set_default (INIT_ORIG_STA);
    set_default (INIT_DEST_STA);
    set_default (INIT_ALTN_STA_1);
    set_default (INIT_ALTN_STA_2);
    set_default (INIT_FLIGHT_PLAN_TIME);
    set_default (INIT_FOB);
    set_default (INIT_BOARDED_FUEL);
    set_default (INIT_PAY_CAPT);
    set_default (INIT_PAY_FO_1);
    set_default (INIT_PAY_FO_2);
    set_default (INIT_PAY_FO_3);
    set_default (AHM_INIT_FLAG);
```

```
    -- OOOI parameters:
```

296 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

```
    set_default (OOOI_ENABLED);
    set_default (OFF_STA);
    set_default (ON_STA);
    -- OOOI times:
    set_default (OUT_TIME);
    set_default (OFF_TIME);
    set_default (ON_TIME);
    set_default (IN_TIME);
    -- OOOI fuel on board:
    set_default (OUT_FOB);
    set_default (OFF_FOB);
    set_default (ON_FOB);
    set_default (IN_FOB);
    -- Flight and block times and fuels:
    set_default (FLIGHT_TIME);
    set_default (FLIGHT_FUEL);
    set_default (BLOCK_TIME);
    set_default (BLOCK_FUEL);
    set_default (EOF_TIMER);
    end_if;
-- ----------------------------------------------------------------------
-- END
-- ----------------------------------------------------------------------
```

## **12.3 Parameters Processing** 

The Parameters Processing function sets the values of certain parameters, including the following: 

- All doors closed/open status 

- Air/ground status 

- Parking brake set time (for OOOI reports) 

- Central Maintenance Computing Function (CMCF) flight phase string 

- Aircraft registration 

- Fuel on board 

- CMF link strength 

297 of 378 

D613Z019-06 

NEW 

ECCN: 7E994 **BOEING PROPRIETARY** 

- FMF destination ETA 

- VHF Data Radio (VDR) substate 

## **12.3.1 Logic Unit** 

```
-- ----------------------------------------------------------------------------
```

```
--
```

```
-- Version C000  2014-02-12
--     Added CMCF flight phase integer to text logic used on SENSOR STATUS page.
--
```

```
-- Version D001  M. Matyas  24-OCT-2017
--     Commented out logic to calculate CURRENT_HHMM because OOOI logic changed
--         to use CURRENT_TIME instead.
--
-- Version D002  S. Meisch  2018 OCT
--     Moved DOORS_ALL_CLOSED, AIRCRAFT_IN_AIR, BRAKE_TIME parameters
--         from OOOI_LOGIC logic unit to BCG_PARAMETERS logic unit.
--         This logic unit should run before all other logic units.
--         This assures that commonly used parameters are evaluated
--         and updated in the correct sequence.
--
-- Version D003  S. Meisch  2018 DEC
--     Adds patch to suppress increase in FOB after engines have started.
--
-- Version E001  M. Matyas  08-FEB-2019
--     Added FOB invalidity check to logic that suppresses FOB increase
--         after engine start.
--     Added logic to calculate FMF destination ETA UDP based on FMF
--         destination ETE ACP.
--     Added logic to convert VDR substate ACP which reflects A750 binary
--         values to VDR substate UDP which reflects A750 decimal values.
--
-- Version F001  M. Matyas  29-SEP-2020
--     Added logic to set delay type if invalid.
--
-- ----------------------------------------------------------------------------
```

```
-- DOORS_ALL_CLOSED
--   Determine if all DOORS are CLOSED (true)
--   or ANY door is OPEN (false)
--
   if   ALL_ENTRY_DOORS_CLOSED          = TRUE
        and DOOR_AFT_EE_ACCESS_OPEN     = FALSE
        and DOOR_BULK_CARGO_OPEN        = FALSE
```

298 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

```
        and DOOR_AFT_CARGO_OPEN         = FALSE
        and DOOR_FWD_ACCESS_OPEN        = FALSE
        and DOOR_FWD_CARGO_OPEN         = FALSE
        and DOOR_FWD_EE_ACCESS_OPEN     = FALSE
        and DOOR_FWD_OVERHEAD_OPEN      = FALSE then
          DOORS_ALL_CLOSED := TRUE;
   else
          DOORS_ALL_CLOSED := FALSE;
   end_if;
```

```
-- ----------------------------------------------------------------------------
--
-- On power up, determine air/ground status
-- AIRCRAFT_IN_AIR defaults to invalid at power-up
--
   if not valid (AIRCRAFT_IN_AIR) then
        if (AIRBORNE) then
                AIRCRAFT_IN_AIR := TRUE;
        else
                AIRCRAFT_IN_AIR := FALSE;
        end_if;
   end_if;
```

```
-- Use AIRBORNE (weight-on-wheels) if valid and showing on-ground or in-air
-- for 3 seconds
```

```
   if for 3 seconds (AIRBORNE) then
   AIRCRAFT_IN_AIR := TRUE;
   end_if;
   if for 3 seconds (not AIRBORNE) then
   AIRCRAFT_IN_AIR := FALSE;
   end_if;
-- Use CAS if AIRBORNE not valid for 3 seconds (and CAS is valid)
   if for 3 seconds (not valid (AIRBORNE)) then
      if valid (ADRF_CAS_VOTED) then
         if ADRF_CAS_VOTED > 125.0 then
            AIRCRAFT_IN_AIR := TRUE;
         else AIRCRAFT_IN_AIR := FALSE;
         end_if;
-- Otherwise use groundspeed if valid
      else if valid (NAV_GROUNDSPEED) then
```

299 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

```
         if NAV_GROUNDSPEED > 130.0 then
            AIRCRAFT_IN_AIR := TRUE;
         else AIRCRAFT_IN_AIR := FALSE;
            end_if;
      end_if;
      end_if;
   end_if;
```

```
-- And if none of the three are valid, AIRCRAFT_IN_AIR status remains unchanged
--
-- ----------------------------------------------------------------------------
--
-- BRAKE_TIME
--    Capture parking brake set time:
--
   if PARKINGBRKLEVERSET changed to (TRUE) then
      BRAKE_TIME := CURRENT_TIME;
   end_if;
```

```
-- ----------------------------------------------------------------------------
--
-- Set CMCF flight phase string:
--
  if CMCF_FLIGHT_PHASE = 1 then
    CMCF_FLT_PHASE_TEXT := " 1 - POWER ON";
  else_if CMCF_FLIGHT_PHASE = 2 then
    CMCF_FLT_PHASE_TEXT := " 2 - ENGINE START";
  else_if CMCF_FLIGHT_PHASE = 3 then
    CMCF_FLT_PHASE_TEXT := " 3 - TAXI OUT";
  else_if CMCF_FLIGHT_PHASE = 4   then
    CMCF_FLT_PHASE_TEXT := " 4 - TAKEOFF";
  else_if CMCF_FLIGHT_PHASE = 5   then
    CMCF_FLT_PHASE_TEXT := " 5 - INITIAL CLIMB";
  else_if CMCF_FLIGHT_PHASE = 6   then
    CMCF_FLT_PHASE_TEXT := " 6 - CLIMB";
  else_if CMCF_FLIGHT_PHASE = 7   then
    CMCF_FLT_PHASE_TEXT := " 7 - ENROUTE";
  else_if CMCF_FLIGHT_PHASE = 8   then
```

D613Z019-06 ECCN: 7E994 

300 of 378 

NEW 

**BOEING PROPRIETARY** 

```
    CMCF_FLT_PHASE_TEXT := " 8 - DESCENT";
  else_if CMCF_FLIGHT_PHASE = 9   then
    CMCF_FLT_PHASE_TEXT := " 9 - APPROACH";
  else_if CMCF_FLIGHT_PHASE = 10   then
    CMCF_FLT_PHASE_TEXT := "10 - GO AROUND";
  else_if CMCF_FLIGHT_PHASE = 11   then
    CMCF_FLT_PHASE_TEXT := "11 - FLARE";
  else_if CMCF_FLIGHT_PHASE = 12   then
    CMCF_FLT_PHASE_TEXT := "12 - ROLLOUT";
  else_if CMCF_FLIGHT_PHASE = 13   then
    CMCF_FLT_PHASE_TEXT := "13 - TAXI IN";
  else_if CMCF_FLIGHT_PHASE = 14   then
    CMCF_FLT_PHASE_TEXT := "14 - ENGINE SHUTDOWN";
  else_if CMCF_FLIGHT_PHASE = 15   then
    CMCF_FLT_PHASE_TEXT := "15 - MAINTENANCE";
  else_if CMCF_FLIGHT_PHASE = 0   then
    CMCF_FLT_PHASE_TEXT := "0";
```

```
  end_if;
```

```
-- ----------------------------------------------------------------------------
```

```
--
-- REGISTRATION_NO assigned to UDP and updated real time.
--
REGISTRATION_NO := AIRCRAFT_REGISTRATION_MARK;
--
-- ----------------------------------------------------------------------------
--
-- 1) Convert TOTAL_FILTERED_FUEL_MASS from integer to real
--      integer: TOTAL_FILTERED_FUEL_MASS
--      real:    FUEL_ON_BOARD
--
-- 2) Suppress increase in fuel on board after engines have started
--      real:    FUEL_ON_BOARD_CHECK (used to detect increase in fuel on board)
--
   FUEL_ON_BOARD_CHECK := TOTAL_FILTERED_FUEL_MASS;    -- actual fuel
```

```
   -- Check for increase in fuel on baord after engines start
```

301 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

```
   if not valid (FUEL_ON_BOARD) or (FUEL_SW_L_CUTOFF and FUEL_SW_R_CUTOFF) then
      -- FUEL_ON_BOARD not initialized or both engines off
      FUEL_ON_BOARD := FUEL_ON_BOARD_CHECK;            -- update FUEL_ON_BOARD
   else      -- FUEL_ON_BOARD initialized or both engines on
      if FUEL_ON_BOARD > FUEL_ON_BOARD_CHECK then
         FUEL_ON_BOARD := FUEL_ON_BOARD_CHECK;         -- update FUEL_ON_BOARD
      -- else current fuel on board increased after engine start, do not update
      -- FUEL_ON_BOARD
      end_if;
   end_if;
-- ----------------------------------------------------------------------------
--
-- CMF_LINK_STRENGTH is a representation of ACARS goodness.
if VHF_LINK_STATUS = 1
       then VHF_STRENGTH := 4;
       else VHF_STRENGTH := 0;
end_if;
if HF_LINK_STATUS = 1
       then HF_STRENGTH := 1;
       else HF_STRENGTH := 0;
end_if;
if SATCOM_LINK_STATUS = 1
       then SATCOM_STRENGTH := 2;
       else SATCOM_STRENGTH := 0;
end_if;
CMF_LINK_STRENGTH := VHF_STRENGTH + HF_STRENGTH + SATCOM_STRENGTH;
```

```
-------------------------------------------------------------------------------
--
-- Calculate FMF destination ETA UDP based on FMF destination ETE ACP:
    if valid (FMF_TIME_TO_DEST) then
        FMF_DEST_ETA := FMF_TIME_TO_DEST + CURRENT_TIME;
    else set_invalid (FMF_DEST_ETA);
    end_if;
```

D613Z019-06 ECCN: 7E994 

302 of 378 

NEW 

**BOEING PROPRIETARY** 

```
-------------------------------------------------------------------------------
--
-- Convert VDR substate ACP (which reflects A750 binary values) to VDR substate
-- UDP (which reflects A750 decimal values):
    if VDR_SUBSTATE_ACP = 0 then
        VDR_SUBSTATE_UDP := 1;
    else_if VDR_SUBSTATE_ACP = 1 then
        VDR_SUBSTATE_UDP := 3;
    else_if VDR_SUBSTATE_ACP = 2 then
        VDR_SUBSTATE_UDP := 2;
    else set_invalid (VDR_SUBSTATE_UDP);
    end_if;
-- ----------------------------------------------------------------------------
--
-- Set delay type if invalid:
    if not valid (DLY_SELECT) then
        if OOOI_STATE = IN then
            DLY_SELECT             := 1;       -- Select departure delay type
        else_if OOOI_STATE = OUT then
            DLY_SELECT             := 2;       -- Select takeoff delay type
        else_if OOOI_STATE = OFF then
            DLY_SELECT             := 3;       -- Select enroute delay type
        else_if OOOI_STATE = ON then
            DLY_SELECT             := 4;       -- Select arrival delay type
        end_if;
    end_if;
-- ----------------------------------------------------------------------------
--
-- END
```

303 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **12.4 POA Autotune** 

The “Plain Old” ACARS (POA) Autotune function enables the aircraft operator to send an uplink to command CMF to tune to a specified POA frequency. 

## **12.4.1 Uplink Decoding Definition** 

The decoding for the POA Autotune Uplink is defined as follows: 

- ACARS SMI: M4; 

- ACARS Label: 4;  Message Identifier: None 

- Alert Level: None 

- Optional Element Delimiter: None 

Table 12-1 describes the POA Autotune Uplink decoding definition. 

**Table 12-1  POA Autotune Uplink Decoding Definition** 

|**#**|**Length**|**Required**|**Destination Parameter**|**Element Description**|
|---|---|---|---|---|
|1|6|Yes|POA_AUTOTUNE_FREQUENCY|"POA autotune frequency (118000-136975)"|



Note: Supported frequencies are those in the range from 118.000 MHz to 136.975 MHz with 8.33 kHz frequency spacing. 

## **Sample Message** 

```
QU DDLXCXA
.RTNBOCR 221954
M4;
AN N7873BO/MA 025A
-  131550
```

## **12.4.2 Logic Unit** 

```
-- ---------------------------------------------------------------------
```

- `-- BCG_POA_AUTOTUNE     M. Matyas  24-OCT-2017` 

```
--
```

> `-- Write POA autotune frequency from POA autotune uplink to autotune` 

- `-- frequency ACP:` 

```
-- ---------------------------------------------------------------------
```

```
--
```

304 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

```
    if POA_AUTOTUNE_ENABLE_WRITE = TRUE then
        if valid(POA_AUTOTUNE_FREQUENCY) then
            if ACTIVE_DATA_FREQUENCY != POA_AUTOTUNE_FREQUENCY then
                AUTOTUNE_FREQUENCY := POA_AUTOTUNE_FREQUENCY;
                POA_AUTOTUNE_ENABLE_WRITE := FALSE;
            end_if;
        end_if;
    end_if;
--
-- ---------------------------------------------------------------------
-- END:         BCG_POA_AUTOTUNE
-- ---------------------------------------------------------------------
```

## **12.5 Reject Downlinks** 

The AMI implements three downlinks to reject uplinks for indicated reasons. 

## **12.5.1 Invalid Reject Downlink** 

CMF sends the Invalid Reject Downlink when it receives an uplink that does not comply with the associated decoding definition. 

## **12.5.1.1 Downlink Encoding Definition** 

The Invalid Reject Downlink is defined as follows: 

- ACARS SMI: A8X 

- ACARS Label: 8X  Allowable Subnetworks: All  Downlink Priority: Flight Regularity  Downlink Buffer: RESPONSE_AUTO  Delete at System Reset: No  Delete on Buffer Full: Yes 

Table 12-2 describes the Invalid Reject Downlink encoding definition. 

**Table 12-2  Invalid Reject Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|2|Always|UPLINK_LABEL|"Uplink Label (XX)"|
|3|1|Always|<SP>|"Delimiter"|



305 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|4|7|Always|INVALID|"Rejection Reason"|
|5|1|Always|<SP>|"Delimiter"|
|6|1-50|Always|UPLINK_TEXT|"Uplink text (1-50 characters)"|



## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221839
A8X
FI BO64/AN N7873BO
DT DDL BFI 221839 M41A
-  RA INVALID QURTNBOCR~1CAA101190436
CREW ADVISORY...
```

## **12.5.2 Unable to Deliver Reject Downlink** 

CMF sends the Unable to Deliver Reject Downlink when it receives an uplink intended for a particular datalink end system but CMF cannot deliver the uplink to the end system. 

## **12.5.2.1 Downlink Encoding Definition** 

The Unable to Deliver Reject Downlink is defined as follows: 

- ACARS SMI: REJ 

- ACARS Label: HX  Allowable Subnetworks: All 

- Downlink Priority: Flight Regularity 

- Downlink Buffer: RESPONSE_AUTO 

- Delete at System Reset: No 

- Delete on Buffer Full: Yes 

Table 12-3 describes the Unable to Deliver Reject Downlink encoding definition. 

**Table 12-3  Unable to Deliver Reject Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|1|Always|.|"Delimiter"|
|3|2|Always|EXTERNAL_UPLINK_LABEL|"Uplink Label (XX)"|
|4|1|Always|<SP>|"Delimiter"|



306 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|5|1-50|Always|EXTERNAL_UPLINK_TEXT|"Uplink text (1-50 characters)”|



## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221839
REJ
FI BO64/AN N7873BO
DT DDL BFI 221839 M52A
-  .H1 - #T6EMU-R UPLINK TEST
```

## **12.5.3 Unable to Process Reject Downlink** 

CMF sends the Unable to Process Reject Downlink when it receives an uplink that it is unable to process (for example, when it receives a printer uplink but the printer is unavailable). 

## **12.5.3.1 Downlink Encoding Definition** 

The Unable to Process Reject Downlink is defined as follows: 

- ACARS SMI: A8X 

- ACARS Label: 8X 

- Allowable Subnetworks: All 

- Downlink Priority: Flight Regularity 

- Downlink Buffer: RESPONSE_AUTO 

- Delete at System Reset: No 

- Delete on Buffer Full: Yes 

Table 12-4 describes the Unable to Process Reject Downlink encoding definition. 

**Table 12-4  Unable to Process Reject Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|2|Always|UPLINK_LABEL|"Uplink Label (XX)"|
|3|1|Always|<SP>|"Delimiter"|
|4|6|Always|UNABLE|"Rejection Reason"|
|5|1|Always|<SP>|"Delimiter"|
|6|1-50|Always|UPLINK_TEXT|"Uplink text (1-50 characters)"|



307 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221839
A8X
FI BO64/AN N7873BO
DT DDL BFI 221839 M42A
```

```
-  C1 UNABLE PRINTER UPLINK...
```

## **12.6 Sensor Status** 

The Sensor Status function enables the flight crew to view certain aircraft sensor information and other relevant data.  This data includes aircraft parameters which are available to CMF and are accessible via the A/C PARAMS command button on the SENSOR STATUS display.  This command button is password-protected with a password of “GORDON”. 

Note:  The password must be entered into the scratchpad every time the display is accessed. 

## **12.6.1 Display Definition** 

Figure 12-1 shows the Sensor Status display definition. 

308 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [242 x 360] intentionally omitted <==**

**Figure 12-1  Sensor Status Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “SENSOR STATUS” 

## **Main Area** 

Table 12-5 describes the Sensor Status display parameters. 

**Table 12-5  Sensor Status Display Parameters** 

|**Name**|**Length**|**Format**|**Range**|**Parameter**|
|---|---|---|---|---|
|AIRCRAFT<br>REGISTRATION|1-7|XXXXXXX||AIRCRAFT_REGISTRATION_MARK|
|FLIGHT NUMBER|1-10|XXXXXXXXXX||FMF_CMF_FLIGHT_NUMBER|



D613Z019-06 309 of 378 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

|**Name**|**Length**|**Format**|**Range**|**Parameter**|
|---|---|---|---|---|
|ACARS FLIGHT<br>IDENTIFIER|3-6|XXXXXX||ACARS_FLIGHT_IDENTIFIER|
|TIME & DATE|20|HH:MM:SS<br>DD-MMM-YYYY||CURRENT_DATE_TIME|
|POSITION|18|XDD°MM.T<br>XDDD°MM.T||AIRCRAFT_POSITION|
|ALTITUDE|1-5|NNNNN||NAV_ALTITUDE|
|OOOI STATE|2-3|XXX|OUT, OFF,<br>ON, or IN|OOOI_STATUS|
|ALL DOORS|6-10|XXXXXXXXXX|CLOSED or<br>NOT<br>CLOSED|DOORS_ALL_CLOSED|
|PARKING BRAKE|3-8|XXXXXXXX|SET or<br>RELEASED|PARKINGBRKLEVERSET|
|AIR/GROUND STATE|3-6|XXXXXX|AIR or<br>GROUND|AIRCRAFT_IN_AIR|
|FLIGHT PHASE|5-20|XXX…|See below|CMCF_FLT_PHASE_TEXT|
|ENGINES (L/R)|2-3 / 2-3|XXX / XXX|ON or OFF|FUEL_SW_L_CUTOFF /<br>FUEL_SW_R_CUTOFF|



Possible flight phase indications are: 

- 1 - POWER ON 

- 2 - ENGINE START 

- 3 - TAXI OUT 

- 4 - TAKEOFF 

- 5 - INITIAL CLIMB 

- 6 - CLIMB 

- 7 - ENROUTE 

- 8 - DESCENT 

- 9 - APPROACH 

- 10 - GO AROUND 

- 11 - FLARE 

- 12 - ROLLOUT 

- 13 - TAXI IN 

- 14 - ENGINE SHUTDOWN 

- 15 - MAINTENANCE 

310 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **Command Buttons** 

Table 12-6 describes the Sensor Status display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 12-6  Sensor Status Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|-|-|-|-|
|2|-|-|-|-|
|3|A/C<br>PARAMS|Show AIRCRAFT<br>PARAMETERS<br>display|Always|-|
|4|-|-|-|-|
|5|RETURN|Return|Always|-|
|6|EXIT|Exit|Always|-|



## **12.6.2 Aircraft Parameters Menu** 

The Aircraft Parameters Menu is accessed from the Sensor Status display and provides access to specific aircraft parameter displays. 

## **12.6.2.1 Display Definition** 

Figure 12-2 shows the Aircraft Parameters Menu display definition. 

311 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [243 x 360] intentionally omitted <==**

**Figure 12-2  Aircraft Parameters Menu Display Definition** 

## **12.6.2.1.1 CMF Parameters Display Definition** 

Figure 12-3 shows the CMF Parameters page 1 of 5 display definition. 

312 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [243 x 360] intentionally omitted <==**

**Figure 12-3: CMF Parameters Page 1 of 5 Display Definition** 

Figure 12-4 shows the CMF Parameters page 2 of 5 display definition. 

313 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [242 x 360] intentionally omitted <==**

**Figure 12-4  CMF Parameters Page 2 of 5 Display Definition** 

Of note, the CMF Parameters page 2 of 5 display definition shows and enables modification of the following values, each of which are stored in NVM in order to retain the values across CMF power cycles: 

- Automatic position reports enable/disable 

- Automatic position reports interval (in a range from 5 to 60 minutes) 

- AHM flight phase reports enable/disable 

- AoIP link advisories enable/disable 

Figure 12-5 shows the CMF Parameters page 3 of 5 display definition. 

314 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [244 x 360] intentionally omitted <==**

**Figure 12-5  CMF Parameters Page 3 of 5 Display Definition** 

Figure 12-6 shows the CMF Parameters page 4 of 5 display definition. 

315 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [243 x 360] intentionally omitted <==**

**Figure 12-6  CMF Parameters Page 4 of 5 Display Definition** 

Figure 12-7 shows the CMF Parameters page 5 of 5 display definition. 

316 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [244 x 360] intentionally omitted <==**

**Figure 12-7  CMF Parameters Page 5 of 5 Display Definition** 

## **12.6.2.1.2 FMF and Navigation Parameters Display Definition** 

Figure 12-8 shows the Flight Management Function (FMF) and Navigation Parameters page 1 of 3 display definition. 

317 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [244 x 360] intentionally omitted <==**

**Figure 12-8  FMF and Navigation Parameters Page 1 of 3 Display Definition** Figure 12-9 shows the FMF and Navigation Parameters page 2 of 3 display definition. 

318 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [243 x 360] intentionally omitted <==**

**Figure 12-9  FMF and Navigation Parameters Page 2 of 3 Display Definition** Figure 12-10 shows the FMF and Navigation Parameters page 3 of 3 display definition. 

319 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [243 x 360] intentionally omitted <==**

**Figure 12-10  FMF and Navigation Parameters Page 3 of 3 Display Definition** 

Note: Headings, tracks, and bearings (i.e., the NAV_MAG_HDG, NAV_MAG_TRACK, NAV_TRUE_HDG, NAV_TRUE_TRACK, NAV_WIND_TRUE_BRG, ND_HEADING_CAPT, and ND_HEADING_FO parameters) are expressed in raw format, where negative values are west of north.  For example, a raw heading of -135° corresponds to a compass heading of 225° and a raw track of -015° corresponds to a compass track of 345°.  Accordingly, if a raw direction is negative then it may be converted to a compass direction by adding 360°.  No such conversion is necessary if a raw direction is positive. 

## **12.6.2.1.3 Engine and FQMS Parameters Display Definition** 

Figure 12-11 shows the Engine and FQMS Parameters display definition. 

320 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [243 x 360] intentionally omitted <==**

**Figure 12-11  Engine and FQMS Parameters Display Definition** 

## **12.6.2.1.4 ADRF and IRU Parameters Display Definition** 

Figure 12-12 shows the Air Data Reference Function (ADRF) and Inertial Reference Unit (IRU) Parameters display definition. 

321 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [243 x 360] intentionally omitted <==**

**Figure 12-12  ADRF and IRU Parameters Display Definition** 

## **12.6.2.1.5 FCM Parameters Display Definition** 

Figure 12-13 shows the Flight Control Module (FCM) Parameters display definition. 

322 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [242 x 360] intentionally omitted <==**

**Figure 12-13  FCM Parameters Display Definition** 

## **12.6.2.1.6 PSS Parameters Display Definition** 

Figure 12-14 shows the Proximity Sensing System (PSS) Parameters display definition. 

323 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [242 x 360] intentionally omitted <==**

**Figure 12-14  PSS Parameters Display Definition** 

## **12.6.2.1.7 Miscellaneous Parameters Display Definition** 

Figure 12-15 shows the Miscellaneous Parameters display definition. 

324 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [244 x 360] intentionally omitted <==**

**Figure 12-15  Miscellaneous Parameters Display Definition** 

Note: Headings, tracks, and bearings (i.e., the NAV_MAG_HDG, NAV_MAG_TRACK, NAV_TRUE_HDG, NAV_TRUE_TRACK, NAV_WIND_TRUE_BRG, ND_HEADING_CAPT, and ND_HEADING_FO parameters) are expressed in raw format, where negative values are west of north.  For example, a raw heading of -135° corresponds to a compass heading of 225° and a raw track of -015° corresponds to a compass track of 345°.  Accordingly, if a raw direction is negative then it may be converted to a compass direction by adding 360°.  No such conversion is necessary if a raw direction is positive. 

## **12.6.2.1.8 Automatic Emergency Report Parameters Display Definition** 

Figure 12-16 shows the Automatic Emergency Report Parameters page 1 of 2 display definition. 

325 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [243 x 360] intentionally omitted <==**

**Figure 12-16  Automatic Emergency Report Parameters Page 1 of 2 Display Definition** 

Figure 12-17 shows the Automatic Emergency Report Parameters page 2 of 2 display definition. 

326 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [243 x 360] intentionally omitted <==**

**Figure 12-17  Automatic Emergency Report Parameters Page 2 of 2 Display Definition** 

## **12.6.2.1.9 OOOI Parameters Display Definition** 

Figure 12-18 shows the OOOI Parameters display definition. 

327 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [244 x 360] intentionally omitted <==**

**Figure 12-18  OOOI Parameters Display Definition** 

## **12.6.2.1.10 Reminders Parameters Display Definition** 

Figure 12-19 shows the Reminders Parameters display definition. 

328 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [243 x 360] intentionally omitted <==**

**Figure 12-19  Reminders Parameters Display Definition** 

## **12.7 Times and Fuels** 

The Times and Fuels function tracks and displays flight identifier, departure and destination airports, fuel boarded, OOOI times and fuels, flight times and fuels, and block times and fuels information for the current and previous flights.  This function consists mainly of a display definition, although it relies on the OOOI logic units that Section 9.6.1 and Section 9.6.2 describe and also on the end-of-flight logic unit that Section 12.2.1 describes. 

## **12.7.1 Display Definition** 

Figure 12-20 shows the Times and Fuels display definition. 

329 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [244 x 360] intentionally omitted <==**

**Figure 12-20  Times and Fuels Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “TIMES & FUELS” 

## **Main Area** 

The main area contains two columns of display-only data.  The first column contains data for the current flight, while the second column contains corresponding data for the previous flight. 

Table 12-7 describes the Times and Fuels display current flight column parameters.  The AMI moves the values of these parameters to the parameters in the previous flight column 9 minutes and 50 seconds after an In event (before the CMF automatic end of flight reset occurs 10 minutes after the In event). 

330 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**Table 12-7  Times and Fuels Display Current Flight Column Parameters** 

|**Name**|**Format**|**Parameter**|
|---|---|---|
|none|XXXXXXXXXX|ENTERED_FLTNO|
|none|XXXX|INIT_ORIG_STA|
|none|XXXX|INIT_DEST_STA|
|FUEL BOARDED|NNNNNN|INIT_BOARDED_FUEL|
|OUT TIME|HH:MM|OUT_TIME|
|OUT FUEL|NNN.N|OUT_FOB|
|OFF TIME|HH:MM|OFF_TIME|
|OFF FUEL|NNN.N|OFF_FOB|
|ON TIME|HH:MM|ON_TIME|
|ON FUEL|NNN.N|ON_FOB|
|IN TIME|HH:MM|IN_TIME|
|IN FUEL|NNN.N|IN_FOB|
|FLIGHT TIME|HH+MM|FLIGHT_TIME|
|FLIGHT FUEL|NNN.N|FLIGHT_FUEL|
|BLOCK TIME|HH+MM|BLOCK_TIME|
|BLOCK FUEL|NNN.N|BLOCK_FUEL|



Table 12-8 describes the Times and Fuels display PREVIOUS FLIGHT column parameters. CMF stores the values of these parameters in NVM in order to retain them across power cycles. 

**Table 12-8  Times and Fuels Display Previous Flight Column Parameters** 

|**Name**|**Format**|**Parameter**|
|---|---|---|
|none|XXXXXXXXXX|PREV_FLIGHT_NUMBER|
|none|XXXX|PREV_ORIG_STA|
|none|XXXX|PREV_DEST_STA|
|FUEL BOARDED|NNNNNN|PREV_BOARDED_FUEL|
|OUT TIME|HH:MM|PREV_OUT_TIME|
|OUT FUEL|NNN.N|PREV_OUT_FOB|
|OFF TIME|HH:MM|PREV_OFF_TIME|
|OFF FUEL|NNN.N|PREV_OFF_FOB|
|ON TIME|HH:MM|PREV_ON_TIME|
|ON FUEL|NNN.N|PREV_ON_FOB|
|IN TIME|HH:MM|PREV_IN_TIME|
|IN FUEL|NNN.N|PREV_IN_FOB|
|FLIGHT TIME|HH+MM|PREV_FLIGHT_TIME|
|FLIGHT FUEL|NNN.N|PREV_FLIGHT_FUEL|
|BLOCK TIME|HH+MM|PREV_BLOCK_TIME|
|BLOCK FUEL|NNN.N|PREV_BLOCK_FUEL|



331 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **Command Buttons** 

Table 12-9 describes the Times and Fuels display command buttons.  If neither condition is satisfied, then the button is not displayed. 

**Table 12-9  Times and Fuels Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|-|-|-|-|
|2|-|-|-|-|
|3|PRINT|Print|Always|-|
|4|-|-|-|-|
|5|RETURN|Return|Always|-|
|6|EXIT|Exit|Always|-|



## **12.7.2 Print Definition** 

Figure 12-21 shows the Times and Fuels print definition. 

**==> picture [323 x 289] intentionally omitted <==**

**Figure 12-21  Times and Fuels Print Definition** 

332 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW
