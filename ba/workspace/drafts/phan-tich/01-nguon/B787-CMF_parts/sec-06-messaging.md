## **6 Messaging** 

This section describes the messaging functions that the AMI implements. 

## **6.1 Uplink Messaging** 

This section describes the uplink messaging functions that the AMI implements. 

## **6.1.1 Display Command Uplink** 

The Display Command Uplink function enables the aircraft operator to send the flight crew a message and control the presentation, including the message title. 

## **6.1.1.1 Uplink Decoding Definition** 

The decoding for the Display Command Uplink is defined as follows: 

- ACARS SMI: CMD 

- ACARS Label: RA  Message Identifier: ~1RA1  Alert Level: Medium (visual “●COMM” and aural high-low chime) 

- Optional Element Delimiter: “,” (comma) character 

Table 6-1 describes the Display Command Uplink decoding definition. 

**Table 6-1  Display Command Uplink Decoding Definition** 

|**#**|**Length**|**Required**|**Destination Parameter**|**Element Description**|
|---|---|---|---|---|
|1|2|Yes|<none>|"Priority code (XX)"|
|2|7|Yes|<none>|"Ground address (XXXXXXX)"|
|3|5|Yes|<none>|"Message identifier (~1RA1)"|
|4|2|Yes|<none>|"Message version (XX)"|
|5|2|Yes|<none>|"Message date (DD)"|
|6|4|Yes|<none>|"Message time (HHMM)"|
|7|2|Yes|<none>|"Delimiter (<CR><LF>)"|
|8|1-16|Yes|RA1_TITLE|"Message title (1-16 characters)"|
|9|1-3480|Yes|UPLINK_TXT_BLK|"Message text (1-3480 characters)"|



Note:  Element 8 is a variable-length element and accordingly should be terminated with a delimiter character.  Pre-defined element delimiters are <CR>, <CR><LF>, and <ETX> and the optional element delimiter defined for this uplink decoding is “,” (comma). 

60 of 378 

D613Z019-06 

NEW 

ECCN: 7E994 

**BOEING PROPRIETARY** 

## **Sample Message** 

```
QU DDLXCXA
.RTNBOCR 221954
CMD
AN N7873BO/MA 004A
-  QURTNBOCR~1RA101190436
TITLE
DISPLAY COMMAND TEXT BLOCK...
```

## **6.1.1.2 Display Definition** 

Figure 6-1 shows the Display Command Uplink display definition. 

**==> picture [244 x 361] intentionally omitted <==**

**Figure 6-1  Display Command Uplink Display Definition** 

61 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- The title contained in the uplink (RA1_TITLE) 

## **Main Area** 

The main area contains the text block from the uplink.  If any lines of the text block contain more than 46 characters, then that line is word-wrapped.  If the entire text block cannot be displayed on a single page, then as many pages as are necessary are created and page arrows are displayed on the right side to access each page. 

## **Command Buttons** 

Table 6-2 describes the Display Command Uplink display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 6-2  Display Command Uplink Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|-|-|-|-|
|2|-|-|-|-|
|3|PRINT|Print|Always|-|
|4|-|-|-|-|
|5|-|-|-|-|
|6|CANCEL|Cancel|Always|-|



## **Review Log** 

When the associated uplink decoding is received, this display becomes available for review in the COMPANY UPLINKS category on the REVIEW menu. 

## **6.1.1.3 Print Definition** 

Figure 6-2 shows the Display Command Uplink print definition. 

62 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [323 x 288] intentionally omitted <==**

**Figure 6-2  Display Command Uplink Print Definition** 

## **6.1.2 E-Mail Uplink** 

The E-Mail Uplink function enables the aircraft operator to send the flight crew a message converted from e-mail format, including the originator’s e-mail address and a subject line. 

## **6.1.2.1 Uplink Decoding Definition** 

The decoding for the E-Mail Uplink is defined as follows: 

- ACARS SMI: CMD 

- ACARS Label: RA 

- Message Identifier: ~1EML 

- Alert Level: Medium (visual “●COMM” and aural high-low chime) 

- Optional Element Delimiter: “,” (comma) 

Table 6-3 describes the E-Mail Uplink decoding definition. 

63 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**Table 6-3  E-Mail Uplink Decoding Definition** 

|**#**|**Length**|**Required**|**Destination Parameter**|**Element Description**|
|---|---|---|---|---|
|1|2|Yes|<none>|"Priority code (XX)"|
|2|7|Yes|<none>|"Ground address (XXXXXXX)"|
|3|5|Yes|<none>|"Message identifier (~1EML)"|
|4|2|Yes|<none>|"Delimiter (<CR><LF>)"|
|5|1-24|Yes|EMAIL_UL_FROM_LOCAL|"Local name (1-24 characters)"|
|6|1-24|Yes|EMAIL_UL_FROM_DOMAIN|"Domain name (1-24 characters)"|
|7|1-24|No|EMAIL_UL_SUBJECT|"Subject (1-24 characters)"|
|8|1-3432|Yes|UPLINK_TXT_BLK|"Message text (1-3432 characters)"|



Note:  Elements 5, 6, and 7 are variable-length elements and accordingly should be terminated with a delimiter character.  Pre-defined element delimiters are <CR>, <CR><LF>, and <ETX> and the optional element delimiter defined for this uplink decoding is “,” (comma). 

## **Sample Message** 

```
QU DDLXCXA
.RTNBOCR 221954
CMD
AN N7873BO/MA 005A
-  QURTNBOCR~1EML
LOCAL,DOMAIN,SUBJECT,E-MAIL UPLINK TEXT BLOCK...
```

## **6.1.2.2 Display Definition** 

Figure 6-3 shows the E-Mail Uplink display definition. 

64 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [242 x 360] intentionally omitted <==**

**Figure 6-3  E-Mail Uplink Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “E-MAIL UPLINK MESSAGE” 

## **Main Area** 

Table 6-4 describes the E-Mail Uplink display parameters. 

**Table 6-4  E-Mail Uplink Display Parameters** 

|**Name**|**Length**|**Format**|**Enterable**|**Range**|**Parameter**|
|---|---|---|---|---|---|
|FROM|1-24|XXX...|No||EMAIL_UL_FROM_LOCAL|



65 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**Name**|**Length**|**Format**|**Enterable**|**Range**|**Parameter**|
|---|---|---|---|---|---|
|@|1-24|XXX...|No||EMAIL_UL_FROM_DOMAIN|
|SUBJECT|1-24|XXX...|No||EMAIL_UL_SUBJECT|



This is followed by the text block from the uplink.  If any lines of the text block contain more than 46 characters, then that line is word-wrapped.  If the entire text block cannot be displayed on a single page, then as many pages as are necessary are created and page arrows are displayed on the right side to access each page. 

## **Command Buttons** 

Table 6-5 describes the E-Mail Uplink display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 6-5  E-Mail Uplink Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|REPLY|Show E-Mail<br>Reply display|Always|-|
|2|-|-|-|-|
|3|PRINT|Print|Always|-|
|4|-|-|-|-|
|5|-|-|-|-|
|6|CANCEL|Cancel|Always|-|



## **Review Log** 

When the associated uplink decoding is received, this display becomes available for review in the COMPANY UPLINKS category on the REVIEW menu. 

## **6.1.2.3 Print Definition** 

Figure 6-4 shows the E-Mail Uplink print definition. 

66 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [322 x 288] intentionally omitted <==**

**Figure 6-4  E-Mail Uplink Print Definition** 

## **6.1.3 Free-Text Uplink** 

The Free-Text Uplink function enables the aircraft operator to send the flight crew a free-text message that includes a message title. 

## **6.1.3.1 Uplink Decoding Definition** 

The decoding for the Free-Text Uplink is defined as follows: 

- ACARS SMI: CMD 

- ACARS Label: RA 

- Message Identifier: ~1DIS 

- Alert Level: Medium (visual “●COMM” and aural high-low chime) 

- Optional Element Delimiter: “,” (comma) character 

Table 6-6 describes the Free-Text Uplink decoding definition. 

67 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**Table 6-6  Free-Text Uplink Decoding Definition** 

|**#**|**Length**|**Required**|**Destination Parameter**|**Element Description**|
|---|---|---|---|---|
|1|2|Yes|<none>|"Priority code (XX)"|
|2|7|Yes|<none>|"Ground address (XXXXXXX)"|
|3|5|Yes|<none>|"Message identifier (~1DIS)"|
|4|2|Yes|<none>|"Message version (XX)"|
|5|2|Yes|<none>|"Message date (DD)"|
|6|4|Yes|<none>|"Message time (HHMM)"|
|7|2|Yes|<none>|"Delimiter (<CR><LF>)"|
|8|1-16|Yes|DISP_MSG_TITLE|"Message title (1-16 characters)"|
|9|1-3480|Yes|UPLINK_TXT_BLK|"Message text (1-3480 characters)"|



Note:  Element 8 is a variable-length element and accordingly should be terminated with a delimiter character.  Pre-defined element delimiters are <CR>, <CR><LF>, and <ETX> and the optional element delimiter defined for this uplink decoding is “,” (comma). 

## **Sample Message** 

```
QU DDLXCXA
.RTNBOCR 221954
CMD
AN N7873BO/MA 006A
-  QURTNBOCR~1DIS01221953
FREE-TEXT TITLE
FREE-TEXT TEXT BLOCK...
```

## **6.1.3.2 Display Definition** 

Figure 6-5 shows the Free-Text Uplink display definition. 

68 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [244 x 360] intentionally omitted <==**

**Figure 6-5  Free-Text Uplink Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- The title contained in the uplink (DISP_MSG_TITLE) 

## **Main Area** 

The main area contains the text block from the uplink.  If any lines of the text block contain more than 46 characters, then that line is word-wrapped.  If the entire text block cannot be displayed on a single page, then as many pages as are necessary are created and page arrows are displayed on the right side to access each page. 

69 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **Command Buttons** 

Table 6-7 describes the Free-Text Uplink display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 6-7  Free-Text Uplink Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|-|-|-|-|
|2|-|-|-|-|
|3|PRINT|Print|Always|-|
|4|-|-|-|-|
|5|-|-|-|-|
|6|CANCEL|Cancel|Always|-|



## **Review Log** 

When the associated uplink decoding is received, this display becomes available for review in the COMPANY UPLINKS category on the REVIEW menu. 

## **6.1.3.3 Print Definition** 

Figure 6-6 shows the Free-Text Uplink print definition. 

70 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [321 x 288] intentionally omitted <==**

**Figure 6-6  Free-Text Uplink Print Definition** 

## **6.1.4 Printer Uplink** 

CMF routes the printer uplink directly to the flight deck printer without displaying it to the flight crew on a Multi-Function Display (MFD). 

## **6.1.4.1 Uplink Decoding Definition** 

The decoding for the Printer Uplink definition, which complies with (but is less specific than) the label C1 printer uplink definition specified in ARINC Specification 620, _Datalink Ground Systems Standard and Interface Specification (DGSS/IS)_ , is defined as follows: 

- ACARS SMI: AGM 

- ACARS Label: C1 

- Message Identifier: None 

- Alert Level: Medium (visual “●COMM” and aural high-low chime) 

- Optional Element Delimiter: “,” (comma) 

Table 6-8 describes the Printer Uplink decoding definition. 

71 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**Table 6-8  Printer Uplink Decoding Definition** 

|**#**|**Length**|**Required**|**Destination Parameter**|**Element Description**|
|---|---|---|---|---|
|1|1|Yes|<none>|"Period (.)"|
|2|7|Yes|<none>|"Ground address (XXXXXXX)"|
|3|1|Yes|<none>|"Space (<SP>)"|
|4|2|Yes|<none>|"Message date (DD)"|
|5|4|Yes|<none>|"Message time (HHMM)"|
|6|2|Yes|<none>|"Delimiter (<CR><LF>)"|
|7|1-3503|Yes|PRINT_TXT_BLK|"Message text (1-3503 characters)"|



## **Sample Message** 

```
QU DDLXCXA
.RTNBOCR 221905
AGM
AN N7873BO/MA 007A
-  .RTNBOCR 190523
PRINTER UPLINK TEXT BLOCK...
```

## **6.1.4.2 Print Definition** 

Figure 6-7 shows the Printer Uplink print definition. 

72 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [323 x 288] intentionally omitted <==**

**Figure 6-7  Printer Uplink Print Definition** 

## **6.1.5 VHF Voice Contact Request** 

The VHF Voice Contact Request function enables the aircraft operator to send a request for the flight crew to contact the operator on a specific VHF channel. 

## **6.1.5.1 Uplink Decoding Definition** 

The decoding for the VHF voice contact uplink is defined as follows: 

- ACARS SMI: GVR 

- ACARS Label: 54  Message Identifier: None  Alert Level: Medium (visual “●COMM” and aural high-low chime) 

- Optional Element Delimiter: “,” (comma) 

Table 6-9 describes the VHF voice contact uplink decoding definition. 

73 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**Table 6-9  VHF Voice Contact Uplink Decoding Definition** 

|**#**|**Length**|**Required**|**Destination Parameter**|**Element Description**|
|---|---|---|---|---|
|1|6|Yes|VHF_VOICE_FREQ|"VHF voice frequency (118000-136975)"|
|2|1-200|No|VHF_VOICE_TXT_BLK|"Message text (1-200 characters)"|



The text block following the VHF voice frequency is optional and limited to 200 characters. 

## **Sample Message** 

```
QU DDLXCXA
.RTNBOCR 221954
GVR
AN N7873BO/MA 008A
-  132475VHF VOICE CONTACT TEXT BLOCK...
```

Note: This sample message includes the optional text block. 

## **6.1.5.2 Display Definition** 

Figure 6-8 shows the VHF Voice Contact Request display definition. 

74 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [244 x 360] intentionally omitted <==**

**Figure 6-8  VHF Voice Contact Request Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “VHF VOICE CONTACT” 

## **Main Area** 

Table 6-10 describes the VHF Voice Contact Request display parameter. 

**Table 6-10  VHF Voice Contact Display Parameter** 

|**Name**|**Length**|**Format**|**Enterable**|**Range**|**Parameter**|
|---|---|---|---|---|---|
|VOICE CONTACT<br>REQUESTED ON VHF<br>FREQUENCY|7|NNN.NNN|No|118.000 –<br>136.975|VHF_VOICE_FREQ|



75 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

## **Command Buttons** 

Table 6-11 describes the VHF Voice Contact Request display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 6-11  VHF Voice Contact Request Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|-|-|-|-|
|2|-|-|-|-|
|3|PRINT|Print|Always|-|
|4|-|-|-|-|
|5|-|-|-|-|
|6|CANCEL|Cancel|Always|-|



## **Review Log** 

When the associated uplink decoding is received, this display becomes available for review in the COMPANY UPLINKS category on the REVIEW menu. 

## **6.1.5.3 Print Definition** 

Figure 6-9 shows the VHF Voice Contact Request print definition. 

76 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [323 x 288] intentionally omitted <==**

**Figure 6-9  VHF Voice Contact Request Print Definition** 

## **6.2 Downlink Messaging** 

This section describes the downlink messaging functions that the AMI implements. 

## **6.2.1 E-Mail Downlink** 

The E-Mail Downlink function allow the flight crew to send an ACARS message which ground systems then convert into an e-mail message. 

## **6.2.1.1 Display Definition** 

Figure 6-10 shows the E-Mail Downlink display definition. 

77 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [244 x 360] intentionally omitted <==**

**Figure 6-10  E-Mail Downlink Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “E-MAIL DOWNLINK MESSAGE” 

## **Main Area** 

Table 6-12 describes the E-Mail Downlink display entry boxes. 

**Table 6-12  E-Mail Downlink Display Entry Boxes** 

|**Name**|**Mand**<br>**atory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|---|
|TO|Yes|1-22|XXX…|||EMAIL_DL_TO_LOCAL|
|@|Yes|1-16|XXX…|||EMAIL_DL_TO_DOMAIN|



D613Z019-06 78 of 378 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**Name**|**Mand**<br>**atory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|---|
|CC|No|1-22|XXX…|||EMAIL_DL_CC_1_LOCAL|
|@|No|1-16|XXX…|||EMAIL_DL_CC_1_DOMAIN|
||No|1-22|XXX…|||EMAIL_DL_CC_2_LOCAL|
|@|No|1-16|XXX…|||EMAIL_DL_CC_2_DOMAIN|
||No|1-22|XXX…|||EMAIL_DL_CC_3_LOCAL|
|@|No|1-16|XXX…|||EMAIL_DL_CC_3_DOMAIN|
|SUBJECT|No|1-24|XXX…|||EMAIL_DL_SUBJECT|
|MESSAGE|Yes|1-24|XXX…|||EMAIL_DL_TXT_1|
||No|1-24|XXX…|||EMAIL_DL_TXT_2|
||No|1-24|XXX…|||EMAIL_DL_TXT_3|
||No|1-24|XXX…|||EMAIL_DL_TXT_4|
||No|1-24|XXX…|||EMAIL_DL_TXT_5|
||No|1-24|XXX…|||EMAIL_DL_TXT_6|
||No|1-24|XXX…|||EMAIL_DL_TXT_7|
||No|1-24|XXX…|||EMAIL_DL_TXT_8|
||No|1-24|XXX…|||EMAIL_DL_TXT_9|



Note: Both the local and domain portions of the various e-mail address parameters may contain one or more periods (.).  These parameters correspond to the two parts of an e-mail address.  For example, to send the message to john.smith@boeing.com, “john.smith” would be entered in the TO field and “boeing.com” would be entered in the associated @ field. 

## **Command Buttons** 

Table 6-13 describes the E-Mail Downlink display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 6-13  E-Mail Downlink Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|SEND|Send<br>downlink|When all mandatory data is<br>entered or selected|When all mandatory data is entered<br>or selected but the downlink queue<br>is full or datalink is NO COMM|
|2|-|-|-|-|
|3|PRINT|Print|Always|-|
|4|RESET|Reset|Always|-|
|5|RETURN|Return|Always|-|
|6|EXIT|Exit|Always|-|



79 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **Review Log** 

When SEND is selected from this display, it becomes available for review in the COMPANY DOWNLINKS category on the REVIEW menu. 

## **6.2.1.2 Downlink Encoding Definition** 

When SEND is selected from this display, the following downlink encoding is used: 

- ACARS SMI: EML 

- ACARS Label: E1  Allowable Subnetworks: All  Downlink Priority: Flight Regularity  Downlink Buffer: MESSAGE 

- Delete at System Reset: Yes 

- Delete on Buffer Full: Yes 

Table 6-14 describes the E-Mail Downlink encoding definition. 

**Table 6-14  E-Mail Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|EML|"Message Identifier"|
|3|2|Always|02|"Message Version"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Always|<CR><LF>|"Delimiter "|
|12|1-22|Always|EMAIL_DL_TO_LOCAL|"To local address (1-22 characters)"|
|13|1|Always|,|"Delimiter"|
|14|1-16|Always|EMAIL_DL_TO_DOMAIN|"To domain (1-16 characters)"|
|15|2|Always|<CR><LF>|"Delimiter"|
|16|1-22|Always|EMAIL_DL_CC_1_LOCAL|"CC1 local address (1-22 characters)"|
|17|1|Always|,|"Delimiter"|
|18|1-16|Always|EMAIL_DL_CC_1_DOMAIN|"CC1 domain (1-16 characters)"|
|19|2|Always|<CR><LF>|"Delimiter"|



80 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|20|1-22|Always|EMAIL_DL_CC_2_LOCAL|"CC2 local address (1-22 characters)"|
|21|1|Always|,|"Delimiter"|
|22|1-16|Always|EMAIL_DL_CC_2_DOMAIN|"CC2 domain (1-16 characters)"|
|23|2|Always|<CR><LF>|"Delimiter"|
|24|1-22|Always|EMAIL_DL_CC_3_LOCAL|"CC3 local address (1-22 characters)"|
|25|1|Always|,|"Delimiter"|
|26|1-16|Always|EMAIL_DL_CC_3_DOMAIN|"CC3 domain (1-16 characters)"|
|27|2|Always|<CR><LF>|"Delimiter"|
|28|1-24|Always|EMAIL_DL_SUBJECT|"Subject (1-24 characters)"|
|29|2|Always|<CR><LF>|"Delimiter"|
|30|1-24|Always|EMAIL_DL_TXT_1|"Text line 1 (1-24 characters)"|
|31|2|Conditionally|<CR><LF>|"Delimiter"|
|32|1-24|Conditionally|EMAIL_DL_TXT_2|"Text line 2 (1-24 characters)"|
|33|2|Conditionally|<CR><LF>|"Delimiter"|
|34|1-24|Conditionally|EMAIL_DL_TXT_3|"Text line 3 (1-24 characters)"|
|35|2|Conditionally|<CR><LF>|"Delimiter"|
|36|1-24|Conditionally|EMAIL_DL_TXT_4|"Text line 4 (1-24 characters)"|
|37|2|Conditionally|<CR><LF>|"Delimiter"|
|38|1-24|Conditionally|EMAIL_DL_TXT_5|"Text line 5 (1-24 characters)"|
|39|2|Conditionally|<CR><LF>|"Delimiter"|
|40|1-24|Conditionally|EMAIL_DL_TXT_6|"Text line 6 (1-24 characters)"|
|41|2|Conditionally|<CR><LF>|"Delimiter"|
|42|1-24|Conditionally|EMAIL_DL_TXT_7|"Text line 7 (1-24 characters)"|
|43|2|Conditionally|<CR><LF>|"Delimiter"|
|44|1-24|Conditionally|EMAIL_DL_TXT_8|"Text line 8 (1-24 characters)"|
|45|2|Conditionally|<CR><LF>|"Delimiter"|
|46|1-24|Conditionally|EMAIL_DL_TXT_9|"Text line 9 (1-24 characters)"|



Note: The presence of each text line and its preceding <CR><LF> delimiter in a downlink message is conditional on the validity of that text line.  In other words, if text is not entered on a particular text line then that line and the preceding <CR><LF> delimiter are not present in the downlink message. 

Note: The formats of the E-Mail Downlink and the E-Mail Reply downlink are identical. 

## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221953
EML
FI BO24/AN N7873BO
DT DDL BFI 221953 M67A
-  EML02     BOE24/22221953KBFIKLGB
```

81 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

```
TEST.ADDRESS,BOEING.COM
```

```
*,*
*,*
*,*
SUBJECT
TEXT LINE 1
TEXT LINE 2
TEXT LINE 3
```

Note: In this sample message, no CC e-mail addresses are present. 

## **6.2.1.3 Print Definition** 

Figure 6-11 shows the E-Mail Downlink print definition. 

**==> picture [323 x 289] intentionally omitted <==**

**Figure 6-11  E-Mail Downlink Print Definition** 

## **6.2.2 E-Mail Reply** 

The E-Mail Reply function enables the flight crew to reply to an e-mail uplink by sending an ACARS message which ground systems then convert into an e-mail message. 

82 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **6.2.2.1 Display Definition** 

Figure 6-12 shows the E-Mail Reply display definition, which is accessible from the E-Mail Uplink display described in Section 6.1.2.2. 

**==> picture [242 x 361] intentionally omitted <==**

**Figure 6-12  E-Mail Reply Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “E-MAIL REPLY MESSAGE” 

83 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **Main Area** 

Table 6-15 describes the E-Mail Reply display entry boxes.  Of note, the values in the TO, @, and SUBJECT entry boxes default to the corresponding values in the most recent e-mail uplink message. 

**Table 6-15  E-Mail Reply Display Entry Boxes** 

|**Name**|**Mand**<br>**atory**|**Length**|**Format**|**Default**|**Parameter**|
|---|---|---|---|---|---|
|TO|Yes|1-22|XXX…|EMAIL_UL_SUBJECT|EMAIL_DL_REPLY_TO_LOCAL|
|@|Yes|1-16|XXX…|EMAIL_UL_FROM_DOMAIN|EMAIL_DL_REPLY_TO_DOMAIN|
|SUBJECT|No|1-24|XXX…|EMAIL_UL_FROM_LOCAL|EMAIL_DL_REPLY_SUBJECT|
|MESSAGE|Yes|1-24|XXX…||EMAIL_DL_REPLY_TXT_1|
||No|1-24|XXX…||EMAIL_DL_REPLY_TXT_2|
||No|1-24|XXX…||EMAIL_DL_REPLY_TXT_3|
||No|1-24|XXX…||EMAIL_DL_REPLY_TXT_4|
||No|1-24|XXX…||EMAIL_DL_REPLY_TXT_5|
||No|1-24|XXX…||EMAIL_DL_REPLY_TXT_6|
||No|1-24|XXX…||EMAIL_DL_REPLY_TXT_7|
||No|1-24|XXX…||EMAIL_DL_REPLY_TXT_8|
||No|1-24|XXX…||EMAIL_DL_REPLY_TXT_9|



Note: Both the local and domain portions of the various e-mail address parameters may contain one or more periods (.).  These parameters correspond to the two parts of an e-mail address.  For example, to send the message to john.smith@boeing.com, “john.smith” would be entered in the TO field and “boeing.com” would be entered in the associated @ field. 

## **Command Buttons** 

Table 6-16 describes the E-Mail Reply display command buttons.  If neither condition is satisfied, then the button is not displayed. 

**Table 6-16  E-Mail Reply Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|SEND|Send<br>downlink|When all mandatory data is<br>entered or selected|When all mandatory data is entered<br>or selected but the downlink queue<br>is full or datalink is NO COMM|
|2|-|-|-|-|
|3|PRINT|Print|Always|-|
|4|RESET|Reset|Always|-|
|5|RETURN|Return|Always|-|
|6|EXIT|Exit|Always|-|



84 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **Review Log** 

When SEND is selected from this display, it becomes available for review in the COMPANY DOWNLINKS category on the REVIEW menu. 

## **6.2.2.2 Downlink Encoding Definition** 

When SEND is selected from this display, the following downlink encoding is used: 

- ACARS SMI: EML 

- ACARS Label: E1  Allowable Subnetworks: All 

- Downlink Priority: Flight Regularity 

- Downlink Buffer: MESSAGE  Delete at System Reset: Yes  Delete on Buffer Full: Yes 

Table 6-17 describes the E-Mail Reply downlink encoding definition, which is identical to the E- Mail Downlink encoding that Table 6-14 describes. 

**Table 6-17  E-Mail Reply Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|3|Always|EML|"Message Identifier"|
|3|2|Always|02|"Message Version"|
|4|10|Always|ENTERED_FLTNO|"Flight Number (XXXXXXXXXX)"|
|5|1|Always|/|"Delimiter"|
|6|2|Always|INIT_SKED_DATE|"Scheduled Date (DD)"|
|7|2|Always|CURRENT_DATE_TIME|"Current Date (DD)"|
|8|4|Always|CURRENT_DATE_TIME|"Current Time (HHMM)"|
|9|4|Always|INIT_ORIG_STA|"Origin Station (XXXX)"|
|10|4|Always|INIT_DEST_STA|"Destination Station (XXXX)"|
|11|2|Always|<CR><LF>|"Delimiter"|
|12|1-24|Always|EMAIL_DL_REPLY_TO_LOCAL|"To local address (1-24 characters)"|
|13|1|Always|,|"Delimiter"|
|14|1-24|Always|EMAIL_DL_REPLY_TO_DOMAIN|"To domain (1-24 characters)"|
|15|2|Always|<CR><LF>|"Delimiter"|
|16|1|Always|*|"CC 1 local address placeholder"|
|17|1|Always|,|"Delimiter"|
|18|1|Always|*|"CC 1 domain placeholder"|



85 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|19|2|Always|<CR><LF>|"Delimiter"|
|20|1|Always|*|"CC 2 local address placeholder"|
|21|1|Always|,|"Delimiter"|
|22|1|Always|*|"CC 2 domain placeholder"|
|23|2|Always|<CR><LF>|"Delimiter"|
|24|1|Always|*|"CC 3 local address placeholder"|
|25|1|Always|,|"Delimiter"|
|26|1|Always|*|"CC 3 domain placeholder"|
|27|2|Always|<CR><LF>|"Delimiter"|
|28|1-24|Always|EMAIL_DL_REPLY_SUBJECT|"Subject (1-24 characters)"|
|29|2|Always|<CR><LF>|"Delimiter"|
|30|1-24|Always|EMAIL_DL_REPLY_TXT_1|"Text line 1 (1-24 characters)"|
|31|2|Conditionally|<CR><LF>|"Delimiter"|
|32|1-24|Conditionally|EMAIL_DL_REPLY_TXT_2|"Text line 2 (1-24 characters)"|
|33|2|Conditionally|<CR><LF>|"Delimiter"|
|34|1-24|Conditionally|EMAIL_DL_REPLY_TXT_3|"Text line 3 (1-24 characters)"|
|35|2|Conditionally|<CR><LF>|"Delimiter"|
|36|1-24|Conditionally|EMAIL_DL_REPLY_TXT_4|"Text line 4 (1-24 characters)"|
|37|2|Conditionally|<CR><LF>|"Delimiter"|
|38|1-24|Conditionally|EMAIL_DL_REPLY_TXT_5|"Text line 5 (1-24 characters)"|
|39|2|Conditionally|<CR><LF>|"Delimiter"|
|40|1-24|Conditionally|EMAIL_DL_REPLY_TXT_6|"Text line 6 (1-24 characters)"|
|41|2|Conditionally|<CR><LF>|"Delimiter"|
|42|1-24|Conditionally|EMAIL_DL_REPLY_TXT_7|"Text line 7 (1-24 characters)"|
|43|2|Conditionally|<CR><LF>|"Delimiter"|
|44|1-24|Conditionally|EMAIL_DL_REPLY_TXT_8|"Text line 8 (1-24 characters)"|
|45|2|Conditionally|<CR><LF>|"Delimiter"|
|46|1-24|Conditionally|EMAIL_DL_REPLY_TXT_9|"Text line 9 (1-24 characters)"|



Note: The presence of each text line and its preceding <CR><LF> delimiter in a downlink message is conditional on the validity of that text line.  In other words, if text is not entered on a particular text line then that line and the preceding <CR><LF> delimiter are not present in the downlink message. 

Note: The formats of the E-Mail Downlink and the E-Mail Reply downlink are identical. 

## **Sample Message** 

```
QU RTNBOCR
.DDLXCXA 221953
EML
FI BO24/AN N7873BO
DT DDL BFI 221953 M67A
```

86 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

```
-  EML02     BOE24/22221953KBFIKLGB
TEST.ADDRESS,BOEING.COM
*,*
*,*
*,*
SUBJECT
TEXT LINE 1
TEXT LINE 2
TEXT LINE 3
```

## **6.2.2.3 Print Definition** 

Figure 6-13 shows the E-Mail Reply print definition. 

**==> picture [324 x 289] intentionally omitted <==**

**Figure 6-13  E-Mail Reply Print Definition** 

## **6.2.3 Message to Ground** 

The Message to Ground function enables the flight crew to send free-text messages to selected entities on the ground. 

87 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **6.2.3.1 Display Definition** 

Figure 6-14 shows the Message to Ground display definition. 

**==> picture [243 x 361] intentionally omitted <==**

**Figure 6-14  Message to Ground Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “MESSAGE TO GROUND” 

## **Main Area** 

Table 6-18 describes the Message to Ground display entry boxes. 

88 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**Table 6-18  Message to Ground Display Entry Boxes** 

|**Name**|**Mand**<br>**atory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|---|
|ADDRESS|Yes|7|XXXXXXX|||AGM_ADDR|
|TEXT|Yes|1-24|XXX…|||AGM_TEXT_1|
||No|1-24|XXX…|||AGM_TEXT_2|
||No|1-24|XXX…|||AGM_TEXT_3|
||No|1-24|XXX…|||AGM_TEXT_4|
||No|1-24|XXX…|||AGM_TEXT_5|
||No|1-24|XXX…|||AGM_TEXT_6|
||No|1-24|XXX…|||AGM_TEXT_7|
||No|1-24|XXX…|||AGM_TEXT_8|



The ADDRESS parameter is not reset after SEND is selected, although each TEXT parameter is.  The eight text entry boxes labeled TEXT, the first of which is mandatory, each allows up to 24 characters of text entry. 

## **Command Buttons** 

Table 6-19 describes the Message to Ground display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 6-19  Message to Ground Display Command Buttons** 

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

## **6.2.3.2 Downlink Encoding Definition** 

When SEND is selected from this display, the following downlink encoding is used: 

 ACARS SMI: A81 

D613Z019-06 89 of 378 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

- ACARS Label: 81 

- Allowable Subnetworks: All 

- Downlink Priority: Flight Regularity 

- Downlink Buffer: MESSAGE 

- Delete at System Reset: 

   - Yes 

- Delete on Buffer Full: Yes 

Table 6-20 describes the Message to Ground downlink encoding definition. 

**Table 6-20  Message to Ground Downlink Encoding Definition** 

|**#**|**Length**|**Inclusion**|**Content**|**Element Description**|
|---|---|---|---|---|
|1|10|Always|<seq_no><airline_ID><flight_no>|Standard ACARS downlink header|
|2|1|Always|/|"Delimiter"|
|3|7|Always|AGM_ADDR|"Ground Address (XXXXXXX)"|
|4|1|Always|.|"Delimiter"|
|5|1-24|Always|AGM_TEXT_1|"Text line 1 (1-24 characters)"|
|6|2|Conditionally|<CR><LF>|"Delimiter"|
|7|1-24|Conditionally|AGM_TEXT_2|"Text line 2 (1-24 characters)"|
|8|2|Conditionally|<CR><LF>|"Delimiter"|
|9|1-24|Conditionally|AGM_TEXT_3|"Text line 3 (1-24 characters)"|
|10|2|Conditionally|<CR><LF>|"Delimiter"|
|11|1-24|Conditionally|AGM_TEXT_4|"Text line 4 (1-24 characters)"|
|12|2|Conditionally|<CR><LF>|"Delimiter"|
|13|1-24|Conditionally|AGM_TEXT_5|"Text line 5 (1-24 characters)"|
|14|2|Conditionally|<CR><LF>|"Delimiter"|
|15|1-24|Conditionally|AGM_TEXT_6|"Text line 6 (1-24 characters)"|
|16|2|Conditionally|<CR><LF>|"Delimiter"|
|17|1-24|Conditionally|AGM_TEXT_7|"Text line 7 (1-24 characters)"|
|18|2|Conditionally|<CR><LF>|"Delimiter"|
|19|1-24|Conditionally|AGM_TEXT_8|"Text line 8 (1-24 characters)"|



Note: The presence of each text line and its preceding <CR><LF> delimiter in a downlink message is conditional on the validity of that text line.  In other words, if text is not entered on a particular text line then that line and the preceding <CR><LF> delimiter are not present in the downlink message. 

## **Sample Message** 

```
QU RTNBOCR FMCBOCR
.DDLXCXA 221804
A81
FI BO64/AN N7873BO
```

90 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

```
DT DDL BFI 221804 M30A
-  TEXT LINE 1
TEXT LINE 2
TEXT LINE 3
```

Note: In this sample message, the Ground Address is “FMCBOCR” (which is contained in the message header and determines the message routing). 

## **6.2.3.3 Print Definition** 

Figure 6-15 shows the Message to Ground print definition. 

**==> picture [323 x 289] intentionally omitted <==**

**Figure 6-15  Message to Ground Print Definition** 

91 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW
