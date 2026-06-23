## **7 Request-Response Exchanges** 

This section describes the request-response exchange functions that the AMI implements. These functions enable the aircraft operator to send the flight crew an uplink (which the flight crew may have requested) that requires a downlink response. 

## **7.1 Crew Advisory** 

The Crew Advisory function enables the aircraft operator to send the flight crew an advisory message that requires a response from the flight crew. 

## **7.1.1 Uplink** 

This section describes the Crew Advisory Uplink function. 

## **7.1.1.1 Uplink Decoding Definition** 

The decoding for the Crew Advisory Uplink is defined as follows: 

- ACARS SMI: CMD 

- ACARS Label: RA 

- Message Identifier: ~1CAA 

- Alert Level: Medium (visual “●COMM” and aural high-low chime) 

- Optional Element Delimiter: “,” (comma) 

Table 7-1 describes the Crew Advisory Uplink decoding definition. 

**Table 7-1  Crew Advisory Uplink Decoding Definition** 

|**#**|**Length**|**Required**|**Destination Parameter**|**Element Description**|
|---|---|---|---|---|
|1|2|Yes|<none>|"Priority code (XX)"|
|2|7|Yes|<none>|"Ground address (XXXXXXX)"|
|3|5|Yes|<none>|"Message identifier (~1CAA)"|
|4|2|Yes|<none>|"Message version (XX)"|
|5|2|Yes|<none>|"Message date (DD)"|
|6|4|Yes|<none>|"Message time (HHMM)"|
|7|2|Yes|<none>|"Delimiter (<CR><LF>)"|
|8|1-3496|Yes|UPLINK_TXT_BLK|"Message text (1-3496 characters)"|



## **Sample Message** 

92 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

```
QU DDLXCXA
.RTNBOCR 221954
CMD
AN N7873BO/MA 009A
-  QURTNBOCR~1CAA01190419
CREW ADVISORY TEXT BLOCK...
```

## **7.1.1.2 Display Definition** 

Figure 7-1 shows the Crew Advisory Uplink display definition. 

**==> picture [242 x 361] intentionally omitted <==**

**Figure 7-1  Crew Advisory Uplink Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

93 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

##  “CREW ADVISORY” 

## **Main Area** 

The main area contains the text block from the uplink.  If any lines of the text block contain more than 46 characters, then that line is word-wrapped.  If the entire text block cannot be displayed on a single page, then as many pages as are necessary are created and page arrows are displayed on the right side to access each page. 

## **Command Buttons** 

Table 7-2 describes the Crew Advisory Uplink display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 7-2  Crew Advisory Uplink Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|ACCEPT|Send<br>ACCEPT<br>response|Always|When the downlink queue is full or<br>datalink is NO COMM|
|2|-|-|-|-|
|3|PRINT|Print|Always|-|
|4|-|-|-|-|
|5|REJECT<br>REASONS|Show<br>RESPONSE<br>REASONS<br>display|Always|When the downlink queue is full or<br>datalink is NO COMM|
|6|REJECT|Send<br>REJECT<br>response|Always|When the downlink queue is full or<br>datalink is NO COMM|



## **Review Log** 

When the associated uplink decoding is received, this display becomes available for review in the COMPANY UPLINKS category on the REVIEW menu. 

## **7.1.1.3 Print Definition** 

Figure 7-2 shows the Crew Advisory Uplink print definition. 

94 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [324 x 288] intentionally omitted <==**

**Figure 7-2  Crew Advisory Uplink Print Definition** 

## **7.1.2 Response** 

This section describes the Crew Advisory Response function. 

## **7.1.2.1 Accept Downlink Encoding Definition** 

When ACCEPT is selected, the following downlink is sent: 

- ACARS SMI: M40 

- ACARS Label: 40  Allowable Subnetworks: All  Downlink Priority: Flight Regularity  Downlink Buffer: RESPONSE_CREW  Delete at System Reset: Yes  Delete on Buffer Full: Yes 

Table 7-3 describes the Crew Advisory Accept downlink encoding definition. 

95 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**Table 7-3  Crew Advisory Accept Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|CAA|"Message Identifier"|
|3|2|Always|01|"Message Version"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Always|<CR><LF>|"Delimiter"|
|12|1|Always|A|"Acceptance Flag"|



## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 222013
M40
FI BO24/AN N7873BO
DT DDL BFI 222013 M72A
-  CAA01     BOE24/22222013KBFIKLGB
A
```

## **7.1.2.2 Reject Downlink Encoding Definition** 

When REJECT is selected, the following downlink is sent: 

- ACARS SMI: M40 

- ACARS Label: 40 

- Allowable Subnetworks: All 

- Downlink Priority: Flight Regularity 

- Downlink Buffer: RESPONSE_CREW 

- Delete at System Reset: Yes 

- Delete on Buffer Full: Yes 

Table 7-4 describes the Crew Advisory Reject downlink encoding definition. 

96 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**Table 7-4  Crew Advisory Reject Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|CAA|"Message Identifier"|
|3|2|Always|01|"Message Version"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Always|<CR><LF>|"Delimiter"|
|12|1|Always|R|"Rejection Flag"|



## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 222013
M40
FI BO24/AN N7873BO
DT DDL BFI 222013 M72A
-  CAA01     BOE24/22222013KBFIKLGB
R
```

## **7.1.2.3 Reject with Reason** 

The Crew Advisory Reject with Reason display is displayed when REJECT REASONS is selected from the Crew Advisory Uplink display, which enables the flight crew to compose a response indicating the reason for the rejection. 

## **7.1.2.3.1 Display Definition** 

Figure 7-3 shows the Crew Advisory Reject with Reason display definition. 

97 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [243 x 360] intentionally omitted <==**

**Figure 7-3  Crew Advisory Reject with Reason Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “CREW ADVISORY RESPONSE REASONS” 

## **Main Area** 

This contains a group of four ESBs: 

- MESSAGE UNCLEAR (CAA_REASON = 1) 

- UNABLE TO COMPLY (CAA_REASON = 2) 

- CHECK ITEM NUMBER (CAA_REASON = 3) 

- CHECK LINE NUMBER (CAA_REASON = 4) 

98 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

##  OTHER (CAA_REASON = 5) 

There are also three entry boxes that become visible only when the associated ESB has been selected.  Table 7-5 describes the Crew Advisory Reject with Reason display entry boxes. 

**Table 7-5  Crew Advisory Reject with Reason Display Entry Boxes** 

|**Name**|**Mand**<br>**atory**|**Length**|**Format**|**Range**|**Display**|**Parameter**|
|---|---|---|---|---|---|---|
|CHECK ITEM<br>NUMBER|Yes|1-2|XX||If CHECK ITEM<br>NUMBER selected|CAA_CHK_ITEM_NO|
|CHECK LINE<br>NUMBER|Yes|1-2|XX||If CHECK LINE<br>NUMBER selected|CAA_CHK_LINE_NO|
|OTHER|Yes|1-24|XXX…||If OTHER selected|CAA_OTHER|



Below this (and extending to multiple pages, as necessary) is displayed the crew advisory uplink that is being rejected. 

## **Command Buttons** 

Table 7-6 describes the Crew Advisory Reject with Reason display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 7-6  Crew Advisory Reject with Reason Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|-|-|-|-|
|2|-|-|-|-|
|3|-|-|-|-|
|4|-|-|-|-|
|5|-|-|-|-|
|6|REJECT|Reject|When all mandatory data is<br>entered or selected|When all mandatory data is entered<br>or selected but the downlink queue<br>is full or datalink is NO COMM|



## **7.1.2.3.2 Downlink Encoding Definition** 

When REJECT is selected from this display, the following downlink encoding is used: 

- ACARS SMI: M40 

- ACARS Label: 40  Allowable Subnetworks: All 

- Downlink Priority: Flight Regularity 

- Downlink Buffer: RESPONSE_CREW 

99 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

- Delete at System Reset: Yes 

- Delete on Buffer Full: Yes 

Table 7-7 describes the Crew Advisory Reject with Reason downlink encoding definition. 

**Table 7-7  Crew Advisory Reject with Reason Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|CAA|"Message Identifier"|
|3|2|Always|01|"Message Version"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Always|<CR><LF>|"Delimiter"|
|12|1|Always|X|"Rejection with Reasons Flag"|
|13|1|Always|CAA_REASON|"Rejection Reason Code (N)"|
|14|2|Conditionally|CAA_CHK_ITEM_NO|"Check Item Number (XX)"|
|15|2|Conditionally|CAA_CHK_LINE_NO|"Check Line Number (XX)"|
|16|1-24|Conditionally|CAA_OTHER|"Other Reason Text (1-24 characters)"|
|17|2|Always|<CR><LF>|"Delimiter"|
|18|1-3250|Always|UPLINK_TXT_BLK|"Uplink Text (1-3250 characters)"|



## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 222013
M40
FI BO24/AN N7873BO
DT DDL BFI 222013 M72A
-  CAA01     BOE24/22222013KBFIKLGB
X2
CREW ADVISORY TEXT BLOCK...
```

Note: In this sample message, the rejection reason code is “2” (unable to comply). 

100 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **7.2 Flight Release** 

The Flight Release function enables the flight crew to request flight release information, the aircraft operator to send that information to the flight crew, and the flight crew to respond accordingly.  The aircraft operator may also send the flight release information without a flight crew request. 

## **7.2.1 Request** 

This section describes the Flight Release Request function. 

## **7.2.1.1 Display Definition** 

Figure 7-4 shows the Flight Release Request display definition. 

**==> picture [242 x 361] intentionally omitted <==**

**Figure 7-4  Flight Release Request Display Definition** 

101 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “FLIGHT RELEASE REQUEST” 

## **Main Area** 

The upper part of this display definition consists of a group of three non-exclusive selector buttons (NESBs) labeled: 

- ROUTE/WIND (FTREL_RTE_WIND = Y if selected, N if not selected) 

- ROUTE (FTREL_ROUTE = Y if selected, N if not selected) 

- WIND (FTREL_WIND = Y if selected, N if not selected) 

Table 7-8 describes the Flight Release Request display entry boxes. 

**Table 7-8  Flight Release Request Display Entry Boxes** 

|**Name**|**Mand**<br>**atory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|---|
|COMPANY<br>ROUTE|No|1-8|XXX…|||FTREL_CO_RTE|
|FLIGHT LEVEL|No|3|NNN|0-490||FTREL_FLT_LVL|
|SUPPLEMENTAL<br>TEXT|No|1-24|XXX…|||FTREL_REQST_1|
||No|1-24|XXX…|||FTREL_REQST_2|
||No|1-24|XXX…|||FTREL_REQST_3|



The three text entry boxes labeled SUPPLEMENTAL TEXT each allows up to 24 characters of supplemental text entry. 

## **Command Buttons** 

Table 7-9 describes the Flight Release Request display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 7-9  Flight Release Request Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|SEND|Send<br>downlink|When all mandatory data is<br>entered or selected|When all mandatory data is entered<br>or selected but the downlink queue<br>is full or datalink is NO COMM|
|2|-|-|-|-|
|3|-|-|-|-|



102 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|4|RESET|Reset|Always|-|
|5|RETURN|Return|Always|-|
|6|EXIT|Exit|Always|-|



## **Review Log** 

When SEND is selected from this display, it becomes available for review in the COMPANY DOWNLINKS category on the REVIEW menu. 

## **7.2.1.2 Downlink Encoding Definition** 

When SEND is selected from this display, the following downlink encoding is used: 

- ACARS SMI: M35 

- ACARS Label: 35 

- Allowable Subnetworks: All 

- Downlink Priority: Flight Regularity 

- Downlink Buffer: REQUEST 

- Delete at System Reset: Yes 

- Delete on Buffer Full: Yes 

Table 7-10 describes the Flight Release Request downlink encoding definition. 

**Table 7-10  Flight Release Request Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|FRL|"Message Identifier"|
|3|2|Always|01|"Message Version"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Always|<CR><LF>|"Delimiter"|
|12|1|Always|FTREL_RTE_WIND|"Route/Wind Selection (X)"|
|13|1|Always|FTREL_ROUTE|"Route Selection (X)"|
|14|1|Always|FTREL_WIND|"Wind Selection (X)"|



103 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|15|8|Always|FTREL_CO_RTE|"Company Route (XXXXXXXX)"|
|16|3|Always|FTREL_FLT_LVL|"Flight Level (NNN)"|
|17|2|Conditionally|<CR><LF>|"Delimiter"|
|18|1-24|Conditionally|FTREL_REQST_1|"Text line 1 (1-24 characters)"|
|19|2|Conditionally|<CR><LF>|"Delimiter"|
|20|1-24|Conditionally|FTREL_REQST_2|"Text line 2 (1-24 characters)"|
|21|2|Conditionally|<CR><LF>|"Delimiter"|
|22|1-24|Conditionally|FTREL_REQST_3|"Text line 3 (1-24 characters)"|



Note: The presence of each text line and its preceding <CR><LF> delimiter in a downlink message is conditional on the validity of that text line.  In other words, if text is not entered on a particular text line then that line and the preceding <CR><LF> delimiter are not present in the downlink message. 

## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221954
M35
FI BO24/AN N7873BO
DT DDL BFI 221954 M68A
-  FRL01     BOE24/19190549KBFIPHOG
Y**ALOHA50 390
```

Note: In this sample message, the flight release request is “Y**” (for combined route and winds), the company route is “ALOHA50” (left-justified), and the flight level is “390” (FL390). 

## **7.2.2 Uplink** 

This section describes the Flight Release Uplink function. 

## **7.2.2.1 Uplink Decoding Definition** 

The decoding for the Flight Release Uplink is defined as follows: 

- ACARS SMI: CMD 

- ACARS Label: RA  Message Identifier: ~1FRL 

- Alert Level: Medium (visual “●COMM” and aural high-low chime) 

- Optional Element Delimiter: “,” (comma) 

Table 7-11 describes the Flight Release Uplink decoding definition. 

104 of 378 

D613Z019-06 

NEW 

ECCN: 7E994 **BOEING PROPRIETARY** 

**Table 7-11  Flight Release Uplink Decoding Definition** 

|**#**|**Length**|**Required**|**Destination Parameter**|**Element Description**|
|---|---|---|---|---|
|1|2|Yes|<none>|"Priority code (XX)"|
|2|7|Yes|<none>|"Ground address (XXXXXXX)"|
|3|5|Yes|<none>|"Message identifier (~1FRL)"|
|4|2|Yes|<none>|"Message version (XX)"|
|5|2|Yes|<none>|"Message date (DD)"|
|6|4|Yes|<none>|"Message time (HHMM)"|
|7|2|Yes|<none>|"Delimiter (<CR><LF>)"|
|8|1-3496|Yes|UPLINK_TXT_BLK|"Message text (1-3496 characters)"|



## **Sample Message** 

```
QU DDLXCXA
.RTNBOCR 221954
CMD
AN N7873BO/MA 010A
-  QURTNBOCR~1FRL01190448
FLIGHT RELEASE TEXT BLOCK...
```

## **7.2.2.2 Display Definition** 

Figure 7-5 shows the Flight Release Uplink display definition. 

105 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [244 x 360] intentionally omitted <==**

**Figure 7-5  Flight Release Uplink Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “FLIGHT RELEASE” 

## **Main Area** 

The main area contains the text block from the uplink.  If any lines of the text block contain more than 46 characters, then that line is word-wrapped.  If the entire text block cannot be displayed on a single page, then as many pages as are necessary are created and page arrows are displayed on the right side to access each page. 

106 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **Command Buttons** 

Table 7-12 describes the Flight Release Uplink display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 7-12  Flight Release Uplink Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|ACCEPT|Send<br>ACCEPT<br>downlink|Always|When the downlink queue is full or<br>datalink is NO COMM|
|2|-|-|-|-|
|3|PRINT|Print|Always|-|
|4|-|-|-|-|
|5|REJECT<br>REASONS|Show<br>RESPONSE<br>REASONS<br>display|Always|When the downlink queue is full or<br>datalink is NO COMM|
|6|REJECT|Send<br>REJECT<br>downlink|Always|When the downlink queue is full or<br>datalink is NO COMM|



## **Review Log** 

When the associated uplink decoding is received, this display becomes available for review in the COMPANY UPLINKS category on the REVIEW menu. 

## **7.2.2.3 Print Definition** 

Figure 7-6 shows the Flight Release Uplink print definition. 

107 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [324 x 288] intentionally omitted <==**

**Figure 7-6  Flight Release Uplink Print Definition** 

## **7.2.3 Response** 

This section describes the Flight Release Response function. 

## **7.2.3.1 Accept Downlink Encoding Definition** 

When ACCEPT is selected, the following downlink is sent: 

- ACARS SMI: M45 

- ACARS Label: 45  Allowable Subnetworks: All  Downlink Priority: Flight Regularity  Downlink Buffer: RESPONSE_CREW  Delete at System Reset: Yes  Delete on Buffer Full: Yes 

Table 7-13 describes the Flight Release Accept downlink encoding definition . 

108 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**Table 7-13  Flight Release Accept Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|FRL|"Message Identifier"|
|3|2|Always|01|"Message Version"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Always|<CR><LF>|"Delimiter"|
|12|1|Always|A|"Acceptance Flag"|



## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221916
M45
FI BO24/AN N7873BO
DT DDL BFI 221916 M51A
-  FRL01     BOE24/22221916KBFIKLGB
A
```

## **7.2.3.2 Reject Downlink Encoding Definition** 

When REJECT is selected, the following downlink is sent: 

- ACARS SMI: M45 

- ACARS Label: 45 

- Allowable Subnetworks: All 

- Downlink Priority: Flight Regularity 

- Downlink Buffer: RESPONSE_CREW 

- Delete at System Reset: Yes 

- Delete on Buffer Full: Yes 

Table 7-14 describes the Flight Release Reject downlink encoding definition. 

109 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**Table 7-14  Flight Release Reject Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|FRL|"Message Identifier"|
|3|2|Always|01|"Message Version"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Always|<CR><LF>|"Delimiter"|
|12|1|Always|R|"Rejection Flag”|



## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221916
M45
FI BO24/AN N7873BO
DT DDL BFI 221916 M51A
-  FRL01     BOE24/22221916KBFIKLGB
R
```

## **7.2.3.3 Reject with Reason** 

The Flight Release Reject with Reason display is displayed when REJECT REASONS is selected from the Flight Release Uplink display, which enables the flight crew to compose a response indicating the reason for the rejection. 

## **7.2.3.3.1 Display Definition** 

Figure 7-7 shows the Flight Release Reject with Reason display definition. 

110 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [243 x 360] intentionally omitted <==**

**Figure 7-7  Flight Release Reject with Reason Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “FLIGHT RELEASE RESPONSE REASONS” 

## **Main Area** 

This contains a group of four ESBs: 

- UNABLE TO COMPLY (FRL_REASON = 1) 

- CHECK ITEM NUMBER (FRL_REASON = 2) 

- CHECK LINE NUMBER (FRL_REASON = 3) 

- OTHER (FRL_REASON = 4) 

111 of 378 

D613Z019-06 

NEW 

ECCN: 7E994 **BOEING PROPRIETARY** 

There are also three entry boxes that become visible only when the associated ESB has been selected.  Table 7-15 describes the Flight Release Reject with Reason display entry boxes. 

**Table 7-15  Flight Release Reject with Reason Display Entry Boxes** 

|**Name**|**Mand**<br>**atory**|**Length**|**Format**|**Range**|**Display**|**Parameter**|
|---|---|---|---|---|---|---|
|CHECK ITEM<br>NUMBER|Yes|1-2|XX||If CHECK ITEM<br>NUMBER selected|FRL_CHK_ITEM_NO|
|CHECK LINE<br>NUMBER|Yes|1-2|XX||If CHECK LINE<br>NUMBER selected|FRL_CHK_LINE_NO|
|OTHER|Yes|1-24|XXX…||If OTHER selected|FRL_OTHER|



Below this (and extending to multiple pages, as necessary) is displayed the flight release uplink that is being rejected. 

## **Command Buttons** 

Table 7-16 describes the Flight Release Reject with Reason display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 7-16  Flight Release Reject with Reason Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|-|-|-|-|
|2|-|-|-|-|
|3|-|-|-|-|
|4|-|-|-|-|
|5|-|-|-|-|
|6|REJECT|Reject|When all mandatory data is<br>entered or selected|When all mandatory data is entered<br>or selected but the downlink queue<br>is full or datalink is NO COMM|



## **7.2.3.3.2 Downlink Encoding Definition** 

When REJECT is selected from this display, the following downlink encoding is used: 

- ACARS SMI: M45 

- ACARS Label: 45  Allowable Subnetworks: All  Downlink Priority: Flight Regularity  Downlink Buffer: RESPONSE_CREW  Delete at System Reset: Yes  Delete on Buffer Full: Yes 

112 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

Table 7-17 describes the Flight Release Reject with Reason downlink encoding definition. 

**Table 7-17  Flight Release Reject with Reason Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|FRL|"Message Identifier"|
|3|2|Always|01|"Message Version"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Always|<CR><LF>|"Delimiter"|
|12|1|Always|X|"Rejection with Reasons Flag"|
|13|1|Always|FRL_REASON|"Rejection Reason Code (N)"|
|14|2|Conditionally|FRL_CHK_ITEM_NO|"Check Item Number (XX)"|
|15|2|Conditionally|FRL_CHK_LINE_NO|"Check Line Number (XX)"|
|16|1-24|Conditionally|FRL_OTHER|"Other Reason Text (1-24 characters)"|
|17|2|Always|<CR><LF>|"Delimiter"|
|18|1-3250|Always|UPLINK_TXT_BLK|"Uplink Text (1-3250 characters)"|



## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221916
M45
FI BO24/AN N7873BO
DT DDL BFI 221916 M51A
-  FRL01     BOE24/22221916KBFIKLGB
X311
FLIGHT RELEASE TEXT BLOCK...
```

Note: In this sample message, the rejection reason code is “3” (check line number) and the line number is “11”. 

## **7.3 Gate Assignment** 

The Gate Assignment function enables the flight crew to request gate assignment information, the aircraft operator to send that information to the flight crew, and the flight crew to respond 

113 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

accordingly.  The aircraft operator may also send the gate assignment information without a flight crew request. 

## **7.3.1 Request** 

This section describes the Gate Assignment Request function. 

## **7.3.1.1 Display Definition** 

Figure 7-8 shows the Gate Assignment Request display definition. 

**==> picture [244 x 361] intentionally omitted <==**

**Figure 7-8  Gate Assignment Request Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

114 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

##  “GATE ASSIGNMENT REQUEST” 

## **Main Area** 

Table 7-18 describes the Gate Assignment Request display entry boxes. 

**Table 7-18  Gate Assignment Request Display Entry Boxes** 

|**Name**|**Mand**<br>**atory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|---|
|FLIGHT NUMBER|Yes|1-10|XXX…||ENTERED_FLTNO|GATE_RQST_FLTNO|
|SUPPLEMENTAL<br>TEXT|No|1-24|XXX…|||GATE_REQUEST_1|
||No|1-24|XXX…|||GATE_REQUEST_2|
||No|1-24|XXX…|||GATE_REQUEST_3|



The three text entry boxes labeled SUPPLEMENTAL TEXT each allows up to 24 characters of supplemental text entry. 

## **Command Buttons** 

Table 7-19 describes the Gate Assignment Request display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 7-19  Gate Assignment Request Display Command Buttons** 

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

## **7.3.1.2 Downlink Encoding Definition** 

When SEND is selected from this display, the following downlink encoding is used: 

 ACARS SMI: M36 

D613Z019-06 115 of 378 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

- ACARS Label: 36 

- Allowable Subnetworks: All 

- Downlink Priority: Flight Regularity 

- Downlink Buffer: REQUEST 

- Delete at System Reset: Yes 

- Delete on Buffer Full: Yes 

Table 7-20 describes the Gate Assignment Request downlink encoding definition. 

**Table 7-20  Gate Assignment Request Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|GTA|"Message Identifier"|
|3|2|Always|01|"Message Version"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Always|<CR><LF>|"Delimiter"|
|12|10|Always|GATE_RQST_FLTNO|"Flight Number (XXXXXXXXXX)"|
|13|2|Conditionally|<CR><LF>|"Delimiter"|
|14|1-24|Conditionally|GATE_REQUEST_1|"Text line 1 (1-24 characters)"|
|15|2|Conditionally|<CR><LF>|"Delimiter"|
|16|1-24|Conditionally|GATE_REQUEST_2|"Text line 2 (1-24 characters)"|
|17|2|Conditionally|<CR><LF>|"Delimiter"|
|18|1-24|Conditionally|GATE_REQUEST_3|"Text line 3 (1-24 characters)"|



Note: The presence of each text line and its preceding <CR><LF> delimiter in a downlink message is conditional on the validity of that text line.  In other words, if text is not entered on a particular text line then that line and the preceding <CR><LF> delimiter are not present in the downlink message. 

## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221949
M36
FI BO24/AN N7873BO
DT DDL BFI 221949 M64A
```

116 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

- `GTA01     BOE24/22221949KBFIKLGB BOE24` 

Note: In this sample message, the flight number is “BOE24” (right-justified). 

## **7.3.2 Uplink** 

This section describes the Gate Assignment Uplink function 

## **7.3.2.1 Uplink Decoding Definition** 

The decoding for the Gate Assignment Uplink is defined as follows: 

- ACARS SMI: CMD 

- ACARS Label: RA 

- Message Identifier: ~1GTA 

- Alert Level: Medium (visual “●COMM” and aural high-low chime) 

- Optional Element Delimiter: “,” (comma) 

Table 7-21 describes the Gate Assignment Uplink decoding definition. 

**Table 7-21  Gate Assignment Uplink Decoding Definition** 

|**#**|**Length**|**Required**|**Destination Parameter**|**Element Description**|
|---|---|---|---|---|
|1|2|Yes|<none>|"Priority code (XX)"|
|2|7|Yes|<none>|"Ground address (XXXXXXX)"|
|3|5|Yes|<none>|"Message identifier (~1GTA)"|
|4|2|Yes|<none>|"Message version (XX)"|
|5|2|Yes|<none>|"Message date (DD)"|
|6|4|Yes|<none>|"Message time (HHMM)"|
|7|2|Yes|<none>|"Delimiter (<CR><LF>)"|
|8|1-3496|Yes|UPLINK_TXT_BLK|"Message text (1-3496 characters)"|



## **Sample Message** 

```
QU DDLXCXA
.RTNBOCR 221954
CMD
AN N7873BO/MA 011A
-  QURTNBOCR~1GTA01190453
GATE ASSIGNMENT TEXT BLOCK...
```

117 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **7.3.2.2 Display Definition** 

Figure 7-9 shows the Gate Assignment Uplink display definition. 

**==> picture [244 x 361] intentionally omitted <==**

**Figure 7-9  Gate Assignment Uplink Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “GATE ASSIGNMENT” 

## **Main Area** 

The main area contains the text block from the uplink.  If any lines of the text block contain more than 46 characters, then that line is word-wrapped.  If the entire text block cannot be displayed 

118 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

on a single page, then as many pages as are necessary are created and page arrows are displayed on the right side to access each page. 

## **Command Buttons** 

Table 7-22 describes the Gate Assignment Uplink display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 7-22  Gate Assignment Uplink Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|ACCEPT|Send<br>ACCEPT<br>response|Always|When the downlink queue is full or<br>datalink is NO COMM|
|2|-|-|-|-|
|3|PRINT|Print|Always|-|
|4|-|-|-|-|
|5|REJECT<br>REASONS|Show<br>RESPONSE<br>REASONS<br>display|Always|When the downlink queue is full or<br>datalink is NO COMM|
|6|REJECT|Send<br>REJECT<br>response|Always|When the downlink queue is full or<br>datalink is NO COMM|



## **Review Log** 

When the associated uplink decoding is received, this display becomes available for review in the COMPANY UPLINKS category on the REVIEW menu. 

## **7.3.2.3 Print Definition** 

Figure 7-10 shows the Gate Assignment Uplink print definition. 

119 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [322 x 288] intentionally omitted <==**

**Figure 7-10  Gate Assignment Uplink Print Definition** 

## **7.3.3 Response** 

This section describes the Gate Assignment Response function. 

## **7.3.3.1 Accept Downlink Encoding Definition** 

When ACCEPT is selected, the following downlink is sent: 

- ACARS SMI: M46 

- ACARS Label: 46  Allowable Subnetworks: All  Downlink Priority: Flight Regularity  Downlink Buffer: RESPONSE_CREW  Delete at System Reset: Yes  Delete on Buffer Full: Yes 

Table 7-23 describes the Gate Assignment Accept downlink encoding definition. 

120 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**Table 7-23  Gate Assignment Accept Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|GTA|"Message Identifier"|
|3|2|Always|01|"Message Version"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Always|<CR><LF>|"Delimiter"|
|12|1|Always|A|"Acceptance Flag"|



## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221922
M46
FI BO24/AN N7873BO
DT DDL BFI 221922 M57A
-  GTA01     BOE24/22221922KBFIKLGB
A
```

## **7.3.3.2 Reject Downlink Encoding Definition** 

When REJECT is selected, the following downlink is sent: 

- ACARS SMI: M46 

- ACARS Label: 46 

- Allowable Subnetworks: All 

- Downlink Priority: Flight Regularity 

- Downlink Buffer: RESPONSE_CREW 

- Delete at System Reset: Yes 

- Delete on Buffer Full: Yes 

Table 7-24 describes the Gate Assignment Reject downlink encoding definition. 

121 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**Table 7-24  Gate Assignment Reject Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|GTA|"Message Identifier"|
|3|2|Always|01|"Message Version"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Always|<CR><LF>|"Delimiter"|
|12|1|Always|R|"Rejection Flag"|



## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221922
M46
FI BO24/AN N7873BO
DT DDL BFI 221922 M57A
-  GTA01     BOE24/22221922KBFIKLGB
R
```

## **7.3.3.3 Reject with Reason** 

The Gate Assignment Reject with Reason display is displayed when REJECT REASONS is selected from the Gate Assignment Uplink display, which enables the flight crew to compose a response indicating the reason for the rejection. 

## **7.3.3.3.1 Display Definition** 

Figure 7-11 shows the Gate Assignment Reject with Reason display definition. 

122 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [243 x 360] intentionally omitted <==**

**Figure 7-11  Gate Assignment Reject with Reason Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “GATE ASSIGNMENT RESPONSE REASONS” 

## **Main Area** 

This contains a group of four ESBs: 

- GATE OCCUPIED (GTA_REASON = 1) 

- NO SUCH GATE (GTA_REASON = 2) 

- GATE BLOCKED (GTA_REASON = 3) 

- OTHER (GTA_REASON = 4) 

123 of 378 

D613Z019-06 

NEW 

ECCN: 7E994 **BOEING PROPRIETARY** 

There is also an entry box that becomes visible only when the associated ESB has been selected. Table 7-25 describes the Gate Assignment Reject with Reason display entry box. 

**Table 7-25  Gate Assignment Reject with Reason Display Entry Box** 

|**Name**|**Mand**<br>**atory**|**Length**|**Format**|**Range**|**Display**|**Parameter**|
|---|---|---|---|---|---|---|
|OTHER|Yes|1-24|XXX…||If OTHER selected|GTA_OTHER|



Below this (and extending to multiple pages, as necessary) is displayed the gate assignment uplink that is being rejected. 

## **Command Buttons** 

Table 7-26 describes the Gate Assignment Reject with Reason display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 7-26  Gate Assignment Reject with Reason Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|-|-|-|-|
|2|-|-|-|-|
|3|-|-|-|-|
|4|-|-|-|-|
|5|-|-|-|-|
|6|REJECT|Reject|When all mandatory data is<br>entered or selected|When all mandatory data is entered<br>or selected but the downlink queue<br>is full or datalink is NO COMM|



## **7.3.3.3.2 Downlink Encoding Definition** 

When REJECT is selected from this display, the following downlink encoding is used: 

- ACARS SMI: M46 

- ACARS Label: 46  Allowable Subnetworks: All 

- Downlink Priority: Flight Regularity 

- Downlink Buffer: RESPONSE_CREW  Delete at System Reset: Yes 

- Delete on Buffer Full: Yes 

Table 7-27 describes the Gate Assignment Reject with Reason downlink encoding definition. 

124 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**Table 7-27  Gate Assignment Reject with Reason Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|GTA|"Message Identifier"|
|3|2|Always|01|"Message Version"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Always|<CR><LF>|"Delimiter"|
|12|1|Always|X|"Rejection with Reasons Flag"|
|13|1|Always|GTA_REASON|"Rejection Reason Code (N)"|
|14|1-24|Conditionally|GTA_OTHER|"Other Reason Text (1-24 characters)"|
|15|2|Always|<CR><LF>|"Delimiter"|
|16|1-3250|Always|UPLINK_TXT_BLK|"Uplink Text (1-3250 characters)"|



## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221922
M46
FI BO24/AN N7873BO
DT DDL BFI 221922 M57A
-  GTA01     BOE24/22221922KBFIKLGB
X4NO RAMP PERSONNEL
GATE ASSIGNMENT TEXT BLOCK...
```

Note: In this sample message, the rejection reason code is “4” (other) and the other reason text is “NO RAMP PERSONNEL”. 

## **7.4 Loadsheet** 

The Loadsheet function enables the aircraft operator to send the flight crew an uplink message containing loadsheet information.  The information is partially in a free-text format and requires a response from the flight crew. 

In order to remove a loadsheet uplink message from NEW MESSAGES, the flight crew must respond to it by selecting either ACCEPT LOADSHEET or REJECT LOADSHEET, entering valid data in the captain ID and code entry boxes, and then selecting SEND. 

125 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **7.4.1 Uplink** 

This section describes the Loadsheet Uplink function. 

## **7.4.1.1 Uplink Decoding Definition** 

The decoding for the Loadsheet Uplink is defined as follows: 

- ACARS SMI: M1L 

- ACARS Label: 1L 

- Message Identifier: LDS 

- Alert Level: Medium (visual “●COMM” and aural high-low chime) 

- Optional Element Delimiter: “/” (forward slash) 

Table 7-28 describes the Loadsheet Uplink decoding definition. 

**Table 7-28  Loadsheet Uplink Decoding Definition** 

|**#**|**Length**|**Required**|**Destination Parameter**|**Element Description**|
|---|---|---|---|---|
|1|3|Yes|<none>|"Message identifier (LDS)"|
|2|1|Yes|<none>|"Delimiter (/)"|
|3|3-10|Yes|LDS_FLIGHTNO|"Flight number (3-10 characters)"|
|4|2-11|Yes|LDS_DATE|"Date (2-11 characters)"|
|5|5-6|No|LDS_TYPE|"Type (PRELIM or FINAL)"|
|6|1-8|No|LDS_EDNO|"Edition (1-8 characters)"|
|7|1-3481|Yes|UPLINK_TXT_BLK|"Message text (1-3481 characters)"|



Note:  Elements 3 through 6 are variable-length elements and accordingly should be terminated with a delimiter character.  Pre-defined element delimiters are <CR>, <CR><LF>, and <ETX> and the optional element delimiter defined for this uplink decoding is “/” (forward slash). 

## **Sample Message** 

```
QU DDLXCXA
.RTNBOCR 221954
M1L
AN N7873BO/MA 012A
-  LDS/BOE718/22-FEB-2019/PRELIM/V1
TEXT BLOCK LINE 01
TEXT BLOCK LINE 02
TEXT BLOCK LINE 03
TEXT BLOCK LINE 04
TEXT BLOCK LINE 05
```

126 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

```
TEXT BLOCK LINE 06
TEXT BLOCK LINE 07
TEXT BLOCK LINE 08
TEXT BLOCK LINE 09
TEXT BLOCK LINE 10
```

## **7.4.1.2 Display Definition** 

Figure 7-12 shows the Loadsheet display definition. 

**==> picture [244 x 361] intentionally omitted <==**

**Figure 7-12  Loadsheet Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “LOADSHEET” 

127 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **Main Area** 

Table 7-29 describes the Loadsheet display parameters. 

**Table 7-29  Loadsheet Display Parameters** 

|**Name**|**Length**|**Format**|**Enterable**|**Range**|**Parameter**|
|---|---|---|---|---|---|
|FLIGHT NUMBER|3-10|XXXXXXXXXX|No||LDS_FLIGHTNO|
|DATE|2-11|XXXXXXXX|No||LDS_DATE|
|TYPE|5-6|PRELIM or FINAL|No||LDS_TYPE|
|EDITION|1-8|XXXXXXXX|No||LDS_EDNO|



This is followed by a group of two ESBs: 

- ACCEPT LOADSHEET (LDS_CONFIRM_REVIEW = 1) 

- REJECT LOADSHEET (LDS_CONFIRM_REVIEW = 2) 

Table 7-30 describes the Loadsheet display entry boxes. 

**Table 7-30  Loadsheet Display Entry Boxes** 

|**Mand**<br>**atory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|
|Yes|1-24|XXX…|||LDS_CAPTAIN_ID|
|Yes|1-6|XXX…|||LDS_CAPTAIN_CODE|



This is followed by the text block from the uplink. If any lines of the text block contain more than 46 characters, then that line is word-wrapped.  If the entire text block cannot be displayed on a single page, then as many pages as are necessary are created and page arrows are displayed on the right side to access each page. 

## **Command Buttons** 

Table 7-31 describes the Loadsheet display command buttons. 

**Table 7-31  Loadsheet Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|SEND|Send<br>downlink|When all mandatory data is<br>entered or selected|When all mandatory data is entered<br>or selected but the downlink queue<br>is full or datalink is NO COMM|
|2|-|-|-|-|
|3|PRINT|Print|Always|-|
|4|RESET|Reset|Always|-|
|5|RETURN|Return|Always|-|
|6|EXIT|Exit|Always|-|



128 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **Review Log** 

When the associated uplink decoding is received, this display becomes available for review in the LOADSHEET category on the REVIEW menu. 

## **7.4.1.3 Print Definition** 

Figure 7-13 shows the Loadsheet print definition. 

**==> picture [324 x 289] intentionally omitted <==**

**Figure 7-13  Loadsheet Print Definition** 

## **7.4.2 Response** 

This section describes the Loadsheet Response function. 

## **7.4.2.1 Downlink Encoding Definition** 

When SEND is selected from this display, the following downlink encoding is used: 

- ACARS SMI: M1L 

- ACARS Label: 1L 

- Allowable Subnetworks: All 

129 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

- Downlink Priority: Flight Regularity 

- Downlink Buffer: 

   - RESPONSE_CREW 

- Delete at System Reset: Yes 

- Delete on Buffer Full: Yes 

Table 7-32 describes the Loadsheet Response downlink encoding definition. 

**Table 7-32  Loadsheet Response Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3-10|Always|LDS_FLIGHTNO|"Flight Number (3-10 characters)"|
|3|1|Always|/|"Delimiter"|
|4|2-11|Always|LDS_DATE|"Date (2-11 characters)"|
|5|1|Always|/|"Delimiter"|
|6|5-6|Always|LDS_TYPE|"Type (PRELIM or FINAL)"|
|7|1|Always|/|"Delimiter"|
|8|1-8|Always|LDS_EDNO|"Edition (1-8 characters)"|
|9|2|Always|<CR><LF>|"Delimiter"|
|10|6|Conditionally|ACCEPT|"ACCEPT Response"|
|11|6|Conditionally|REJECT|"REJECT Response"|
|12|2|Always|<CR><LF>|"Delimiter"|
|13|1-24|Always|LDS_CAPTAIN_ID|"Captain ID (1-24 characters)"|
|14|1|Always|/|"Delimiter"|
|15|1-6|Always|LDS_CAPTAIN_CODE|"Captain Code (1-6 characters)"|



## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221626
M1L
FI BO718/AN N7873BO
DT DDL BFI 221626 M01A
-  BOE718/22-FEB-2019/PRELIM/V1
ACCEPT
SMITH/789
```

## **7.5 Weight and Balance** 

The Weight and Balance function enables the flight crew to request weight and balance information, the aircraft operator to send that information to the flight crew, and the flight crew to 

130 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

respond accordingly.  The aircraft operator may also send the weight and balance information without a flight crew request. 

## **7.5.1 Request** 

This section describes the Weight and Balance Request function. 

## **7.5.1.1 Display Definition** 

Figure 7-14 shows the Weight and Balance Request display definition. 

**==> picture [243 x 361] intentionally omitted <==**

**Figure 7-14  Weight and Balance Request Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

131 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

##  “WEIGHT & BALANCE REQUEST” 

## **Main Area** 

The main area contains a group of three text entry boxes labeled TEXT, each of which allows up to 24 characters of text entry.  Table 7-33 describes the Weight and Balance Request display entry boxes. 

**Table 7-33  Weight and Balance Request Display Entry Boxes** 

|**Name**|**Mand**<br>**atory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|---|
|TEXT|No|1-24|XXX…|||WTBAL_RQST_TXT_1|
||No|1-24|XXX…|||WTBAL_RQST_TXT_2|
||No|1-24|XXX…|||WTBAL_RQST_TXT_3|



## **Command Buttons** 

Table 7-34 describes the Weight and Balance Request display command buttons.  If neither condition is satisfied, then the button is not displayed. 

**Table 7-34  Weight and Balance Request Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|SEND|Send<br>downlink|Always|When the downlink queue is full or<br>datalink is NO COMM|
|2|-|-|-|-|
|3|-|-|-|-|
|4|RESET|Reset|Always|-|
|5|RETURN|Return|Always|-|
|6|EXIT|Exit|Always|-|



## **Review Log** 

When SEND is selected from this display, it becomes available for review in the COMPANY DOWNLINKS category on the REVIEW menu. 

## **7.5.1.2 Downlink Encoding Definition** 

When SEND is selected from this display, the following downlink encoding is used: 

- ACARS SMI: M31 

- ACARS Label: 31  Allowable Subnetworks: All 

132 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

- Downlink Priority: Flight Regularity 

- Downlink Buffer: REQUEST 

- Delete at System Reset: Yes 

- Delete on Buffer Full: Yes 

Table 7-35 describes the Weight and Balance Request downlink encoding definition. 

**Table 7-35  Weight and Balance Request Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|WAB|"Message Identifier"|
|3|2|Always|01|"Message Version"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Conditionally|<CR><LF>|"Delimiter"|
|12|1-24|Conditionally|WTBAL_RQST_TXT_1|"Text line 1 (1-24 characters)"|
|13|2|Conditionally|<CR><LF>|"Delimiter"|
|14|1-24|Conditionally|WTBAL_RQST_TXT_2|"Text line 2 (1-24 characters)"|
|15|2|Conditionally|<CR><LF>|"Delimiter"|
|16|1-24|Conditionally|WTBAL_RQST_TXT_3|"Text line 3 (1-24 characters)"|



Note: The presence of each text line and its preceding <CR><LF> delimiter in a downlink message is conditional on the validity of that text line.  In other words, if text is not entered on a particular text line then that line and the preceding <CR><LF> delimiter are not present in the downlink message. 

## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221937
M31
FI BO24/AN N7873BO
DT DDL BFI 221937 M58A
-  WAB01     BOE24/22221937KBFIKLGB
```

Note: In this sample message, no supplemental text is present. 

133 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **7.5.2 Uplink** 

This section describes the Weight and Balance Uplink function. 

## **7.5.2.1 Uplink Decoding Definition** 

The decoding for the Weight and Balance Uplink is defined as follows: 

- ACARS SMI: CMD 

- ACARS Label: RA 

- Message Identifier: ~1WAB 

- Alert Level: Medium (visual “●COMM” and aural high-low chime) 

- Optional Element Delimiter: “,” (comma) 

Table 7-36 describes the Weight and Balance Uplink decoding definition. 

**Table 7-36  Weight and Balance Uplink Decoding Definition** 

|**#**|**Length**|**Required**|**Destination Parameter**|**Element Description**|
|---|---|---|---|---|
|1|2|Yes|<none>|"Priority code (XX)"|
|2|7|Yes|<none>|"Ground address (XXXXXXX)"|
|3|5|Yes|<none>|"Message identifier (~1WAB)"|
|4|2|Yes|<none>|"Message version (XX)"|
|5|2|Yes|<none>|"Message date (DD)"|
|6|4|Yes|<none>|"Message time (HHMM)"|
|7|2|Yes|<none>|"Delimiter (<CR><LF>)"|
|8|1-3496|Yes|UPLINK_TXT_BLK|"Message text (1-3496 characters)"|



## **Sample Message** 

```
QU DDLXCXA
.RTNBOCR 221954
CMD
AN N7873BO/MA 013A
-  QURTNBOCR~1WAB01190526
WEIGHT & BALANCE TEXT BLOCK...
```

## **7.5.2.2 Display Definition** 

Figure 7-15 shows the Weight and Balance Uplink display definition. 

134 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [243 x 360] intentionally omitted <==**

**Figure 7-15  Weight and Balance Uplink Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “WEIGHT & BALANCE” 

## **Main Area** 

The main area contains the text block from the uplink.  If any lines of the text block contain more than 46 characters, then that line is word-wrapped.  If the entire text block cannot be displayed on a single page, then as many pages as are necessary are created and page arrows are displayed on the right side to access each page. 

135 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **Command Buttons** 

Table 7-37 describes the Weight and Balance Uplink display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 7-37  Weight and Balance Uplink Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|ACCEPT|Send<br>ACCEPT<br>downlink|Always|When the downlink queue is full or<br>datalink is NO COMM|
|2|-|-|-|-|
|3|PRINT|Print|Always|-|
|4|-|-|-|-|
|5|REJECT<br>REASONS|Show<br>RESPONSE<br>REASONS<br>display|Always|When the downlink queue is full or<br>datalink is NO COMM|
|6|REJECT|Send<br>REJECT<br>downlink|Always|When the downlink queue is full or<br>datalink is NO COMM|



## **Review Log** 

When the associated uplink decoding is received, this display becomes available for review in the COMPANY UPLINKS category on the REVIEW menu. 

## **7.5.2.3 Print Definition** 

Figure 7-16 shows the Weight and Balance Uplink print definition. 

136 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [324 x 288] intentionally omitted <==**

**Figure 7-16  Weight and Balance Uplink Print Definition** 

## **7.5.3 Response** 

This section describes the Weight and Balance Response function. 

## **7.5.3.1 Accept Downlink Encoding Definition** 

When ACCEPT is selected, the following downlink is sent: 

- ACARS SMI: M41 

- ACARS Label: 41  Allowable Subnetworks: All  Downlink Priority: Flight Regularity  Downlink Buffer: RESPONSE_CREW  Delete at System Reset: Yes  Delete on Buffer Full: Yes 

Table 7-38 describes the Weight and Balance Accept downlink encoding definition. 

137 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

**Table 7-38  Weight and Balance Accept Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|WAB|"Message Identifier"|
|3|2|Always|01|"Message Version"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Always|<CR><LF>|"Delimiter"|
|12|1|Always|A|"Acceptance Flag"|



## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221834
M41
FI BO64/AN N7873BO
DT DDL BFI 221834 M39A
-  WAB01     BOE64/22221834KBFIPHOG
A
```

## **7.5.3.2 Reject Downlink Encoding Definition** 

When REJECT is selected, the following downlink is sent: 

- ACARS SMI: M41 

- ACARS Label: 41 

- Allowable Subnetworks: All 

- Downlink Priority: Flight Regularity 

- Downlink Buffer: RESPONSE_CREW 

- Delete at System Reset: Yes 

- Delete on Buffer Full: Yes 

Table 7-39 describes the Weight and Balance Reject downlink encoding definition. 

138 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**Table 7-39  Weight and Balance Reject Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|WAB|"Message Identifier"|
|3|2|Always|01|"Message Version"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Always|<CR><LF>|"Delimiter"|
|12|1|Always|R|"Rejection Flag"|



## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221834
M41
FI BO64/AN N7873BO
DT DDL BFI 221834 M69A
-  WAB01     BOE64/22221834KBFIPHOG
R
```

## **7.5.3.3 Reject with Reason** 

The Weight and Balance Reject with Reason display is displayed when REJECT REASONS is selected from the Weight and Balance Uplink display, which enables the flight crew to compose a response indicating the reason for the rejection. 

## **7.5.3.3.1 Display Definition** 

Figure 7-17 shows the Weight and Balance Reject with Reason display definition. 

139 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [241 x 360] intentionally omitted <==**

**Figure 7-17  Weight and Balance Reject with Reason Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “WEIGHT & BALANCE RESPONSE REASONS” 

## **Main Area** 

This contains a group of six ESBs: 

- PASSENGER COUNT DISCREPANCY (WAB_REASON = 1) 

- FUEL ORDER DISCREPANCY (WAB_REASON = 2) 

- CREW COUNT DISCREPANCY (WAB_REASON = 3) 

- CHECK ITEM NUMBER (WAB_REASON = 4) 

140 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

- CHECK LINE NUMBER (WAB_REASON = 5) 

- OTHER (WAB_REASON = 6) 

There are also three entry boxes that become visible only when the associated ESB is selected. Table 7-40 describes the Weight and Balance Reject with Reason display entry boxes. 

**Table 7-40  Weight and Balance Reject with Reason Display Entry Boxes** 

|**Name**|**Mand**<br>**atory**|**Length**|**Format**|**Range**|**Display**|**Parameter**|
|---|---|---|---|---|---|---|
|CHECK ITEM<br>NUMBER|Yes|1-2|XX||If CHECK ITEM<br>NUMBER selected|WAB_CHK_ITEM_NO|
|CHECK LINE<br>NUMBER|Yes|1-2|XX||If CHECK LINE<br>NUMBER selected|WAB_CHK_LINE_NO|
|OTHER|Yes|1-24|XXX…||If OTHER selected|WAB_OTHER|



Below this (and extending to multiple pages, as necessary) is displayed the weight and balance uplink that is being rejected. 

## **Command Buttons** 

Table 7-41 describes the Weight and Balance Reject with Reason display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 7-41  Weight and Balance Reject with Reason Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|-|-|-|-|
|2|-|-|-|-|
|3|-|-|-|-|
|4|-|-|-|-|
|5|-|-|-|-|
|6|REJECT|Reject|When all mandatory data is<br>entered or selected|When all mandatory data is entered<br>or selected but the downlink queue<br>is full or datalink is NO COMM|



## **7.5.3.3.2 Downlink Encoding Definition** 

When REJECT is selected from this display, the following downlink encoding is used: 

- ACARS SMI: M41 

- ACARS Label: 41  Allowable Subnetworks: All 

- Downlink Priority: Flight Regularity 

141 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

- Downlink Buffer: 

- Delete at System Reset: 

   - RESPONSE_CREW 

   - Yes 

- Delete on Buffer Full: Yes 

Table 7-42 describes the Weight and Balance Reject with Reason downlink encoding definition. 

**Table 7-42  Weight and Balance Reject with Reason Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|WAB|"Message Identifier"|
|3|2|Always|01|"Message Version"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Always|<CR><LF>|"Delimiter"|
|12|1|Always|X|"Rejection with Reasons Flag"|
|13|1|Always|WAB_REASON|"Rejection Reason Code (N)"|
|14|2|Conditionally|WAB_CHK_ITEM_NO|"Check Item Number (XX)"|
|15|2|Conditionally|WAB_CHK_LINE_NO|"Check Line Number (XX)"|
|16|1-24|Conditionally|WAB_OTHER|"Other Reason Text (1-24 characters)"|
|17|2|Always|<CR><LF>|"Delimiter"|
|18|1-3250|Always|UPLINK_TXT_BLK|"Uplink Text (1-3250 characters)"|



## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221916
M41
FI BO64/AN N7873BO
DT DDL BFI 221916 M51A
-  WAB01     BOE64/22221916KBFIPHOG
X432
WEIGHT & BALANCE TEXT BLOCK...
```

Note: In this sample message, the rejection reason code is “4” (check item number) and the item number that the flight crew entered is “32”. 

142 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW
