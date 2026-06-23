## **8 Manual Reports** 

This section describes the manual (flight crew-initiated) report functions that the AMI implements. 

## **8.1 Arrival Report** 

The Arrival Report function enables the flight crew to send additional information that is not included in the automatic On and In reports, such as the pilot who performed the landing, the landing category, and autoland information.  The data on this display is reset after SEND is selected. 

## **8.1.1 Display Definition** 

Figure 8-1 shows the Arrival Report page 1 of 2 display definition. 

143 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [242 x 360] intentionally omitted <==**

**Figure 8-1  Arrival Report Page 1 of 2 Display Definition** 

Figure 8-2 shows the Arrival Report page 2 of 2 display definition. 

144 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [242 x 360] intentionally omitted <==**

**Figure 8-2  Arrival Report Page 2 of 2 Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “ARRIVAL REPORT” 

## **Main Area** 

Table 8-1 describes the Arrival Report display entry boxes. 

**Table 8-1  Arrival Report Display Entry Boxes** 

|**Name**|**Mand**<br>**atory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|---|
|ON TIME|Yes|4|HHMM||ON_TIME|ARR_ON_TIME|
|IN TIME|Yes|4|HHMM||IN_TIME|ARR_IN_TIME|



NEW 

D613Z019-06 145 of 378 ECCN: 7E994 **BOEING PROPRIETARY** 

|**Name**|**Mand**<br>**atory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|---|
|FUEL ON BOARD|No|1-5|NNN.N|0.0-280.0|IN_FOB|ARR_FOB|
|SUPPLEMENTAL<br>TEXT|No|1-24|XXX…|||ARR_SUPLMT_TXT_1|
||No|1-24|XXX…|||ARR_SUPLMT_TXT_2|
||No|1-24|XXX…|||ARR_SUPLMT_TXT_3|



The first three entry boxes are followed by a group of ESBs labeled LANDING PILOT to select which flight crew member performed the landing: 

- CAPT (ARR_LNDG_PILOT = 1) 

- F/O 1 (ARR_LNDG_PILOT = 2) 

- F/O 2 (ARR_LNDG_PILOT = 3) 

- F/O 3 (ARR_LNDG_PILOT = 4) 

Those ESBs are followed by another group of ESBs labeled LANDING CATEGORY to select the landing category: 

- I (ARR_LAND_CAT_CND = 01) 

- II (ARR_LAND_CAT_CND = 02) 

- IIIA (ARR_LAND_CAT_CND = 3A) 

- IIIB (ARR_LAND_CAT_CND = 3B) 

- IIIC (ARR_LAND_CAT_CND = 3C) 

Those ESBs are followed by another group of ESBs labeled AUTOLAND to indicate whether an autoland was performed: 

- YES 

- NO (ARR_AUTOLAND = NO) 

If the “YES” ESB is selected, then another group of ESBs is displayed: 

- SATISFACTORY (ARR_AUTOLND_QUAL = YS) 

- UNSATISFACTORY (ARR_AUTOLND_QUAL = YU) 

Page 2 of the ARRIVAL REPORT display contains a group of three text entry boxes labeled SUPPLEMENTAL TEXT, each of which allows up to 24 characters of supplemental text entry. 

146 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **Command Buttons** 

Table 8-2 describes the Arrival Report display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 8-2  Arrival Report Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|SEND|Send<br>downlink|When all mandatory data is<br>entered or selected|When all mandatory data is entered<br>or selected but the downlink queue<br>is full or datalink is NO COMM|
|2|-|-|-|-|
|3|-|-|-|-|
|4|RESET|Reset|Always|-|
|5|RETURN|Return|Always|-|
|6|EXIT|Exit|Always|-|



## **Review Log** 

When SEND is selected from this display, it becomes available for review in the COMPANY DOWNLINKS category on the REVIEW menu. 

## **8.1.2 Downlink Encoding Definition** 

When SEND is selected from this display, the following downlink encoding is used: 

- ACARS SMI: M28 

- ACARS Label: 28  Allowable Subnetworks: All  Downlink Priority: Flight Regularity  Downlink Buffer: REPORT_CREW  Delete at System Reset: Yes  Delete on Buffer Full: Yes 

Table 8-3 describes the Arrival Report downlink encoding definition. 

**Table 8-3  Arrival Report Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|LND|"Message Identifier"|
|3|2|Always|02|"Message Version"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|



D613Z019-06 147 of 378 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Always|<CR><LF>|"Delimiter"|
|12|4|Always|ARR_ON_TIME|"On Time (HHMM)"|
|13|4|Always|ARR_IN_TIME|"In Time (HHMM)"|
|14|4|Always|ARR_FOB|"Fuel On Board / 100 (NNNN)”|
|15|2|Conditionally|01|"Landing Category"|
|16|2|Conditionally|02|"Landing Category"|
|17|2|Conditionally|3A|"Landing Category"|
|18|2|Conditionally|3B|"Landing Category"|
|19|2|Conditionally|3C|"Landing Category"|
|20|1|Always|ARR_LNDG_PILOT|"Landing Pilot (N)"|
|21|0|Conditionally|BEGIN_GROUP||
|22|2|Conditionally|YS|"Autoland Satisfactory"|
|23|2|Conditionally|YU|"Autoland Unsatisfactory"|
|24|0|<n/a>|END_GROUP||
|25|2|Conditionally|NO|"No Autoland"|
|26|2|Conditionally|<CR><LF>|"Delimiter"|
|27|1-24|Conditionally|ARR_SUPLMT_TXT_1|"Text line 1 (1-24 characters)"|
|28|2|Conditionally|<CR><LF>|"Delimiter"|
|29|1-24|Conditionally|ARR_SUPLMT_TXT_2|"Text line 2 (1-24 characters)"|
|30|2|Conditionally|<CR><LF>|"Delimiter"|
|31|1-24|Conditionally|ARR_SUPLMT_TXT_3|"Text line 3 (1-24 characters)"|



Note: The presence of each text line and its preceding <CR><LF> delimiter in a downlink message is conditional on the validity of that text line.  In other words, if text is not entered on a particular text line then that line and the preceding <CR><LF> delimiter are not present in the downlink message. 

## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 222016
M28
FI BO24/AN N7873BO
DT DDL BFI 222016 M74A
-  LND02     BOE24/22222016KBFIKLGB
1425143604583B4YU
TEXT LINE 1
```

148 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

Note: In this sample message, the fuel on board is “0458” (45,800), the landing category is “3B”, the landing pilot is “4” (F/O 3), and the autoland indication is “YU” (yes, unsatisfactory). 

## **8.2 ATC Datalink Problem Report** 

The ATC Datalink Problem Report function enables the flight crew to send a problem report in a format suitable for submission to the appropriate reporting agency that monitors ATC datalink operations in the airspace in question. 

## **8.2.1 Display Definition** 

Figure 8-3 shows the ATC Datalink Problem Report page 1 of 2 display definition. 

**==> picture [245 x 361] intentionally omitted <==**

**Figure 8-3  ATC Datalink Problem Report Page 1 of 2 Display Definition** 

Figure 8-4 shows the ATC Datalink Problem Report page 2 of 2 display definition. 

149 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [243 x 360] intentionally omitted <==**

**Figure 8-4  ATC Datalink Problem Report Page 2 of 2 Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “ATC DATALINK PROBLEM REPORT” 

## **Main Area** 

Table 8-4 describes the ATC Datalink Problem Report display parameters. 

**Table 8-4  ATC Datalink Problem Report Display Parameters** 

|**Name**|**Length**|**Format**|**Range**|**Parameter**|
|---|---|---|---|---|
|FLIGHT NUMBER|1-10|XXXXXXXX||ENTERED_FLTNO|
|AIRCRAFT<br>REGISTRATION|1-7|XXXXXXX||REGISTRATION_NO|



150 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

|**Name**|**Length**|**Format**|**Range**|**Parameter**|
|---|---|---|---|---|
|AIRCRAFT TYPE|4|XXXX||AIRCRAFT_TYPE|



CMF determines the aircraft type (ICAO aircraft type designator) as follows: 

- The first character is the airplane manufacturer, namely “B” (Boeing). 

- The second and third characters are the major model, namely “78” (787). 

- The fourth character is the minor model, “8” (787-8), “9” (787-9), or “X” (787-10). 

- Any undefined characters are shown as “*” (asterisk). 

Table 8-5 describes the ATC Datalink Problem Report display entry boxes. 

**Table 8-5  ATC Datalink Problem Report Display Entry Boxes** 

|**Name**|**Mand**<br>**atory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|---|
|DATE UTC|Yes|2|DD|1-31||PR_UTC_DATE|
|TIME UTC|Yes|4|HHMM|||PR_UTC_TIME|
|ACTIVE<br>CENTER|No|1-8|XXX…|||PR_ACT_CTR|
|NEXT CENTER|No|1-8|XXX…|||PR_NEXT_CTR|
|POSITION|No|1-15|XXX...|||PR_POSITION|
|ORIGINATOR|No|1-24|XXX...|||PR_ORIGINATOR|
|DESCRIPTION|Yes|1-24|XXX…|||PR_TEXT_1|
||No|1-24|XXX…|||PR_TEXT_2|
||No|1-24|XXX…|||PR_TEXT_3|
||No|1-24|XXX…|||PR_TEXT_4|
|ADDITIONAL<br>DESCRIPTION|No|1-24|XXX…|||PR_TEXT_5|
||No|1-24|XXX…|||PR_TEXT_6|
||No|1-24|XXX…|||PR_TEXT_7|
||No|1-24|XXX…|||PR_TEXT_8|
||No|1-24|XXX…|||PR_TEXT_9|
||No|1-24|XXX…|||PR_TEXT_10|
||No|1-24|XXX…|||PR_TEXT_11|
||No|1-24|XXX…|||PR_TEXT_12|
||No|1-24|XXX…|||PR_TEXT_13|
||No|1-24|XXX…|||PR_TEXT_14|
||No|1-24|XXX…|||PR_TEXT_15|
||No|1-24|XXX…|||PR_TEXT_16|
||No|1-24|XXX…|||PR_TEXT_17|
||No|1-24|XXX…|||PR_TEXT_18|



151 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **Command Buttons** 

Table 8-6 describes the ATC Datalink Problem Report display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 8-6  ATC Datalink Problem Report Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|SEND|Send<br>downlink|When all mandatory data is<br>entered or selected|When all mandatory data is entered<br>or selected but the downlink queue<br>is full or datalink is NO COMM|
|2|-|-|-|-|
|3|PRINT|Print|Always|-|
|4|RESET|Reset|Always|-|
|5|RETURN|Return|Always|-|
|6|EXIT|Exit|Always|-|



## **Review Log** 

When SEND is selected from this display, it becomes available for review in the COMPANY DOWNLINKS category on the REVIEW menu. 

## **8.2.2 Downlink Encoding Definition** 

When SEND is selected from this display, the following downlink encoding is used: 

- ACARS SMI: A82 

- ACARS Label: 82  Allowable Subnetworks: All  Downlink Priority: Flight Regularity  Downlink Buffer: REPORT_CREW  Delete at System Reset: Yes  Delete on Buffer Full: Yes 

Table 8-7 describes the ATC Datalink Problem Report downlink encoding definition. 

**Table 8-7  ATC Datalink Problem Report Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|CRA|"Message Identifier"|
|3|2|Always|02|"Message Version"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|



D613Z019-06 152 of 378 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Always|<CR><LF>|"Delimiter"|
|12|1-7|Always|REGISTRATION_NO|"Aircraft Registration (1-7 characters)"|
|13|1|Always|,|"Delimiter"|
|14|4|Always|AIRCRAFT_TYPE|"Aircraft Type (XXXX)"|
|15|1|Always|,|"Delimiter"|
|16|2|Always|PR_UTC_DATE|"PR Date (DD)"|
|17|1|Always|,|"Delimiter"|
|18|4|Always|PR_UTC_TIME|"PR Time (HHMM)"|
|19|1|Always|,|"Delimiter"|
|20|1-8|Always|PR_ACT_CTR|"Active Center (1-8 characters)"|
|21|1|Always|,|"Delimiter"|
|22|1-8|Always|PR_NEXT_CTR|"Next Center (1-8 characters)"|
|23|1|Always|,|"Delimiter"|
|24|1-13|Always|PR_POSITION|"PR Position (1-13 characters)"|
|25|1|Always|,|"Delimiter"|
|26|1-24|Always|PR_ORIGINATOR|"PR Originator (1-24 characters)"|
|27|2|Always|<CR><LF>|"Delimiter"|
|28|1-24|Always|PR_TEXT_1|"Text line 1 (1-24 characters)"|
|29|2|Conditionally|<CR><LF>|"Delimiter"|
|30|1-24|Conditionally|PR_TEXT_2|"Text line 2 (1-24 characters)"|
|31|2|Conditionally|<CR><LF>|"Delimiter"|
|32|1-24|Conditionally|PR_TEXT_3|"Text line 3 (1-24 characters)"|
|33|2|Conditionally|<CR><LF>|"Delimiter"|
|34|1-24|Conditionally|PR_TEXT_4|"Text line 4 (1-24 characters)"|
|35|2|Conditionally|<CR><LF>|"Delimiter"|
|36|1-24|Conditionally|PR_TEXT_5|"Text line 5 (1-24 characters)"|
|37|2|Conditionally|<CR><LF>|"Delimiter"|
|38|1-24|Conditionally|PR_TEXT_6|"Text line 6 (1-24 characters)"|
|39|2|Conditionally|<CR><LF>|"Delimiter"|
|40|1-24|Conditionally|PR_TEXT_7|"Text line 7 (1-24 characters)"|
|41|2|Conditionally|<CR><LF>|"Delimiter"|
|42|1-24|Conditionally|PR_TEXT_8|"Text line 8 (1-24 characters)"|
|43|2|Conditionally|<CR><LF>|"Delimiter"|
|44|1-24|Conditionally|PR_TEXT_9|"Text line 9 (1-24 characters)"|
|45|2|Conditionally|<CR><LF>|"Delimiter"|



153 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|46|1-24|Conditionally|PR_TEXT_10|"Text line 10 (1-24 characters)"|
|47|2|Conditionally|<CR><LF>|"Delimiter"|
|48|1-24|Conditionally|PR_TEXT_11|"Text line 11 (1-24 characters)"|
|49|2|Conditionally|<CR><LF>|"Delimiter"|
|50|1-24|Conditionally|PR_TEXT_12|"Text line 12 (1-24 characters)"|
|51|2|Conditionally|<CR><LF>|"Delimiter"|
|52|1-24|Conditionally|PR_TEXT_13|"Text line 13 (1-24 characters)"|
|53|2|Conditionally|<CR><LF>|"Delimiter"|
|54|1-24|Conditionally|PR_TEXT_14|"Text line 14 (1-24 characters)"|
|55|2|Conditionally|<CR><LF>|"Delimiter"|
|56|1-24|Conditionally|PR_TEXT_15|"Text line 15 (1-24 characters)"|
|57|2|Conditionally|<CR><LF>|"Delimiter"|
|58|1-24|Conditionally|PR_TEXT_16|"Text line 16 (1-24 characters)"|
|59|2|Conditionally|<CR><LF>|"Delimiter"|
|60|1-24|Conditionally|PR_TEXT_17|"Text line 17 (1-24 characters)"|
|61|2|Conditionally|<CR><LF>|"Delimiter"|
|62|1-24|Conditionally|PR_TEXT_18|"Text line 18 (1-24 characters)"|



Note: The presence of each text line and its preceding <CR><LF> delimiter in a downlink message is conditional on the validity of that text line.  In other words, if text is not entered on a particular text line then that line and the preceding <CR><LF> delimiter are not present in the downlink message. 

Note: Although the ARINC Specification 620 definition of a label 82 downlink message allows a supplementary address to be included, the baseline AMI does not include one. 

## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 222015
A82
FI BO24/AN N7873BO
DT DDL BFI 222015 M73A
-  CRA02     BOE24/22222015KBFIKLGB
N7873BO,B78X,23,1221,KZSE,KZOA,80NM SOUTH OF SEA,SMITH
TEXT LINE 1
TEXT LINE 2
TEXT LINE 3
```

## **8.2.3 Print Definition** 

Figure 8-5 shows the ATC Datalink Problem Report print definition. 

154 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [323 x 288] intentionally omitted <==**

**Figure 8-5  ATC Datalink Problem Report Print Definition** 

## **8.3 Delay Report** 

The Delay Report function enables the flight crew to inform the aircraft operator of a departure, takeoff, enroute, or arrival delay.  The report includes data pertinent to the type of delay and the reason for the delay. 

## **8.3.1 Display Definition** 

The Delay Report display definition depends on the selected delay type.  AMI logic automatically selects the delay type as follows: 

- The logic selects the departure delay type if: 

   - CMF initializes when the airplane is on the ground, all doors are closed, and the parking brake is set, 

   - CMF initializes when the airplane is on the ground and not all doors are closed, or 

   - the OOOI state changes to In. 

- The logic selects the takeoff delay type if: 

   - CMF initializes when the airplane is on the ground, all doors are closed, and the parking brake is released, or 

155 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

   - the OOOI state changes to Out. 

- The logic selects the enroute delay type if: 

   - CMF initializes when the airplane is in the air, or 

   - the OOOI state changes to Off. 

- The logic selects the arrival delay type if the OOOI state changes to On. 

- If none of these conditions apply, then the logic makes no automatic selection. 

The flight crew may manually select any delay type at any time. 

Figure 8-6 shows the Delay Report page 1 of 2 display definition when the departure delay type is selected, including relevant information and delay reasons. 

**==> picture [216 x 313] intentionally omitted <==**

**Figure 8-6  Delay Report Page 1 of 2 Display Definition – Departure Delay Type** 

Figure 8-7 shows the Delay Report page 1 of 2 display definition when the takeoff delay type is selected, including relevant information and delay reasons. 

156 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [216 x 313] intentionally omitted <==**

**Figure 8-7  Delay Report Page 1 of 2 Display Definition – Takeoff Delay Type** 

Figure 8-8 shows the Delay Report page 1 of 2 display definition when the enroute delay type is selected, including relevant information and delay reasons. 

157 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [216 x 312] intentionally omitted <==**

**Figure 8-8  Delay Report Page 1 of 2 Display Definition – Enroute Delay Type** 

Figure 8-9 shows the Delay Report page 1 of 2 display definition when the arrival delay type is selected, including relevant information and delay reasons. 

158 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [216 x 312] intentionally omitted <==**

**Figure 8-9  Delay Report Page 1 of 2 Display Definition – Arrival Delay Type** 

Figure 8-10 shows the Delay Report page 2 of 2 display definition.  This page includes a group of three text entry boxes labeled SUPPLEMENTAL TEXT, each of which allows up to 24 characters of supplemental text entry. 

159 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [216 x 312] intentionally omitted <==**

**Figure 8-10  Delay Report Page 2 of 2 Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “DELAY REPORT” 

## **Main Area** 

Table 8-8 describes the Delay Report display delay type ESBs. 

**Table 8-8  Delay Report Display Delay Type ESBs** 

|**Button Title**|**Result of Selection**|
|---|---|
|DEPARTURE|Lower section of display contains prompts for relevant information<br>and ESBs defined for departure delay reasons|
|TAKEOFF|Lower section of display contains prompts for relevant information<br>and ESBs defined for takeoff delay reasons|
|ENROUTE|Lower section of display contains prompts for relevant information<br>and ESBs defined for enroute delay reasons|



160 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

|**Button Title**|**Result of Selection**|
|---|---|
|ARRIVAL|Lower section of display contains prompts for relevant information<br>and ESBs defined for arrival delay reasons|



## **Departure Delay Type Selected** 

Table 8-9 describes the Delay Report display estimated out time entry box that the AMI displays when the departure delay type is selected. 

**Table 8-9  Delay Report Display Estimated Out Time Entry Box** 

|**Name**|**Mand**<br>**atory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|---|
|ESTIMATED OUT<br>TIME|Yes|4|HHMM|||EST_OUT_TIME|



When the departure delay type is selected the AMI displays the DEPARTURE DELAY REASON ESB group, which is composed of the following selections: 

- AIRPORT CONGESTION 

- MECHANICAL PROBLEM 

- LATE CREW 

- LATE AIRCRAFT 

- LATE PASSENGER 

- LOADING 

- ATC HOLD 

- WEATHER 

- OTHER (with associated entry box for up to 24 characters) 

## **Takeoff Delay Type Selected** 

Table 8-10 describes the Delay Report display estimated off time entry box that the AMI displays when the takeoff delay type is selected. 

**Table 8-10  Delay Report Display Estimated Off Time Entry Box** 

|**Name**|**Mand**<br>**atory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|---|
|ESTIMATED<br>OFF TIME|Yes|4|HHMM|||EST_OFF_TIME|



When the takeoff delay type is selected the AMI displays the TAKEOFF DELAY REASON ESB group, which is composed of the following selections: 

161 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

- AIRPORT CONGESTION 

- MECHANICAL PROBLEM 

- ATC HOLD 

- WEATHER 

- OTHER (with associated entry box for up to 24 characters) 

## **Enroute Delay Type Selected** 

Table 8-11 describes the Delay Report display estimated on time entry box that the AMI displays when the enroute delay type is selected. 

**Table 8-11  Delay Report Display Estimated On Time Entry Box** 

|**Name**|**Mand**<br>**atory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|---|
|ESTIMATED<br>ON TIME|Yes|4|HHMM||FMF_DEST_ETA|EST_ON_TIME|



When the enroute delay type is selected the AMI displays the ENROUTE DELAY REASON ESB group, which is composed of the following selections: 

- ATC HOLD 

- ATC REROUTE 

- WEATHER/HEADWINDS 

- PERF LIMITS 

- FLIGHT LEVEL 

- OTHER (with associated entry box for up to 24 characters) 

## **Arrival Delay Type Selected** 

Table 8-12 describes the Delay Report display estimated in time entry box that the AMI displays when the arrival delay type is selected. 

**Table 8-12  Delay Report Display Estimated In Time Entry Box** 

|**Name**|**Mand**<br>**atory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|---|
|ESTIMATED<br>IN TIME|Yes|4|HHMM|||EST_IN_TIME|



When the arrival delay type is selected the AMI displays the ARRIVAL DELAY REASON ESB group, which is composed of the following selections: 

162 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

- AIRPORT CONGESTION 

- MECHANICAL PROBLEM 

- GATE OCCUPIED 

- GROUND CREW 

- ATC HOLD 

- WEATHER 

- GATE BLOCKED 

- OTHER (with associated entry box for up to 24 characters) 

## **Any Delay Type Selected** 

Table 8-13 describes the Delay Report display entry boxes that the AMI displays when any delay type is selected. 

**Table 8-13  Delay Report Display Entry Boxes** 

|**Name**|**Mand**<br>**atory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|---|
|FUEL ON BOARD|No|1-5|NNN.N|0.0-280.0|FUEL_ON_BOARD|DLY_FUEL_ON_BD|
|SUPPLEMENTAL<br>TEXT|No|1-24|XXX…|||DLY_SUPLMT_TXT_1|
||No|1-24|XXX…|||DLY_SUPLMT_TXT_2|
||No|1-24|XXX…|||DLY_SUPLMT_TXT_3|



## **Command Buttons** 

Table 8-14 describes the Delay Report display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 8-14  Delay Report Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|SEND|Send<br>downlink|When all mandatory data is<br>entered or selected|When all mandatory data is entered<br>or selected but the downlink queue<br>is full or datalink is NO COMM|
|2|-|-|-|-|
|3|-|-|-|-|
|4|RESET|Reset|Always|-|
|5|RETURN|Return|Always|-|
|6|EXIT|Exit|Always|-|



163 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **Review Log** 

When SEND is selected from this display, it becomes available for review in the COMPANY DOWNLINKS category on the REVIEW menu. 

## **8.3.2 Downlink Encoding Definition** 

When SEND is selected from this display, the following downlink encoding is used: 

- ACARS SMI: M21 

- ACARS Label: 21  Allowable Subnetworks: All 

- Downlink Priority: Flight Regularity 

- Downlink Buffer: REPORT_CREW 

- Delete at System Reset: Yes 

- Delete on Buffer Full: Yes 

Table 8-15 describes the Delay Report downlink encoding definition. 

**Table 8-15  Delay Report Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Conditionally|DPD|"Message Identifier"|
|3|3|Conditionally|DTO|"Message Identifier"|
|4|3|Conditionally|DNR|"Message Identifier"|
|5|3|Conditionally|DAR|"Message Identifier"|
|6|2|Always|02|"Message Version"|
|7|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|8|1|Always|/|"Delimiter"|
|9|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|10|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|11|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|12|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|13|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|14|2|Always|<CR><LF>|"Delimiter"|
|15|0|Conditionally|BEGIN_GROUP||
|16|4|Always|EST_OUT_TIME|"Estimated Out Time (HHMM)"|
|17|2|Conditionally|AR|"Depart - Airport Congestion"|
|18|2|Conditionally|ME|"Depart - Mechanical Problem"|
|19|2|Conditionally|CR|"Depart - Late Crew"|



164 of 378 

D613Z019-06 

NEW 

ECCN: 7E994 **BOEING PROPRIETARY** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|20|2|Conditionally|AC|"Depart - Late Aircraft"|
|21|2|Conditionally|PL|"Depart - Late Passenger"|
|22|2|Conditionally|LD|"Depart - Loading"|
|23|2|Conditionally|AT|"Depart - ATC Hold"|
|24|2|Conditionally|WX|"Depart - Weather"|
|25|0|Conditionally|BEGIN_SUBGROUP||
|26|2|Always|OC|"Depart - Other"|
|27|1-24|Always|DLY_DEPT_TEXT|"Depart - Text (1-24 characters)"|
|28|0|<n/a>|END_SUBGROUP||
|29|0|<n/a>|END_GROUP||
|30|0|Conditionally|BEGIN_GROUP||
|31|4|Always|EST_OFF_TIME|"Estimated Off Time (HHMM)"|
|32|2|Conditionally|AR|"Takeoff - Airport Congestion"|
|33|2|Conditionally|ME|"Takeoff - Mechanical Problem"|
|34|2|Conditionally|AT|"Takeoff - ATC Hold"|
|35|2|Conditionally|WX|"Takeoff - Weather"|
|36|0|Conditionally|BEGIN_SUBGROUP||
|37|2|Always|OC|"Takeoff - Other"|
|38|1-24|Always|DLY_TAKEOFF_TEXT|"Takeoff - Text (1-24 characters)"|
|39|0|<n/a>|END_SUBGROUP||
|40|0|<n/a>|END_GROUP||
|41|0|Conditionally|BEGIN_GROUP||
|42|4|Always|EST_ON_TIME|"Estimated On Time (HHMM)"|
|43|2|Conditionally|AT|"Enroute - ATC Hold"|
|44|2|Conditionally|TR|"Enroute - ATC Reroute"|
|45|2|Conditionally|WW|"Enroute - Weather/Headwinds"|
|46|2|Conditionally|PF|"Enroute - Performance"|
|47|2|Conditionally|FL|"Enroute - Flight Level"|
|48|0|Conditionally|BEGIN_SUBGROUP||
|49|2|Always|OC|"Enroute - Other"|
|50|1-24|Always|DLY_ENROUTE_TEXT|"Enroute - Text (1-24 characters)"|
|51|0|<n/a>|END_SUBGROUP||
|52|0|<n/a>|END_GROUP||
|53|0|Conditionally|BEGIN_GROUP||
|54|4|Always|EST_IN_TIME|"Estimated In Time (HHMM)"|
|55|2|Conditionally|AR|"Arrival - Airport Congestion"|
|56|2|Conditionally|AT|"Arrival - ATC Hold"|
|57|2|Conditionally|ME|"Arrival - Mechanical Problem"|
|58|2|Conditionally|WX|"Arrival - Weather"|
|59|2|Conditionally|GO|"Arrival - Gate Occupied"|
|60|2|Conditionally|GB|"Arrival - Gate Blocked"|



165 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|61|2|Conditionally|CR|"Arrival - Ground Crew"|
|62|0|Conditionally|BEGIN_SUBGROUP||
|63|2|Always|OC|"Arrival - Other"|
|64|1-24|Always|DLY_ARRIVAL_TEXT|"Arrival - Text (1-24 characters)"|
|65|0|<n/a>|END_SUBGROUP||
|66|0|<n/a>|END_GROUP||
|67|2|Always|<CR><LF>|"Delimiter"|
|68|4|Always|DLY_FUEL_ON_BD|"Fuel On Board / 100 (NNNN)"|
|69|2|Conditionally|<CR><LF>|"Delimiter"|
|70|1-24|Conditionally|DLY_SUPLMT_TXT_1|"Text line 1 (1-24 characters)"|
|71|2|Conditionally|<CR><LF>|"Delimiter"|
|72|1-24|Conditionally|DLY_SUPLMT_TXT_2|"Text line 2 (1-24 characters)"|
|73|2|Conditionally|<CR><LF>|"Delimiter"|
|74|1-24|Conditionally|DLY_SUPLMT_TXT_3|"Text line 3 (1-24 characters)"|



Note: The presence of each text line and its preceding <CR><LF> delimiter in a downlink message is conditional on the validity of that text line.  In other words, if text is not entered on a particular text line then that line and the preceding <CR><LF> delimiter are not present in the downlink message. 

Table 8-16 describes the Delay Report downlink encoding message identifiers. 

**Table 8-16  Delay Report Downlink Encoding Message Identifiers** 

|**Delay Type**|**Message Identifier**|
|---|---|
|Departure|DPD|
|Takeoff|DTO|
|Enroute|DNR|
|Arrival|DAR|



Table 8-17 describes the Delay Report downlink encoding departure delay reasons. 

**Table 8-17  Delay Report Downlink Encoding Departure Delay Reasons** 

|**Delay Reason**|**Code**|
|---|---|
|AIRPORT CONGESTION|AR|
|MECHANICAL PROBLEM|ME|
|LATE CREW|CR|
|LATE AIRCRAFT|AC|
|LATE PASSENGER|PL|
|LOADING|LD|
|ATC HOLD|AT|
|WEATHER|WX|
|OTHER|OC|



166 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

Table 8-18 describes the Delay Report downlink encoding takeoff delay reasons. 

**Table 8-18  Delay Report Downlink Encoding Takeoff Delay Reasons** 

|**Delay Reason Selected**|**Code in Field 13**|
|---|---|
|AIRPORT CONGESTION|AR|
|MECHANICAL PROBLEM|ME|
|ATC HOLD|AT|
|WEATHER|WX|
|OTHER|OC|



Table 8-19 describes the Delay Report downlink encoding enroute delay reasons. 

**Table 8-19  Delay Report Downlink Encoding Enroute Delay Reasons** 

|**Delay Reason Selected**|**Code in Field 13**|
|---|---|
|ATC HOLD|AT|
|ATC REROUTE|TR|
|WEATHER/HEADWINDS|WW|
|PERF LIMITS|PF|
|FLIGHT LEVEL|FL|
|OTHER|OC|



Table 8-20 describes the Delay Report downlink encoding arrival delay reasons. 

**Table 8-20  Delay Report Downlink Encoding Arrival Delay Reasons** 

|**Delay Reason Selected**|**Code in Field 13**|
|---|---|
|AIRPORT CONGESTION|AR|
|MECHANICAL PROBLEM|ME|
|GATE OCCUPIED|GO|
|GROUND CREW|CR|
|ATC HOLD|AT|
|WEATHER|WX|
|GATE BLOCKED|GB|
|OTHER|OC|



If the flight crew selected the “OTHER” delay reason, then the text that they entered in the associated entry box (up to 24 characters) follows the “OC” reason code. 

## **Sample Messages** 

```
QU RTNBOCR
.DDLXCXA 221440
M21
```

167 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

```
FI BO428/AN N7873BO
DT DDL BFI 221440 M00A
-  DPD02    BOE428/22221440KBFIKBFI
1450AT
0450
```

Note: In sample message above, the message identifier is “DPD” (departure delay), the estimated Off time is “1450” (14:50), the delay reason is “AT” (ATC hold blocked), the fuel on board is “0450” (45,000), and no supplemental text is present. 

```
QU RTNBOCR
.DDLXCXA 221956
M21
FI BO24/AN N7873BO
DT DDL BFI 221956 M70A
-  DAR02     BOE24/22221956KBFIKLGB
1258GB
0321
TEXT LINE 1
TEXT LINE 2
TEXT LINE 3
```

Note: In sample message above, the message identifier is “DAR” (arrival delay), the estimated In time is “1258” (12:58), the delay reason is “GB” (gate blocked), and the fuel on board is “0321” (32,100). 

## **8.4 Departure Report** 

The Departure Report function enables the flight crew to send additional information that is not included in the automatic Out and Off reports, such as the pilot who performed the takeoff, and also thrust and flap settings. 

## **8.4.1 Display Definition** 

Figure 8-11 shows the Departure Report display definition. 

168 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [243 x 360] intentionally omitted <==**

**Figure 8-11  Departure Report Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “DEPARTURE REPORT” 

## **Main Area** 

Table 8-21 describes the Departure Report display entry boxes. 

**Table 8-21  Departure Report Display Entry Boxes** 

|**Name**|**Mand**<br>**atory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|---|
|OUT TIME|Yes|4|HHMM||OUT_TIME|DEPT_TIME|
|OFF TIME|Yes|4|HHMM||OFF_TIME|TKO_TIME|



169 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**Name**|**Mand**<br>**atory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|---|
|FUEL ON BOARD|No|1-5|NNN.N|0.0-280.0|OFF_FOB|TKO_FUEL|
|TAKEOFF FLAPS|No|1-2|NN|0-30||TKO_FLAP|
|TAKEOFF N1|No|2-5|NNN.N|80.0-150.0||TKO_N1|
|TAKEOFF TPR|No|2-3|NNN|50-150||TKO_TPR|
|SUPPLEMENTAL<br>TEXT|No|1-24|XXX…|||TKO_SUPLMT_TXT_1|
||No|1-24|XXX…|||TKO_SUPLMT_TXT_2|
||No|1-24|XXX…|||TOK_SUPLMT_TXT_3|



The “TAKEOFF TPR” label and entry box are only displayed on airplanes with Rolls Royce engines.  On airplanes with General Electric (GE) engines, the label and entry box are invisible and the associated field in the downlink encoding contains “*”. 

The first five or six entry boxes are followed by a group of ESBs labeled TAKEOFF PILOT to select which flight crew member performed the takeoff: 

- CAPT (TKO_PILOT = 1) 

- F/O 1 (TKO_PILOT = 2) 

- F/O 2 (TKO_PILOT = 3) 

- F/O 3 (TKO_PILOT = 4) 

Those ESBs are followed by a group of three text entry boxes labeled SUPPLEMENTAL TEXT, each of which allows up to 24 characters of supplemental text entry. 

## **Command Buttons** 

Table 8-22 describes the Departure Report display command buttons.  If neither condition is satisfied, then the button is not displayed. 

**Table 8-22  Departure Report Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|SEND|Send<br>downlink|When all mandatory data is<br>entered or selected|When all mandatory data is entered<br>or selected but the downlink queue<br>is full or datalink is NO COMM|
|2|-|-|-|-|
|3|-|-|-|-|
|4|RESET|Reset|Always|-|
|5|RETURN|Return|Always|-|
|6|EXIT|Exit|Always|-|



170 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **Review Log** 

When SEND is selected from this display, it becomes available for review in the COMPANY DOWNLINKS category on the REVIEW menu. 

## **8.4.2 Downlink Encoding Definition** 

When SEND is selected from this display, the following downlink encoding is used: 

- ACARS SMI: M24 

- ACARS Label: 24 

- Allowable Subnetworks: All 

- Downlink Priority: Flight Regularity 

- Downlink Buffer: REPORT_CREW 

- Delete at System Reset: Yes 

- Delete on Buffer Full: Yes 

Table 8-23 describes the Departure Report downlink encoding definition. 

**Table 8-23  Departure Report Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|TKO|"Message Identifier"|
|3|2|Always|01|"Message Version"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Always|<CR><LF>|"Delimiter"|
|12|4|Always|DEPT_TIME|"Out Time (HHMM)"|
|13|4|Always|TKO_TIME|"Off Time (HHMM)"|
|14|4|Always|TKO_FUEL|"Off Fuel On Board / 100 (NNNN)"|
|15|1|Always|TKO_PILOT|"Takeoff Pilot (N)"|
|16|2|Always|TKO_FLAP|"Takeoff Flaps (NN)"|
|17|3|Always|TKO_TPR|"Takeoff TPR (NNN)"|
|18|4|Always|TKO_N1|"Takeoff N1 x 10 (NNNN)"|
|19|2|Conditionally|<CR><LF>|"Delimiter"|



171 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|20|1-24|Conditionally|TKO_SUPLMT_TXT_1|"Text line 1 (1-24 characters)"|
|21|2|Conditionally|<CR><LF>|"Delimiter"|
|22|1-24|Conditionally|TKO_SUPLMT_TXT_2|"Text line 2 (1-24 characters)"|
|23|2|Conditionally|<CR><LF>|"Delimiter"|
|24|1-24|Conditionally|TKO_SUPLMT_TXT_3|"Text line 3 (1-24 characters)"|



Note: The presence of each text line and its preceding <CR><LF> delimiter in a downlink message is conditional on the validity of that text line.  In other words, if text is not entered on a particular text line then that line and the preceding <CR><LF> delimiter are not present in the downlink message. 

## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221955
M24
FI BO24/AN N7873BO
DT DDL BFI 221955 M69A
-  TKO01     BOE24/22221955KBFIKLGB
1456150606983200990999
TEXT LINE 1
```

Note: In this sample message, the fuel on board is “0698” (69,800), the takeoff pilot is “3” (F/O 2), the takeoff flap setting is “20”, the takeoff TPR is “099” (99), and the takeoff N1 is “0999” (99.9%). 

## **8.5 Manual Diversion Report** 

The Manual Diversion Report function enables the flight crew to notify the aircraft operator of a diversion.  The report includes the diversion station (in either three-character IATA format or four-character ICAO format), estimated time of arrival (ETA) at the diversion station, estimated fuel at the diversion station, fuel on board, reason for diverting, and optional supplemental text. 

## **8.5.1 Display Definition** 

Figure 8-12 shows the Manual Diversion Report display definition. 

172 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [245 x 360] intentionally omitted <==**

**Figure 8-12  Manual Diversion Report Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “DIVERSION REPORT” 

## **Main Area** 

Table 8-24 describes the Manual Diversion Report display entry boxes. 

**Table 8-24  Manual Diversion Report Display Entry Boxes** 

|**Name**|**Mand**<br>**atory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|---|
|DIVERSION<br>STATION|Yes|3-4|XXXX||FMF_ACTRTEDEST|DIV_DEST|



173 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**Name**|**Mand**<br>**atory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|---|
|ETA AT<br>DIVERSION<br>STATION|No|4|HHMM||FMF_DEST_ETA|DIV_DEST_ETA|
|FUEL AT<br>DIVERSION<br>STATION|No|1-5|NNN.N|0.0-280.0|FMF_FUEL_AT_DEST|DIV_DEST_FUEL|
|FUEL ON BOARD|No|1-5|NNN.N|0.0-280.0|FUEL_ON_BOARD|DIV_FUEL_ON_BOARD|
|SUPPLEMENTAL<br>TEXT|No|1-24|XXX…|||DIV_TXT_1|
||No|1-24|XXX…|||DIV_TXT_2|
||No|1-24|XXX…|||DIV_TXT_3|



The first four entry boxes are followed by a group of ESBs labeled SELECT DIVERSION REASON: 

- FUEL (DIV_CODE = 1) 

- MEDICAL (DIV_CODE = 3) 

- TECHNICAL (DIV_CODE = 2) 

- SECURITY (DIV_CODE = 8) 

- ENROUTE WEATHER (DIV_CODE = 6) 

- DESTINATION WEATHER (DIV_CODE = 7) 

- OTHER (DIV_CODE = 5) (with associated entry box for up to 24 characters) 

The ESBs are followed by a group of three text entry boxes labeled SUPPLEMENTAL TEXT, each of which allows up to 24 characters of supplemental text entry. 

## **Command Buttons** 

Table 8-25 describes the Manual Diversion Report display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 8-25  Manual Diversion Report Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|SEND|Send<br>downlink|When all mandatory data is<br>entered or selected|When all mandatory data is entered<br>or selected but the downlink queue<br>is full or datalink is NO COMM|
|2|-|-|-|-|
|3|-|-|-|-|
|4|RESET|Reset|Always|-|
|5|RETURN|Return|Always|-|
|6|EXIT|Exit|Always|-|



174 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

## **Review Log** 

When SEND is selected from this display, it becomes available for review in the COMPANY DOWNLINKS category on the REVIEW menu. 

## **8.5.2 Downlink Encoding Definition** 

When SEND is selected from this display, the following downlink encoding is used: 

- ACARS SMI: M25 

- ACARS Label: 25 

- Allowable Subnetworks: All 

- Downlink Priority: Flight Regularity 

- Downlink Buffer: REPORT_CREW 

- Delete at System Reset: Yes 

- Delete on Buffer Full: Yes 

Table 8-26 describes the Manual Diversion Report downlink encoding definition. 

**Table 8-26  Manual Diversion Report Downlink Encoding Definition** 

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
|16|1|Always|DIV_REASON|"Divert reason (N)"|
|17|1-24|Conditionally|DIV_REASON_OTHER|"Other reason text (1-24 characters)"|
|18|2|Conditionally|<CR><LF>|"Delimiter"|
|19|1-24|Conditionally|DIV_TXT_1|"Text line 1 (1-24 characters)”|



175 of 378 

D613Z019-06 

NEW 

ECCN: 7E994 **BOEING PROPRIETARY** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|20|2|Conditionally|<CR><LF>|"Delimiter"|
|21|1-24|Conditionally|DIV_TXT_2|"Text line 2 (1-24 characters)"|
|22|2|Conditionally|<CR><LF>|"Delimiter"|
|23|1-24|Conditionally|DIV_TXT_3|"Text line 3 (1-24 characters)"|



Note: The presence of each text line and its preceding <CR><LF> delimiter in a downlink message is conditional on the validity of that text line.  In other words, if text is not entered on a particular text line then that line and the preceding <CR><LF> delimiter are not present in the downlink message. 

Note: The formats of the Manual Diversion Report downlink and the Automatic Diversion Report downlink are identical, although the Automatic Diversion Report downlink never includes other reason text or supplemental text that are optional in the Manual Diversion Report downlink. 

## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221954
M25
FI BO24/AN N7873BO
DT DDL BFI 221954 M68A
-  DIV02     BOE24/22221954KBFIKSFO
KSJC2046032103987
```

Note: In this sample message, the diversion station is “KSJC”, the ETA at the diversion station is “2046” (20:46), the estimated fuel at the diversion station is “0321” (32,100), the fuel on board is “0398” (39,800), the diversion reason is “7” (destination weather), and no supplemental text is present. 

## **8.6 ETA Report** 

The ETA Report function enables the flight crew to inform the aircraft operator of the estimated time of arrival (ETA) at the destination airport. 

## **8.6.1 Display Definition** 

Figure 8-13 shows the ETA Report display definition. 

176 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [244 x 360] intentionally omitted <==**

**Figure 8-13  ETA Report Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “ETA REPORT” 

## **Main Area** 

Table 8-27 describes the ETA Report display entry boxes. 

**Table 8-27  ETA Report Display Entry Boxes** 

|**Name**|**Mand**<br>**atory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|---|
|ESTIMATED TIME<br>OF ARRIVAL|Yes|4|HHMM||FMF_DEST_ETA|ETA_ETA|



177 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**Name**|**Mand**<br>**atory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|---|
|FUEL ON BOARD|No|1-5|NNN.N|0.0-280.0|FUEL_ON_BOARD|ETA_FUEL_ON_BD|
|SUPPLEMENTAL<br>TEXT|No|1-24|XXX…|||ETA_SUPLMT_TXT_1|
||No|1-24|XXX…|||ETA_SUPLMT_TXT_2|
||No|1-24|XXX…|||ETA_SUPLMT_TXT_3|



The three text entry boxes labeled SUPPLEMENTAL TEXT each allows up to 24 characters of supplemental text entry. 

## **Command Buttons** 

Table 8-28 describes the ETA REPORT display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 8-28  ETA Report Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|SEND|Send<br>downlink|When all mandatory data is<br>entered or selected|When all mandatory data is entered<br>or selected but the downlink queue<br>is full or datalink is NO COMM|
|2|-|-|-|-|
|3|-|-|-|-|
|4|RESET|Reset|Always|-|
|5|RETURN|Return|Always|-|
|6|EXIT|Exit|Always|-|



## **Review Log** 

When SEND is selected from this display, it becomes available for review in the COMPANY DOWNLINKS category on the REVIEW menu. 

## **8.6.2 Downlink Encoding Definition** 

When SEND is selected from this display, the following downlink encoding is used: 

- ACARS SMI: M26 

- ACARS Label: 26 

- Allowable Subnetworks: All 

- Downlink Priority: Flight Regularity 

- Downlink Buffer: REPORT_CREW 

- Delete at System Reset: Yes 

178 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

##  Delete on Buffer Full: Yes 

Table 8-29 describes the ETA Report downlink encoding definition. 

**Table 8-29  ETA Report Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|ETA|"Message Identifier"|
|3|2|Always|01|"Message Version"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Always|<CR><LF>|"Delimiter"|
|12|4|Always|ETA_ETA|"Destination ETA (HHMM)"|
|13|4|Always|ETA_FUEL_ON_BD|"Fuel on Board / 100 (NNNN)"|
|14|2|Conditionally|<CR><LF>|"Delimiter"|
|15|1-24|Conditionally|ETA_SUPLMT_TXT_1|"Text line 1 (1-24 characters)"|
|16|2|Conditionally|<CR><LF>|"Delimiter"|
|17|1-24|Conditionally|ETA_SUPLMT_TXT_2|"Text line 2 (1-24 characters)"|
|18|2|Conditionally|<CR><LF>|"Delimiter"|
|19|1-24|Conditionally|ETA_SUPLMT_TXT_3|"Text line 3 (1-24 characters)"|



Note: The presence of each text line and its preceding <CR><LF> delimiter in a downlink message is conditional on the validity of that text line.  In other words, if text is not entered on a particular text line then that line and the preceding <CR><LF> delimiter are not present in the downlink message. 

## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221950
M26
FI BO24/AN N7873BO
DT DDL BFI 221950 M65A
-  ETA01     BOE24/22221950KBFIKLGB
21480328
TEXT LINE 1
```

Note: In this sample message, the ETA is “2148” (21:48) and the fuel on board is “0328” (32,800). 

179 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **8.7 Maintenance Report** 

The Maintenance Report function enables the flight crew to enter text regarding maintenance problems for transmission to the ground. 

## **8.7.1 Display Definition** 

Figure 8-14 shows the Maintenance Report display definition. 

**==> picture [242 x 361] intentionally omitted <==**

**Figure 8-14  Maintenance Report Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “MAINTENANCE REPORT” 

180 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **Main Area** 

The main area of this display definition consists of a group of six text entry boxes labeled TEXT, each of which allows up to 24 characters of text entry. 

Table 8-30 describes the Maintenance Report display entry boxes. 

**Table 8-30  Maintenance Report Display Entry Boxes** 

|**Name**|**Mand**<br>**atory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|---|
|TEXT|Yes|1-24|XXX…|||MAINT_TEXT_1|
||No|1-24|XXX…|||MAINT_TEXT_2|
||No|1-24|XXX…|||MAINT_TEXT_3|
||No|1-24|XXX…|||MAINT_TEXT_4|
||No|1-24|XXX…|||MAINT_TEXT_5|
||No|1-24|XXX…|||MAINT_TEXT_6|



## **Command Buttons** 

Table 8-31 describes the Maintenance Report display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 8-31  Maintenance Report Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|SEND|Send<br>downlink|When all mandatory data is<br>entered or selected|When all mandatory data is entered<br>or selected but the downlink queue<br>is full or datalink is NO COMM|
|2|-|-|-|-|
|3|-|-|-|-|
|4|RESET|Reset|Always|-|
|5|RETURN|Return|Always|-|
|6|EXIT|Exit|Always|-|



## **Review Log** 

When SEND is selected from this display, it becomes available for review in the COMPANY DOWNLINKS category on the REVIEW menu. 

## **8.7.2 Downlink Encoding Definition** 

When SEND is selected from this display, the following downlink encoding is used: 

 ACARS SMI: M2A 

D613Z019-06 181 of 378 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

- ACARS Label: 2A 

- Allowable Subnetworks: All 

- Downlink Priority: Flight Regularity 

- Downlink Buffer: REPORT_CREW 

- Delete at System Reset: 

- Delete on Buffer Full: 

- Yes 

- Yes 

Table 8-32 describes the Maintenance Report downlink encoding definition. 

**Table 8-32  Maintenance Report Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|MNT|"Message Identifier"|
|3|2|Always|01|"Message Version”|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Always|<CR><LF>|"Delimiter”|
|12|1-24|Always|MAINT_TEXT_1|"Text line 1 (1-24 characters)"|
|13|2|Conditionally|<CR><LF>|"Delimiter”|
|14|1-24|Conditionally|MAINT_TEXT_2|"Text line 2 (1-24 characters)"|
|15|2|Conditionally|<CR><LF>|"Delimiter”|
|16|1-24|Conditionally|MAINT_TEXT_3|"Text line 3 (1-24 characters)"|
|17|2|Conditionally|<CR><LF>|"Delimiter”|
|18|1-24|Conditionally|MAINT_TEXT_4|"Text line 4 (1-24 characters)"|
|19|2|Conditionally|<CR><LF>|"Delimiter”|
|20|1-24|Conditionally|MAINT_TEXT_5|"Text line 5 (1-24 characters)"|
|21|2|Conditionally|<CR><LF>|"Delimiter”|
|22|1-24|Conditionally|MAINT_TEXT_6|"Text line 6 (1-24 characters)"|



Note: The presence of each text line and its preceding <CR><LF> delimiter in a downlink message is conditional on the validity of that text line.  In other words, if text is not entered on a particular text line then that line and the preceding <CR><LF> delimiter are not present in the downlink message. 

## **Sample Message** 

182 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

```
QU RTNBOCR
.DDLXCXA 221947
M2A
FI BO24/AN N7873BO
DT DDL BFI 221947 M63A
-  MNT01     BOE24/22221947KBFIKLGB
TEXT LINE 1
TEXT LINE 2
TEXT LINE 3
```

## **8.8 Miscellaneous Code Report** 

The Miscellaneous Code Report function enables the aircraft operator to support new or otherwise unsupported functions.  When a need arises for a new function, an alphanumeric code is assigned to the function and flight crews are advised of the purpose and data entry requirements for the new application.  To send the message for the function, the flight crew enters the assigned miscellaneous code and the required data in the text fields. 

## **8.8.1 Display Definition** 

Figure 8-15 shows the Miscellaneous Code Report display definition. 

183 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [243 x 360] intentionally omitted <==**

**Figure 8-15  Miscellaneous Code Report Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “MISCELLANEOUS CODE REPORT” 

## **Main Area** 

Table 8-33 describes the Miscellaneous Code Report display entry boxes. 

**Table 8-33  Miscellaneous Code Report Display Entry Boxes** 

|**Name**|**Mandatory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|---|
|MISCELLANEOUS<br>CODE|Yes|1-2|XX|||MISC_CODE|



184 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**Name**|**Mandatory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|---|
|SUPPLEMENTAL<br>TEXT|No|1-24|XXX…|||MISC_TEXT_1|
||No|1-24|XXX…|||MISC_TEXT_2|
||No|1-24|XXX…|||MISC_TEXT_3|
||No|1-24|XXX…|||MISC_TEXT_4|
||No|1-24|XXX…|||MISC_TEXT_5|
||No|1-24|XXX…|||MISC_TEXT_6|



The six text entry boxes labeled SUPPLEMENTAL TEXT each allows up to 24 characters of supplemental text entry. 

## **Command Buttons** 

Table 8-34 describes the Miscellaneous Code Report display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 8-34  Miscellaneous Code Report Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|SEND|Send<br>downlink|When all mandatory data is<br>entered or selected|When all mandatory data is entered<br>or selected but the downlink queue<br>is full or datalink is NO COMM|
|2|-|-|-|-|
|3|-|-|-|-|
|4|RESET|Reset|Always|-|
|5|RETURN|Return|Always|-|
|6|EXIT|Exit|Always|-|



## **Review Log** 

When SEND is selected from this display, it becomes available for review in the COMPANY DOWNLINKS category on the REVIEW menu. 

## **8.8.2 Downlink Encoding Definition** 

When SEND is selected from this display, the following downlink encoding is used: 

- ACARS SMI: M29 

- ACARS Label: 29  Allowable Subnetworks: All  Downlink Priority: Flight Regularity  Downlink Buffer: REPORT_CREW 

D613Z019-06 185 of 378 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

- Delete at System Reset: Yes 

- Delete on Buffer Full: Yes 

Table 8-35 describes the Miscellaneous Code Report downlink encoding definition. 

**Table 8-35  Miscellaneous Code Report Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|MSC|"Message Identifier"|
|3|2|Always|01|"Message Version"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Always|<CR><LF>|"Delimiter"|
|12|2|Always|MISC_CODE|"Miscellaneous Code (XX)"|
|13|2|Conditionally|<CR><LF>|"Delimiter"|
|14|1-24|Conditionally|MISC_TEXT_1|"Text line 1 (1-24 characters)"|
|15|2|Conditionally|<CR><LF>|"Delimiter"|
|16|1-24|Conditionally|MISC_TEXT_2|"Text line 2 (1-24 characters)"|
|17|2|Conditionally|<CR><LF>|"Delimiter"|
|18|1-24|Conditionally|MISC_TEXT_3|"Text line 3 (1-24 characters)"|
|19|2|Conditionally|<CR><LF>|"Delimiter"|
|20|1-24|Conditionally|MISC_TEXT_4|"Text line 4 (1-24 characters)"|
|21|2|Conditionally|<CR><LF>|"Delimiter"|
|22|1-24|Conditionally|MISC_TEXT_5|"Text line 5 (1-24 characters)"|
|23|2|Conditionally|<CR><LF>|"Delimiter"|
|24|1-24|Conditionally|MISC_TEXT_6|"Text line 6 (1-24 characters)"|



Note: The presence of each text line and its preceding <CR><LF> delimiter in a downlink message is conditional on the validity of that text line.  In other words, if text is not entered on a particular text line then that line and the preceding <CR><LF> delimiter are not present in the downlink message. 

## **Sample Message** 

```
QU RTNBOCR
.QXSXMXS 221853
M29
FI BO0024/AN N7873BO
```

186 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

```
DT QXS BFI7 221853 M45A
-  MSC01     BOE24/22221853KBFIKLGB
A1
TEXT LINE 1
TEXT LINE 2
TEXT LINE 3
```

Note: In this sample message, the miscellaneous code is “A1”. 

## **8.9 Situation Report** 

The Situation Report function enables the flight crew to notify the aircraft operator of a hijacking or other emergency situation.  The flight crew enters text into the text fields in a predefined format or in free-text form and then CMF and the DSPs give the message high priority. 

This function also enables the flight crew to manually set the Automatic Emergency Report function to the Armed, On, or Off state.  When the flight crew sets that function to the On state, CMF immediately sends a message containing key airplane information and periodically sends that message thereafter. 

Note: The logic units that Section 9.4.1 and Section 9.4.2 describe have the ability to automatically initiate automatic emergency reports. 

## **8.9.1 Display Definition** 

Figure 8-16 shows the Situation Report display definition. 

187 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [246 x 360] intentionally omitted <==**

**Figure 8-16  Situation Report Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “SITUATION REPORT” 

## **Main Area** 

Table 8-36 describes the Situation Report display entry boxes. 

**Table 8-36  Situation Report Display Entry Boxes** 

|**Name**|**Mandatory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|---|
|TEXT|Yes|1-24|XXX…|||EMER_SITU_TXT_1|
||No|1-24|XXX…|||EMER_SITU_TXT_2|



188 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**Name**|**Mandatory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|---|
||No|1-24|XXX…|||EMER_SITU_TXT_3|



The three text entry boxes labeled TEXT, the first of which is mandatory, each allows up to 24 characters of supplemental text entry. 

Additionally, this display contains a group of ESBs to control the state of the Automatic Emergency Report function: 

- AUTOMATIC EMERGENCY REPORTS ON (EMERGENCY_SELECTION = 1) 

- AUTOMATIC EMERGENCY REPORTS ARMED (EMERGENCY_SELECTION = 2) 

- AUTOMATIC EMERGENCY REPORTS OFF (EMERGENCY_SELECTION = 3) 

Selection of AUTOMATIC EMERGENCY REPORTS ON causes CMF to immediately begin sending automatic emergency reports, while selection of SEND causes CMF to send the situation report.  Section 9.4.3 describes the Automatic Emergency Report downlink encoding definition. 

## **Command Buttons** 

Table 8-37 describes the Situation Report display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 8-37  Situation Report Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|SEND|Send<br>downlink|When all mandatory data is<br>entered or selected|When all mandatory data is entered<br>or selected but the downlink queue<br>is full or datalink is NO COMM|
|2|-|-|-|-|
|3|-|-|-|-|
|4|RESET|Reset|Always|-|
|5|RETURN|Return|Always|-|
|6|EXIT|Exit|Always|-|



## **Review Log** 

When SEND is selected from this display, it becomes available for review in the COMPANY DOWNLINKS category on the REVIEW menu. 

## **8.9.2 Downlink Encoding Definition** 

When SEND is selected from this display, the following downlink encoding is used: 

189 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

- ACARS SMI: HJK 

- ACARS Label: 00 

- Allowable Subnetworks: All 

- Downlink Priority: Emergency 

- Downlink Buffer: REPORT_CREW 

- Delete at System Reset: No 

- Delete on Buffer Full: No 

Table 8-38 describes the Situation Report downlink encoding definition. 

**Table 8-38  Situation Report Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|SIT|"Message Identifier"|
|3|2|Always|02|"Message Version"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Always|<CR><LF>|"Delimiter"|
|12|1-24|Always|EMER_SITU_TXT_1|"Text line 1 (1-24 characters)"|
|13|2|Conditionally|<CR><LF>|"Delimiter"|
|14|1-24|Conditionally|EMER_SITU_TXT_2|"Text line 2 (1-24 characters)"|
|15|2|Conditionally|<CR><LF>|"Delimiter"|
|16|1-24|Conditionally|EMER_SITU_TXT_3|"Text line 3 (1-24 characters)"|



Note: The presence of each text line and its preceding <CR><LF> delimiter in a downlink message is conditional on the validity of that text line.  In other words, if text is not entered on a particular text line then that line and the preceding <CR><LF> delimiter are not present in the downlink message. 

## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221938
HJK
FI BO24/AN N7873BO
DT DDL BFI 221938 M59A
```

190 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

```
-  SIT02     BOE24/22221938KBFIKLGB
TEXT LINE 1
```

191 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW
