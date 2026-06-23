## **11 Loop Back Messages** 

The AMI implements several loop back message (also known as command-response message) functions. 

## **11.1 Automatic Emergency Report Status Loop Back Messages** 

The Automatic Emergency Report Status Uplink enables the aircraft operator to request the AMI to send the Automatic Emergency Report Status Downlink and to set the function to the Armed, On, or Off state.  The uplink is not displayed to the flight crew. 

## **11.1.1 Uplink Decoding Definition** 

The decoding for the Automatic Emergency Report Status Uplink is defined as follows: 

||ACARS SMI:|CMD|
|---|---|---|
||ACARS Label:|RA|
||Message Identifier:|~4EMG|
||Alert Level:|None|



- Optional Element Delimiter: None 

Table 11-1 describes the Automatic Emergency Report Status Uplink decoding definition. 

**Table 11-1  Automatic Emergency Report Status Uplink Decoding Definition** 

|**#**|**Length**|**Required**|**Destination Parameter**|**Element Description**|
|---|---|---|---|---|
|1|9|Yes|RA4_GND_ADDR|"Priority & address (XXXXXXXXX)"|
|2|5|Yes|<none>|"Message identifier (~4EMG)"|
|3|1|No|EMERGENCY_SELECTION|"Automatic emergency report selection (1,<br>2, or 3)"|



If the optional automatic emergency report selection value is included, then the AMI selects the corresponding state for the Automatic Emergency Report function: 

- 1: Automatic Emergency Report Function On 

- 2: Automatic Emergency Report Function Armed 

- 3: Automatic Emergency Report Function Off 

When the AMI receives this uplink it sends the Automatic Emergency Report Status Downlink. 

277 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **Sample Message** 

```
QU DDLXCXA
.RTNBOCR 221954
CMD
AN N7873BO/MA 019A
-  QURTNBOCR~4EMG
```

Note: In this sample message the automatic emergency report selection value is omitted. 

## **11.1.2 Downlink Encoding Definition** 

The encoding for the Automatic Emergency Report Status Downlink is defined as follows: 

- ACARS SMI: RDO 

- ACARS Label: RB 

- Allowable Subnetworks: All 

- Downlink Priority: Flight Regularity 

- Downlink Buffer: RESPONSE_AUTO 

- Delete at System Reset: No 

- Delete on Buffer Full: Yes 

Table 11-2 describes the Automatic Emergency Report Status Downlink encoding definition. 

**Table 11-2  Automatic Emergency Report Status Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|9|Always|RA4_GND_ADDR|"Priority & address (XXXXXXXXX)"|
|3|1|Always|/|"Delimiter"|
|4|5|Always|~4EMG|"Message Identifier"|
|5|1|Always|<SP>|"Delimiter"|
|6|18|Conditionally|EMERGENCY MODE OFF|"EMERGENCY_SELECTION = 3"|
|7|18|Conditionally|EMERGENCY MODE ARM|"EMERGENCY_SELECTION = 2"|
|8|17|Conditionally|EMERGENCY MODE ON|"EMERGENCY_SELECTION = 1"|
|9|2|Always|<CR><LF>|"Delimiter"|
|10|1-5|Always|EMERGENCY_DESRATE_THRESHOLD|"Descent Rate Threshold (NNNNN)"|
|11|1|Always|,|"Delimiter"|
|12|4|Always|EMERGENCY_MMO_THRESHOLD|"Above MMOThreshold (N.NN)"|
|13|1|Always|,|"Delimiter"|
|14|1-3|Always|EMERGENCY_VMO_THRESHOLD|"Above VMOThreshold (NNN)"|



278 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|15|1|Always|,|"Delimiter"|
|16|1-3|Always|EMERGENCY_LOW_SPEED_THRESHOLD|"CAS Low Threshold (NNN)"|
|17|1|Always|,|"Delimiter"|
|18|1-2|Always|EMERGENCY_PITCH_THRESHOLD|"Pitch Angle Threshold (NN)"|
|19|1|Always|,|"Delimiter"|
|20|1-2|Always|EMERGENCY_PITCH_RATE_THRESHOLD|"Pitch Rate Threshold (NN)"|
|21|1|Always|,|"Delimiter"|
|22|1-2|Always|EMERGENCY_YAW_RATE_THRESHOLD|"Yaw Rate Threshold (NN)"|
|23|1|Always|,|"Delimiter"|
|24|3|Always|EMERGENCY_VERT_ACCEL_THRESHOLD|"Vertical Acceleration Threshold<br>(N.N)"|
|25|1|Always|,|"Delimiter"|
|26|1-5|Always|EMERGENCY_FUEL_THRESHOLD|"Fuel Threshold (NNNNN)"|
|27|1|Always|,|"Delimiter"|
|28|1-2|Always|EMERGENCY_TPR_THRESHOLD|"TPR Threshold (NN)"|
|29|1|Always|,|"Delimiter"|
|30|1-2|Always|EMERGENCY_N1_THRESHOLD|"N1 Threshold (NN)"|
|31|1|Always|,|"Delimiter"|
|32|2-3|Always|EMERGENCY_FREQUENCY|"Reporting Interval (NNN)"|
|33|1|Always|,|"Delimiter"|
|34|2-3|Always|MAX_EMERGENCY_RPT|"Reporting Time Limit (NNN)"|
|35|1|Always|,|"Delimiter"|
|36|1-5|Always|EMERGENCY_MIN_ALTITUDE|"Reporting Min Altitude (NNNNN)"|
|37|1|Always|,|"Delimiter"|
|38|1-5|Always|EMERGENCY_CLBRATE_THRESHOLD|"Climb Rate Threshold (NNNNN)"|



The following ranges and units apply to the following parameters: 

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

279 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

- N1 threshold: 0-25% 

- Reporting interval: 60-900 seconds 

- Reporting time limit: 30-360 minutes 

- Reporting minimum altitude: 0-30000 feet 

- Climb rate threshold: 0-20000 feet per minute 

## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221920
RDO
FI BO24/AN N7873BO
DT DDL BFI 221920 M54A
-  QURTNBOCR/~4EMG EMERGENCY MODE ARM
6000,0.10,40,115,15,15,15,3.0,5000,10,10,120,30,7500,6000
```

## **11.2 OOOI Data Loop Back Messages** 

The OOOI Data Uplink enables the aircraft operator to request the AMI to send the OOOI Data Downlink.  The uplink is not displayed to the flight crew. 

## **11.2.1 Uplink Decoding Definition** 

The decoding for the OOOI Data Uplink is defined as follows: 

- ACARS SMI: CMD 

- ACARS Label: RA  Message Identifier: ~2OOI  Alert Level: None 

- Optional Element Delimiter: None 

Table 11-3 describes the OOOI Data Uplink decoding definition. 

**Table 11-3  OOOI Data Uplink Decoding Definition** 

|**#**|**Length**|**Required**|**Destination Parameter**|**Element Description**|
|---|---|---|---|---|
|1|9|Yes|RA2_GND_ADDR|"Priority & address (XXXXXXXXX)"|
|2|5|Yes|<none>|"Message identifier (~2OOI)"|



When the AMI receives this uplink it sends the OOOI Data Downlink. 

280 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **Sample Message** 

```
QU DDLXCXA
.RTNBOCR 221954
CMD
AN N7873BO/MA 020A
- QURTNBOCR~2OOI
```

## **11.2.2 Downlink Encoding Definition** 

The encoding for the OOOI Data Downlink is defined as follows: 

- ACARS SMI: RDO 

- ACARS Label: RB 

- Allowable Subnetworks: All 

- Downlink Priority: Flight Regularity 

- Downlink Buffer: RESPONSE_AUTO 

- Delete at System Reset: No 

- Delete on Buffer Full: Yes 

Table 11-4 describes the OOOI data encoding definition. 

**Table 11-4  OOOI Data Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|9|Always|RA2_GND_ADDR|"Priority & address (XXXXXXXXX)"|
|3|1|Always|/|"Delimiter"|
|4|5|Always|~2OOI|"Message Identifier"|
|5|1|Always|<SP>|"Delimiter"|
|6|1-10|Always|ENTERED_FLTNO|"Current Flight Number (1-10<br>characters)"|
|7|1|Always|,|"Delimiter"|
|8|3-4|Always|INIT_ORIG_STA|"Current Origin Station (3-4<br>characters)"|
|9|1|Always|,|"Delimiter"|
|10|3-4|Always|INIT_DEST_STA|"Current Destination Station (3-4<br>characters)"|
|11|1|Always|,|"Delimiter"|
|12|1-6|Always|INIT_BOARDED_FUEL|"Current Boarded Fuel (NNNNNN)"|
|13|1|Always|,|"Delimiter"|



281 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|14|4|Always|OUT_TIME|"Current Out Time (HHMM)"|
|15|1|Always|,|"Delimiter"|
|16|3-5|Always|OUT_FOB|"Current Out Fuel / 1000 (NNN.N)"|
|17|1|Always|,|"Delimiter"|
|18|4|Always|OFF_TIME|"Current Off Time (HHMM)"|
|19|1|Always|,|"Delimiter"|
|20|3-5|Always|OFF_FOB|"Current Off Fuel / 1000 (NNN.N)"|
|21|1|Always|,|"Delimiter"|
|22|4|Always|ON_TIME|"Current On Time (HHMM)"|
|23|1|Always|,|"Delimiter"|
|24|3-5|Always|ON_FOB|"Current On Fuel / 1000 (NNN.N)"|
|25|1|Always|,|"Delimiter"|
|26|4|Always|IN_TIME|"Current In Time (HHMM)"|
|27|1|Always|,|"Delimiter"|
|28|3-5|Always|IN_FOB|"Current In Fuel / 1000 (NNN.N)"|
|29|2|Always|<CR><LF>|"Delimiter"|
|30|1-10|Always|PREV_FLIGHT_NUMBER|"Previous Flight Number (1-10<br>characters)"|
|31|1|Always|,|"Delimiter"|
|32|3-4|Always|PREV_ORIG_STA|"Previous Origin Station (3-4<br>characters)"|
|33|1|Always|,|"Delimiter"|
|34|3-4|Always|PREV_DEST_STA|"Previous Destination Station (3-4<br>characters)"|
|35|1|Always|,|"Delimiter"|
|36|1-6|Always|PREV_BOARDED_FUEL|"Previous Boarded Fuel (NNNNNN)"|
|37|1|Always|,|"Delimiter"|
|38|4|Always|PREV_OUT_TIME|"Previous Out Time (HHMM)"|
|39|1|Always|,|"Delimiter"|
|40|3-5|Always|PREV_OUT_FOB|"Previous Out Fuel / 1000 (NNN.N)"|
|41|1|Always|,|"Delimiter"|
|42|4|Always|PREV_OFF_TIME|"Previous Off Time (HHMM)"|
|43|1|Always|,|"Delimiter"|
|44|3-5|Always|PREV_OFF_FOB|"Previous Off Fuel / 1000 (NNN.N)"|
|45|1|Always|,|"Delimiter"|
|46|4|Always|PREV_ON_TIME|"Previous On Time (HHMM)"|
|47|1|Always|,|"Delimiter"|
|48|3-5|Always|PREV_ON_FOB|"Previous On Fuel / 1000 (NNN.N)"|
|49|1|Always|,|"Delimiter"|
|50|4|Always|PREV_IN_TIME|"Previous In Time (HHMM)"|



282 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|51|1|Always|,|"Delimiter"|
|52|3-5|Always|PREV_IN_FOB|"Previous In Fuel / 1000 (NNN.N)"|



## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221707
RDO
FI BO24/AN N7873BO
DT DDL BFI 221707 M21A
-  QURTNBOCR/~2OOI
BOE24,KBFI,KBFI,9876,1730,55.9,1734,55.8,1751,52.6,1751,52.9
BOE718,KBFI,KBFI,5432,1635,45.9,1639,45.8,1656,42.6,1656,42.9
```

## **11.3 Position Report Loop Back Messages** 

The Position Report Uplink enables the aircraft operator to request the AMI to send the Position Report Downlink.  The uplink is not displayed to the flight crew. 

## **11.3.1 Uplink Decoding Definition** 

The decoding for the Position Report Uplink is defined as follows: 

||ACARS SMI:|CMD|
|---|---|---|
||ACARS Label:|RA|
||Message Identifier:|~4POS|
||Alert Level:|None|
||Optional Element Delimiter:|None|



Table 11-5 describes the Position Report Uplink decoding definition. 

**Table 11-5  Position Report Uplink Decoding Definition** 

|**#**|**Length**|**Required**|**Destination Parameter**|**Element Description**|
|---|---|---|---|---|
|1|9|Yes|RA4_GND_ADDR|"Priority & address (XXXXXXXXX)"|
|2|5|Yes|<none>|"Message identifier (~4POS)"|



When the AMI receives this uplink it sends the Position Report Downlink. 

283 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **Sample Message** 

```
QU DDLXCXA
.RTNBOCR 221954
CMD
AN N7873BO/MA 021A
- QURTNBOCR~4POS
```

## **11.3.2 Downlink Encoding Definition** 

The encoding for the Position Report Downlink is defined as follows: 

- ACARS SMI: RDO 

- ACARS Label: RB 

- Allowable Subnetworks: All 

- Downlink Priority: Flight Regularity 

- Downlink Buffer: RESPONSE_AUTO 

- Delete at System Reset: No 

- Delete on Buffer Full: Yes 

Table 11-6 describes the Position Report Downlink encoding definition. 

**Table 11-6  Position Report Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|9|Always|RA4_GND_ADDR|"Priority & address (XXXXXXXXX)"|
|3|1|Always|/|"Delimiter"|
|4|5|Always|~4POS|"Message Identifier"|
|5|1|Always|<SP>|"Delimiter"|
|6|13|Always|AIRCRAFT_POSITION|"Position (XDDMMTXDDDMMT)"|
|7|1|Always|/|"Delimiter"|
|8|1-5|Always|NAV_ALTITUDE|"Altitude (NNNNN)"|
|9|1|Always|/|"Delimiter"|
|10|4|Always|NAV_MAG_HDG|"Magnetic Heading (+/-NNN)"|
|11|1|Always|/|"Delimiter"|
|12|1-7|Always|FMF_LAST_WPT|"Last Waypoint (1-7 characters)"|
|13|1|Always|/|"Delimiter"|
|14|1-7|Always|FMF_ACTIVE_WPT|"Active Waypoint (1-7 characters)"|
|15|1|Always|/|"Delimiter"|



284 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|16|1-7|Always|FMF_NEXT_WPT|"Next Waypoint (1-7 characters)"|
|17|1|Always|/|"Delimiter"|
|18|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|19|6|Always|CURRENT_DATE_TIME|"Current Time (HHMMSS)"|



Note: Headings, tracks, and bearings (i.e., the NAV_MAG_HDG, NAV_MAG_TRACK, NAV_TRUE_HDG, NAV_TRUE_TRACK, NAV_WIND_TRUE_BRG, ND_HEADING_CAPT, and ND_HEADING_FO parameters) are expressed in raw format, where negative values are west of north.  For example, a raw heading of -135° corresponds to a compass heading of 225° and a raw track of -015° corresponds to a compass track of 345°.  Accordingly, if a raw direction is negative then it may be converted to a compass direction by adding 360°.  No such conversion is necessary if a raw direction is positive. 

## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221921
RDO
FI BO24/AN N7873BO
DT DDL BFI 221921 M55A
-  QURTNBOCR/~4POS N48083W121405/31004/+170/BLAKO/RADDY/YKM/22192118
```

## **11.4 Software Configuration Loop Back Messages** 

The Software Configuration Uplink enables the aircraft operator to request the AMI to send the Software Configuration Downlink.  The uplink is not displayed to the flight crew. 

## **11.4.1 Uplink Decoding Definition** 

The decoding for the Software Configuration Uplink is defined as follows: 

- ACARS SMI: CMD 

- ACARS Label: RA  ~4CFG 

- Message Identifier: 

- Alert Level: None 

- Optional Element Delimiter: None 

Table 11-7 describes the Software Configuration Uplink decoding definition. 

285 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**Table 11-7  Software Configuration Uplink Decoding Definition** 

|**#**|**Length**|**Required**|**Destination Parameter**|**Element Description**|
|---|---|---|---|---|
|1|9|Yes|RA4_GND_ADDR|"Priority & address (XXXXXXXXX)"|
|2|5|Yes|<none>|"Message identifier (~4CFG)"|



When the AMI receives this uplink it sends the Software Configuration Downlink. 

## **Sample Message** 

```
QU DDLXCXA
.RTNBOCR 221954
CMD
AN N7873BO/MA 022A
-  QURTNBOCR~4CFG
```

## **11.4.2 Downlink Encoding Definition** 

The encoding for the Software Configuration Downlink is defined as follows: 

- ACARS SMI: RDO 

- ACARS Label: RB 

- Allowable Subnetworks: All 

- Downlink Priority: Flight Regularity 

- Downlink Buffer: 

   - RESPONSE_AUTO 

- Delete at System Reset: No 

- Delete on Buffer Full: Yes 

Table 11-8 describes the Software Configuration Downlink encoding definition. 

**Table 11-8  Software Configuration Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|9|Always|RA4_GND_ADDR|"Priority & address (XXXXXXXXX)"|
|3|1|Always|/|"Delimiter"|
|4|5|Always|~4CFG|"Message Identifier"|
|5|1|Always|<SP>|"Delimiter"|
|6|15|Always|ATS_SOFTWARE_PART_NUMBER|"CMF OPS Part Number"|
|7|1|Always|/|"Delimiter"|
|8|10|Always|ATS_DF_FILE_PART_NUMBER|"CMF OPS UADF Part Number"|



286 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|9|1|Always|/|"Delimiter"|
|10|15|Always|AMI_PART_NUMBER|"CMF AMI Part Number"|
|11|1|Always|/|"Delimiter"|
|12|10|Always|AMI_DF_FILE_PART_NUMBER|"CMF AMI UADF Part Number"|



## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221920
RDO
FI BO24/AN N7873BO
DT DDL BFI 221920 M53A
```

```
-  QURTNBOCR/~4CFG HNP5E-AL21-5012/O176061303/BCG-47-8CMF-
A012/A192220610
```

## **11.5 Subnetwork Status Loop Back Messages** 

The Subnetwork Status Uplink enables the aircraft operator to request the AMI to send the Subnetwork Status Downlink.  The uplink is not displayed to the flight crew. 

## **11.5.1 Uplink Decoding Definition** 

The decoding for the Subnetwork Status Uplink is defined as follows: 

||ACARS SMI:|CMD|
|---|---|---|
||ACARS Label:|RA|
||Message Identifier:|~4SUB|
||Alert Level:|None|
||Optional Element Delimiter:|None|



Table 11-9 describes the Subnetwork Status Uplink decoding definition. 

**Table 11-9  Subnetwork Status Uplink Decoding Definition** 

|**#**|**Length**|**Required**|**Destination Parameter**|**Element Description**|
|---|---|---|---|---|
|1|9|Yes|RA4_GND_ADDR|"Priority & address (XXXXXXXXX)"|
|2|5|Yes|<none>|"Message identifier (~4SUB)"|



When the AMI receives this uplink it sends the Subnetwork Status Downlink. 

287 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **Sample Message** 

```
QU DDLXCXA
.RTNBOCR 221954
CMD
AN N7873BO/MA 023A
- QURTNBOCR~4SUB
```

## **11.5.2 Downlink Encoding Definition** 

The encoding for the Subnetwork Status Downlink is defined as follows: 

- ACARS SMI: RDO 

- ACARS Label: RB 

- Allowable Subnetworks: All 

- Downlink Priority: Flight Regularity 

- Downlink Buffer: RESPONSE_AUTO 

- Delete at System Reset: No 

- Delete on Buffer Full: Yes 

Table 11-10 describes the Subnetwork Status Downlink encoding definition. 

**Table 11-10  Subnetwork Status Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|9|Always|RA4_GND_ADDR|"Priority & address<br>(XXXXXXXXX)"|
|3|1|Always|/|"Delimiter"|
|4|5|Always|~4SUB|"Message identifier"|
|5|2|Always|<CR><LF>|"Delimiter"|
|6|4|Always|VHF:|"VHF flag"|
|7|4|Conditionally|COMM|"VHF COMM"|
|8|7|Conditionally|NO COMM|"VHF NO COMM"|
|9|6|Conditionally|FAILED|"VHF failed"|
|10|11|Conditionally|NOT INSTALL|“VHF not installed”|
|11|1|Always|,|"Delimiter"|
|12|4|Conditionally|LEFT|"VHF-L master"|
|13|5|Conditionally|RIGHT|"VHF-R master"|
|14|6|Conditionally|CENTER|"VHF-C master"|
|15|1|Conditionally|*|“Invalid VHF master”|



288 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|16|1|Always|,|"Delimiter"|
|17|4-5|Always|VHF_VOICE_MODE|"VHF voice/data mode (VOICE or<br>DATA)"|
|18|1|Always|,|"Delimiter"|
|19|1-2|Always|CURRENT_REGION|“Current region (NN)”|
|20|1|Always|,|"Delimiter"|
|21|7|Always|ACTIVE_DATA_FREQUENCY|"Active VHF frequency<br>(NNN.NNN)"|
|22|1|Always|,|"Delimiter"|
|23|1|Always|S|"VDR state prefix"|
|24|1|Always|VDR_STATE|"VDR state (N)"|
|25|1|Always|/|"Delimiter"|
|26|1|Always|P|"VDR substate prefix"|
|27|1|Always|VDR_SUBSTATE_UDP|"VDR substate (N)"|
|28|1|Always|,|"Delimiter"|
|29|5|Always|MODE<SP>|"VDL mode"|
|30|1|Conditionally|-|"-"|
|31|1|Conditionally|A|"A"|
|32|1|Conditionally|2|"2"|
|33|1|Conditionally|*|“Invalid VDL mode”|
|34|2|Always|<CR><LF>|"Delimiter"|
|35|3|Always|HF:|"HF flag"|
|36|4|Conditionally|COMM|"HF COMM"|
|37|7|Conditionally|NO COMM|"HF NO COMM"|
|38|6|Conditionally|FAILED|"HF failed"|
|39|11|Conditionally|NOT INSTALL|“HF not installed”|
|40|1|Always|,|"Delimiter"|
|41|4|Conditionally|LEFT|"HF-L master"|
|42|5|Conditionally|RIGHT|"HF-R master"|
|43|1|Conditionally|*|“Invalid HF master”|
|44|1|Always|,|"Delimiter"|
|45|4-5|Always|HF_VOICE_MODE|"HF voice/data mode (VOICE or<br>DATA)"|
|46|1|Always|,|"Delimiter"|
|47|5-9|Always|HFDR_DATA_CHANNEL_AVAILABLE|"HF datalink availability (AVAIL or<br>NOT AVAIL)"|
|48|2|Always|<CR><LF>|"Delimiter"|
|49|7|Always|SATCOM:|"SATCOM flag"|
|50|4|Conditionally|COMM|"SATCOM COMM"|
|51|7|Conditionally|NO COMM|"SATCOM NO COMM"|
|52|6|Conditionally|FAILED|"SATCOM failed"|



289 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|53|11|Conditionally|NOT INSTALL|“SATCOM not installed”|
|54|1|Always|,|"Delimiter"|
|55|4|Conditionally|LEFT|"SDU-L master"|
|56|5|Conditionally|RIGHT|"SDU-R master"|
|57|1|Conditionally|*|“Invalid SDU master”|
|58|1|Always|,|"Delimiter"|
|59|5-9|Always|SATCOM_DATA_CHANNEL_AVAILABLE|"SATCOM datalink availability<br>(AVAIL or NOT AVAIL)"|
|60|2|Always|<CR><LF>|"Delimiter"|
|61|5|Always|AOIP:|"AoIP flag"|
|62|5|Conditionally|AVAIL|"AoIP available"|
|63|9|Conditionally|NOT AVAIL|"AoIP not available"|
|64|6|Conditionally|FAILED|"AoIP failed"|



## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 142229
RDO
FI BO24/AN N7873BO
DT DDL BFIV 142229 M03A
-  QURTNBOCR/~4SUB
VHF:COMM,CENTER,DATA,9,136.975,S7/P3,MODE 2
HF:NO COMM,LEFT,DATA,NOT AVAIL
SATCOM:COMM,LEFT,AVAIL
AOIP:FAILED
```

Note: If AoIP is not enabled, then CMF sets its status to FAILED. 

## **11.6 Test Loop Back Messages** 

The Test Uplink enables the aircraft operator to request the AMI to send the Test Downlink in response in order to verify end-to-end operation of the datalink system.  This function provides for a text block containing up to 200 characters that the aircraft operator includes in the uplink and then the AMI includes in the corresponding downlink.  The uplink is not displayed to the flight crew. 

## **11.6.1 Uplink Decoding Definition** 

The decoding for the Test Uplink is defined as follows: 

290 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

- ACARS SMI: CMD 

- ACARS Label: RA 

- Message Identifier: ~4LBK 

- Alert Level: None 

- Optional Element Delimiter: None 

Table 11-11 describes the Test Uplink decoding definition. 

**Table 11-11  Test Uplink Decoding Definition** 

|**#**|**Length**|**Required**|**Destination Parameter**|**Element Description**|
|---|---|---|---|---|
|1|9|Yes|RA4_GND_ADDR|"Priority & address (XXXXXXXXX)"|
|2|5|Yes|<none>|"Message identifier (~4LBK)"|
|3|1-200|Yes|RA4_TXT_BLK|"Loop back text (1-200 characters)"|



When the AMI receives this uplink it sends the Test Downlink. 

## **Sample Message** 

```
QU DDLXCXA
.RTNBOCR 221954
CMD
AN N7873BO/MA 024A
- QURTNBOCR~4LBKLOOPBACK TEXT
```

## **11.6.2 Downlink Encoding Definition** 

The encoding for the Test Downlink is defined as follows: 

- ACARS SMI: RDO 

- ACARS Label: RB 

- Allowable Subnetworks: All 

- Downlink Priority: Flight Regularity 

- Downlink Buffer: RESPONSE_AUTO 

- Delete at System Reset: No 

- Delete on Buffer Full: Yes 

Table 11-12 describes the Test Downlink encoding definition. 

291 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**Table 11-12  Test Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|9|Always|RA4_GND_ADDR|"Priority & address (XXXXXXXXX)"|
|3|1|Always|/|"Delimiter"|
|4|5|Always|~4LBK|"Message Identifier"|
|5|1|Always|<SP>|"Delimiter"|
|6|1-200|Always|RA4_TXT_BLK|"Loop Back Text (1-200 characters)"|



## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221919
RDO
FI BO24/AN N7873BO
DT DDL BFI 221919 M52A
-  QURTNBOCR/~4LBK LOOP BACK TEXT
```

292 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW
