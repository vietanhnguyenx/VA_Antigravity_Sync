## **2 Global Settings** 

This section describes the global settings for the CMF baseline AMI, which include function enables that allow an aircraft operator to enable and disable certain certified CMF operational software features. 

## **2.1 Start Display** 

The start display is the display that CMF shows when the COMPANY main menu item is selected.  The start display in the CMF baseline AMI is the Company Menu that Section 3.1 describes. 

## **2.2 ATC Enable** 

ATC applications are the FANS applications and the B1 applications. 

This option allows an aircraft operator to collectively enable or disable these applications (if, for example, it does not wish to train pilots to use them). 

In the CMF baseline AMI, this option is set to enable use of the ATC applications. 

## **2.3 FIS Enable** 

FIS applications are those defined in ARINC Specification 623, _Character-Oriented Air Traffic Service (ATS) Applications_ (and equivalent EUROCAE documents) to provide: 

- D-ATIS reports 

- Oceanic clearances 

- Departure clearances 

- Terminal Weather Information for Pilots (TWIP) reports 

- Expected taxi clearances 

- Pushback clearances 

This option allows an aircraft operator to enable or disable these applications (if, for example, it does not wish to subscribe to the associated services). 

In the CMF baseline AMI, this option is set to enable use of the FIS applications. 

27 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **2.4 Automatic Master Reset Enable** 

This option determines whether CMF automatically resets 10 minutes after the end of a flight (i.e., after the airplane has transitioned from the in-air state to the on-ground state and at least one door has been opened) in preparation for the next flight.  An automatic master reset clears all displays and message logs and also resets designated parameters to their default values. 

In the CMF baseline AMI, this option is set to enable automatic master resets. 

## **2.5 EICAS Memo Message Enable** 

787 provides Engine Indicating and Crew Alerting System (EICAS) memo messages to annunciate situations when the flight crew has disabled any of the very high frequency (VHF), satellite communications (SATCOM), and high frequency (HF) datalink subnetworks.  This option determines whether CMF instructs EICAS to display those messages when appropriate. 

In the CMF baseline AMI, this option is set to enable EICAS memo messages. 

## **2.6 Maximum Uplink Delay Timer Enable and Value** 

The maximum uplink delay timer function provides the ability for CMF to indicate to the flight crew that a FANS CPDLC uplink message has been delayed by more than a certain number of seconds.  (This function is inherent to B1 CPDLC uplink messages.) 

This option allows an aircraft operator to enable or disable this function, and, if it is enabled, what the default value is (which may be overwritten by the flight crew).  An entry of “0” in the AMI results in no default value. 

In the CMF baseline AMI, this option is set to enable the maximum uplink delay timer with no default value. 

## **2.7 Password Definition** 

The CMF baseline AMI sets the password for the DIAGNOSTICS display (which is accessed via DEBUG button on the COMM AUDIT display) to “GORDON”. 

Note: The CMF baseline AMI also sets the password for the AIRCRAFT PARAMETERS display (which is accessed via the A/C PARAMS button on the SENSOR STATUS display) to “GORDON”. 

Note:  The password must be entered into the scratchpad every time the display is accessed. 

28 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **2.8 Special Encodings** 

The CMF baseline AMI defines the three special encodings (reject downlinks) that Section 12.5 describes.  These encodings respectively indicate that CMF received an uplink which: 

- does not comply with the associated decoding definition; 

- is intended for a particular datalink end system but CMF cannot deliver the uplink to the end system; or 

- CMF is unable to process (for example, when it receives a printer uplink but the printer is unavailable). 

29 of 378 

D613Z019-06 

NEW 

ECCN: 7E994 **BOEING PROPRIETARY**
