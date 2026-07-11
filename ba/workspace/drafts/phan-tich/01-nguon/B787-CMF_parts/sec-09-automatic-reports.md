## **9 Automatic Reports** 

This section describes the automatic report functions that the AMI implements. 

## **9.1 AHM Flight Phase Report** 

This section describes the Airplane Health Management (AHM) Flight Phase Report function that the AMI implements.  This function should not be modified in order to ensure that Boeing AHM receives necessary flight phase reports. 

Note: There is no display definition for this function, although the SENSOR STATUS display described in Section 12.6.1 shows the flight phase and the CMF PARAMETERS display described in Section 12.6.2.1.1 allows AHM flight phase reports to be enabled or disabled. 

## **9.1.1 Logic Unit** 

The AMI implements a logic unit to detect flight phase changes (including OOOI, diversion, and flight initialization events) and generate the AHM Flight Phase Report downlink encoding. 

```
-- ----------------------------------------------------------------------------
```

```
--
-- Revision history
--
-- 17-OCT-2010  Original version
--
-- VERSION C000 --- NEW VERSIONING --- NO CHANGE IN LOGIC
--
-- Version D001  M. Matyas  24-OCT-2017
--     Updated "AHS" references to "AHM".
--     Updated references to AHS_IDENT parameter to AHM_FLIGHT_PHASE_IDENT.
--     Updated references to FLIGHT_PHASE parameter to AHM_FLIGHT_PHASE_ENABLE.
--     No change to logic.
--
-- Version F001  M. Matyas  29-SEP-2020
--     Added logic to send AHM flight phase reports at OOOI events, diversion
--         event, and flight initialization event.
```

```
-- ----------------------------------------------------------------------------
--
```

```
-- When AHM flight phase reports are enabled, CMF creates and sends AHM flight
-- phase reports at the following flight phase transition points and also at
-- at OOOI and diversion events:
```

```
--
```

192 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

- `-- Report Identifier: POES      Transition from PO (1) to ES (2) -- Report Identifier: ESTA      Transition from ES (2) to TA (3) -- Report Identifier: TAES      Transition from TA (3) to ES (2) -- Report Identifier: TATO      Transition from TA (3) to TO (4) -- Report Identifier: TOIC      Transition from TO (4) to IC (5) -- Report Identifier: ICCL      Transition from IC (5) to CL (6) -- Report Identifier: CLER      Transition from CL (6) to ER (7) -- Report Identifier: ERCL      Transition from ER (7) to CL (6) -- Report Identifier: ERDC      Transition from ER (7) to DC (8) -- Report Identifier: DCAP      Transition from DC (8) to AP (9) -- Report Identifier: APGA      Transition from AP (9) to GA (10) -- Report Identifier: APFL      Transition from AP (9) to FL (11) -- Report Identifier: FLRO      Transition from FL (11) to RO (12) -- Report Identifier: ECER      Transition from DC (8) to ER (7) -- Report Identifier: ROTI      Transition from RO (12) to TI (13) -- Report Identifier: TISD      Transition from TI (13) to SD (14) -- Report Identifier: SDPO      Transition from SD (14) to PO (1) -- Report identifier: OUT       Out event -- Report identifier: OFF       Off event -- Report identifier: ON        On event -- Report identifier: IN        In event -- Report identifier: RTG       Return to gate event -- Report identifier: DVRT      Diversion event -- Report identifier: INIT      Flight initialization event --` 

```
-- Note: The number next to the flight phase abbreviation is the integer
-- representation of the flight phase.
--
```

```
-- ----------------------------------------------------------------------
```

```
set_default (CMCF_FLIGHT_PHASE_CURRENT);
set_default (AHM_FLIGHT_PHASE_IDENT);
```

```
if AHM_FLIGHT_PHASE_ENABLE = TRUE then
```

```
    if valid (CMCF_FLIGHT_PHASE) then
        CMCF_FLIGHT_PHASE_CURRENT := CMCF_FLIGHT_PHASE;
    end_if;
```

```
    if (CMCF_FLIGHT_PHASE_CURRENT changed from (1) to (2))  then
         AHM_FLIGHT_PHASE_IDENT := "POES";
         send(BCG_AHM_FLIGHT_PHASE);
```

```
    else_if (CMCF_FLIGHT_PHASE_CURRENT changed from (2) to (3)) then
         AHM_FLIGHT_PHASE_IDENT := "ESTA";
         send(BCG_AHM_FLIGHT_PHASE);
```

193 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

```
    else_if (CMCF_FLIGHT_PHASE_CURRENT changed from (3) to (2)) then
         AHM_FLIGHT_PHASE_IDENT := "TAES";
         send(BCG_AHM_FLIGHT_PHASE);
```

```
    else_if (CMCF_FLIGHT_PHASE_CURRENT changed from (3) to (4)) then
         AHM_FLIGHT_PHASE_IDENT := "TATO";
         send(BCG_AHM_FLIGHT_PHASE);
```

```
    else_if (CMCF_FLIGHT_PHASE_CURRENT changed from (4) to (5)) then
         AHM_FLIGHT_PHASE_IDENT := "TOIC";
         send(BCG_AHM_FLIGHT_PHASE);
```

```
    else_if (CMCF_FLIGHT_PHASE_CURRENT changed from (5) to (6)) then
         AHM_FLIGHT_PHASE_IDENT := "ICCL";
         send(BCG_AHM_FLIGHT_PHASE);
```

```
    else_if (CMCF_FLIGHT_PHASE_CURRENT changed from (6) to (7)) then
         AHM_FLIGHT_PHASE_IDENT := "CLER";
         send(BCG_AHM_FLIGHT_PHASE);
```

```
    else_if (CMCF_FLIGHT_PHASE_CURRENT changed from (7) to (6)) then
         AHM_FLIGHT_PHASE_IDENT := "ERCL";
         send(BCG_AHM_FLIGHT_PHASE);
```

```
    else_if (CMCF_FLIGHT_PHASE_CURRENT changed from (7) to (8)) then
         AHM_FLIGHT_PHASE_IDENT := "ERDC";
```

```
         send(BCG_AHM_FLIGHT_PHASE);
```

```
    else_if (CMCF_FLIGHT_PHASE_CURRENT changed from (8) to (9)) then
         AHM_FLIGHT_PHASE_IDENT := "DCAP";
```

```
         send(BCG_AHM_FLIGHT_PHASE);
```

```
    else_if (CMCF_FLIGHT_PHASE_CURRENT changed from (9) to (10)) then
         AHM_FLIGHT_PHASE_IDENT := "APGA";
         send(BCG_AHM_FLIGHT_PHASE);
```

```
    else_if (CMCF_FLIGHT_PHASE_CURRENT changed from (9) to (11)) then
         AHM_FLIGHT_PHASE_IDENT := "APFL";
         send(BCG_AHM_FLIGHT_PHASE);
```

```
    else_if (CMCF_FLIGHT_PHASE_CURRENT changed from (11) to (12)) then
```

```
         AHM_FLIGHT_PHASE_IDENT := "FLRO";
```

```
         send(BCG_AHM_FLIGHT_PHASE);
```

```
    else_if (CMCF_FLIGHT_PHASE_CURRENT changed from (8) to (7)) then
```

194 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

```
         AHM_FLIGHT_PHASE_IDENT := "ECER";
```

```
         send(BCG_AHM_FLIGHT_PHASE);
```

```
    else_if (CMCF_FLIGHT_PHASE_CURRENT changed from (12) to (13)) then
         AHM_FLIGHT_PHASE_IDENT := "ROTI";
         send(BCG_AHM_FLIGHT_PHASE);
```

```
    else_if (CMCF_FLIGHT_PHASE_CURRENT changed from (13) to (14)) then
         AHM_FLIGHT_PHASE_IDENT := "TISD";
         send(BCG_AHM_FLIGHT_PHASE);
```

```
    else_if (CMCF_FLIGHT_PHASE_CURRENT changed from (14) to (1)) then
         AHM_FLIGHT_PHASE_IDENT := "SDPO";
         send(BCG_AHM_FLIGHT_PHASE);
```

```
    else_if OOOI_STATE changed to (OUT) then
         AHM_FLIGHT_PHASE_IDENT := "OUT";
         send (BCG_AHM_FLIGHT_PHASE);
```

```
    else_if OOOI_STATE changed to (OFF) then
         AHM_FLIGHT_PHASE_IDENT := "OFF";
         send (BCG_AHM_FLIGHT_PHASE);
```

```
    else_if OOOI_STATE changed to (ON) then
         AHM_FLIGHT_PHASE_IDENT := "ON";
         send (BCG_AHM_FLIGHT_PHASE);
```

```
    else_if OOOI_STATE changed to (IN) then
```

```
         if RETURN_TO_GATE then
             AHM_FLIGHT_PHASE_IDENT := "RTG";
             send (BCG_AHM_FLIGHT_PHASE);
         else
```

```
             AHM_FLIGHT_PHASE_IDENT := "IN";
             send (BCG_AHM_FLIGHT_PHASE);
         end_if;
```

```
    else_if AIRCRAFT_IN_AIR
    and valid (FMF_ACTRTEDEST)
    and (AHM_DVRT_PREV_DEST != FMF_ACTRTEDEST) then
        AHM_DVRT_FLAG := TRUE;
```

```
    else_if not AHM_INIT_FLAG then
```

```
        if valid (IRU_RDC_PITCH_ANGLE, FMF_ACTRTEORIGIN, FMF_ACTRTEDEST,
        FMF_ORIGIN_RWY_ID, FMF_CG) then
            AHM_INIT_FLAG := TRUE;
            AHM_FLIGHT_PHASE_IDENT := "INIT";
```

195 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

```
            send (BCG_AHM_FLIGHT_PHASE);
        end_if;
```

```
    end_if;
```

```
    if for 5 seconds (AHM_DVRT_FLAG) then    -- Give FMF time to update params
        AHM_FLIGHT_PHASE_IDENT := "DVRT";
        send (BCG_AHM_FLIGHT_PHASE);
        set_default (AHM_DVRT_FLAG);
    end_if;
end_if;
```

```
AHM_DVRT_PREV_DEST := FMF_ACTRTEDEST;
```

```
-------------------------------------------------------------------------------
--
-- END
```

## **9.1.2 Downlink Encoding Definition** 

If the AMI detects a flight phase transition (e.g., a flight phase transition from Power On to Engine Start) and AHM flight phase reports are enabled, then it sends the following downlink encoding: 

||ACARS SMI:|M49|
|---|---|---|
||ACARS Label:|49|
||Allowable Subnetworks:|All|
||Downlink Priority:|Flight Regularity|
||Downlink Buffer:|REPORT_AUTO|
||Delete at System Reset:|No|
||Delete on Buffer Full:|Yes|



Table 9-1 describes the AHM Flight Phase Report downlink encoding definition. 

**Table 9-1  AHM Flight Phase Report Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|2|Always|01|"Message Version"|
|3|4|Always|AHM_FLIGHT_PHASE_IDENT|"Message Identifier (YYZZ)"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|



