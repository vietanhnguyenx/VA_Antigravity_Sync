## **4 Flight Initialization** 

This section describes the flight initialization functions that the AMI implements. 

## **4.1 Manual Flight Initialization** 

The Manual Flight Initialization function enables the flight crew to manually initialize flight information for the Company application. 

## **4.1.1 Display Definition** 

Figure 4-1 shows the Manual Flight Initialization display definition. 

**==> picture [243 x 361] intentionally omitted <==**

**Figure 4-1  Manual Flight Initialization Display Definition** 

34 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “FLIGHT INITIALIZATION” 

## **Main Area** 

Table 4-1 describes the Manual Flight Initialization display entry boxes. 

**Table 4-1  Manual Flight Initialization Display Entry Boxes** 

|**Name**|**Mand**<br>**atory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|---|
|FLIGHT<br>NUMBER|No|1-10|XXX…||FMF_CMF_FLIGHT_<br>NUMBER|ENTERED_FLTNO|
|SCHEDULED<br>DATE|No|1-2|DD|1-31||INIT_SKED_DATE|
|ORIGIN<br>STATION|No|3-4|XXXX|A-Z, 0-9|FMF_ACTRTEORIGIN|INIT_ORIG_STA|
|DESTINATION<br>STATION|No|3-4|XXXX|A-Z, 0-9|FMF_ACTRTEDEST|INIT_DEST_STA|
|ALTERNATE<br>STATION 1|No|3-4|XXXX|A-Z, 0-9||INIT_ALTN_STA_1|
|ALTERNATE<br>STATION 2|No|3-4|XXXX|A-Z, 0-9||INIT_ALTN_STA_2|
|FLIGHT PLAN<br>TIME|No|4|HHMM|||INIT_FLIGHT_PLAN_<br>TIME|
|FUEL ON<br>BOARD|No|1-5|NNN.N|0.0-280.0|FUEL_ON_BOARD|INIT_FOB|
|FUEL<br>BOARDED|No|1-6|NNNNNN|-99999 –<br>280000||INIT_BOARDED_FUEL|
|CAPTAIN|No|1-6|XXXXXX|||INIT_PAY_CAPT|
|F/O 1|No|1-6|XXXXXX|||INIT_PAY_FO_1|
|F/O 2|No|1-6|XXXXXX|||INIT_PAY_FO_2|
|F/O 3|No|1-6|XXXXXX|||INIT_PAY_FO_3|



## **Command Buttons** 

Table 4-2 describes the Manual Flight Initialization display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 4-2  Manual Flight Initialization Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|-|-|-|-|



35 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|2|-|-|-|-|
|3|PRINT|Print|Always|-|
|4|RESET|Reset|Always|-|
|5|RETURN|Return|Always|-|
|6|EXIT|Exit|Always|-|



## **4.1.2 Print Definition** 

Figure 4-2 shows the Manual Flight Initialization print definition. 

**==> picture [322 x 289] intentionally omitted <==**

**Figure 4-2  Manual Flight Initialization Print Definition** 

## **4.2 Automatic Flight Initialization** 

The Automatic Flight Initialization function enables the flight crew to request the aircraft operator to automatically initialize flight information for the Company application via a flight initialization uplink message.  The aircraft operator may also automatically initialize flight information for the Company application via a flight initialization uplink message without a request from the flight crew. 

36 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **4.2.1 Request** 

This section describes the Automatic Flight Initialization downlink request function. 

## **4.2.1.1 Display Definition** 

Figure 4-3 shows the Automatic Flight Initialization request display definition. 

**==> picture [243 x 361] intentionally omitted <==**

**Figure 4-3  Automatic Flight Initialization Request Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “AUTOMATIC FLIGHT INITIALIZATION REQUEST” 

37 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **Main Area** 

Table 4-3 describes the request Automatic Flight Initialization request display entry boxes. 

**Table 4-3  Automatic Flight Initialization Request Display Entry Boxes** 

|**Name**|**Mand**<br>**atory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|---|
|FLIGHT<br>NUMBER|Yes|1-10|XXX…||FMF_CMF_FLIGHT_NUMBER|ENTERED_FLTNO|
|SCHEDULED<br>DATE|Yes|2|DD|1-31||INIT_SKED_DATE|



## **Command Buttons** 

Table 4-4 describes the Automatic Flight Initialization request display command buttons.  If neither condition is satisfied, then the button is not displayed. 

**Table 4-4  Automatic Flight Initialization Request Display Command Buttons** 

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

## **4.2.1.2 Downlink Encoding Definition** 

When SEND is selected from this display, the following downlink encoding is used: 

- ACARS SMI: M20 

- ACARS Label: 20 

- Allowable Subnetworks: All 

- Downlink Priority: Flight Regularity 

- Downlink Buffer: REQUEST 

38 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

- Delete at System Reset: Yes 

- Delete on Buffer Full: Yes 

Table 4-5 describes the Automatic Flight Initialization request downlink encoding definition. 

**Table 4-5  Automatic Flight Initialization Request Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|INI|"Message Identifier"|
|3|2|Always|01|"Message Version"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|



## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221846
M20
FI BO24/AN N7873BO
DT DDL BFI 221846 M43A
-  INI01     BOE24/22221846
```

## **4.2.2 Uplink** 

This section describes the Automatic Flight Initialization uplink function. 

## **4.2.2.1 Uplink Decoding Definition** 

The decoding for the Automatic Flight Initialization uplink is defined as follows: 

- ACARS SMI: CMD 

- ACARS Label: RA  Message Identifier: ~1INI  Alert Level: Medium (visual “●COMM” and aural high-low chime) 

- Optional Element Delimiter: “/” (forward slash) 

Table 4-6 describes the Automatic Flight Initialization uplink decoding definition. 

39 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**Table 4-6  Automatic Flight Initialization Uplink Decoding Definition** 

|**#**|**Length**|**Required**|**Destination Parameter**|**Element Description**|
|---|---|---|---|---|
|1|2|Yes|<none>|"Priority code (XX)"|
|2|7|Yes|<none>|"Ground address (XXXXXXX)"|
|3|5|Yes|<none>|"Message identifier (~1INI)"|
|4|2|Yes|<none>|"Message version (XX)"|
|5|2|Yes|<none>|"Message date (DD)"|
|6|4|Yes|<none>|"Message time (HHMM)"|
|7|2|Yes|<none>|"Delimiter (<CR><LF>)"|
|8|3-4|No|INIT_ORIG_STA|"Origin station (3-4 characters [A-Z, 0-9])"|
|9|3-4|No|INIT_DEST_STA|"Destination station (3-4 characters [A-Z, 0-9])"|
|10|3-4|No|INIT_ALTN_STA_1|"Alternate station 1 (3-4 characters [A-Z, 0-9])"|
|11|3-4|No|INIT_ALTN_STA_2|"Alternate station 2 (3-4 characters [A-Z, 0-9])"|
|12|4|No|INIT_FLIGHT_PLAN_TIME|"Flight plan time (HHMM)"|
|13|1-6|No|INIT_BOARDED_FUEL|"Boarded fuel (-99999 – 280000)"|
|14|1-6|No|INIT_PAY_CAPT|"Captain ID (1-6 characters)"|
|15|1-6|No|INIT_PAY_FO_1|"First officer 1 ID (1-6 characters)"|
|16|1-6|No|INIT_PAY_FO_2|"First officer 2 ID (1-6 characters)"|
|17|1-6|No|INIT_PAY_FO_3|"First officer 3 ID (1-6 characters)"|



Note:  Elements 13 through 17 are variable-length elements and accordingly should be terminated with a delimiter character.  Pre-defined element delimiters are <CR>, <CR><LF>, and <ETX> and the optional element delimiter defined for this uplink decoding is “/” (forward slash). 

## **Sample Message** 

```
QU DDLXCXA
.RTNBOCR 221954
CMD
AN N7873BO/MA 001A
-  QURTNBOCR~1INI01190457
KBFI/PHOG/PHNL//0456/28000/1/22/333//
```

Note: In this sample message, Alternate Station 2 and First Officer 3 ID are omitted. 

## **4.2.2.2 Display Definition** 

Figure 4-4 shows the Automatic Flight Initialization uplink display definition. 

40 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [243 x 360] intentionally omitted <==**

**Figure 4-4  Automatic Flight Initialization Uplink Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “FLIGHT INITIALIZATION” 

## **Main Area** 

Table 4-7 describes the Automatic Flight Initialization uplink display parameters. 

**Table 4-7  Automatic Flight Initialization Uplink Display Parameters** 

|**Name**|**Length**|**Format**|**Range**|**Parameter**|
|---|---|---|---|---|
|FLIGHT NUMBER|3-10|XXXXXXXXXX||ENTERED_FLTNO|
|SCHEDULED DATE|2|DD|1-31|INIT_SKED_DATE|



41 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**Name**|**Length**|**Format**|**Range**|**Parameter**|
|---|---|---|---|---|
|ORIGIN STATION|3-4|XXXX||INIT_ORIG_STA|
|DESTINATION<br>STATION|3-4|XXXX||INIT_DEST_STA|
|ALTERNATE<br>STATION 1|3-4|XXXX||INIT_ALTN_STA_1|
|ALTERNATE<br>STATION 2|3-4|XXXX||INIT_ALTN_STA_2|
|FLIGHT PLAN TIME|5|HH+MM||INIT_FLIGHT_PLAN_TIME|
|FUEL ON BOARD|3-5|NNN.N|0.0-280.0|INIT_FOB|
|FUEL BOARDED|1-6|NNNNNN|-99999 – 280000|INIT_BOARDED_FUEL|
|CAPTAIN|1-6|XXXXXX||INIT_PAY_CAPT|
|F/O 1|1-6|XXXXXX||INIT_PAY_FO_1|
|F/O 2|1-6|XXXXXX||INIT_PAY_FO_2|
|F/O 3|1-6|XXXXXX||INIT_PAY_FO_3|



## **Command Buttons** 

Table 4-8 describes the Automatic Flight Initialization display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 4-8  Automatic Flight Initialization Uplink Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|-|-|-|-|
|2|-|-|-|-|
|3|PRINT|Print|Always|-|
|4|FLIGHT INIT|Show<br>FLIGHT INIT<br>display|-|-|
|5|-|-|-|-|
|6|CANCEL|Cancel|Always|-|



## **Review Log** 

When the associated uplink decoding is received, this display becomes available for review in the COMPANY UPLINKS category on the REVIEW menu. 

## **4.2.2.3 Print Definition** 

Figure 4-5 shows the Automatic Flight Initialization uplink print definition. 

42 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [323 x 288] intentionally omitted <==**

**Figure 4-5  Automatic Flight Initialization Uplink Print Definition** 

43 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW
