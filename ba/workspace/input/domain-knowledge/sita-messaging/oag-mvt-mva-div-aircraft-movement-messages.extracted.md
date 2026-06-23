**==> picture [82 x 47] intentionally omitted <==**

# MVT / MVA / DIV Aircraft Movement Messages **Data Elements and Message Examples** 

**==> picture [284 x 285] intentionally omitted <==**

MAKE SMARTER MOVES 

**==> picture [74 x 42] intentionally omitted <==**

## MVT, MVA, DIV Message Types 

## **1. MVT and MVA Message types:** 

As per the AHM, Aircraft Movement Messages serve the purpose of controlling punctual and regular operation of all flights and are also the basis for aircraft and crew rotation. 

The MVT and MVA message types that can be sent are as follows: 

- Departure Messages 

- Arrival Messages 

- Delay Messages 

- Delayed Take-Off Messages 

- Return to Ramp Messages 

- Return to Airborne Messages 

- Revised Estimated Time of Arrival Messages 

- Arrival Taxi Time Variance Information Messages 

## **2. DIV Message types:** 

As per the AHM, DIVs are used to notify the occurrence of in-flight diversions to the airline control centre and on-route stations. 

The DIV message types that can be sent are as follows: 

- Diversion Messages 

- 1 - 

**==> picture [74 x 42] intentionally omitted <==**

## MVT and MVA Message Type Data Elements 

As per the AHM, the MVT and MVA message data elements that can be supplied are as follows: 

**= information starts on next line down**  **= information goes on the same line as above** 

## **DEPARTURE Messages:** 

These are the data elements which can be supplied in a Departure Message.  They include any mandatory, conditional and optional elements – note all times on MVT/MVA messages are sent in UTC. 

## **Mandatory elements to be supplied on ALL MVT/MVA messages:** 

- 

 

 

 

 

|**Elements**<br>**What is it used for**<br>**Standard Message Identifier: **This is used to signify the<br>Standard of message being sent<br>**Flight Identifier:**<br>This is used to determine which<br>flight is going to be changed<br>**Aircraft registration:**<br>This is the registration number<br>the aircraft has been given<br>**Airport of movement:**<br>This is the airport at which the<br>movement of the schedule is taking<br>place –**DEPARTURE**airport<br>**Departure Message specific elements:**<br>**Elements**<br>**What is it used for**<br>**1. Departure Information:**<br> **a. Departure Identifier:**<br>This is used to signify the type of<br>message being sent<br> **b. Off-Block Time:**<br>This is used to signify the time at<br>which the aircraft leaves the terminal<br> **c. Airborne Time:**<br>This is used to signify the time at<br>which the aircraft takes off<br>**2. Estimated Arrival**<br> **(Touchdown) information:**<br>This is used to signify the estimated<br>time of arrival at the intended apt of<br>destination|**Data to be supplied**<br>**M/C/O**<br>MVA or MVT<br> **M**<br>Designator, Flt Number**M**<br>and Scheduled UTC date<br>of Departure –<br>E.g.**BA100/27**<br>2-10 printable character - **M**<br>e.g. **.PPVMU**<br>IATA three-letter code**M**<br>preceded by a full stop -<br>e.g.**.LTN**<br>**Data to be supplied**<br>**M/C/O**<br>Identifier**AD**<br> **M**<br>Four digit time group or**M** <br>six digit date and time<br>group –<br>E.g.**AD1200 or AD271200**<br>Four digit time group or**O**<br>six digit date and time<br>group preceded by an<br>oblique –<br>E.g.**AD/1200 or**<br>**AD/271200**<br>Identifier EA followed<br> **C**<br>by four digit time group,<br>space and airport of<br>destination –<br>e.g.**EA1244 STN**|
|---|---|
|<br>**Elements**<br>**1. Departure Information:**<br> **a. Departure Identifier:**<br> **b. Off-Block Time:**<br> **c. Airborne Time:**<br>**2. Estimated Arrival**<br> **(Touchdown) information:**||



- 2 - 

**==> picture [74 x 42] intentionally omitted <==**

|<br>|**DEPARTURE Messages (continued):**<br>**Elements**<br>**What is it used for**<br>**Data to be supplied** **M/C/O **<br>**3. Actual Delay Information:**<br>**a. Delay identifier:**<br>This is used to signify a delay is<br>Identifier**DL**<br> **C**<br>taking place<br>**b. Delay reason codes:**<br>This is used to signify the reason why<br>**1 delay code**– 2 character**C**<br>a delay has taken place by using an<br>delay code, followed by an<br>AHM delay reason code, and how<br>oblique and four digit<br>long the delay will take – up to two<br>group to show duration of<br>delay codes can be supplied<br>delay (hhmm) –<br>e.g.**DL72/0015**<br>**2 delay codes **- 2 character**C**<br>delay code for each delay<br>and four digit time group<br>for duration of each delay –<br>e.g.**DL64/72/0015/0020**<br>**4. Passenger Information:**<br>This is used to signify the amount of<br>Identifier PX followed by**O**<br>seats occupied by passengers per<br>by the number of seats<br>destination<br>occupied by passengers<br>per destination –<br>e.g.**PX112**or**PX12/134/10**<br>**5. Reclearance information:**<br>This is used to signify if there has been  Identifier RC followed by**O**<br>reclearance issued for a flight and the<br>four digit time group of the<br>this will take place<br>time at reclearance point,<br>space and airport of<br>reclearance –<br>e.g.**RC1200 LTN**<br>**6. Estimated On-block Time:** This is used to signify the estimated       Identifier EB followed by**O**<br>time at which the aircraft is expected<br>four digit UTC time group<br>to reach the terminal<br>e.g.**EB1200**<br>**7. Flight Leg Date indicator:**<br>This is used to signify UTC scheduled<br>Identifier FLD followed by**O**<br>date of departure for Flight Leg<br>two digit to show day of<br>month.<br>e.g.**FLD16**<br>**8. Extra Delay Information:**<br>**a. Extra delay identifier:**<br>This is used to signify an additional<br>Identifier**EDL**<br>**O**<br>delay(s) is taking place, further to the<br>original delay.<br>**b. Extra delay reason codes:**This is used to signify the reason why<br>**1 delay code**– 2 character**O**<br>an additional delay(s) has taken place  delay code, followed by an<br>by using an AHM delay reason code,<br>oblique and four digit|
|---|---|



- 3 - 

**==> picture [74 x 42] intentionally omitted <==**

and how long the delay will take – up to two Extra delay codes can be supplied 

group to show duration of delay (hhmm) – e.g. **DL72/0015** 

**2 delay codes** - 2 character **O** delay code for each delay and four digit time group for duration of each delay – e.g. **DL64/72/0015/0020** 

## **DEPARTURE Messages (continued):** 

## **Elements What is it used for** 

## **Data to be supplied M/C/O** 

**9. Crew Report Time:** This is used to signify the time at Identifier CRT followed **O** which the airline cabin and flight deck by the four digit UTC report in for duty - if flight deck and time group, or six digit crew cabin crew times are both UTC date/time group - required, the flight deck will be shown e.g. **CRT1530, CRT041530** first and should be separated by and or **CRT041530/041540** oblique **10. Movement after Pushback:** This is used to signify the time at Identifier MAP followed **O** the aircraft starts to move forward by the four digit UTC towards the runway after pushing back  time group, or six digit from the terminal UTC date/time group – e.g. **MAP1530** or **MAP041530 11. Sub Delay Code:** This is used to further define Delay and  Identifier DLA followed **O** Extra delay information, which has by 2-3 characters per already been supplied early in the delay code separated by message, by using an AHM delay a slash - reason code – a maximum of four e.g. **DLA841/812/932/652** codes can be supplied **12. Take Off Fuel:** This is used to signify the amount of Identifier TOF followed **O** fuel the aircraft is holding upon by 4-6 numeric characters take off e.g. **TOF6400 13. Take Off Weight:** This is used to signify the weight of Identifier TOW followed **O** the complete aircraft upon take off by 5-6 numeric characters e.g. **TOW63452 14. Zero Fuel Weight:** This is used to signify the weight of Identifier ZFW followed **O** the aircraft only, without the fuel by 5-6 numeric characters weight e.g. **ZFW132500 15. Category of Operation:** This is used to signify **(Landing Capability)** 

- 4 - 

**==> picture [74 x 42] intentionally omitted <==**

## **ARRIVAL Messages:** 

These are the data elements which can be supplied in an Arrival Message.  They include any mandatory, conditional and optional elements – note all times on MVT/MVA messages are sent in UTC. 

|<br>|**Mandatory elements to be supplied on ALL MVT/MVA messages:**<br>**Elements**<br>**What is it used for**<br>**Data to be supplied** **M/C/O **<br>**Standard Message Identifier: **This is used to signify the<br>MVA or MVT<br> **M**<br>Standard of message being sent<br>**Flight Identifier:**<br>This is used to determine which<br>Designator, Flt Number**M**<br>flight is going to be changed<br>and Scheduled UTC date<br>of Departure –<br>E.g.**BA100/27**<br>**Aircraft registration:**<br>This is the registration number<br>2-10 printable character - **M**<br>the aircraft has been given<br>e.g. **.PPVMU**<br>**Airport of movement:**<br>This is the airport at which the<br>IATA three-letter code**M**<br>movement of the schedule is taking<br>preceded by a full stop -<br>place –**ARRIVAL**airport<br>e.g.**.LTN**|**Mandatory elements to be supplied on ALL MVT/MVA messages:**<br>**Elements**<br>**What is it used for**<br>**Data to be supplied** **M/C/O **<br>**Standard Message Identifier: **This is used to signify the<br>MVA or MVT<br> **M**<br>Standard of message being sent<br>**Flight Identifier:**<br>This is used to determine which<br>Designator, Flt Number**M**<br>flight is going to be changed<br>and Scheduled UTC date<br>of Departure –<br>E.g.**BA100/27**<br>**Aircraft registration:**<br>This is the registration number<br>2-10 printable character - **M**<br>the aircraft has been given<br>e.g. **.PPVMU**<br>**Airport of movement:**<br>This is the airport at which the<br>IATA three-letter code**M**<br>movement of the schedule is taking<br>preceded by a full stop -<br>place –**ARRIVAL**airport<br>e.g.**.LTN**|
|---|---|---|
||<br>**Elements**<br>**Standard Message Identifier: **<br>**Flight Identifier:**<br>**Aircraft registration:**<br>**Airport of movement:**|<br>**What is it used for**<br>This is used to signify the<br>Standard of message being sent<br>This is used to determine which<br>flight is going to be changed<br>This is the registration number<br>the aircraft has been given<br>This is the airport at which the<br>movement of the schedule is taking<br>place –**ARRIVAL**airport|



||<br> <br>movement of the schedule is taking<br>place –**ARRIVAL**airport|preceded by a full stop -<br>e.g.**.LTN**|
|---|---|---|
| <br> <br>|**Arrival Message specific elements:**<br>**Elements**<br>**What is it used for**<br>**1. Arrival Information:**<br>**a. Arrival Identifier:**<br>This is used to signify the type of<br>message being sent<br> **b. Touch-down time:**<br>This is used to signify the time at<br>which the aircraft touches down on<br>the runway<br>  **c. On-block time:**<br>This is used to signify the time at<br>which the aircraft arrives at the<br>terminal<br>**d. Flight Leg Date Indicator**This is used to signify the UTC<br>Scheduled Date of departure for<br>flight leg|**Data to be supplied** **M/C/O **<br>Identifier**AA**<br> **M**<br>Four-digit time group<br> **O**<br>or six-digit date/time<br>group<br>e.g.**AA1200 or AA271200**<br>Four-digit time group<br>**O**<br>or six-digit date/time<br>group preceded by an<br>oblique<br>e.g.**AA/1200 or AA/271200**<br>**&**when combined with<br>touch-down time<br>**AA1200/1210 or**<br>**AA271200/271210**<br>Identifier FLD followed**O**<br>by two digits UTC<br>scheduled date of departure<br>e.g.**FLD03**|
||**1.**<br> <br> <br>  <br>||



- 5 - 

**==> picture [74 x 42] intentionally omitted <==**

## **DELAY Messages:** 

These are the data elements which can be supplied in a Delay Message.  They include any mandatory, conditional and optional elements – note all times on MVT/MVA messages are sent in UTC. 

## **Mandatory elements to be supplied on ALL MVT/MVA messages:** 

|<br>|**Elements**<br>**Standard Message Identifier: **<br>**Flight Identifier:**<br>**Aircraft registration:**<br>**Airport of movement:**|**What is it used for**<br>This is used to signify the<br>Standard of message being sent<br>This is used to determine which<br>flight is going to be changed<br>This is the registration number<br>the aircraft has been given<br>This is the airport at which the<br>movement of the schedule is taking<br>place –**DEPARTURE**airport|**Data to be supplied** **M/C/O **<br>MVA or MVT<br> **M**<br>Designator, Flt Number**M**<br>and Scheduled UTC date<br>of Departure –<br>E.g.**BA100/27**<br>2-10 printable character - **M**<br>e.g. **.PPVMU**<br>IATA three-letter code**M**<br>preceded by a full stop -<br>e.g.**.LTN**|**M/C/O **|
|---|---|---|---|---|



## **Delay Message specific elements:** 

|**Elements**<br>**1. Estimated Departure time**<br> **Information:**<br>**OR**<br>**2. Next Information:**|**What is it used for**<br>This is used to signify the estimated<br>departure time of a delayed flight<br>This is used instead of Element 1 to<br>indicate date/time when further<br>information will be given in case of<br>indefinite delay|**Data to be supplied** **M/C/O**<br>Identifier ED followed<br>**C** <br>by two numerical digits<br>indicate the UTC date<br>and four numerical digits<br>for the UTC time group<br>of the event –<br>e.g.**ED041630**<br>Identifier NI is followed**C**<br>by two numerical digits<br>to indicate the UTC date<br>and the four numerical<br>digit for the UTC time<br>time of the event –<br>e.g.**NI052215**|**M/C/O**|
|---|---|---|---|
|**1. **<br>  <br>**2.**||||



 

**3. Delay Reason Information: a. Delay identifier:** This is used to signify a delay is Identifier **DL O** taking place **b. Delay reason codes:** This is used to signify the reason why **1 delay code** – 2 character a delay has taken place by using an delay code, followed by an AHM delay reason code, and how oblique and four digit long the delay will take – up to two group to show duration of delay codes can be supplied delay (hhmm) – E.g. **DL72/0015** 

**2 delay codes** - 2 character **O** delay code for each delay and four digit time group for duration of each delay – 

- 6 - 

**==> picture [74 x 42] intentionally omitted <==**

e.g. **DL64/72/0015/0020** 

## **DELAY Messages (continued):** 

**Elements What is it used for Data to be supplied M/C/O 4. Flight Leg Date Indicator:** This is used to signify the UTC Identifier FLD followed **O** Scheduled Date of departure for by two digits UTC flight leg scheduled date of departure e.g. **FLD03 5. Extra Delay Information: a. Extra delay identifier:** This is used to signify an additional Identifier **EDL O** delay(s) is taking place, further to the original delay.  **b. Extra delay reason codes:** This is used to signify the reason why **1 delay code** – 2 character **O** an additional delay(s) has taken place  delay code, followed by an by using an AHM delay reason code, oblique and four digit and how long the delay will take group to show duration of – up to two Extra delay codes can delay (hhmm) – be supplied e.g. **EDL72/0015 2 delay codes** - 2 character **O** delay code for each delay and four digit time group for duration of each delay – e.g. DLA6 **4/72/0015/0020 6. Sub Delay Code:** This is used to further define Delay and  Identifier DLA followed **O** Extra delay information, which has by 2-3 characters per already been supplied early in the delay code separated by message, by using an AHM delay a slash - reason code – a maximum of four e.g. **DLA841/812/932/652** codes can be supplied 

**DELAYED TAKE-OFF Messages:** 

- 7 - 

**==> picture [74 x 42] intentionally omitted <==**

These are the data elements which can be supplied in a Delay Take-Off Message.  They include any mandatory, conditional and optional elements – note all times on MVT/MVA messages are sent in UTC. 

## **Mandatory elements to be supplied on ALL MVT/MVA messages:** 

|<br><br><br><br><br><br>|**Elements**<br>**Standard Message Identifier: **<br>**Flight Identifier:**<br>**Aircraft registration:**<br>**Airport of movement:**<br>**Delayed Take-Off Message**|**What is it used for**<br>This is used to signify the<br>Standard of message being sent<br>This is used to determine which<br>flight is going to be changed<br>This is the registration number<br>the aircraft has been given<br>This is the airport at which the<br>movement of the schedule is taking<br>place –**DEPARTURE**airport<br>**specific elements:**<br>**What is it used for**<br>This is used to signify the type of<br>message being sent<br>This is used to signify the time at<br>which the aircraft leaves the terminal<br>This is used to signify the type of<br>message being sent<br>This is used to signify the estimated<br>time at which the aircraft is expected<br>to take-off<br>This is used to signify the estimated<br>time of arrival at the intended apt of<br>destination|**Data to be supplied** **M/C/O **<br>MVA or MVT<br> **M**<br>Designator, Flt Number**M**<br>and Scheduled UTC date<br>of Departure –<br>E.g.**BA100/27**<br>2-10 printable character - **M**<br>e.g. **.PPVMU**<br>IATA three-letter code**M**<br>preceded by a full stop -<br>e.g.**.LTN**<br>**Data to be supplied** **M/C/O**<br>Identifier**AD**<br> **C**<br>Four digit time group or**C** <br>six digit date and time<br>group –<br>E.g.**AD1200 or AD271200**<br>Identifier**EO**<br>**C**<br>Four digit time group<br> **C**<br>e.g.**EO1310**<br>Identifier EA followed<br> **O**<br>by four digit time group,<br>space and airport of<br>destination –<br>e.g.**EA1244 STN**|
|---|---|---|---|
||<br>**Elements**<br>**1. Departure Information:**<br> **a. Departure Identifier:**<br> **b. Off-Block Time:**<br>**2. Estimated Take-Off** <br> **Information:**<br>**a. Estimated Take-Off**<br>**information:**<br>**b. Estimated Take-Off**<br>**time**<br>**3. Estimated Arrival**<br> **(Touchdown) information: **|||



- 8 - 

**==> picture [74 x 42] intentionally omitted <==**

## **DELAYED TAKE-OFF Messages (continued):** 

|<br>|**Elements**<br>**What is it used for**<br>**4. Delay Information:** <br> <br> <br> **a. Delay identifier:**<br>This is used to signify a delay is<br>taking place<br>**b. Delay reason codes:**<br>This is used to signify the reason why<br>a delay has taken place by using an<br>AHM delay reason code, and how<br>long the delay will take – up to two<br>delay codes can be supplied<br>**5. Estimated On-block Time:** This is used to signify the estimated<br>**O**<br>time at which the aircraft is expected<br>to reach the terminal<br>**6. Flight Leg Date Indicator:**<br>This is used to signify UTC scheduled<br>date of departure for Flight Leg<br>**7. Extra Delay Information:**<br>**a. Extra delay identifier:**<br>This is used to signify an additional<br>delay(s) is taking place, further to the<br>original delay.<br>**b. Extra delay reason codes:**This is used to signify the reason why<br>an additional delay(s) has taken place<br>by using an AHM delay reason code,<br>and how long the delay will take<br>– up to two Extra delay codes can<br>be supplied<br>**8. Sub Delay Code:**<br>This is used to further define Delay and<br>Extra delay information, which has<br>already been supplied early in the<br>message,by using an AHM delay<br>reason code– a maximum of four<br>codes can be supplied|**Data to be supplied** **M/C/O**<br>Identifier**DL** **O**<br>**1 delay code**– 2 character**O**<br>delay code, followed by an<br>oblique and four digit<br>group to show duration of<br>delay (hhmm) –<br>e.g.**DL72/0015**<br>**2 delay codes **- 2 character**O**<br>delay code for each delay<br>and four digit time group<br>for duration of each delay –<br>e.g.**DL64/72/0015/0020**<br>Identifier EB followed by<br>four digit UTC time group<br>e.g.**EB1200**<br>Identifier FLD followed by**O**<br>two digit to show day of<br>month.<br>e.g.**FLD16**<br>Identifier**EDL**<br>**O**<br>**1 delay code**– 2 character**O**<br>delay code, followed by an<br>oblique and four digit<br>group to show duration of<br>delay (hhmm) –<br>e.g. E**DL72/0015**<br>**2 delay codes **- 2 character**O**<br>delay code for each delay<br>and four digit time group<br>for duration of each delay –<br>e.g. E**DL64/72/0015/0020**<br>Identifier DLA followed**O**<br>by 2-3 characters per<br>delay code separated by<br>a slash -<br>e.g.**DLA841/812/932/652**|
|---|---|---|



## **RETURN TO RAMP Messages:** 

These are the data elements which can be supplied in a Return to Ramp Message.  They include any mandatory, conditional and optional elements – note all times on MVT/MVA messages are sent in UTC. 

- 9 - 

**==> picture [74 x 42] intentionally omitted <==**

|<br><br><br><br>|**Mandatory elements to be supplied on ALL MVT/MVA messages:**<br>**Elements**<br>**What is it used for**<br>**Data to be supplied** **M/C/O **<br>**Standard Message Identifier: **This is used to signify the<br>MVA or MVT<br> **M**<br>Standard of message being sent<br>**Flight Identifier:**<br>This is used to determine which<br>Designator, Flt Number**M**<br>flight is going to be changed<br>and Scheduled UTC date<br>of Departure –<br>E.g.**BA100/27**<br>**Aircraft registration:**<br>This is the registration number<br>2-10 printable character - **M**<br>the aircraft has been given<br>e.g. **.PPVMU**<br>**Airport of movement:**<br>This is the airport at which the<br>IATA three-letter code**M**<br>movement of the schedule is taking<br>preceded by a full stop -<br>place –**DEPARTURE**airport<br>e.g.**.LTN**<br>**Return to Ramp Message specific elements:**<br>**Elements**<br>**What is it used for**<br>**Data to be supplied** **M/C/O**<br>**1. Departure Information:**<br> **a. Departure Identifier:**<br>This is used to signify the type of<br>Identifier**AD** **C**<br>message being sent<br> **b. Off-Block Time:**<br>This is used to signify the time at<br>Four digit time group or**C** <br>which the aircraft leaves the terminal<br>six digit date and time<br>group –<br>E.g.**AD1200 or AD271200**<br>**2. Return to Ramp**<br> **Information:**<br>**a. Return to Ramp Identifier:** This is used to signify the type of<br>Identifier**RR                           C**<br>message being sent<br> **b. Return to Ramp Time:**<br>This is to signify the time at which<br>Four digit time group**O**<br>the aircraft has been forced to return<br>e.g.**RR1230**<br>**3. Original Delay Information:** <br> <br>**a. Delay identifier:**<br>This is used to signify a delay is<br>Identifier**DL** **O**<br>taking place<br>**b. Delay reason codes:**<br>This is used to signify the reason why<br>**1 delay code**– 2 character**O**<br>a delay has taken place by using an<br>delay code, followed by an<br>AHM delay reason code, and how<br>oblique and four digit<br>long the delay will take – up to two<br>group to show duration of<br>delay codes can be supplied<br>delay (hhmm) –<br>e.g.**DL72/0015**<br>**2 delay codes **- 2 character**O**<br>delay code for each delay<br>and four digit time group<br>for duration of each delay –<br>e.g.**DL64/72/0015/0020**|
|---|---|
||<br>**Elements**<br>**What is it used for**<br>**Standard Message Identifier: **This is used to signify the<br>Standard of message being sent<br>**Flight Identifier:**<br>This is used to determine which<br>flight is going to be changed<br>**Aircraft registration:**<br>This is the registration number<br>the aircraft has been given<br>**Airport of movement:**<br>This is the airport at which the<br>movement of the schedule is taking<br>place –**DEPARTURE**airport<br>**Return to Ramp Message specific elements:**<br>**Elements**<br>**What is it used for**<br>**1. Departure Information:**<br> **a. Departure Identifier:**<br>This is used to signify the type of<br>message being sent<br> **b. Off-Block Time:**<br>This is used to signify the time at<br>which the aircraft leaves the terminal<br>**2. Return to Ramp**<br> **Information:**<br>**a. Return to Ramp Identifier:** This is used to signify the type of<br>message being sent<br> **b. Return to Ramp Time:**<br>This is to signify the time at which<br>the aircraft has been forced to return<br>**3. Original Delay Information:** <br> <br>**a. Delay identifier:**<br>This is used to signify a delay is<br>taking place<br>**b. Delay reason codes:**<br>This is used to signify the reason why<br>a delay has taken place by using an<br>AHM delay reason code, and how<br>long the delay will take – up to two<br>delay codes can be supplied|



## **RETURN TO RAMP Messages (continued):** 

**What is it used for** 

**Data to be supplied M/C/O** 

**Elements** 

- 10 - 

**==> picture [74 x 42] intentionally omitted <==**

**5. Estimated On-block Time:** This is used to signify the estimated Identifier EB followed by **O** time at which the aircraft is expected four digit UTC time group to reach the terminal e.g. **EB1200 6. Flight Leg Date Indicator:** This is used to signify UTC scheduled Identifier FLD followed by **O** date of departure for Flight Leg two digit to show day of month. e.g. **FLD16** 

## **RETURN FROM AIRBORNE Messages:** 

These are the data elements which can be supplied in a Return from Airborne Message.  They include any mandatory, conditional and optional elements – note all times on MVT/MVA messages are sent in UTC. 

- 11 - 

**==> picture [74 x 42] intentionally omitted <==**

## **Mandatory elements to be supplied on ALL MVT/MVA messages:** 

|<br>|**Elements**<br>**Standard Message Identifier: **<br>**Flight Identifier:**<br>**Aircraft registration:**<br>**Airport of movement:**|**What is it used for**<br>This is used to signify the<br>Standard of message being sent<br>This is used to determine which<br>flight is going to be changed<br>This is the registration number<br>the aircraft has been given<br>This is the airport at which the<br>movement of the schedule is taking<br>place –**DEPARTURE**airport|**Data to be supplied** **M/C/O **<br>MVA or MVT<br> **M**<br>Designator, Flt Number**M**<br>and Scheduled UTC date<br>of Departure –<br>E.g.**BA100/27**<br>2-10 printable character - **M**<br>e.g. **.PPVMU**<br>IATA three-letter code**M**<br>preceded by a full stop -<br>e.g.**.LTN**|**M/C/O **|
|---|---|---|---|---|



||<br> <br>movement of the schedule is taking<br>place –**DEPARTURE**airport|preceded by a full stop -<br>e.g.**.LTN**||
|---|---|---|---|
|<br>|**Return from Airborne Message specific elements:**<br>**Elements**<br>**What is it used for**<br>**1. Forced Return Information:**<br>**a. Forced Return Identifier:**This is used to signify the type of<br>message being sent<br>  **b. Touch-down Time:**<br>This is used to signify the time at<br>which the aircraft has been forced<br>to land due to circumstances beyond<br>control<br>**c. On-block Time:**<br>This is used to signify the time at<br>which the aircraft arrives back at<br>the terminal<br>**2. Estimated Arrival**<br>This is used to signify the estimated<br> **Information:**<br>time the aircraft is expected to land<br>**3. Estimated On-block Time:** This is used to signify the estimated<br>time the aircraft is due to arrive at the<br>terminal|**Data to be supplied** **M/C/O**<br>Identifier**FR**<br>**C**<br>Four digit time group<br> **O**<br>e.g.**FR1215**<br>Four digit time group<br> **O**<br>preceded by an oblique<br>e.g.**FR/1235 or**<br>**FR1215/1235**(when<br>supplied with touchdown<br>time)<br>Identifier**EA**followed by**O**<br>four digit time group<br>e.g.**EA1205**<br>Identifier**EB**followed by**O**<br>four digit time group<br>e.g.**EB1025**|**M/C/O**|
||<br>**Elements**<br>**1. Forced Return Information:**<br>**a. Forced Return Identifier:**<br>  **b. Touch-down Time:**<br>**c. On-block Time:**<br>**2. Estimated Arrival**<br> **Information:**<br>**3. Estimated On-block Time:**|||



## **REVISED ESTIMATED TIME OF ARRIVAL MESSAGE** 

These are the data elements which can be supplied in a Revised Estimated Time of Arrival Message.  They include any mandatory, conditional and optional elements – note all times on MVT/MVA messages are sent in UTC. 

## **Mandatory elements to be supplied on ALL MVT/MVA messages:** 

- 12 - 

**==> picture [74 x 42] intentionally omitted <==**

|<br><br><br>|**Elements**<br>**What is it used for**<br>**Data to be supplied** **M/C/O **<br>**Standard Message Identifier: **This is used to signify the<br>MVA or MVT<br> **M**<br>Standard of message being sent<br>**Flight Identifier:**<br>This is used to determine which<br>Designator, Flt Number**M**<br>flight is going to be changed<br>and Scheduled UTC date<br>of Departure –<br>E.g.**BA100/27**<br>**Aircraft registration:**<br>This is the registration number<br>2-10 printable character - **M**<br>the aircraft has been given<br>e.g. **.PPVMU**<br>**Airport of movement:**<br>This is the airport at which the<br>IATA three-letter code**M**<br>movement of the schedule is taking<br>preceded by a full stop -<br>place –**ARRIVAL**airport<br>e.g.**.LTN**<br>**Return from Revised Estimated Time of Arrival Message specific elements:**<br>**Elements**<br>**What is it used for**<br>**Data to be supplied** **M/C/O**<br>**1. Revised Estimated Time**<br> **Of Arrival (Touchdown):**<br>**a. Estimated Arrival Indicator:**This is used to signify the type of<br>Identifier**EA**<br>**C**<br>message being sent<br> **b. Revised ETA:**<br>This is used to signify the latest<br>Four digit time group<br> **C**<br>estimated arrival time of the aircraft<br>e.g.**EA1205**<br>at it’s intended destination<br>**c. Estimated On-Block Time:**This is used to signify the time the<br>Indicator**EB**followed<br> **O**<br>aircraft is expected to arrive at the<br>by four digit UTC time<br>terminal<br>group<br>e.g.**EB1212**|
|---|---|
||<br>**Elements**<br>**What is it used for**<br>**1. Revised Estimated Time**<br> **Of Arrival (Touchdown):**<br>**a. Estimated Arrival Indicator:**This is used to signify the type of<br>message being sent<br> **b. Revised ETA:**<br>This is used to signify the latest<br>estimated arrival time of the aircraft<br>at it’s intended destination<br>**c. Estimated On-Block Time:**This is used to signify the time the<br>aircraft is expected to arrive at the<br>terminal|



## **ARRIVAL TAXI TIME VARIATION INFO MESSAGE** 

These are the data elements which can be supplied in an Arrival Taxi Time Variation Info Message. They include any mandatory, conditional and optional elements – note all times on MVT/MVA messages are sent in UTC. 

## **Mandatory elements to be supplied on ALL MVT/MVA messages:** 

**Elements What is it used for** 

**Data to be supplied M/C/O** 

- 13 - 

**==> picture [74 x 42] intentionally omitted <==**

##  

##  

##  

- 

- 

|**Standard Message Identifier: **This is used to signify the<br>Standard of message being sent<br>**Flight Identifier:**<br>This is used to determine which<br>flight is going to be changed<br>**Aircraft registration:**<br>This is the registration number<br>the aircraft has been given<br>**Airport of movement:**<br>This is the airport at which the<br>movement of the schedule is taking<br>place –**ARRIVAL**airport<br>**Return from Arrival Taxi Time Variation Info Message specific**|**Standard Message Identifier: **This is used to signify the<br>Standard of message being sent<br>**Flight Identifier:**<br>This is used to determine which<br>flight is going to be changed<br>**Aircraft registration:**<br>This is the registration number<br>the aircraft has been given<br>**Airport of movement:**<br>This is the airport at which the<br>movement of the schedule is taking<br>place –**ARRIVAL**airport<br>**Return from Arrival Taxi Time Variation Info Message specific**|MVA or MVT<br> **M**<br>Designator, Flt Number**M**<br>and Scheduled UTC date<br>of Departure –<br>E.g.**BA100/27**<br>2-10 printable character - **M**<br>e.g. **.PPVMU**<br>IATA three-letter code**M**<br>preceded by a full stop -<br>e.g.**.LTN**<br>**elements:**<br>**Data to be supplied** **M/C/O**<br>Identifier**AA**<br>**C**<br>Four digit time group<br> **C**<br>or six digit date/time<br>group<br>e.g.**AA1235 or AA031225**<br>Identifier**EB**<br>**C**<br>Four digit time group<br> **C**<br>e.g.**EB1315**|
|---|---|---|
|<br>**Elements**<br>**1.** **Touch-down Time info:**<br>**a. Arrival Identifier:**<br> **b. Touch-down Time:**<br>**2. Estimated on-block Time:**<br>**a. Estimated On-Block**<br>**Time Identifier:**<br> **b. Estimated On-Block Time:**|<br>**What is it used for**<br>This is used to signify the type of<br>message is being sent<br>This is used to signify the time the<br>aircraft lands at it destination<br>This is used to signify the type of<br>information being supplied<br> This is used to signify the time the<br>aircraft is expected to arrive at the<br>terminal||



## **SUPPLEMENTARY INFORMATION** 

Supplementary information can be supplied at the bottom of any MVT or MVA message, after all other information for that message as been stated.  This is the format it needs to be supplied in: 

## **Supplementary Info specific elements:** 

|**Elements**<br>**1. Supplementary Info:**|**What is it used for**<br>This is used to signify any other<br>information involving the aircraft<br>movement.  It is free text information|**Data to be supplied** <br>Identifier**SI**followed by<br>**space**followed by**free**<br>**text info**<br>e.g.**SI DEICING**|**M/C/O **|
|---|---|---|---|
||||**O**|



## MVT and MVA Message Examples 

The below message examples contain the Mandatory, Conditional and **some** optional data elements stated in the Message Data Elements section of this document.  Not all combinations of Data Elements can be shown so the examples show a select few.  Where a time can be supplied with four digit time group OR six digits UTC date and time group, two examples are shown to demonstrate both formats: 

## **a) DEPARTURE message** 

- 14 - 

**==> picture [74 x 42] intentionally omitted <==**

## **Message Format:** 

## **Element:** 

**MVT (or MVA)** = Standard Message Identifier **SD200/21.PMDFG.CDG** = Flt Identifier, Acft Reg, Schd UTC date of Dep and Apt of Movement (DEP) **AD1100/1115 EA1500 FRA** = Dep Identifier, Off Block/Airborne Time and ETA info **DL72/0015** = Actual Delay Information **PX112** = Passenger Information **SI DEICING** = Supplementary Information Identifier and Free Text info 

## **OR** 

**MVT (or MVA) SD200/21.PMDFG.CDG AD211100/211115 EA1500 FRA DL72/0015 PX112 SI DEICING** 

= Standard Message Identifier 

= Flt Identifier, Acft Reg, Schd UTC date of Dep and Apt of Movement (DEP) = Dep Identifier, Off Block/Airborne UTC Date and Time and ETA info = Actual Delay Information = Passenger Information = Supplementary Information Identifier and Free Text info 

## **b) ARRIVAL message** 

## **Message Format:** 

## **Element:** 

**MVT (or MVA) SD200/22.PMDFG.FRA AA1515/1520 FLD22** 

= Standard Message Identifier 

= Flt Identifier, Acft Reg, Schd UTC date of Dep and Apt of Movement (ARR) = Arr Identifier, Touch-down/On-Block Time = Flight Leg Date Indicator 

## **OR** 

**MVT (or MVA) SD200/22.PMDFG.FRA AA221515/221520 FLD22** 

= Standard Message Identifier = Flt Identifier, Acft Reg, Schd UTC date of Dep and Apt of Movement (ARR) = Arr Identifier, Touch-down/On-Block UTC Date and Time = Flight Leg Date Indicator 

## **MVT and MVA Message Examples:** 

## **c) Delay Message** 

## **Message Format:** 

## **Element:** 

**MVT (or MVA)** = Standard Message Identifier **SD200/22.PMDFG.CDG** = Flt Identifier, Acft Reg, Schd UTC Date of Dep and Apt of Movement (DEP) **ED221125** = Estimated Departure Indicator, UTC Date and Time **DL72/0025** = Delay Identifier, Reason Code and Time Delay 

## **OR** 

**(If an indefinite delay is taking place, then use NEXT info)** 

- 15 - 

**==> picture [74 x 42] intentionally omitted <==**

**MVT (or MVA)** = Standard Message Identifier **SD200/22.PMDFG.CDG** = Flt Identifier, Acft Reg, Schd UTC Date of Dep and Apt of Movement (DEP) **NI221150** = Next Info Identifier, UTC Date and Time **SI ENGINE TROUBLE** = Supplementary Information Identifier and Free Text info 

## **- d) Delayed Take Off Message** 

## **Message Format:** 

## **Element:** 

**MVT (or MVA)** = Standard Message Identifier **SD200/22.PMDFG.CDG** = Flt Identifier, Acft Reg, Schd UTC Date of Dep and Apt of Movement (DEP) **AD1115 EO1135** = Dep Identifier, Off-Block Time, Est. Take-Off Identifier and Time **SI DEICING =** Supplementary Information Identifier and Free Text info 

## **OR** 

**MVT (or MVA)** = Standard Message Identifier **SD200/22.PMDFG.CDG** = Flt Identifier, Acft Reg, Schd UTC Date of Dep and Apt of Movement (DEP) **AD221115 EO1135 EA1530 FRA** = Dep Ident, Off-Block UTC Date & Time, Est.Take-Off Ident & Time, ETA **DL72/0025** = Delay Identifier, Reason Code and Time Delay **EB1545** = Est. On-Block Identifier and Time 

## **e) Return to Ramp Message** 

## **Message Format:** 

## **Element:** 

**MVT (or MVA)** = Standard Message Identifier **SD200/22.PMDFG.CDG** = Flt Identifier, Acft Reg, Schd UTC Date of Dep and Apt of Movement (DEP) **AD1115 RR1125** = Dep Identifier, Off-Block Time, Return to Ramp Identifier and Time **DL72/0015** = Delay Identifier, Reason Code and Time Delay **SI ABORTED TAKE-OFF** = Supplementary Information Identifier and Free Text info **OR MVT (or MVA)** = Standard Message Identifier **SD200/22.PMDFG.CDG** = Flt Identifier, Acft Reg, Schd UTC Date of Dep and Apt of Movement (DEP) **AD221115 RR1125** = Dep Ident, Off-Block UTC date & Time, Return to Ramp Identifier & Time **DL72/0015** = Delay Identifier, Reason Code and Time Delay **SI ABORTED TAKE-OFF** = Supplementary Information Identifier and Free Text info 

## **MVT and MVA Message Examples:** 

## **f) Return From Airborne Message** 

**Message Format: Element: MVT (or MVA)** = Standard Message Identifier **SD200/22.PMDFG.CDG** = Flt Identifier, Acft Reg, Schd UTC Date of Dep and Apt of Movement (DEP) **FR1200/1215** = Forced Return Identifier, Touch-down/On-Block Time **SI ENGINE 1 TROUBLE** = Supplementary Information Identifier and Free Text info 

- 16 - 

**==> picture [74 x 42] intentionally omitted <==**

## **g) Revised Estimated Time of Arrival** 

## **Message Format:** 

## **Element:** 

**MVT (or MVA) SD200/22.PMDFG.FRA EA1515 EB1525 SI RADAR FAILURE** 

= Standard Message Identifier 

= Flt Identifier, Acft Reg, Schd UTC Date of Dep and Apt of Movement (ARR) 

= Estimated Arrival Identifier, Revised ETA 

= Estimated On-Block Identifier and Time 

= Supplementary Information Identifier and Free Text info 

## **h) Arrival Taxi Time Variance Information Message** 

## **Message Format:** 

## **Element:** 

**MVT (or MVA) SD200/22.PMDFG.FRA AA1510 EB1520 SI AIRPORT STRIKE** 

= Standard Message Identifier 

= Flt Identifier, Acft Reg, Schd UTC Date of Dep and Apt of Movement (ARR) 

= Arr Identifier, Touch-down Time, Est. On-Block Identifier and Time 

= Supplementary Information Identifier and Free Text info 

## **OR** 

**MVT (or MVA) SD200/22.PMDFG.FRA AA221510 EB1520 SI AIRPORT STRIKE** 

= Standard Message Identifier 

= Flt Identifier, Acft Reg, Schd UTC Date of Dep and Apt of Movement (ARR) = Arr Ident, Touch-down UTC Date & Time, Est. On-Block Identifier & Time = Supplementary Information Identifier and Free Text info 

## DIV Message Type Data Elements 

As per the AHM, DIV message data elements that can be supplied are as follows: 

**= information starts on next line down** 

 **= information goes on the same line as above** 

## **DIVERSION Messages:** 

These are the data elements which can be supplied in a Diversion Message.  They include any mandatory, conditional and optional elements – note all times on DIV messages are sent in UTC. 

## **Mandatory elements to be supplied on ALL DIV messages:** 

- 17 - 

**==> picture [74 x 42] intentionally omitted <==**

|<br>|**Elements**<br>**Standard Message Identifier: **<br>**Flight Identifier:**<br>**Aircraft registration:**<br>**Airport of movement:**|**What is it used for**<br>This is used to signify the<br>Standard of message being sent<br>This is used to determine which<br>flight is going to be changed<br>This is the registration number<br>the aircraft has been given<br>This is the airport at which the<br>the aircraft was originally<br>intending to land at|**Data to be supplied** **M/C/O **<br>DIV<br> **M**<br>Designator, Flt Number**M**<br>and Scheduled UTC date<br>of Departure –<br>e.g.**BA100/27**<br>2-10 printable character - **M**<br>e.g. **.PPVMU**<br>IATA three-letter code**M**<br>preceded by a full stop -<br>e.g.**.LTN**|**M/C/O **|
|---|---|---|---|---|



## **Diversion Message specific elements:** 

| <br><br> <br>|**Elements**<br>**1. Estimated Arrival**<br> **(Touchdown) info:**<br>**a. Estimated Arrival**<br>**Indicator:**<br> **b. Estimated Time of Arrival**<br> **at Diversion Apt:**<br>**c. Airport Code**<br>**(Diversion Apt):**<br>**2. Reason for Diversion:**<br>**a. Identifier for Reason of**<br>**Diversion:**<br> **b. Reason Code**|**What is it used for**<br>This is used to signify the type<br>message being sent<br>This is used to signify the expected<br>arrival time of the aircraft at the Apt<br>has been diverted to<br>This is used to signify the Apt the<br>aircraft has been diverted to<br>This is used to signify that a diversion<br>reason is being supplied<br>This is used to signify the reason as to<br>why the diversion has taken place|**Data to be supplied** <br>Identifier**EA**<br>Four digit time group<br>e.g.**EA2135**<br>IATA three-letter code<br>preceded by a space –<br>e.g.**EA2135_LHR**<br>Identifier**DR**<br>Reason Code as per<br>AHM 011 –<br>e.g.**DR71**|**M/C/O **|
|---|---|---|---|---|
|||||**M**<br> **M**<br> **M**<br> <br>**C**<br> **C**|



## **DIVERSION Message (continued):** 

 

|**Elements**<br>**3. Number of Passengers**<br> **On Board:**<br>**a. Passenger on Board**<br>**Identifier:**<br> **b. Total number of seats**|**What is it used for**<br>This is used to signify that passenger<br>information is being supplied<br>This is used to signify the total number|**Data to be supplied** <br>Identifier**PX**<br>Numerical value -|**M/C/O**|
|---|---|---|---|
||||**C**<br> **C**|



- 18 - 

**==> picture [74 x 42] intentionally omitted <==**

of seats occupied by passengers e.g. **PX112 4. Estimated On-Block time:** This is used to signify the time Identifier **EB** followed **O** the aircraft is expected to reach by a four digit time - the terminal e.g. **EB1120 5. Flight Leg Date Indicator:** This is used to signify UTC scheduled Identifier FLD followed by **O** date of departure for Flight Leg two digit to show day of month. e.g. **FLD16** 

## **SUPPLEMENTARY INFORMATION** 

Supplementary information can be supplied at the bottom of any MVT or MVA message, after all other information for that message as been stated.  This is the format it needs to be supplied in: 

## **Supplementary Info specific elements:** 

**Elements What is it used for Data to be supplied M/C/O 1. Supplementary Info:** This is used to signify any other Identifier **SI** followed by **O** information involving the aircraft **space** followed by **free** movement.  It is free text information **text info** e.g. **SI DEICING** 

## **1. Supplementary Info:** 

## DIV Message Examples 

The below message examples contain the Mandatory, Conditional and **some** optional data elements stated in the Message Data Elements section of this document: 

## **DIVERSION message** 

**Message Format: Element:** 

## **e.g. 1** 

**DIV** = Standard Message Identifier **SD200/30.CVBNM.MAN** = Flt Identifier, Acft Reg, Schd UTC date of Dep and Apt of Original Landing **EA1125 STN** = Estimated Arrival Time and Diversion Airport **DR71 PX112** = Delay Identifier and code, Passenger Indicator and Number of Seats used **SI BAD WEATHER** = Supplementary Information Identifier and Free Text info 

- 19 - 

**==> picture [74 x 42] intentionally omitted <==**

## **e.g. 2** 

**DIV** = Standard Message Identifier **SD200/30.CVBNM.MAN** = Flt Identifier, Acft Reg, Schd UTC date of Dep and Apt of Original Landing **EA1125 STN** = Estimated Arrival Time and Diversion Airport **DR71** = Delay Identifier and code **EB1140** = Estimated On-Block Identifier and Time **FLD30** = Flight Leg Date Identifier **SI BAD WEATHER** = Supplementary Information Identifier and Free Text info 

## **e.g. 3** 

**DIV SD200/30.CVBNM.MAN EA1125 STN PX112 SI BAD WEATHER** 

= Standard Message Identifier = Flt Identifier, Acft Reg, Schd UTC date of Dep and Apt of Original Landing = Estimated Arrival Time and Diversion Airport = Passenger Indicator and Number of Seats used = Supplementary Information Identifier and Free Text info 

- 20 - 