196 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|5|1|Always|/|"Delimiter"|
|6|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|7|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|8|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|9|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|10|2|Always|<CR><LF>|"Delimiter"|
|11|6|Always|NAV_ALTITUDE|"Altitude (±NNNNN)"|
|12|5|Always|ADRF_CAS_VOTED|"CAS (NNN.N)"|
|13|6|Always|ADRF_TAT_VOTED|"TAT (±NNN.N)"|
|14|4|Always|FUEL_ON_BOARD|“Fuel on board / 100 (NNNN)”|
|15|4|Always|FMF_FUEL_AT_DEST|“Fuel at destination / 100 (NNNN)”|
|16|4|Always|FMF_DEST_ETA|“ETA at destination (HHMM)”|



“YY” is the flight phase from which the transition is occurring and “ZZ” is the flight phase to which the transition is occurring.  The following flight phase message identifiers are possible: 

- “POES” (transition from Power On to Engine Start) 

- “ESTA” (transition from Engine Start to Taxi Out) 

- “TAES” (transition from Taxi Out to Engine Start) 

- “TATO” (transition from Taxi Out to Takeoff) 

- “TOIC” (transition from Takeoff to Initial Climb) 

- “ICCL” (transition from Initial Climb to Climb) 

- “CLER” (transition from Climb to Enroute) 

- “ERCL” (transition from Enroute to Climb) 

- “ERDC” (transition from Enroute to Descent) 

- “DCAP” (transition from Descent to Approach) 

- “APGA” (transition from Approach to Go Around) 

- “APFL” (transition from Approach to Flare) 

- “FLRO” (transition from Flare to Rollout) 

- “DCER” (transition from Descent to Enroute) 

- “ROTI” (transition from Rollout to Taxi In) 

- “TISD” (transition from Taxi In to Engine Shutdown) 

- “SDPO” (transition from Engine Shutdown to Power On) 

197 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

Additional flight phase message identifiers (which are always four characters, potentially including space characters) include the following: 

- “OUT ” (Out event) 

- “OFF ” (Off event) 

- “ON  ” (On event) 

- “IN  ” (In event) 

- “RTG ” (Return to Gate event) 

- “DVRT” (diversion event, which occurs if the FMF destination airport changes when the airplane is airborne) 

- “INIT” (flight initialization event, which occurs when the IRU pitch angle, FMF origin airport, FMF destination airport, FMF origin airport runway, and FMF center-of-gravity are all valid for the first time during a flight) 

## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 070034
M49
FI BO1234/AN N7873BO
DT DDL BFI 070034 M16A
-  01ERDC   BOE1234/070034KBFIKBFI
+10999293.8+  7.7 607 5940043
```

Note: In this sample message, the message identifier is “ERDC” (transition from the Enroute flight phase to the Descent flight phase), the altitude is “+10999” (10,999 feet), the CAS is 293.8 (293.8 KCAS), the TAT is “+  7.7” (7.7°C) , the fuel on board is “ 607” (60,700), the predicted fuel at the destination is “ 594” (59,400), and the predicted ETA at the destination is “0043” (00:43). 

## **9.1.3 Uplink Decoding Definition** 

An aircraft operator may send the AHM Flight Phase Report Configuration Uplink to enable or disable AHM flight phase reports.  CMF stores the value contained in this uplink in non-volatile memory (NVM) in order to retain it across power cycles. 

The decoding for the AHM Flight Phase Report Configuration Uplink is defined as follows: 

- ACARS SMI: CMD 

- ACARS Label: RA  Message Identifier: ~1AHM 

198 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

- Alert Level: None 

- Optional Element Delimiter: “,” (comma) 

Table 9-2 describes the AHM Flight Phase Report Configuration Uplink decoding definition. 

**Table 9-2  AHM Flight Phase Report Configuration Uplink Decoding Definition** 

|**#**|**Length**|**Required**|**Destination Parameter**|**Element Description**|
|---|---|---|---|---|
|1|2|Yes|<none>|"Priority code (XX)"|
|2|7|Yes|<none>|"Ground address (XXXXXXX)"|
|3|5|Yes|<none>|"Message identifier (~1AHM)"|
|4|2|Yes|<none>|"Delimiter (<CR><LF>)"|
|5|1|Yes|AHM_FLIGHT_PHASE_ENABLE|"Enable (1) or disable (0)"|



## **Sample Message** 

```
QU DDLXCXA
.RTNBOCR 221954
CMD
AN N7873BO/MA 014A
-  QURTNBOCR~1AHM
1
```

Note: This sample message would enable AHM flight phase reports. 

## **9.2 AoIP Link Advisory** 

This section describes the ACARS-over-IP (AoIP) Link Advisory function that the AMI implements.  This function is intended to emulate the media advisory function for traditional ACARS media (which is implemented in CMF operational software) by sending an AoIP link advisory when the AMI detects an AoIP link status change.  This function also includes an uplink decoding definition to enable or disable the advisories. 

Note: There is no display definition for this function, although the CMF PARAMETERS display described in Section 12.6.2.1.1 allows AoIP advisories to be enabled or disabled. 

Note: If AoIP is not enabled – either because the Option Selection Software (OSS) does not enable the CMF AoIP software option or the AMI does not define AoIP as a subnetwork preference – then the AMI does not generate AoIP link advisories because CMF sets the AoIP link status to Failed. 

## **9.2.1 Logic Unit** 

The AMI implements a logic unit to generate the AoIP Link Advisory downlink encoding. 

199 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

```
-- ----------------------------------------------------------------------
--
-- Version D001    M. Matyas  24-OCT-2017
--     Developed logic to detect an AoIP link status change and send a
--         corresponding advisory downlink.
--
-- Version E001    M. Matyas  05-FEB-2019
--     Enhanced logic to consider whether AoIP link advisories are enabled.
--
-- ---------------------------------------------------------------------
    if AOIP_LINK_ADV_ENABLE and AOIP_LINK_STATUS changed then
        AOIP_LINK_ADV_STATUS   := AOIP_LINK_STATUS;
        AOIP_LINK_ADV_TIME     := CURRENT_TIME;
        send (BCG_AOIP_LINK_ADV);
    end_if;
-- ---------------------------------------------------------------------
-- END
-- ---------------------------------------------------------------------
```

## **9.2.2 Downlink Encoding Definition** 

The encoding for the AoIP Link Advisory downlink is defined as follows: 

- ACARS SMI: M19 

- ACARS Label: 19  Allowable Subnetworks: All  Downlink Priority: Flight Regularity  Downlink Buffer: REPORT_AUTO  Delete at System Reset: Yes  Delete on Buffer Full: Yes 

Table 9-3 describes the AoIP Link Advisory downlink encoding definition. 

**Table 9-3  AoIP Link Advisory Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|AOI|"Message Identifier"|
|3|2|Always|02|"Message Version"|



200 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Always|<CR><LF>|"Delimiter"|
|12|1|Conditionally|A|"Available flag"|
|13|1|Conditionally|N|"Not Available flag"|
|14|1|Conditionally|F|"Failed flag"|
|15|1|Conditionally|*|"Invalid flag"|
|16|6|Always|AOIP_LINK_ADV_TIME|"Timestamp (HHMMSS)"|



## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 061508
M19
FI BO1234/AN N7873BO
DT DDL BFI 061508 M01A
-  AOI02   BOE1234/06061508KBFIKBFI
N150802
```

201 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **9.2.3 Uplink Decoding Definition** 

An aircraft operator may send the AoIP Link Advisory Configuration Uplink to enable or disable AoIP link advisory downlinks.  CMF stores the value contained in this uplink in NVM in order to retain it across power cycles. 

The decoding for the AoIP Link Advisory Configuration Uplink is defined as follows: 

- ACARS SMI: CMD 

- ACARS Label: RA 

- Message Identifier: ~1AOI 

- Alert Level: None 

- Optional Element Delimiter: “,” (comma) 

Table 9-4 describes the AoIP Link Advisory Configuration Uplink decoding definition. 

**Table 9-4  AoIP Link Advisory Configuration Uplink Decoding Definition** 

|**#**|**Length**|**Required**|**Destination Parameter**|**Element Description**|
|---|---|---|---|---|
|1|2|Yes|<none>|"Priority code (XX)"|
|2|7|Yes|<none>|"Ground address (XXXXXXX)"|
|3|5|Yes|<none>|"Message identifier (~1AOI)"|
|4|2|Yes|<none>|"Delimiter (<CR><LF>)"|
|5|1|Yes|AOIP_LINK_ADV_ENABLE|"Enable (1) or disable (0)"|



## **Sample Message** 

```
QU DDLXCXA
.RTNBOCR 221954
CMD
AN N7873BO/MA 015A
-  QURTNBOCR~1AOI
0
```

Note: This sample message would disable AoIP link advisories. 

## **9.3 Automatic Diversion Report** 

This section describes the Automatic Diversion Report function that the AMI implements.  This function automatically generates a diversion report if the FMF destination airport changes when the airplane is airborne. 

202 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **9.3.1 Logic Unit** 

The AMI implements a logic unit to generate the Automatic Diversion Report downlink encoding. 

```
-- ----------------------------------------------------------------------------
--
-- Version F001  M. Matyas  29-SEP-2020
--     Logic to detect diversion event and send automatic diversion report.
```

```
-- ----------------------------------------------------------------------------
```

```
    if AIRCRAFT_IN_AIR
    and valid (FMF_ACTRTEDEST)
    and (DIV_PREV_DEST != FMF_ACTRTEDEST) then
        DIV_AUTO_FLAG := TRUE;
    end_if;
```

```
    if for 5 seconds (DIV_AUTO_FLAG) then    -- Give FMF time to update params
        set_default (DIV_DEST);
        set_default (DIV_DEST_ETA);
        set_default (DIV_DEST_FUEL);
        set_default (DIV_FUEL_ON_BOARD);
        send (BCG_DIVERT_AUTO);
        set_default (DIV_AUTO_FLAG);
    end_if;
```

```
    DIV_PREV_DEST := FMF_ACTRTEDEST;
```

```
-- ----------------------------------------------------------------------------
--
```

```
-- END
```

## **9.3.2 Downlink Encoding Definition** 

The encoding for the Automatic Diversion Report downlink is defined as follows: 

- ACARS SMI: M25 

- ACARS Label: 25  Allowable Subnetworks: All  Downlink Priority: Flight Regularity  Downlink Buffer: REPORT_AUTO  Delete at System Reset: Yes 

203 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

##  Delete on Buffer Full: Yes 

Table 9-5 describes the Automatic Diversion Report downlink encoding definition. 

**Table 9-5  Automatic Diversion Report Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|DIV|"Message Identifier"|
|3|2|Always|02|"Message Version"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Always|<CR><LF>|"Delimiter"|
|12|4|Always|DIV_DEST|"Divert station (XXXX)"|
|13|4|Always|DIV_DEST_ETA|"Divert station ETA (HHMM)"|
|14|4|Always|DIV_DEST_FUEL|"Divert station fuel / 100 (NNNN)"|
|15|4|Always|DIV_FUEL_ON_BOARD|"Fuel on board / 100 (NNNN)"|
|16|1|Always|A|"Divert reason (A = auto)"|



Note: The formats of the Manual Diversion Report downlink and the Automatic Diversion Report downlink are identical, although the Automatic Diversion Report downlink never includes other reason text or supplemental text that are optional in the Manual Diversion Report downlink. 

## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221541
M25
FI BO24/AN N7873BO
DT DDL BFI 221541 M10A
-  DIV02     BOE24/22221541KBFIPHOG
PHNL143203210398A
```

Note: In this sample message, the diversion station is “PHNL”, the ETA at the diversion station is “1432” (14:32), the estimated fuel at the diversion station is “0321” (32,100), the fuel on board is “0398” (39,800), and the diversion reason is “A” (automatic). 

204 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **9.4 Automatic Emergency Report** 

This section describes the Automatic Emergency Report function that the AMI implements.  This function includes the uplink decoding definition described in Section 11.1.1 that the aircraft operator may send to set the function to the Armed, Off, or On state as well as the uplink decoding definition described in Section 9.4.4 that the aircraft operator may send to set the thresholds for detecting an emergency condition. 

Note: The flight crew may also manually set the Automatic Emergency Report function to the Armed, Off, or On state on the Situation Report display that Section 8.9.1 describes. 

With the default settings, the AMI enables the automatic emergency report function (i.e., potentially sends automatic emergency reports) under the following conditions: 

- radio altimeter height is greater than 2,000 feet; and 

- FMF origin airport, destination airport, and flight number are valid; and 

- CAS is greater than 100 knots; and 

- pressure altitude is greater than 10,000 feet. 

With the default settings, the AMI disables the automatic emergency function (i.e., does not potentially send automatic emergency reports) under the following conditions: 

- radio altimeter height is less than 500 feet; or 

- FMF destination airport is invalid, FMF flight number is invalid, and airplane is on the ground. 

With the default settings, the AMI begins sending automatic emergency reports under the following conditions: 

- Altitude rate (vertical speed) 

   - Climb rate: greater than 7,500 feet per minute 

   - Descent rate: greater than 7,500 feet per minute 

- Speed 

   - CAS: less than 100 knots CAS 

   - VMO: greater than 390 knots CAS 

   - MMO: greater than 0.95 Mach 

- Attitude 

   - Pitch angle: greater than 20 degrees (up or down) 

   - Pitch rate: greater than 10 degrees per second 

   - Yaw rate: greater than 10 degrees per second 

   - Vertical acceleration: greater than 2.5g 

205 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

- Engines 

   - N1: both engines less than 5% N1 

   - TPR: both engines than 5% TPR 

   - Fuel control switches: both set to CUTOFF 

- Fuel: less than 5,500 pounds 

With the default settings, if the AMI begins sending automatic emergency reports then it sends a report every 60 seconds for up to 60 minutes. 

## **9.4.1 Detection Logic Unit** 

The AMI implements a logic unit to automatically detect an emergency condition. 

```
--------------------------------------------------------------------
-- This Logic Unit determines if an emergency situation exists.   --
--   This provides automatic determination of an emergency state  --
--   based on whether certain state parameters exceed a           --
--   predetermined limit.                                         --
--                                                                --
-- G.Sandell  7-02-2009  Initial development                      --
--                                                                --
-- G.Sandell  4-10-2013  Changed logic for ON/ARM/OFF             --
--                       Added check on climb rate                --
--                       Changed enabling logic                   --
--                                                                --
-- G.Sandell  5-1-2013   Allowed for LRRA invalid above 7500      --
--                                                                --
-- S.Meisch   2014-01-22 REVERSION TO C000 - NO CHANGE            --
--
-- Version C001  G.Sandell  18-APR-2014
--     Changed disabling
--     Changed filtering on des rate to 5 sec
--     Changed EO logic
--     Separated CLB AND DES rate
--
```

```
-- Version D001  M. Matyas  01-NOV-2017
--     Added logic to determine overall vertical rate emergency
--         state.
```

```
--
```

- `-- Version D002  S. Meisch  AUG-2018` 

- `--     Added logic to determine overall pitch rate emergency` 

- `--         state.` 

```
--
```

206 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

```
-- Version F001  M. Matyas  29-SEP-2020
--     Updated references from ACARS_10_CHAR_FLIGHT_NUMBER to
--         FMF_CMF_FLIGHT_NUMBER.
--     Updated reference from CUR_FUELREMAIN_WT to FMF_FUEL_REMAINING_WEIGHT.
--
--------------------------------------------------------------------
-- Input Variables  (ACPs and Existing UDPs)                      --
--    AIRCRAFT_IN_AIR (Boolean)                                   --
--    ADRF_ALTRATE_VOTED                                          --
--    ADRF_CAS_VOTED                                              --
--    ADRF_MACH_VOTED                                             --
--    ADRF_PRESSALT_VOTED                                         --
--    ADRF_TAT_VOTED                                              --
--    FMF_FUEL_REMAINING_WEIGHT                                   --
--    EICAS_ENG_N1_SPD_L                                          --
--    EICAS_ENG_N1_SPD_R                                          --
--    FUEL_SW_L_CUTOFF                                            --
--    FUEL_SW_R_CUTOFF                                            --
--    ENG_TPR_ACTUAL_L                                            --
--    ENG_TPR_ACTUAL_R                                            --
--    IRU_RDC_BODY_PITCH_RATE                                     --
--    IRU_RDC_BODY_YAW_RATE                                       --
--    IRU_RDC_INERTIAL_VERT_SPEED                                 --
--    IRU_RDC_PITCH_ANGLE                                         --
--    IRU_RDC_VERT_ACCELERATION                                   --
--    METRIC_ENABLE_ON                                            --
--    TOTAL_FILTERED_FUEL_MASS                                    --
--    TIME_SINCE_POWER_ON                                         --
--    FMF_ACTRTEORIGIN                                            --
--    FMF_ACTRTEDEST                                              --
--    FMF_CMF_FLIGHT_NUMBER                                       --
--    LRRA_RADIO_HEIGHT                                           --
--                                                                --
--   UDPs                                                         --
--    EMERGENCY_DESRATE_THRESHOLD                                 --
--    EMERGENCY_CLBRATE_THRESHOLD                                 --
--    EMERGENCY_MMO_THRESHOLD                                     --
--    EMERGENCY_VMO_THRESHOLD                                     --
--    EMERGENCY_LOW_SPEED_THRESHOLD                               --
--    EMERGENCY_PITCH_THRESHOLD                                   --
--    EMERGENCY_PITCH_RATE_THRESHOLD                              --
--    EMERGENCY_YAW_RATE_THRESHOLD                                --
--    EMERGENCY_VERT_ACCEL_THRESHOLD                              --
--    EMERGENCY_FUEL_THRESHOLD                                    --
--    EMERGENCY_TPR_THRESHOLD                                     --
--    EMERGENCY_N1_THRESHOLD                                      --
```

207 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

```
--    EMERGENCY_MIN_ALTITUDE                                      --
--    EMERGENCY_ENABLED                                           --
--    RADIO_ALT_REACHED                                           --
--    VMO                                                         --
--    MMO                                                         --
--                                                                --
-- Internal/Output Parameters                                     --
--    LAST_EMERGENCY_STATE                                        --
--    CUR_EMERGENCY_STATE                                         --
--    EMERGENCY_STATE_CLB                                         --
--    EMERGENCY_STATE_DES                                         --
--    EMERGENCY_STATE_RATE                                        --
--    EMERGENCY_STATE_EO                                          --
--    ENGINE_OUT_LEFT                                             --
--    ENGINE_OUT_RIGHT                                            --
--    EMERGENCY_STATE_SPD                                         --
--    EMERGENCY_STATE_FUEL                                        --
--    EMERGENCY_STATE_ATTITUDE                                    --
--    OVER_CAS                                                    --
--    OVER_MACH                                                   --
--    UNDER_CAS                                                   --
--    OVER_PITCH_RATE                                             --
--    OVER_YAW_RATE                                               --
--    OVER_PITCH                                                  --
--    OVER_ACCEL                                                  --
--                                                                --
--------------------------------------------------------------------
--------------------------------------------------------------------
-- Initialize Parameters                                          --
--------------------------------------------------------------------
LAST_EMERGENCY_STATE := CUR_EMERGENCY_STATE;
set_default (CUR_EMERGENCY_STATE);
--------------------------------------------------------------------
-- Determine if reporting is enabled                              --
--------------------------------------------------------------------
If (LRRA_RADIO_HEIGHT > 2000) then
   RADIO_ALT_REACHED := TRUE;
end_if;
If valid (FMF_ACTRTEORIGIN) and
   valid (FMF_ACTRTEDEST) and
   valid (FMF_CMF_FLIGHT_NUMBER) and
     RADIO_ALT_REACHED and
     (ADRF_CAS_VOTED > EMERGENCY_LOW_SPEED_THRESHOLD) and
     (ADRF_PRESSALT_VOTED > EMERGENCY_MIN_ALTITUDE) then
   EMERGENCY_ENABLED := TRUE;
end_if;
```

208 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

```
--------------------------------------------------------------------
-- Determine when reporting is disabled                           --
--------------------------------------------------------------------
If (not valid (FMF_ACTRTEDEST) and
   not valid (FMF_CMF_FLIGHT_NUMBER)
   and not (AIRCRAFT_IN_AIR)) or
     (LRRA_RADIO_HEIGHT < 500)  then
   EMERGENCY_ENABLED := FALSE;
   RADIO_ALT_REACHED := FALSE;
end_if;
--------------------------------------------------------------------
```

```
--------------------------------------------------------------------
-- Look for Vertical Rate                                         --
--------------------------------------------------------------------
If EMERGENCY_ENABLED then
    if valid (ADRF_ALTRATE_VOTED) then
        if for 5 seconds (-ADRF_ALTRATE_VOTED >
           (EMERGENCY_DESRATE_THRESHOLD + 500)) then
             EMERGENCY_STATE_DES := TRUE;
        end_if;
    end_if;
    if valid (IRU_RDC_INERTIAL_VERT_SPEED) then
        if for 5 seconds (-IRU_RDC_INERTIAL_VERT_SPEED >
            EMERGENCY_DESRATE_THRESHOLD) then
             EMERGENCY_STATE_DES := TRUE;
        end_if;
    end_if;
end_if;
```

```
If EMERGENCY_ENABLED then
    if valid (ADRF_ALTRATE_VOTED) then
        if for 5 seconds (ADRF_ALTRATE_VOTED >
           (EMERGENCY_CLBRATE_THRESHOLD + 500)) then
             EMERGENCY_STATE_CLB := TRUE;
        end_if;
    end_if;
```

```
    if valid (IRU_RDC_INERTIAL_VERT_SPEED) then
        if for 5 seconds (IRU_RDC_INERTIAL_VERT_SPEED >
            EMERGENCY_CLBRATE_THRESHOLD) then
             EMERGENCY_STATE_CLB := TRUE;
        end_if;
    end_if;
```

209 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

```
end_if;
```

```
if EMERGENCY_STATE_DES or EMERGENCY_STATE_CLB then
    EMERGENCY_STATE_VERT_RATE := TRUE;
end_if;
```

```
--------------------------------------------------------------------
```

```
--------------------------------------------------------------------
```

```
-- Look for Multiple Engine Out                                   --
--------------------------------------------------------------------
If EMERGENCY_ENABLED and AIRCRAFT_IN_AIR then
    if for 5 seconds ((valid (ENG_TPR_ACTUAL_L) and
       ENG_TPR_ACTUAL_L < EMERGENCY_TPR_THRESHOLD) or
       (valid (EICAS_ENG_N1_SPD_L) and
       EICAS_ENG_N1_SPD_L < EMERGENCY_N1_THRESHOLD) or
       FUEL_SW_L_CUTOFF or
       (not valid (ENG_TPR_ACTUAL_L) and not valid (EICAS_ENG_N1_SPD_L))) then
       ENGINE_OUT_LEFT := TRUE;
    end_if;
```

```
    if for 5 seconds (((valid (ENG_TPR_ACTUAL_L) and
       ENG_TPR_ACTUAL_L > EMERGENCY_TPR_THRESHOLD + 5) or
       (valid (EICAS_ENG_N1_SPD_L) and
       EICAS_ENG_N1_SPD_L > EMERGENCY_N1_THRESHOLD + 5)) and
       not (FUEL_SW_L_CUTOFF)) then
       ENGINE_OUT_LEFT := FALSE;
    end_if;
```

```
    if for 5 seconds ((valid (ENG_TPR_ACTUAL_R) and
       ENG_TPR_ACTUAL_R < EMERGENCY_TPR_THRESHOLD) or
       (valid (EICAS_ENG_N1_SPD_R) and
       EICAS_ENG_N1_SPD_R < EMERGENCY_N1_THRESHOLD) or
       FUEL_SW_R_CUTOFF or
       (not valid (ENG_TPR_ACTUAL_R) and not valid (EICAS_ENG_N1_SPD_R))) then
       ENGINE_OUT_RIGHT := TRUE;
    end_if;
```

```
    if for 5 seconds (((valid (ENG_TPR_ACTUAL_R) and
```

```
       ENG_TPR_ACTUAL_R > EMERGENCY_TPR_THRESHOLD + 5) or
```

```
       (valid (EICAS_ENG_N1_SPD_R) and
       EICAS_ENG_N1_SPD_R > EMERGENCY_N1_THRESHOLD + 5)) and
```

```
       not (FUEL_SW_R_CUTOFF)) then
       ENGINE_OUT_RIGHT := FALSE;
    end_if;
```

210 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

```
end_if;
If ENGINE_OUT_LEFT and ENGINE_OUT_RIGHT then
    EMERGENCY_STATE_EO := TRUE;
end_if;
--------------------------------------------------------------------
--------------------------------------------------------------------
-- Look for Excessive Airspeed (High or Low)                      --
--------------------------------------------------------------------
If EMERGENCY_ENABLED and AIRCRAFT_IN_AIR then
    if valid (ADRF_CAS_VOTED) and
       ADRF_CAS_VOTED > (VMO + EMERGENCY_VMO_THRESHOLD) then
       OVER_CAS := TRUE;
    end_if;
    if valid (ADRF_MACH_VOTED) and
       ADRF_MACH_VOTED > (MMO + EMERGENCY_MMO_THRESHOLD) then
       OVER_MACH := TRUE;
    end_if;
    if valid (ADRF_CAS_VOTED) and
       ADRF_CAS_VOTED < EMERGENCY_LOW_SPEED_THRESHOLD then
       UNDER_CAS := TRUE;
    end_if;
end_if;
If OVER_CAS or OVER_MACH or UNDER_CAS then
    EMERGENCY_STATE_SPD := TRUE;
end_if;
```

```
--------------------------------------------------------------------
```

```
--------------------------------------------------------------------
-- Look for Unusual Attitude or Maneuver                          --
--------------------------------------------------------------------
If EMERGENCY_ENABLED and AIRCRAFT_IN_AIR then
    if valid (IRU_RDC_BODY_PITCH_RATE) and
       (IRU_RDC_BODY_PITCH_RATE > EMERGENCY_PITCH_RATE_THRESHOLD or
       IRU_RDC_BODY_PITCH_RATE < -EMERGENCY_PITCH_RATE_THRESHOLD) then
       OVER_PITCH_RATE := TRUE;
    end_if;
    if valid (IRU_RDC_BODY_YAW_RATE) and
       (IRU_RDC_BODY_YAW_RATE > EMERGENCY_YAW_RATE_THRESHOLD or
       IRU_RDC_BODY_YAW_RATE < -EMERGENCY_YAW_RATE_THRESHOLD) then
       OVER_YAW_RATE := TRUE;
    end_if;
```

211 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

```
    if valid (IRU_RDC_PITCH_ANGLE) and
       IRU_RDC_PITCH_ANGLE > EMERGENCY_PITCH_THRESHOLD or
       IRU_RDC_PITCH_ANGLE < -EMERGENCY_PITCH_THRESHOLD then
       OVER_PITCH := TRUE;
    end_if;
    if valid (IRU_RDC_VERT_ACCELERATION) and
       IRU_RDC_VERT_ACCELERATION > EMERGENCY_VERT_ACCEL_THRESHOLD then
       OVER_ACCEL := TRUE;
    end_if;
end_if;
If OVER_PITCH_RATE or OVER_YAW_RATE or OVER_PITCH or OVER_ACCEL then
    EMERGENCY_STATE_ATTITUDE := TRUE;
end_if;
--------------------------------------------------------------------
--------------------------------------------------------------------
-- Look for Emergency/Hijack Transponder Code Set                 --
--------------------------------------------------------------------
--                                                                --
--  Transponder code not available on 787.                        --
--                                                                --
--------------------------------------------------------------------
--------------------------------------------------------------------
-- Look for Low Fuel Situation                                    --
--------------------------------------------------------------------
If EMERGENCY_ENABLED and AIRCRAFT_IN_AIR then
    if for 10 seconds
       (FMF_FUEL_REMAINING_WEIGHT < EMERGENCY_FUEL_THRESHOLD) then
       EMERGENCY_STATE_FUEL := TRUE;
    end_if;
    if for 10 seconds
       (TOTAL_FILTERED_FUEL_MASS < EMERGENCY_FUEL_THRESHOLD) then
       EMERGENCY_STATE_FUEL := TRUE;
    end_if;
end_if;
--------------------------------------------------------------------
--------------------------------------------------------------------
-- Look for Depressurization (Cabin Altitude)                     --
--------------------------------------------------------------------
--                                                                --
--  Cabin altitude not available on 787.                          --
```

212 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

```
--                                                                --
--------------------------------------------------------------------
--------------------------------------------------------------------
-- Determine final emergency state                                --
--------------------------------------------------------------------
CUR_EMERGENCY_STATE := EMERGENCY_STATE_VERT_RATE or
EMERGENCY_STATE_EO or EMERGENCY_STATE_SPD or EMERGENCY_STATE_FUEL or
EMERGENCY_STATE_ATTITUDE;
```

```
--------------------------------------------------------------------
```

## **9.4.2 Reporting Logic Unit** 

The AMI implements a logic unit to generate the Automatic Emergency Report downlink encoding. 

```
--------------------------------------------------------------------
-- This Logic Unit sends reports in emergency situations.         --
--                                                                --
-- G.Sandell  7-02-2009 Initial development                       --
--                                                                --
-- G.Sandell  4-10-2013 Changed ON/OFF to ON/ARM/OFF              --
--                                                                --
-- VERSION C000 NEW VERSIONING -- no change since B000            --
--                                                                --
-- VERSION C001    G Sandell  4-18-2014                           --
--     Changed for separating CLB and DES rate                    --
--                                                                --
-- Version D001    M Matyas  01-NOV-2017                          --
--     Added logic to reset overall vertical rate emergency state.--
--                                                                --
-- Version D002    S Meisch  2018SEP                              --
--     Changed downlink report name to:  BCG_EMERG_AUTO           --
--                                                                --
-- Version E001    M Matyas  21-FEB-2019                          --
--     Changed encoding name to BCG_EMRG for consistency.         --
--                                                                --
--------------------------------------------------------------------
--                                                                --
-- Input Parameters                                               --
--    EMERGENCY_STATE_CLB                                         --
--    EMERGENCY_STATE_DES                                         --
--    EMERGENCY_STATE_EO                                          --
--    EMERGENCY_STATE_SPD                                         --
```

213 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

```
--    EMERGENCY_STATE_FUEL                                        --
--    EMERGENCY_STATE_ATTITUDE                                    --
--    EMERGENCY_SELECTION                                         --
--    EMERGENCY_FREQUENCY                                         --
--    MAX_EMERGENCY_RPT                                           --
--    CUR_EMERGENCY_STATE                                         --
--                                                                --
-- Internal/Output Parameters                                     --
--    LAST_EMERGENCY_SELECTION                                    --
--    EMERGENCY_COUNTER                                           --
--    NEW_EMERGENCY                                               --
--    END_EMERGENCY                                               --
--    MANUAL_EMERGENCY                                            --
--    LAST_EMERGENCY_STATE                                        --
--                                                                --
--------------------------------------------------------------------
--------------------------------------------------------------------
-- Send reports for continuing emergency situations               --
--------------------------------------------------------------------
if (EMERGENCY_SELECTION = 1) and (LAST_EMERGENCY_SELECTION = 1) then
    EMERGENCY_COUNTER := EMERGENCY_COUNTER + 1;
    if EMERGENCY_COUNTER = EMERGENCY_FREQUENCY * (EMERGENCY_COUNTER/
    EMERGENCY_FREQUENCY) then
        send (BCG_EMRG);
    end_if;
end_if;
--------------------------------------------------------------------
```

```
--------------------------------------------------------------------
```

```
-- Look for manually-initiated start                              --
--------------------------------------------------------------------
if (EMERGENCY_SELECTION = 1) and (LAST_EMERGENCY_SELECTION !=1) then
        NEW_EMERGENCY := TRUE;
        MANUAL_EMERGENCY := TRUE;
end_if;
```

```
--------------------------------------------------------------------
```

```
--------------------------------------------------------------------
```

```
-- Look for auto-initiated start                                  --
--------------------------------------------------------------------
if (EMERGENCY_SELECTION =2) and CUR_EMERGENCY_STATE and
    not (LAST_EMERGENCY_STATE) then
        NEW_EMERGENCY := TRUE;
        MANUAL_EMERGENCY := FALSE;
end_if;
```

NEW 

214 of 378 

D613Z019-06 ECCN: 7E994 

**BOEING PROPRIETARY** 

```
--------------------------------------------------------------------
--------------------------------------------------------------------
-- Set up reporting process and send initial report               --
--------------------------------------------------------------------
if NEW_EMERGENCY then
        send (BCG_EMRG);
        EMERGENCY_COUNTER := 1;
        NEW_EMERGENCY := FALSE;
        EMERGENCY_SELECTION := 1;
end_if;
--------------------------------------------------------------------
--------------------------------------------------------------------
-- Look for manual cancellation                                   --
--------------------------------------------------------------------
if (LAST_EMERGENCY_SELECTION = 1) and (EMERGENCY_SELECTION != 1) then
        END_EMERGENCY := TRUE;
end_if;
--------------------------------------------------------------------
--------------------------------------------------------------------
-- End reporting                                                  --
--------------------------------------------------------------------
if END_EMERGENCY or EMERGENCY_COUNTER >= MAX_EMERGENCY_RPT*60 then
        END_EMERGENCY := FALSE;
        if (EMERGENCY_SELECTION = 1) then
           EMERGENCY_SELECTION := 2;
        end_if;
        EMERGENCY_COUNTER := MAX_EMERGENCY_RPT*60 + 10;
-- And reset all the variables                                    --
        EMERGENCY_STATE_CLB := FALSE;
        EMERGENCY_STATE_DES := FALSE;
        EMERGENCY_STATE_VERT_RATE := FALSE;
        EMERGENCY_STATE_EO := FALSE;
        ENGINE_OUT_LEFT := FALSE;
        ENGINE_OUT_RIGHT := FALSE;
        EMERGENCY_STATE_SPD := FALSE;
        EMERGENCY_STATE_FUEL := FALSE;
        EMERGENCY_STATE_ATTITUDE := FALSE;
        OVER_CAS := FALSE;
        OVER_MACH := FALSE;
        UNDER_CAS := FALSE;
        OVER_PITCH_RATE := FALSE;
        OVER_YAW_RATE := FALSE;
        OVER_PITCH := FALSE;
```

215 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

```
        OVER_ACCEL := FALSE;
        MANUAL_EMERGENCY := FALSE;
        CUR_EMERGENCY_STATE := FALSE;
end_if;
```

```
--------------------------------------------------------------------
```

```
--------------------------------------------------------------------
-- Clean up for the next cycle                                    --
--------------------------------------------------------------------
LAST_EMERGENCY_SELECTION := EMERGENCY_SELECTION;
--------------------------------------------------------------------
```

## **9.4.3 Downlink Encoding Definition** 

The encoding for the Automatic Emergency Report downlink is defined as follows: 

- ACARS SMI: SIT 

- ACARS Label: 99  Allowable Subnetworks: All  Downlink Priority: Emergency  Downlink Buffer: REPORT_AUTO  Delete at System Reset: No  Delete on Buffer Full: No 

Table 9-6 describes the Automatic Emergency Report downlink encoding definition. 

**Table 9-6  Automatic Emergency Report Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|EMR|"Message Identifier"|
|3|2|Always|06|"Message Version"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Always|<CR><LF>|"Delimiter"|
|12|13|Always|AIRCRAFT_POSITION|"Position (XDDMMTXDDDMMT) "|



216 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|13|1|Always|,|"Delimiter"|
|14|1-5|Always|NAV_ALTITUDE|"Altitude (NNNNN)"|
|15|1|Always|,|"Delimiter"|
|16|6|Always|CURRENT_TIME|"Timestamp (HHMMSS)"|
|17|2|Always|<CR><LF>|"Delimiter"|
|18|4|Always|NAV_MAG_HDG|"Magnetic Heading (±NNN)"|
|19|1|Always|,|"Delimiter"|
|20|4|Always|NAV_MAG_TRACK|"Magnetic Track (±NNN)"|
|21|1|Always|,|"Delimiter"|
|22|4|Always|NAV_TRUE_HDG|"True Heading (±NNN)"|
|23|1|Always|,|"Delimiter"|
|24|4|Always|NAV_TRUE_TRACK|"True Track (±NNN)"|
|25|1|Always|,|"Delimiter"|
|26|4|Always|NAV_WIND_TRUE_BRG|"True Wind Bearing (±NNN)"|
|27|1|Always|,|"Delimiter"|
|28|1-4|Always|NAV_WIND_MAG|"Wind Speed (NNNN)"|
|29|1|Always|,|"Delimiter"|
|30|1-4|Always|NAV_GROUNDSPEED|"Groundspeed (NNNN)"|
|31|1|Always|,|"Delimiter"|
|32|4|Always|FMF_DEST_ETA|"Destination ETA (HHMM)"|
|33|2|Always|<CR><LF>|"Delimiter"|
|34|1-5|Always|ADRF_PRESSALT_VOTED|"Pressure Altitude (NNNNN)"|
|35|1|Always|,|"Delimiter"|
|36|2-6|Always|ADRF_ALTRATE_VOTED|"Altitude Rate" (±NNNNN)|
|37|1|Always|,|"Delimiter"|
|38|1-3|Always|ADRF_CAS_VOTED|"CAS (NNN)"|
|39|1|Always|,|"Delimiter"|
|40|5|Always|ADRF_MACH_VOTED|"Mach (N.NNN)"|
|41|1|Always|,|"Delimiter"|
|42|2-4|Always|ADRF_SAT_VOTED|"SAT (±NNN)"|
|43|2|Always|<CR><LF>|"Delimiter"|
|44|2-6|Always|IRU_RDC_INERTIAL_VERT_SPEED|"Vertical Speed (±NNNNN)"|
|45|1|Always|,|"Delimiter"|
|46|4|Always|IRU_RDC_VERT_ACCELERATION|"Vertical Acceleration (±N.N)"|
|47|1|Always|,|"Delimiter"|
|48|4-6|Always|IRU_RDC_PITCH_ANGLE|"Pitch Angle (±NNN.N)"|
|49|1|Always|,|"Delimiter"|
|50|4-6|Always|IRU_RDC_BODY_PITCH_RATE|"Pitch Rate (±NNN.N)"|
|51|1|Always|,|"Delimiter"|



217 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|52|4-6|Always|IRU_RDC_BODY_YAW_RATE|"Yaw Rate (±NNN.N)"|
|53|2|Always|<CR><LF>|"Delimiter"|
|54|3 or 6|Always|FUEL_SW_L_CUTOFF|"Left engine fuel control (RUN /<br>CUTOFF)"|
|55|1|Always|/|"Delimiter"|
|56|3 or 6|Always|FUEL_SW_R_CUTOFF|"Right engine fuel control (RUN /<br>CUTOFF)"|
|57|1|Always|,|"Delimiter"|
|58|3-5|Always|EICAS_ENG_N1_SPD_L|"Left engine N1 (NNN.N)"|
|59|1|Always|/|"Delimiter"|
|60|3-5|Always|EICAS_ENG_N1_SPD_R|"Right engine N1 (NNN.N)"|
|61|1|Always|,|"Delimiter"|
|62|3-5|Always|ENG_TPR_ACTUAL_L|"Left engine TPR (NNN.N)"|
|63|1|Always|/|"Delimiter"|
|64|3-5|Always|ENG_TPR_ACTUAL_R|"Right engine TPR (NNN.N)"|
|65|1|Always|,|"Delimiter"|
|66|3-5|Always|EEC_ENG_OIL_P_L|"Left engine oil pressure (NNN.N)"|
|67|1|Always|/|"Delimiter"|
|68|3-5|Always|EEC_ENG_OIL_P_R|"Right engine oil pressure (NNN.N) "|
|69|1|Always|,|"Delimiter"|
|70|2-4|Always|EEC_ENG_OIL_T_L|"Left engine oil temperature (±NNN)"|
|71|1|Always|/|"Delimiter"|
|72|2-4|Always|EEC_ENG_OIL_T_R|"Right engine oil temperature (±NNN)"|
|73|1|Always|,|"Delimiter"|
|74|3-4|Always|L_ENG_OIL_QTY|"Left engine oil quantity (NN.N)"|
|75|1|Always|/|"Delimiter"|
|76|3-4|Always|R_ENG_OIL_QTY|"Right engine oil quantity (NN.N)"|
|77|1|Always|,|"Delimiter"|
|78|3-5|Always|FUEL_ON_BOARD|"Fuel on board / 1000 (NNN.N)"|
|79|2|Always|<CR><LF>|"Delimiter"|
|80|3 or 7|Always|FCM_AP_ENGD|"Autopilot (ENG / NOT ENG)"|
|81|1|Always|,|"Delimiter"|
|82|1-2|Always|FCM_FLAP_LVR_POSN|"Flap lever position (NN)"|
|83|1|Always|,|"Delimiter"|
|84|1-3|Always|FCM_FLAPS_SLATS_NORM|"Flaps/slats position (NNN)"|
|85|1|Always|,|"Delimiter"|
|86|1|Always|*|"777X left FWT placeholder"|
|87|1|Always|/|"Delimiter"|
|88|1|Always|*|"777X right FWT placeholder"|
|89|1|Always|,|"Delimiter"|



218 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|90|3|Conditionally|OFF|"Gear status - OFF"|
|91|2|Conditionally|UP|"Gear status - UP"|
|92|4|Conditionally|DOWN|"Gear status - DOWN"|
|93|7|Conditionally|TRANSIT|"Gear status - IN TRANSIT"|
|94|1|Conditionally|*|"Gear status - INVALID"|
|95|2|Always|<CR><LF>|"Delimiter"|
|96|3|Conditionally|OFF|"Wing Anti-Ice Off"|
|97|4|Conditionally|AUTO|“Wing Anti-Ice Auto”|
|98|2|Conditionally|ON|“Wing Anti-Ice On”|
|99|1|Conditionally|*|“Wing Anti-Ice Invalid”|
|100|1|Always|,|"Delimiter"|
|101|3-6|Always|LRRA_RADIO_HEIGHT|"LRRA height (NNNN.N)"|
|102|1|Always|,|"Delimiter"|
|103|2-3|Always|ECS_APU_RUNNING|"APU (ON / OFF)"|
|104|2|Always|<CR><LF>|"Delimiter"|
|105|1|Conditionally|M|"Manual Trigger"|
|106|1|Conditionally|A|"Automatic Trigger"|
|107|4|Conditionally|,VS-|"Descent Rate Trigger"|
|108|4|Conditionally|,VS+|"Climb Rate Trigger"|
|109|3|Conditionally|,EO|"Engines Out Trigger"|
|110|5|Conditionally|,CAS-|"CAS Low Trigger"|
|111|4|Conditionally|,VMO|"VMOTrigger"|
|112|4|Conditionally|,MMO|"MMOTrigger"|
|113|3|Conditionally|,PA|"Pitch Angle Trigger"|
|114|3|Conditionally|,PR|"Pitch Rate Trigger"|
|115|3|Conditionally|,YR|"Yaw Rate Trigger"|
|116|2|Conditionally|,G|"Vertical Acceleration Trigger"|
|117|5|Conditionally|,FUEL|"Fuel Trigger"|



Note: Headings, tracks, and bearings (i.e., the NAV_MAG_HDG, NAV_MAG_TRACK, NAV_TRUE_HDG, NAV_TRUE_TRACK, and NAV_WIND_TRUE_BRG parameters) are expressed in raw format, where negative values are west of north.  For example, a raw heading of -135° corresponds to a compass heading of 225° and a raw track of -015° corresponds to a compass track of 345°.  Accordingly, if a raw direction is negative then it may be converted to a compass direction by adding 360°.  No such conversion is necessary if a raw direction is positive. 

Note: Flap lever position is expressed in degrees and flaps/slats position is expressed in percent.  Table 9-7 correlates flap settings to flap lever positions and flaps/slats positions. 

219 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**Table 9-7  Flap Settings, Flap Lever Positions, and Flap/Slats Positions** 

|**Flap Setting**|**Flap Lever**<br>**Position**|**Flaps/Slats**<br>**Position**|
|---|---|---|
|UP|0°|0%|
|1|11°|20%|
|5|17°|40%|
|10|24°|50%|
|15|31°|60%|
|17|39°|67%|
|18|43°|73%|
|20|51°|80%|
|25|58°|100%|
|30|65°|120%|



## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221641
SIT
FI BO718/AN N7873BO
DT DDL BFI 221641 M10A
-  EMR06    BOE718/22221641KBFIKBFI
N47365W122066,10000,164142
-035,-035,-020,-020,-059,0,289,1653
10000,+0,250,0.452,-5
+1,+0.0,+2.2,+0.0,+0.0
RUN/RUN,74.0/74.0,49.4/49.4,110.9/110.9,+154/+154,17.5/17.5,44.6
ENG,0,0,*/*,UP
AUTO,*,ON
M
```

Note: In this sample message, the fuel on board is “44.6” (44,600), the LRRA (radio altimeter) height is “*” (invalid), and the automatic emergency report trigger is “M” (manual, based on selection of the AUTOMATIC EMERGENCY REPORTS ON button on the SITUATION REPORT display). 

## **9.4.4 Uplink Decoding Definition** 

An aircraft operator may send the Automatic Emergency Report Configuration Uplink to set alternative thresholds for the Automatic Emergency Report function.  CMF stores these values in NVM in order to retain them across power cycles. 

220 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

To set an alternative threshold, a new threshold value is inserted in the appropriate position in the uplink.  Values are comma-delimited and may be omitted (skipped) in the uplink. 

The decoding for the Automatic Emergency Report Configuration Uplink is defined as follows: 

- ACARS SMI: CMD 

- ACARS Label: RA 

- Message Identifier: ~1DEF 

- Alert Level: None 

- Optional Element Delimiter: “,” (comma) character 

Table 9-8 describes the Automatic Emergency Report Configuration Uplink decoding definition. 

**Table 9-8  Automatic Emergency Report Configuration Uplink Decoding Definition** 

|**#**|**Length**|**Required**|**Destination Parameter**|**Element Description**|
|---|---|---|---|---|
|1|2|Yes|<none>|"Priority code (XX)"|
|2|7|Yes|<none>|"Ground address (XXXXXXXX)"|
|3|5|Yes|<none>|"Message Identifier (~1DEF)"|
|4|2|Yes|<none>|"Message version (XX)"|
|5|2|Yes|<none>|"Message date (DD)"|
|6|4|Yes|<none>|"Message time (HHMM)"|
|7|2|Yes|<none>|"Delimiter (<CR><LF>)"|
|8|1-5|No|EMERGENCY_DESRATE_THRESHOLD|"Descent rate threshold (NNNNN)"|
|9|4|No|EMERGENCY_MMO_THRESHOLD|"Above MMOthreshold (N.NN)"|
|10|1-3|No|EMERGENCY_VMO_THRESHOLD|"Above VMOthreshold (NNN)"|
|11|1-3|No|EMERGENCY_LOW_SPEED_THRESHOLD|"CAS low threshold (NNN)"|
|12|1-2|No|EMERGENCY_PITCH_THRESHOLD|"Pitch angle threshold (NN)"|
|13|1-2|No|EMERGENCY_PITCH_RATE_THRESHOLD|"Pitch rate threshold (NN)"|
|14|1-2|No|EMERGENCY_YAW_RATE_THRESHOLD|"Yaw rate threshold (NN)"|
|15|3|No|EMERGENCY_VERT_ACCEL_THRESHOLD|"Vertical acceleration threshold<br>(N.N)"|
|16|1-5|No|EMERGENCY_FUEL_THRESHOLD|"Fuel threshold (NNNNN)"|
|17|1-2|No|EMERGENCY_TPR_THRESHOLD|"TPR threshold (NN)"|
|18|1-2|No|EMERGENCY_N1_THRESHOLD|"N1 threshold (NN)"|
|19|2-3|No|EMERGENCY_FREQUENCY|"Reporting interval (NNN)"|
|20|2-3|No|MAX_EMERGENCY_RPT|"Reporting time limit (NNN)"|
|21|1-5|No|EMERGENCY_MIN_ALTITUDE|"Reporting min altitude (NNNNN)"|
|22|1-5|No|EMERGENCY_CLBRATE_THRESHOLD|"Climb rate threshold (NNNNN)"|



All threshold parameters are optional. 

The following ranges and units apply to the following parameters: 

221 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

- Descent rate threshold: 0-20000 feet per minute 

- Above MMO threshold: 0.00-0.30 Mach 

- Above VMO threshold: 0-100 knots CAS 

- CAS low threshold: 0-200 knots CAS 

- Pitch angle threshold: 0-45 degrees 

- Pitch rate threshold: 0-30 degrees per second 

- Yaw rate threshold: 0-30 degrees per second 

- Vertical acceleration threshold: 1.0-5.0g 

- Fuel threshold: 0-20000 pounds 

- TPR threshold: 0-25 

- N1 threshold: 0-25% 

- Reporting interval: 60-900 seconds 

- Reporting time limit: 30-360 minutes 

- Reporting minimum altitude: 0-30000 feet 

- Climb rate threshold: 0-20000 feet per minute 

Note:  Elements 8 through 22 are variable-length elements and accordingly should be terminated with a delimiter character.  Pre-defined element delimiters are <CR>, <CR><LF>, and <ETX> and the optional element delimiter defined for this uplink decoding is “,” (comma). 

## **Sample Message** 

```
QU DDLXCXA
.RTNBOCR 221954
CMD
AN N7873BO/MA 016A
-  QURTNBOCR~1DEF01190445
6000,0.1,40,115,,,15,3.0,5000,10,10,120,30,7500,6000
```

Note: In this sample message the pitch angle and pitch rate thresholds are omitted. 

## **9.5 Automatic Position Report** 

This section describes the Automatic Position Report function that the AMI implements.  This function includes an uplink decoding definition to enable or disable automatic position reports and set the interval between each report. 

222 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

As defined in the CMF baseline AMI with default values, the Automatic Position Report function automatically generates position reports at a default interval of 15 minutes when the aircraft is airborne and meets the requirements for ICAO “4D/15” normal aircraft tracking. 

Note: There is no display definition for this function, although the CMF PARAMETERS display described in Section 12.6.2.1.1 allows automatic position reports to be enabled or disabled and their interval to be changed. 

## **9.5.1 Logic Unit** 

The AMI implements a logic unit to generate the Automatic Position Report downlink encoding. 

```
-- ---------------------------------------------------------------------
--
-- Version D001
-- M. Matyas  24-OCT-2017
--     Automatic position reporting logic based on PERIODIC_POS_RPT.C000.
--         Added ability to enable/disable automatic position reporting and
--         configure automatic position reporting interval via uplink.
--
-- ---------------------------------------------------------------------
--
    if AIRCRAFT_IN_AIR and POS_RPT_ENABLE then
        if POS_RPT_COUNTER > (POS_RPT_INTERVAL * 60) then
                send (BCG_POS_RPT);
                POS_RPT_COUNTER := 0;
        else
        POS_RPT_COUNTER := POS_RPT_COUNTER + 1;
        end_if;
    else
        POS_RPT_COUNTER := 0;
    end_if;
-------------------------------------------------------------------------------
--
-- END
```

223 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

## **9.5.2 Downlink Encoding Definition** 

The encoding for the Automatic Position Report downlink is defined as follows: 

- ACARS SMI: M16 

- ACARS Label: 16 

- Allowable Subnetworks: All 

- Downlink Priority: Flight Regularity 

- Downlink Buffer: REPORT_AUTO 

- Delete at System Reset: No 

- Delete on Buffer Full: Yes 

Table 9-9 describes the Automatic Position Report downlink encoding definition. 

**Table 9-9  Automatic Position Report Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|POS|"Message Identifier"|
|3|2|Always|02|"Message Version"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Always|<CR><LF>|"Delimiter"|
|12|13|Always|AIRCRAFT_POSITION|"Position (XDDMMTXDDDMMT)"|
|13|1|Always|,|"Delimiter"|
|14|1-5|Always|NAV_ALTITUDE|"Altitude (NNNNN)"|
|15|1|Always|,|"Delimiter"|
|16|6|Always|CURRENT_TIME|"Current Time (HHMMSS)"|
|17|1|Always|,|"Delimiter"|
|18|4|Always|NAV_MAG_HDG|"Magnetic Heading (±NNN)"|
|19|1|Always|,|"Delimiter"|
|20|4|Always|NAV_WIND_TRUE_BRG|"True Wind Bearing (±NNN)"|
|21|1|Always|,|"Delimiter"|
|22|1-4|Always|NAV_WIND_MAG|"Wind Speed (NNNN)"|
|23|1|Always|,|"Delimiter"|



224 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|24|1-4|Always|NAV_GROUNDSPEED|"Groundspeed (NNNN)"|
|25|1|Always|,|"Delimiter"|
|26|4|Always|FMF_DEST_ETA|"Destination ETA (HHMM)"|
|27|1|Always|,|"Delimiter"|
|28|2-6|Always|ADRF_ALTRATE_VOTED|"Altitude Rate (±NNNNN)"|
|29|1|Always|,|"Delimiter"|
|30|1-3|Always|ADRF_CAS_VOTED|"CAS (NNN)"|
|31|1|Always|,|"Delimiter"|
|32|5|Always|ADRF_MACH_VOTED|"Mach (N.NNN)"|
|33|1|Always|,|"Delimiter"|
|34|2-4|Always|ADRF_SAT_VOTED|"SAT (±NNN)"|
|35|1|Always|,|"Delimiter"|
|36|3-5|Always|FUEL_ON_BOARD|"Fuel on Board / 1000 (NNN.N)"|



Note: Headings, tracks, and bearings (i.e., the NAV_MAG_HDG and NAV_WIND_TRUE_BRG parameters) are expressed in raw format, where negative values are west of north.  For example, a raw heading of -135° corresponds to a compass heading of 225° and a raw track of -015° corresponds to a compass track of 345°.  Accordingly, if a raw direction is negative then it may be converted to a compass direction by adding 360°.  No such conversion is necessary if a raw direction is positive. 

## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 261904
M16
FI BO718/AN N7873BO
DT DDL BFI 261904 M08A
-  POS02    BOE718/26261904KBFIKLGB
N47280W122020,39003,190414,-035,-067,41,289,2157,+2,251,0.454,-5,34.3
```

Note: In this sample message, the fuel on board is “34.3” (34,300). 

## **9.5.3 Uplink Decoding Definition** 

An aircraft operator may send the Automatic Position Report Configuration Uplink to enable or disable the Automatic Position Report function and set the interval between automatic position reports.  CMF stores the values contained in this uplink in NVM in order to retain them across power cycles. 

The decoding for the Automatic Position Report Configuration Uplink is defined as follows: 

 ACARS SMI: CMD 

225 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

- ACARS Label: RA 

- Message Identifier: ~1POS 

- Alert Level: None 

- Optional Element Delimiter: “,” (comma) 

Table 9-10 describes the Automatic Position Report Configuration Uplink decoding definition. 

**Table 9-10  Automatic Position Report Configuration Uplink Decoding Definition** 

|**#**|**Length**|**Required**|**Destination Parameter**|**Element Description**|
|---|---|---|---|---|
|1|2|Yes|<none>|"Priority code (XX)"|
|2|7|Yes|<none>|"Ground address (XXXXXXX)"|
|3|5|Yes|<none>|"Message identifier (~1POS)"|
|4|2|Yes|<none>|"Delimiter (<CR><LF>)"|
|5|1|Yes|POS_RPT_ENABLE|"Enable (1) or disable (0)"|
|6|1|No|<none>|"Delimiter (,)"|
|7|1-2|No|POS_RPT_INTERVAL|"Interval (5-60 [minutes])"|



## **Sample Message** 

```
QU DDLXCXA
.RTNBOCR 221954
CMD
AN N7873BO/MA 017A
-  QURTNBOCR~1POS
1,10
```

Note: In the sample message above, automatic position reports are enabled at a 10-minute interval. 

```
QU DDLXCXA
.RTNBOCR 221955
CMD
AN N7873BO/MA 018A
-  QURTNBOCR~1POS
0
```

Note: In the sample message above, automatic position reports are disabled and the automatic position report interval is omitted. 

## **9.6 OOOI Reports** 

This section describes the OOOI Reports function that the AMI implements.  This function includes logic to detect OOOI state transitions and perform certain actions at those transitions, 

226 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

including sending specified downlink encodings as OOOI reports.  Of note, this logic requires that an FMF flight plan (route) be entered and activated, specifically the destination airport. 

Note: Section 11.2 describes the OOOI Data Loop Back Message function, which allows an aircraft operator to request OOOI-related information from the airplane. 

Note: There is no display definition for this function, although the OOOI Test Page display described in Section 12.6.2.1.9 shows OOOI-related parameters. 

227 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

Table 9-11 summarizes the OOOI state transition logic. 

**Table 9-11  OOOI State Transition Logic** 

|**To**<br>**From**|**Out**|**Off**|**On**|**In**|
|---|---|---|---|---|
|**Out**||Doors Closed<br>and In Air|N/A|Doors Open<br>(Return to Gate)|
|**Off**|N/A||On Ground|N/A|
|**On**|N/A|Doors Closed<br>and In Air<br>(Touch and Go)||Doors Open|
|**In**|Doors Closed<br>and Brake Off|N/A|N/A||
|**Invalid**|On Ground,<br>Doors Closed,<br>and Brake Off|In Air and<br>Doors Closed|N/A|On Ground,<br>Doors Closed,<br>and Brake On<br>or<br>On Ground<br>and Doors Open|



In Air is true (and On Ground is false) when: 

- calibrated airspeed (CAS) is valid and CAS is greater than 125 knots; or 

- CAS is invalid, but ground speed is valid and ground speed is greater than 130 knots; or 

- both CAS and ground speed are invalid, but the In Air discrete is true. 

Otherwise On Ground is true and In Air is false. 

Brake On (parking brake set) and Brake Off (parking brake released) are set based on the status of the parking brake handle. 

Doors Open is true if any of the following are set to true: 

- DOOR_ENTRY_1L_OPEN 

- DOOR_ENTRY_2L_OPEN 

- DOOR_ENTRY_3L_OPEN 

228 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

- DOOR_ENTRY_4L_OPEN 

- DOOR_ENTRY_1R_OPEN 

- DOOR_ENTRY_2R_OPEN 

- DOOR_ENTRY_3R_OPEN 

- DOOR_ENTRY_4R_OPEN 

- DOOR_AFT_EE_ACCESS_OPEN 

- DOOR_FWD_EE_ACCESS_OPEN 

- DOOR_FWD_OVERHEAD_OPEN 

- DOOR_FWD_ACCESS_OPEN 

- DOOR_BULK_CARGO_OPEN 

- DOOR_FWD_CARGO_OPEN 

- DOOR_AFT_CARGO_OPEN 

Doors Closed is true if all of the above parameters are either false or invalid. 

## **9.6.1 State Logic Unit** 

The AMI implements a logic unit to detect OOOI state transitions. 

```
-- -------------------------------------------------------------------------
--
-- BCG_OOOI_LOGIC  (OOOI STATE MACHINE)
--
-- This logic unit performs OOOI State Transition Logic:
--      OUT, OFF, ON, IN
--
-- -------------------------------------------------------------------------
-- LOGIC DEPENDENCY:
--       Dependent on other Logic Units:     BCG_PARAMETERS
--       Is required for other Logic Units:  YES
-- -------------------------------------------------------------------------
--
-- Revision History
--
--    26-FEB-2007 Original version
--
--    29-APR-2007 PEP 29 APR 07
--                Revised to include Sandell comments from his
--                13 APR 07 e-mail to P. Poteet, S. Lee and
```

229 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

```
--                M. Henninger. The areas were the doors open/closed
--                and determination of air/ground status.
--
--    13-JUN-2007 PEP 13 JUN 07
--                Revised to include G.Sandell and T.Dastrup revision
--                to air/ground logic.
--
--    03-OCT-2007
--                Changed airborne determination from 10 seconds to 3 seconds.
--
-- Version C000 - new versioning - no change in logic
--
-- Version D001  M. Matyas  24-OCT-2017
--         Changed logic that captures parking brake set time to use
--         CURRENT_TIME instead of CURRENT_HHMM.
--
-- Version D002  S. Meisch - 2018 OCT
--         1) Added logic dependency in description comment section
--         2) Moved generic parameters to BCG_PARAMETERS logic unit (runs first)
--            to assure proper sequencing of logic DOORS_ALL_CLOSED,
--            AIRCRAFT_IN_AIR, BRAKE_TIME)
--
-- Version E001  M. Matyas  18-FEB-2019
--     Added logic to determine initial delay type.
--
-- Version F001  M. Matyas  29-SEP-2020
--     Updated references from ESB_DELAY_SEL to DLY_SELECT.
--
---------------------------------------------------------------------------
-- The following logic unit is an OOOI state machine.
-- It determines the current OOOI state and then
-- checks the criteria for transition to other states.
-- ------------------------------
-- BEGIN OOOI STATE MACHINE
-- ------------------------------
-- If IN, look for OUT event.
-- ------------------------------
   if OOOI_STATE = IN then
      if DOORS_ALL_CLOSED and NOT PARKINGBRKLEVERSET then
         OOOI_STATE     :=  OUT;          -- Doors Closed, Brake Rel
         OOOI_STATUS    := "OUT";         -- Go OUT
         RETURN_TO_GATE := FALSE;
         TOUCH_AND_GO   := FALSE;
         set_invalid (BRAKE_TIME);
      end_if;
```

230 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

```
-- ------------------------------
```

```
-- If OUT, look for OFF or IN event.
-- ------------------------------
   else_if OOOI_STATE = OUT then
      if DOORS_ALL_CLOSED then
         if AIRCRAFT_IN_AIR then
            OOOI_STATE   :=  OFF;       -- In Air, Doors Closed
            OOOI_STATUS  := "OFF";      -- Go OFF
            set_invalid (BRAKE_TIME);
         end_if;
      else  -- (Doors not Closed)
         OOOI_STATE     :=  IN;           -- Door Open
         OOOI_STATUS    := "IN";          -- Go IN
         RETURN_TO_GATE := TRUE;          -- Return to Gate
      end_if;
```

```
-- ------------------------------
```

```
-- If OFF, look for ON event.
-- ------------------------------
   else_if OOOI_STATE = OFF then
      if NOT AIRCRAFT_IN_AIR then
         OOOI_STATE     :=  ON;           -- On Gnd
         OOOI_STATUS    := "ON";          -- GO ON
         RETURN_TO_GATE := FALSE;         -- Not a Return to Gate
         TOUCH_AND_GO   := FALSE;         -- Not a Touch and Go
         set_invalid (BRAKE_TIME);
      end_if;
-- ------------------------------
-- If ON, look for OFF or IN event.
-- ------------------------------
   else_if OOOI_STATE = ON then
      if DOORS_ALL_CLOSED then
         if AIRCRAFT_IN_AIR then
            OOOI_STATE   :=  OFF;         -- In Air, Doors Closed
            OOOI_STATUS  := "OFF";        -- Go OFF
            TOUCH_AND_GO   := TRUE;       -- Touch and Go
            RETURN_TO_GATE := FALSE;      -- Not a Return to Gate
            set_invalid (BRAKE_TIME);
         end_if;
      else
         OOOI_STATE     :=  IN;           -- Door Open
         OOOI_STATUS    := "IN";          -- Go IN
         RETURN_TO_GATE := FALSE;         -- Not a Return to Gate
         TOUCH_AND_GO   := FALSE;         -- Not a Touch and Go
      end_if;
```

231 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

```
   else
```

```
-- --------------------------------------------------------------
-- If OOOI state is invalid, then determine initial OOOI state.
-- --------------------------------------------------------------
      if NOT AIRCRAFT_IN_AIR then
         if DOORS_ALL_CLOSED then
            if PARKINGBRKLEVERSET then
               OOOI_STATE    :=  IN;    -- On Gnd, Doors Closed, Brake Set
               OOOI_STATUS   := "IN";   -- IN State
               DLY_SELECT    := 1;
            else
               OOOI_STATE    :=  OUT;   -- On Gnd, Doors Closed, Brake Rel
               OOOI_STATUS   := "OUT";  -- OUT State
               DLY_SELECT    := 2;
            end_if;
         else
            OOOI_STATE    :=  IN;       -- On Gnd, Door(s) Open
            OOOI_STATUS   := "IN";      -- IN State
            DLY_SELECT    := 1;
         end_if;
      else
         if DOORS_ALL_CLOSED then
            OOOI_STATE    :=  OFF;      -- In Air, Doors Closed
            OOOI_STATUS   := "OFF";     -- OFF State
            DLY_SELECT    := 3;
    -- ------------------------------
    --   else
    --      leave OOOI Invalid        -- In Air, Door(s) Open = INVALID
    -- ------------------------------
         end_if;
      end_if;
      RETURN_TO_GATE := FALSE;        -- Not a Return to Gate
      TOUCH_AND_GO   := FALSE;        -- Not a Touch and Go
      set_invalid (BRAKE_TIME);
   end_if;
-------------------------------------------------------------------------------
--
-- END
```

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

232 of 378 

NEW 

## **9.6.2 Events Logic Unit** 

The AMI implements a logic unit to perform certain actions at OOOI state transitions, including sending specified downlink encodings as OOOI reports. 

```
-- ----------------------------------------------------------------------------
-- BCG_OOOI_EVENTS    OOOI EVENT PROCESSING
--     26-FEB-2007        Original version
--
-- This logic unit performs necessary processing at the time an OOOI
-- event occurs.
--
--   DEPENDENCY NOTES:
--       1. BCG_PARAMETERS  must run before this logic unit
--       2. BCG_OOOI_LOGIC  must run before this logic unit
--
-- ----------------------------------------------------------------------------
```

```
--
-- 02-OCT-2007
--      Changed EOF timer to 9 minutes 50 seconds from when IN event is
--      triggered to assure the logic is executed before CMF resets.
--
-- Version C000 - new versioning - no change in logic
--
-- Version D001  M. Matyas  24-OCT-2017
--     Changed logic that captures OOOI times to use CURRENT_TIME instead
--     of CURRENT_HHMM.
--
-- Version D002  S. Meisch  2018 AUG
--     1) Changed downlink encoding names to include "BCG_" prefix.
--     2) Fixed invalid scheduled date. (CPDB defaults to current date, logic
--         snapshots INIT_SKED_DATE at OUT event.)
--
-- Version E001  M. Matyas  11-FEB-2019
--     Removed unused DEFAULT_STA logic.
--     Added logic to set arrival delay report type at On event.
--     Added logic to calculate flight and block times and fuels.
--
```

- `-- Version F001  M. Matyas  29-SEP-2020 --     Added logic to reestablish link with FMF destination airport when --         touch-and-go occurs. --     Added logic to capture Off station at Off event and On station --         at On event. --     Updated references from ESB_DELAY_SEL to DLY_SELECT and --         from INIT_DEPT_STA to INIT_ORIG_STA.` 

233 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

```
--     Changed logic to enable OOOI reports if FMF destination airport is valid.
--     Added logic to capture flight number if invalid at Out event.
--     Corrected block fuel calculation logic to use IN_FOB (not ON_FOB).
--
```

```
-- ----------------------------------------------------------------------------
```

```
-- Enable OOOI reports only if a destination airport is entered in FMF:
   if valid (FMF_ACTRTEDEST) then
      OOOI_ENABLED  := TRUE;            -- Enable OOOI reports
   end_if;
```

```
-- -----------------------------------------------
-- OUT EVENT
-- -----------------------------------------------
if OOOI_STATE changed to (OUT) then
   INIT_SKED_DATE := INIT_SKED_DATE;    -- Snapshot scheduled date
   OUT_TIME := CURRENT_TIME;            -- Capture OUT time
   OUT_FOB := FUEL_ON_BOARD;            -- Capture fuel on board
   set_invalid (IN_TIME);               -- Invalidate IN time
   set_invalid (IN_FOB);                -- Invalidate IN fuel
   set_invalid (EOF_TIMER);             -- Invalidate end of flight timer
   DLY_SELECT := 2;                     -- Select takeoff delay type
   if not valid (ENTERED_FLTNO) then             -- Capture flight number
      ENTERED_FLTNO := FMF_CMF_FLIGHT_NUMBER;    -- if not valid
   end_if;
   if not valid (INIT_SKED_DATE) then            -- Capture scheduled date
      INIT_SKED_DATE := CURRENT_DATE;            -- if not valid
   end_if;
   if OOOI_ENABLED then
      send (BCG_OOOI_OUT);                       -- Send OUT report
   end_if;
end_if;
```

```
-- -----------------------------------------------
-- OFF EVENT
-- -----------------------------------------------
if OOOI_STATE changed to (OFF) then
   if TOUCH_AND_GO then
      set_default (INIT_DEST_STA);      -- Reestablish link to FMF destination
   end_if;
```

NEW 

D613Z019-06 234 of 378 ECCN: 7E994 **BOEING PROPRIETARY** 

```
   set_invalid (ON_TIME);               -- Invalidate ON time
   set_invalid (ON_FOB);                -- Invalidate ON fuel
   INIT_ORIG_STA := INIT_ORIG_STA;      -- Break link with FMF origin
   OFF_STA       := INIT_ORIG_STA;      -- Capture Off station
   OFF_TIME      := CURRENT_TIME;       -- Capture OFF time
   OFF_FOB       := FUEL_ON_BOARD;      -- Capture fuel on board
   DLY_SELECT    := 3;                  -- Select enroute delay type
   if OOOI_ENABLED then
      send (BCG_OOOI_OFF);              -- Send OFF report
   end_if;
end_if;
-- -----------------------------------------------
-- ON EVENT
-- -----------------------------------------------
if OOOI_STATE changed to (ON) then
   ON_TIME       := CURRENT_TIME;       -- Capture ON time
   ON_FOB        := FUEL_ON_BOARD;      -- Capture fuel on board
   ENTERED_FLTNO := ENTERED_FLTNO;      -- Break link with FMF flight number
   INIT_DEST_STA := INIT_DEST_STA;      -- Break link with FMF destination
   ON_STA        := INIT_DEST_STA;      -- Capture On station
   DLY_SELECT    := 4;                  -- Select arrival delay type
   if OOOI_ENABLED then
      send (BCG_OOOI_ON);               -- Send ON report
   end_if;
end_if;
-- -----------------------------------------------
-- IN EVENT
-- -----------------------------------------------
if OOOI_STATE changed to (IN) then
   if VALID(BRAKE_TIME) then            -- Capture IN time...
      IN_TIME := BRAKE_TIME;            -- either when brake was set...
   else
      IN_TIME := CURRENT_TIME;          -- or else use current time.
   end_if;
   IN_FOB         := FUEL_ON_BOARD;     -- Capture fuel on board
   DLY_SELECT     := 1;                 -- Select departure delay type
```

235 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

```
   if RETURN_TO_GATE then
      if OOOI_ENABLED then
         send (BCG_OOOI_RTG);           -- Send return to gate report
      end_if;
   else                                 -- Normal IN event
      EOF_TIMER := CURRENT_DATE_TIME + (590);  -- Set end of flight timer to
                                               -- 9 minutes and 50 seconds
      if OOOI_ENABLED then
         send (BCG_OOOI_IN);            -- Send IN report
      end_if;
   end_if;
end_if;
-- -----------------------------------------------
-- Calculate flight and block times and fuels
-- -----------------------------------------------
FLIGHT_TIME := ON_TIME - OFF_TIME;            -- Calculate flight time
    if FLIGHT_TIME < 0 then
        FLIGHT_TIME := FLIGHT_TIME + 86400;   -- Keep flight time positive
    end_if;
FLIGHT_FUEL := OFF_FOB - ON_FOB;              -- Calculate flight fuel
BLOCK_TIME := IN_TIME - OUT_TIME;             -- Calculate block time
    if BLOCK_TIME < 0 then
        BLOCK_TIME := BLOCK_TIME + 86400;     -- Keep block time positive
    end_if;
BLOCK_FUEL := OUT_FOB - IN_FOB;               -- Calculate block fuel
-------------------------------------------------------------------------------
--
```

```
-- END
```

## **9.6.3 Out Report Downlink Encoding Definition** 

If the AMI detects a transition to the Out state, then it sends the following downlink encoding: 

- ACARS SMI: M11 

- ACARS Label: 11  Allowable Subnetworks: All 

D613Z019-06 236 of 378 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

- Downlink Priority: Flight Regularity 

- Downlink Buffer: REPORT_OOOI 

- Delete at System Reset: No 

- Delete on Buffer Full: Yes 

Table 9-12 describes the Out Report downlink encoding definition. 

**Table 9-12  Out Report Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|OUT|"Message Identifier"|
|3|2|Always|01|"Message Version"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Always|<CR><LF>|"Delimiter"|
|12|4|Always|OUT_TIME|"Out Time (HHMM)"|
|13|4|Always|OUT_FOB|"Out Fuel on Board / 100 (NNNN)"|
|14|6|Always|INIT_BOARDED_FUEL|"Boarded Fuel (NNNNNN)"|



## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221737
M11
FI BO64/AN N7873BO
DT DDL BFI 221737 M23A
-  OUT01     BOE64/22221737KBFIPHOG
17370427080000
```

Note: In this sample message, the fuel on board at the Out event is “0427” (42,700) and the boarded fuel is “080000” (80,000). 

## **9.6.4 Off Report Downlink Encoding Definition** 

If the AMI detects a transition to the Off state, then it sends the following downlink encoding: 

 ACARS SMI: M12 

D613Z019-06 237 of 378 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

- ACARS Label: 12 

- Allowable Subnetworks: All 

- Downlink Priority: Flight Regularity 

- Downlink Buffer: REPORT_OOOI 

- Delete at System Reset: No 

- Delete on Buffer Full: Yes 

Table 9-13 describes the Off Report downlink encoding definition. 

**Table 9-13  Off Report Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|OFF|"Message Identifier"|
|3|2|Always|01|"Message Version"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Always|<CR><LF>|"Delimiter"|
|12|4|Always|OFF_TIME|"Off Time (HHMM)"|
|13|4|Always|OFF_FOB|"Off Fuel on Board / 100 (NNNN)"|



## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221742
M12
FI BO64/AN N7873BO
DT DDL BFI 221742 M24A
-  OFF01     BOE64/22221742KBFIPHOG
17420425
```

Note: In this sample message, the fuel on board at the Off event is “0425” (42,500). 

## **9.6.5 On Report Downlink Encoding Definition** 

If the AMI detects a transition to the On state, then it sends the following downlink encoding: 

238 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

- ACARS SMI: M13 

- ACARS Label: 13 

- Allowable Subnetworks: All 

- Downlink Priority: Flight Regularity 

- Downlink Buffer: REPORT_OOOI 

- Delete at System Reset: No 

- Delete on Buffer Full: Yes 

Table 9-14 describes the On Report downlink encoding definition. 

**Table 9-14  On Report Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|ONN|"Message Identifier"|
|3|2|Always|01|"Message Version"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Always|<CR><LF>|"Delimiter"|
|12|4|Always|ON_TIME|"On Time (HHMM)"|
|13|4|Always|ON_FOB|"On Fuel on Board / 100 (NNNN)"|



## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221829
M13
FI BO64/AN N7873BO
DT DDL BFI 221829 M37A
-  ONN01     BOE64/22221829KBFIPHOG
18290327
```

Note: In this sample message, the fuel on board at the On event is “0327” (32,700). 

239 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **9.6.6 In Report Downlink Encoding Definition** 

If the AMI detects a transition to the In state, then it sends the following downlink encoding: 

- ACARS SMI: M14 

- ACARS Label: 14 

- Allowable Subnetworks: All 

- Downlink Priority: Flight Regularity 

- Downlink Buffer: REPORT_OOOI 

- Delete at System Reset: No 

- Delete on Buffer Full: Yes 

Table 9-15 describes the In Report downlink encoding definition. 

**Table 9-15  In Report Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|INN|"Message Identifier"|
|3|2|Always|01|"Message Version"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Always|<CR><LF>|"Delimiter"|
|12|4|Always|IN_TIME|"In Time (HHMM)"|
|13|4|Always|IN_FOB|"In Fuel on Board / 100 (NNNN)"|



Note: IN_TIME is set to the most recent time that the parking brake was set prior to a door opening.  If the parking brake was not set prior to a door opening, then IN_TIME is set to the time that the door opened. The In event and the In report downlink occur at the time the door opened. 

## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221831
M14
FI BO64/AN N7873BO
DT DDL BFI 221831 M38A
```

240 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

- `INN01     BOE64/22221831KBFIPHOG 18310325` 

Note: In this sample message, the fuel on board at the In event is “0325” (32,500). 

## **9.6.7 Return to Gate Report Downlink Encoding Definition** 

If the AMI detects a transition to the Return to Gate state (i.e., an In state following an Out state), then it sends the following downlink encoding: 

- ACARS SMI: M15 

- ACARS Label: 15 

- Allowable Subnetworks: All 

- Downlink Priority: Flight Regularity 

- Downlink Buffer: REPORT_OOOI 

- Delete at System Reset: No 

- Delete on Buffer Full: Yes 

Table 9-16 describes the Return to Gate Report downlink encoding definition. 

**Table 9-16  Return to Gate Report Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|RTG|"Message Identifier"|
|3|2|Always|01|"Message Version"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Always|<CR><LF>|"Delimiter"|
|12|4|Always|OUT_TIME|"Out Time (HHMM)"|
|13|4|Always|IN_TIME|"In Time (HHMM)"|
|14|4|Always|IN_FOB|"In Fuel on Board / 100 (NNNN)"|



Note: IN_TIME is set to the most recent time that the parking brake was set prior to a door opening.  If the parking brake was not set prior to a door opening, then IN_TIME is set to the time that the door opened. The In event and the In report downlink occur at the time the door opened. 

241 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 262212
M15
FI BO64/AN N7873BO
DT DDL BFI 262212 M06A
-  RTG01     BOE64/26262212KBFIKSYR
220922120454
```

Note: In this sample message, the fuel on board at the In event is “0454” (45,400). 

242 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW
