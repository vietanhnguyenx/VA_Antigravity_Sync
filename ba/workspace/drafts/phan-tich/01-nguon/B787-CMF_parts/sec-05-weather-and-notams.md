## **5 Weather and NOTAMs** 

This section describes the weather and Notices to Airmen (NOTAMs) functions that the AMI implements. 

## **5.1 Weather** 

The Weather function enables the flight crew to request and receive weather reports and forecasts. 

## **5.1.1 Request** 

This section describes the Weather Request function. 

## **5.1.1.1 Display Definition** 

The Weather Request display enables the flight crew to request weather reports and forecasts from an aircraft operator host system or other service provider.  The flight crew may enter stations (airport identifiers) in either three-character International Air Transport Association (IATA) format or four-character ICAO format.  Figure 5-1 shows the Weather Request display definition. 

44 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [244 x 360] intentionally omitted <==**

**Figure 5-1  Weather Request Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “WEATHER REQUEST” 

## **Main Area** 

The upper portion of the display contains a group of exclusive selector buttons (ESBs) to select the type of weather request: 

- ACTUAL (WXR_RQST_TYPE = SA) 

- FORECAST 1 (WXR_RQST_TYPE = FC) 

- FORECAST 2 (WXR_RQST_TYPE = FT) 

45 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

##  ACTUAL & FORECAST (WXR_RQST_TYPE = FS) 

Table 5-1 describes the Weather Request display entry boxes. 

**Table 5-1  Weather Request Display Entry Boxes** 

|**Name**|**Mandatory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|---|
|STATION 1|Yes|3-4|XXXX|||WXR_STA_1|
|STATION 2|No|3-4|XXXX|||WXR_STA_2|
|STATION 3|No|3-4|XXXX|||WXR_STA_3|
|STATION 4|No|3-4|XXXX|||WXR_STA_4|



## **Command Buttons** 

Table 5-2 describes the Weather Request display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 5-2  Weather Request Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|SEND|Send<br>downlink|When all mandatory data is<br>entered or selected|When all mandatory data is entered<br>or selected but the downlink queue<br>is full or datalink is NO COMM|
|2|-|-|-|-|
|3|-|-|-|-|
|4|RESET|Reset|Always|-|
|5|RETURN|Return|Always|-|
|6|EXIT|Exit|Always|-|



## **Review Log** 

When SEND is selected from this display, it becomes available for review in the WEATHER & NOTAMS category on the REVIEW menu. 

## **5.1.1.2 Downlink Encoding Definition** 

When SEND is selected from this display, the following downlink encoding is used: 

- ACARS SMI: WXR 

- ACARS Label: 5U 

- Allowable Subnetworks: All 

- Downlink Priority: Flight Regularity 

- Downlink Buffer: REQUEST 

46 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

- Delete at System Reset: Yes 

- Delete on Buffer Full: Yes 

Table 5-3 describes the Weather Request downlink encoding definition. 

**Table 5-3  Weather Request Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|2|Conditionally|SA|"Weather Request Type (SA)"|
|3|2|Conditionally|FC|"Weather Request Type (FC)"|
|4|2|Conditionally|FT|"Weather Request Type (FT)"|
|5|2|Conditionally|FS|"Weather Request Type (FS)"|
|6|1|Always|<SP>|"Delimiter"|
|7|4|Always|WXR_STA_1|"Station 1 (XXXX)"|
|8|1|Conditionally|,|"Delimiter"|
|9|4|Conditionally|WXR_STA_2|"Station 2 (XXXX)"|
|10|1|Conditionally|,|"Delimiter"|
|11|4|Conditionally|WXR_STA_3|"Station 3 (XXXX)"|
|12|1|Conditionally|,|"Delimiter"|
|13|4|Conditionally|WXR_STA_4|"Station 4 (XXXX)"|



Note: The weather station parameters and their preceding “,” (comma) delimiters are included only if they have been entered. 

## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 261848
WXR
FI BO1234/AN N7873BO
DT DDL BFI 261848 M02A
-  FS CDG ,EGLL
```

Note: In this sample message, the weather request type is “FS” (actual and forecast) and weather is requested for “CDG” (three-characters left-justified) and “EGLL”. 

## **5.1.2 Uplink** 

This section describes the Weather Uplink function. 

47 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

## **5.1.2.1 Uplink Decoding Definition** 

The decoding for the Weather Uplink is defined as follows: 

- ACARS SMI: CMD 

- ACARS Label: RA 

- Message Identifier: ~1WXR 

- Alert Level: Medium (visual “●COMM” and aural high-low chime) 

- Optional Element Delimiter: “,” (comma) 

Table 5-4 describes the Weather Uplink decoding definition. 

**Table 5-4  Weather Uplink Decoding Definition** 

|**#**|**Length**|**Required**|**Destination Parameter**|**Element Description**|
|---|---|---|---|---|
|1|2|Yes|<none>|"Priority code (XX)"|
|2|7|Yes|<none>|"Ground address (XXXXXXX)"|
|3|5|Yes|<none>|"Message identifier (~1WXR)"|
|4|2|Yes|<none>|"Message version (XX)"|
|5|2|Yes|<none>|"Delimiter (<CR><LF>)"|
|6|1-16|Yes|WX_TITLE|"Message title (1-16 characters)"|
|7|1-3486|Yes|UPLINK_TXT_BLK|"Message text (1-3486 characters)"|



Note:  Element 6 is a variable-length element and accordingly should be terminated with a delimiter character.  Pre-defined element delimiters are <CR>, <CR><LF>, and <ETX> and the optional element delimiter defined for this uplink decoding is “,” (comma). 

## **Sample Message** 

```
QU DDLXCXA
.RTNBOCR 221954
CMD
AN N7873BO/MA 002A
-  QURTNBOCR~1WXR01
WEATHER TITLE
WEATHER TEXT BLOCK...
```

## **5.1.2.2 Display Definition** 

Figure 5-2 shows the Weather Uplink display definition. 

48 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [242 x 360] intentionally omitted <==**

**Figure 5-2  Weather Uplink Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- The title contained in the uplink (WX_TITLE) 

## **Main Area** 

The main area contains the text block from the uplink.  If any lines of the text block contain more than 46 characters, then that line is word-wrapped.  If the entire text block cannot be displayed on a single page, then as many pages as are necessary are created and page arrows are displayed on the right side to access each page. 

49 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **Command Buttons** 

Table 5-5 describes the Weather Uplink display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 5-5  Weather Uplink Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|-|-|-|-|
|2|-|-|-|-|
|3|PRINT|Print|Always|-|
|4|-|-|-|-|
|5|-|-|-|-|
|6|CANCEL|Cancel|Always|-|



## **Review Log** 

When the associated uplink decoding is received, this display becomes available for review in the WEATHER & NOTAMS category on the REVIEW menu. 

## **5.1.2.3 Print Definition** 

Figure 5-3 shows the Weather Uplink print definition. 

50 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [324 x 288] intentionally omitted <==**

**Figure 5-3  Weather Uplink Print Definition** 

## **5.2 NOTAMs** 

The NOTAMs function enables the flight crew to request and receive NOTAMs. 

## **5.2.1 Request** 

This section describes the NOTAMs Request function. 

## **5.2.1.1 Display Definition** 

The NOTAMs Request display enables the flight crew to request station (airport) and/or enroute NOTAMs from the aircraft operator.  The flight crew may enter separate stations for station NOTAMs or route information for enroute NOTAMs and may also enter stations (airport identifiers) in three-character IATA format or four-character ICAO format.  The supplemental text fields are for entering information that may be required by the aircraft operator’s host system to complete the request.  Figure 5-4 shows the NOTAMs Request display definition. 

51 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [242 x 360] intentionally omitted <==**

**Figure 5-4  NOTAMs Request Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “NOTAMS REQUEST” 

## **Main Area** 

Table 5-6 describes the NOTAMs Request display entry boxes. 

**Table 5-6  NOTAMs Request Display Entry Boxes** 

|**Name**|**Mand**<br>**atory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|---|
|STATION 1|No|3-4|XXXX|||NOTAM_STA_1|
|STATION 2|No|3-4|XXXX|||NOTAM_STA_2|



NEW 

52 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

|**Name**|**Mand**<br>**atory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|---|
|ENROUTE<br>STATIONS|No|1-10|XXX…|||NOTAM_ENROUTE|
|SUPPLEMENTAL<br>TEXT|No|1-24|XXX…|||NOTAM_REQST_1|
||No|1-24|XXX…|||NOTAM_REQST_2|
||No|1-24|XXX…|||NOTAM_REQST_3|



The three text entry boxes labeled SUPPLEMENTAL TEXT each allows up to 24 characters of supplemental text entry. 

## **Command Buttons** 

Table 5-7 describes the NOTAMs Request display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 5-7  NOTAMs Request Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|SEND|Send<br>downlink|When all mandatory data is<br>entered or selected|When all mandatory data is entered<br>or selected but the downlink queue<br>is full or datalink is NO COMM|
|2|-|-|-|-|
|3|-|-|-|-|
|4|RESET|Reset|Always|-|
|5|RETURN|Return|Always|-|
|6|EXIT|Exit|Always|-|



## **Review Log** 

When SEND is selected from this display, it becomes available for review in the WEATHER & NOTAMS category on the REVIEW menu. 

## **5.2.1.2 Logic Unit** 

The AMI implements a logic unit to enable and disable the SEND button on the NOTAMs Request display as appropriate. 

```
-- ----------------------------------------------------------------------------
```

```
--
```

- `-- Version C000` 

- `-- Jan 2014  SA Meisch` 

- `--     Logic fix.` 

- `--     Toggle SEND command button based on entry of one of the following:` 

53 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

```
--         Station 1, Station 2, or Enroute.
--
-- Sep 2018  SA Meisch
--     Required for NOTAM display.
--
-- Version F001  M. Matyas  29-SEP-2020
--     Updated reference from NR_SEND_COMMAND to NOTAM_SEND.
--
-- ----------------------------------------------------------------------------
```

```
    if valid (NOTAM_STA_1) or valid (NOTAM_STA_2) or valid (NOTAM_ENROUTE) then
        NOTAM_SEND := TRUE;
    else
        NOTAM_SEND := FALSE;
    end_if;
-- ----------------------------------------------------------------------------
--
-- END
```

## **5.2.1.3 Downlink Encoding Definition** 

When SEND is selected from this display, the following downlink encoding is used: 

||ACARS SMI:|M38|
|---|---|---|
||ACARS Label:|38|
||Allowable Subnetworks:|All|
||Downlink Priority:|Flight Regularity|
||Downlink Buffer:|REQUEST|
||Delete at System Reset:|Yes|
||Delete on Buffer Full:|Yes|



Table 5-8 describes the NOTAMs Request downlink encoding definition. 

**Table 5-8  NOTAMs Request Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|NTM|"Message Identifier"|
|3|2|Always|01|"Message Version"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|



54 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Always|<CR><LF>|"Delimiter"|
|12|4|Always|NOTAM_STA_1|"Station 1 (XXXX)"|
|13|4|Always|NOTAM_STA_2|"Station 2 (XXXX)"|
|14|10|Always|NOTAM_ENROUTE|"Enroute Stations (XXXXXXXXXX)"|
|15|2|Conditionally|<CR><LF>|"Delimiter"|
|16|1-24|Conditionally|NOTAM_REQST_1|"Text line 1 (1-24 characters)"|
|17|2|Conditionally|<CR><LF>|"Delimiter"|
|18|1-24|Conditionally|NOTAM_REQST_2|"Text line 2 (1-24 characters)"|
|19|2|Conditionally|<CR><LF>|"Delimiter"|
|20|1-24|Conditionally|NOTAM_REQST_3|"Text line 3 (1-24 characters)"|



Note: The presence of each text line and its preceding <CR><LF> delimiter in a downlink message is conditional on the validity of that text line.  In other words, if text is not entered on a particular text line then that line and the preceding <CR><LF> delimiter are not present in the downlink message. 

## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221945
M38
FI BO24/AN N7873BO
DT DDL BFI 221945 M61A
-  NTM01     BOE24/22221945KBFIKLGB
KLGB**************
```

Note: In this sample message, NOTAMs are requested only for “KLGB” as Station 1; no NOTAMs are requested for Station 2 or for Enroute Stations and no supplemental text is present. 

```
QU RTNBOCR
.DDLXCXA 221946
M38
FI BO24/AN N7873BO
DT DDL BFI 221946 M62A
-  NTM01     BOE24/22221946KBFIKLGB
LAX ****WCOAST77
TEXT LINE 1
```

55 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

Note: In this sample message, NOTAMs are requested for “LAX” (left-justified) as Station 1 and for “WCOAST77” as Enroute Stations, and one line of supplemental text is also included; no NOTAMs are requested for Station 2. 

## **5.2.2 Uplink** 

This section describes the NOTAMs Uplink function. 

## **5.2.2.1 Uplink Decoding Definition** 

The decoding for the NOTAMs Uplink is defined as follows: 

- ACARS SMI: CMD 

- ACARS Label: RA  Message Identifier: ~1NTM 

- Alert Level: Medium (visual “●COMM” and aural high-low chime) 

- Optional Element Delimiter: “,” (comma) 

Table 5-9 describes the NOTAMs Uplink decoding definition. 

**Table 5-9  NOTAMs Uplink Decoding Definition** 

|**#**|**Length**|**Required**|**Destination Parameter**|**Element Description**|
|---|---|---|---|---|
|1|2|Yes|<none>|"Priority code (XX)"|
|2|7|Yes|<none>|"Ground address (XXXXXXX)"|
|3|5|Yes|<none>|"Message identifier (~1NTM)"|
|4|2|Yes|<none>|"Message version (XX)"|
|5|2|Yes|<none>|"Delimiter (<CR><LF>)"|
|6|1-16|Yes|NOTAM_UL_TITLE|"Message title (1-16 characters)"|
|7|1-3486|Yes|UPLINK_TXT_BLK|"Message text (1-3486 characters)"|



Note:  Element 6 is a variable-length element and accordingly should be terminated with a delimiter character.  Pre-defined element delimiters are <CR>, <CR><LF>, and <ETX> and the optional element delimiter defined for this uplink decoding is “,” (comma). 

## **Sample Message** 

```
QU DDLXCXA
.RTNBOCR 221954
CMD
AN N7873BO/MA 003A
-  QURTNBOCR~1NTM01
NOTAM TITLE
```

56 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

```
NOTAM TEXT BLOCK...
```

## **5.2.2.2 Display Definition** 

Figure 5-5 show the NOTAMs Uplink display definition. 

**==> picture [242 x 361] intentionally omitted <==**

**Figure 5-5  NOTAMs Uplink Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- The title contained in the uplink (NOTAM_UL_TITLE) 

57 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **Main Area** 

The main area contains the text block from the uplink.  If any lines of the text block contain more than 46 characters, then that line is word-wrapped.  If the entire text block cannot be displayed on a single page, then as many pages as are necessary are created and page arrows are displayed on the right side to access each page. 

## **Command Buttons** 

Table 5-10 describes the NOTAMs Uplink display command buttons.  If neither condition is satisfied, then the button is not displayed. 

**Table 5-10  NOTAMs Uplink Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|-|-|-|-|
|2|-|-|-|-|
|3|PRINT|Print|Always|-|
|4|-|-|-|-|
|5|-|-|-|-|
|6|CANCEL|Cancel|Always|-|



## **Review Log** 

When the associated uplink decoding is received, this display becomes available for review in the WEATHER & NOTAMS category on the REVIEW menu. 

## **5.2.2.3 Print Definition** 

Figure 5-6 shows the NOTAMs Uplink print definition. 

58 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [322 x 288] intentionally omitted <==**

**Figure 5-6  NOTAMs Uplink Print Definition** 

59 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW
