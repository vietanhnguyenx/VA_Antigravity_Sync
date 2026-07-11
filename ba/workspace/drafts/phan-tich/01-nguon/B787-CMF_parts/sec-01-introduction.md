## **1 Introduction** 

The Communications Management Function (CMF) provides Aircraft Communications Addressing and Reporting System (ACARS) and Aeronautical Telecommunications Network (ATN) datalink capabilities to the Boeing 787 airplane. 

CMF also provides Air Traffic Control (ATC) datalink applications, including Controller-Pilot Data Link Communications (CPDLC) and Automatic Dependent Surveillance – Contract (ADS-C) applications for Future Air Navigation System (FANS) environments and the Baseline 1 (B1) CPDLC application for ATN environments, together with their respective datalink initiation applications.  CMF also provides Flight Information Services (FIS) applications for Digital Automated Terminal Information Service (D-ATIS) reports, oceanic clearances, and other similar reports and clearances.  For the 787, Boeing defines these collective Air Traffic Services (ATS) capabilities in the certified CMF operational software and the capabilities are standard for all aircraft operators. 

CMF does, however, offer the capability for aircraft operators to customize uplink message decoding, downlink message encoding, display format, print format, and related definitions for an Aeronautical Operational Communications (AOC) / Aeronautical Administrative Communications (AAC) datalink application (also known as the “Company” datalink application), as well as datalink routing definitions for the ATS (ATC and FIS) and AOC/AAC applications. This capability is implemented in a CMF Airline Modifiable Information (AMI) file that is created using the Ground-Based Software Tool (GBST).  In order to support 787 airplane production, Boeing has developed a series of CMF “baseline” AMIs with generic functionality.  There are two CMF baseline AMI configurations: 

- Configuration 1 (Config 1) is a 787-8 CMF baseline AMI for CMF operational software versions before Block Point version (BPv) 2. 

- Configuration 2 (Config 2) is a 787-8, 787-9, and 787-10 CMF baseline AMI for CMF operational software versions including and after BPv2. 

A 787 aircraft operator may choose to: 

- use the Boeing CMF baseline AMI; 

- use a Boeing CMF “service ready” AMI, which is designed to prefer a specific datalink service provider (DSP) with specific datalink options; 

- request Boeing (or a third party) to construct a partially or completely customized CMF AMI using GBST; or 

- construct a partially or completely customized CMF AMI itself using GBST. 

This document describes the Boeing CMF baseline AMI, specifically the CMF baseline AMI version F001 that Section 1.2 references. 

20 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **1.1 CMF AMI Components and Functions** 

A CMF AMI is composed the following types of components: 

- Dataset, which includes global settings for: 

   - Function enables 

   - System-generated reject messages 

- Uplink message decoding definitions 

- Downlink message encoding definitions 

- Display definitions 

- Print definitions 

- Logic units 

- Review logs definition 

- Downlink buffers definition 

- Customer parameter database 

- ACARS end system uplink routing and downlink label tables 

- Datalink options, which includes: 

   - Geographic region tables 

   - Timers, counters, and enables 

   - Subnetwork preference table 

In general, one or more components provide specific AMI functions.  For example, for the Out, Off, On, In (OOOI) Reports function a logic unit component detects OOOI events and encoding definition components define a downlink message for each event.  As another example, for the Free-Text Uplink function a decoding definition component defines the uplink message and a display definition component displays the content of the message. 

This document is organized based on the specific functions that the AMI provides and on the supporting components that the AMI contains. 

## **1.1.1 Logic Units** 

CMF executes logic units once per second in the order defined in the AMI, specifically in this order for the baseline AMI: 

- Parameters processing (Section 12.3.1) 

- Automatic emergency detection (Section 9.4.1) 

21 of 378 

D613Z019-06 

NEW 

ECCN: 7E994 **BOEING PROPRIETARY** 

- Automatic emergency reporting (Section 9.4.2) 

- OOOI state (Section 9.6.1) 

- OOOI events (Section 9.6.2) 

- Airports processing (Section 12.1.1) 

- Reminders (Section 10.2) 

- Automatic position reporting (Section 9.5.1) 

- Automatic diversion reporting (Section 9.3.1) 

- Airplane Heath Management (AHM) flight phase reporting (Section 9.1.1) 

- Notices to Airmen (NOTAMs) Request display SEND button (Section 5.2.1.2) 

- ACARS-over-IP (AoIP) link advisories (Section 9.2.1) 

- Plain Old ACARS (POA) autotune (Section 12.4.2) 

- End of flight processing (Section 12.2.1) 

## **1.2 Config 2 CMF Baseline AMI Part Numbers** 

Table 1-1 lists the Config 2 CMF baseline AMI part numbers along with the target CMF operational software and other relevant information. 

22 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**Table 1-1  Config 2 CMF Baseline AMI Part Numbers** 

|**Black Label LSAP**|**Description**|**Target CCS**<br>**Hardware**|**Version**|**Type**|**Target CMF Operational**<br>**Software**|**GBST / IPDB**|**Description**<br>**Document**|
|---|---|---|---|---|---|---|---|
|BCG28-U000-0083|23 CMF AMI|CCR L8, R8|B000|CFG21307|BPv2 (HNP5E-AL21-5003)<br>BPv2A (HNP55-AL21-5008)<br>BPv2B (HNP54-AL21-5009)|PS4092978-905 /<br>PS4092983-902|D613Z019-01<br>Rev B|
|BCG2F-U000-0084|23 CMF AMI<br>UADF DB|GGM L1, L2,<br>R1, R2||||||
|BCG23-U000-0123|23 CMF AMI|CCR L8, R8|B001|CFG21408|BPv2.5 (HNP5B-AL21-5006)|PS4092978-A06 /<br>PS4092983-902|D613Z019-01<br>Rev C|
|BCG24-U000-0124|23 CMF AMI<br>UADF DB|GGM L1, L2,<br>R1, R2||||||
|BCG29-U000-0291|23 CMF AMI|CCR L8, R8|B002|CFG21505|BPv3 (HNP5A-AL21-5007)|PS4092978-906a /<br>PS4092983-902|D613Z019-01<br>Rev D|
|BCG2A-U000-0292|23 CMF AMI<br>UADF DB|GGM L1, L2,<br>R1, R2||||||
|BCG4D-U000-05R9|23 CMF AMI|CCR L8, R8|D001|2017NOV|BPv5 (HNP5D-AL21-5011)|PS4092978-907 /<br>PS4092983-903|D613Z019-01<br>Rev E|
|BCG45-U000-05S0|23 CMF AMI<br>UADF DB|GGM L1, L2,<br>R1, R2||||||
|BCG47-8CMF-A000|23 CMF AMI|CCR L8, R8|D002|2018OCT|||D613Z019-01<br>Rev F|
|BCG53-8CMF-U000|23 CMF AMI<br>UADF DB|GGM L1, L2,<br>R1, R2||||||
|BCG42-8CMF-A005|23 CMF AMI|CCR L8, R8|D003|2018DEC|||D613Z019-01<br>Rev G|
|BCG56-8CMF-U005|23 CMF AMI<br>UADF DB|GGM L1, L2,<br>R1, R2||||||
|BCG47-8CMF-A011|23 CMF AMI|CCR L8, R8|E001|2019APR|BPv6 (HNP5E-AL21-5012)||D613Z019-01<br>Rev H|
|BCG53-8CMF-U011|23 CMF AMI<br>UADF DB|GGM L1, L2,<br>R1, R2||||||
|BCG44-8CMF-A012|23 CMF AMI|CCR L8, R8|E002|2019JUN||||
|BCG50-8CMF-U012|23 CMF AMI<br>UADF DB|GGM L1, L2,<br>R1, R2||||||



23 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

|**Black Label LSAP**|**Description**|**Target CCS**<br>**Hardware**|**Version**|**Type**|**Target CMF Operational**<br>**Software**|**GBST / IPDB**|**Description**<br>**Document**|
|---|---|---|---|---|---|---|---|
|BCG45-8CMF-A013|23 CMF AMI|CCR L8, R8|F001|2020SEP|BPv6 (HNP5E-AL21-5012)|PS4092978-908 /<br>PS4092983-903|D613Z019-06<br>NEW|
|BCG51-8CMF-U013|23 CMF AMI<br>UADF DB|GGM L1, L2,<br>R1, R2||||||



Note: CMF BPv4 software (HNP5C-AL21-5010) did not cause development of a new CMF baseline AMI. 

24 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **1.3 Significant Changes** 

Significant changes made from CMF baseline AMI version E002 to version F001 include the following: 

- Enhanced diversion report display to include fuel at diversion station and “ENROUTE WEATHER”, “DESTINATION WEATHER”, and “SECURITY” diversion reasons 

- Enhanced diversion report downlink (version 2) to include standard initialized destination airport in message header and also diversion station and fuel at diversion station in message body 

- Added automatic diversion report logic and downlink 

- Added logic to send Airplane Health Management (AHM) flight phase report downlink at OOOI events, diversion event, and flight initialization event 

- Added fuel on board, fuel at destination, and ETA at destination to AHM flight phase report downlink 

- Added logic for CMF origin and destination airports to more closely follow FMF origin and destination airports as appropriate 

- Corrected logic that calculates block fuel 

- Changed “DEPARTURE STATION” to “ORIGIN STATION” on flight initialization displays and print formats (for consistency with Flight Management Function [FMF] and CMF ATC displays) 

- Disabled AoIP link advisory downlink by default 

- Updated VHF region definitions, including addition of Andaman Islands region 

## **1.4 Message Viewing** 

Messages that a CMF AMI defines to be viewable (i.e., to have an associated display) are viewable in the NEW MESSAGES and REVIEW menus that are respectively accessible via the NEW MESSAGES and REVIEW main menu items. 

CMF places a display referenced by an uplink decoding in the NEW MESSAGES menu when it receives the uplink message.  CMF also places a display referenced by a logic unit in the NEW MESSAGES menu when it executes the associated logic (such as the Reminders function logic that Section 9.6 describes). 

CMF moves a display that is defined to be accessible in a REVIEW menu category from the NEW MESSAGES menu to a category in the REVIEW menu when it has displayed an associated uplink message that does not require an ACCEPT or REJECT response or when the 

25 of 378 

D613Z019-06 

NEW 

ECCN: 7E994 

**BOEING PROPRIETARY** 

flight crew has selected ACCEPT or REJECT for an associated uplink message that does require an ACCEPT or REJECT response.  Additionally, CMF places a display that references a downlink encoding and is defined to be accessible in a REVIEW menu category when the flight crew has selected SEND for the associated downlink message. 

Note: The ACCEPT, CANCEL, and REJECT glareshield buttons are reserved for use by the ATS applications; the flight crew cannot use them to respond to AMI-defined messages. 

Section 13.5 describes the REVIEW menu categories that the CMF baseline AMI defines in the Review Logs component and also lists which displays are assigned to which REVIEW menu categories (if any). 

## **1.5 CMF Baseline AMI Functions** 

The following sections in this document describe the functions that the CMF baseline AMI provides and also the supporting components that the AMI contains. 

Note: As defined in the CMF baseline AMI with default values, the Automatic Position Report function that Section 9.5 describes meets the requirements for International Civil Aviation Organization (ICAO) “4D/15” normal aircraft tracking. 

26 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW
