---
source_url: ""
document_type: "Domain Knowledge — trích xuất PDF (pdftotext -layout)"
extracted: "2026-06-16"
status: "Raw extract — chưa biên tập"
---

# HKIA-A-CDM-Operations-Guidelines

> **Nguồn (PDF):** 
> **Lưu ý:** Trích tự động bằng `pdftotext -layout` (qua WSL /mnt) — trung thực nội dung, có thể lệch định dạng bảng/cột. Đối chiếu PDF gốc khi cần.

---
  Airport Collaborative Decision Making
  (A-CDM) Operations Guidelines
  Version 2.0
  Date: 20Oct 2018




“Airport Authority Hong Kong owns the copyright subsisting in this material. Except as permitted under
applicable law, reproduction or re-dissemination without permission by the Airport Authority Hong Kong is
strictly prohibited.”
                                                                                                   HONG KONG INTERNATIONAL AIRPORT
                                                                                                       A-CDM OPERATIONS GUIDELINES

TABLE OF CONTENTS

1          Document Control ...................................................................................................................................2
2          Document Structure ................................................................................................................................3
3          Important A-CDM Definitions ..................................................................................................................3
4          Introduction .............................................................................................................................................7
    4.1        A-CDM at Hong Kong International Airport ........................................................................................7
    4.2        Benefits of A-CDM ...............................................................................................................................7
5          Summary Of HKIA Processes and Procedures..........................................................................................8
6          Detailed HKIA Processes and Procedures ................................................................................................9
    6.1        Flight Plan and Estimated Off-block Time (EOBT) .............................................................................10
    6.2        A-CDM Arrival Data Sources and Updates.........................................................................................11
    6.3        Target Off-Block Time (TOBT) and Preliminary Target Off-Block Time (POBT) .................................12
    6.4        Target Start-Up Approval Time (TSAT) ..............................................................................................14
    6.5        Start-up and Pushback Procedures ...................................................................................................17
7          Special flight handling and fall back procedures ...................................................................................19
    7.1        Air return handling ............................................................................................................................19
    7.2        Ground return handling.....................................................................................................................20
    7.3        Fall back procedure ...........................................................................................................................21
8          Aircraft Docking Guidance System information display ........................................................................22
    8.1        Arrival display ....................................................................................................................................22
    8.2        Departure display ..............................................................................................................................23
9          Use Cases ...............................................................................................................................................24
    9.1        Normal Flight with No Delays ............................................................................................................25
    9.2        Ad-hoc Delay (in this scenario, due to missing Passenger) ...............................................................30
    9.3        Regulated Flight (CTOT Allocation) ....................................................................................................36
10         Measurement of Key Performance Indicators .......................................................................................47
    10.1       KPI and Definitions ............................................................................................................................47
    10.2       KPI Monitoring and reporting ............................................................................................................48




                                                                                                                                                                         1
                                                      HONG KONG INTERNATIONAL AIRPORT
                                                          A-CDM OPERATIONS GUIDELINES

1   DOCUMENT CONTROL
    Date         Author                  Version   Comment
    2016/04/27   Fredrik Lindblom/SAAB   00.10     DRAFT version
    2016/05/03   Fredrik Lindblom/SAAB   00.20     Updated after internal Saab feedback
    2016/05/09   Fredrik Lindblom/Saab   00.30     Updated after internal Saab feedback
    2016/05/12   Fredrik Lindblom/SAAB   00.31     Update after inputs from HKIA
    2016/05/16   Fredrik Lindblom/SAAB   00.32     Update after inputs from HKIA
    2016/05/23   Fredrik Lindblom/SAAB   00.40     Update after inputs from HKIA
    2016/05/25   Fredrik Lindblom/SAAB   00.41     Update to adapt to LHR current operational
                                                   procedures
    2016/08/16   Fredrik Lindblom/SAAB   00.50     Update to accommodate inputs from HKIA A-
                                                   CDM stakeholder community after inputs
                                                   from A-CDM Work Shop #1 and #2.
    2016/12/13   Fredrik Lindblom/SAAB   00.60     Updates to accommodate inputs from HKIA
                                                   A-CDM stakeholder community as a result of
                                                   A-CDM Work Shop #3
    2017/02/25   Fredrik Lindblom/SAAB   00.61     Updates after meetings with AA, CAD and
                                                   Cathay on February 22-24 in Hong Kong
    2017/03/19   Fredrik Lindblom/SAAB   00.62     Updated after more clarifications on ETD to
                                                   TOBT updates
                                                   Minor text corrections
    2017/03/20   Fredrik Lindblom/SAAB   00.63     Updated based on discussion with AA
    2017/04/04   Fredrik Lindblom/SAAB   00.70     Updated after Work Shop #4
    2017/06/18   Fredrik Lindblom/SAAB   00.80     Updated after workshop in July and inputs
                                                   from stakeholders
    2017/06/21   Fredrik Lindblom/SAAB   01.00     Final version
    2017/07/21   Man Chui/AA             01.10     Updated ADGS display
    2018/06/13   Fredrik Lindblom/SAAB   01.20     Included procedures for ground and air return
    2018/10/20   Man Chui/AA             02.0      Update procedures of 1. Air-return 2. Ground
                                                   return 3. Fallback procedure




                                                                                                   2
                                                                          HONG KONG INTERNATIONAL AIRPORT
                                                                              A-CDM OPERATIONS GUIDELINES

2   DOCUMENT STRUCTURE
    The Operational Guidelines are structured as follows:
          Chapter 3 – Important A-CDM Definitions: This chapter provides all important A-CDM definitions,
           including what data source is being used and what Milestones they are related to.
          Chapter 4 – Introduction: This chapter provides the introduction to A-CDM at Hong Kong International
           Airport (HKIA).
          Chapter 5 – Summary Of HKIA Processes and Procedures: This chapter provides a high level summary of
           the A-CDM procedures implemented at HKIA that apply to the stakeholders.
          Chapter 6 – Detailed HKIA Processes and Procedures: This chapter provides all the details related to the
           procedures in term of how they are done and who is doing what. The chapter also covers details about
           how certain data/information elements are calculated … etc at various steps in the processes. The
           chapter is designed so that each stakeholder is able to derive certain parts of it if they want to develop
           their own internal guidelines … etc.
          Chapter 7 – Special flight handling and fall back procedures: This chapter provides inputs to how A-CDM
           procedures are applied during degraded mode of operations.
          Chapter 8 – Aircraft Docking Guidance System information display.
          Chapter 9 – Use Cases: This chapter provides example Use Case for various scenarios when applying the
           A-CDM procedures.
          Chapter 10 – Measurement of Key Performance Indicators: This chapter provides What and How Key
           Performance Indicators that will be measured when A-CDM is implemented.


3   IMPORTANT A-CDM DEFINITIONS
        Definition             Explanation                                        Source                   Milestone
        AIBT – Actual In       The time the aircraft arrives in-blocks.           First priority is that   7, 8
        Block Time                                                                is it provided by
                                                                                  AODB (AIBT is
                                                                                  captured by the
                                                                                  marshal on ground
                                                                                  and put into the
                                                                                  AODB)
                                                                                  As the second
                                                                                  priority it is
                                                                                  generated by
                                                                                  Aerobahn (derived
                                                                                  from ground
                                                                                  surveillance data
                                                                                  from CAD)
        ALDT – Actual          The time the aircraft lands on the runway          First priority is that   6
        Landing Time                                                              is it provided by
                                                                                  CAD
                                                                                  As the second
                                                                                  priority it is
                                                                                  generated by
                                                                                  Aerobahn (derived
                                                                                  from ground




                                                                                                                        3
                                                                HONG KONG INTERNATIONAL AIRPORT
                                                                    A-CDM OPERATIONS GUIDELINES

                                                                         surveillance data
                                                                         from CAD)
AOBT – Actual Off     Time the aircraft pushes back or vacates the       First priority is that   15
Block Time            parking position also known as off chocks          is it provided by
                                                                         AODB data based
                                                                         on the Push Back
                                                                         Program.
                                                                         As the second
                                                                         priority it is
                                                                         generated by
                                                                         Aerobahn (derived
                                                                         from ground
                                                                         surveillance data
                                                                         from CAD)
ARDT – Actual         When the aircraft is ready for start-              Provided by CAD          12
Ready Time            up/pushback or taxi immediately after              (Electronic Flight
                      clearance delivery.                                Strip System)
ASAT – Actual         Time that the aircraft receives its start-up       Provided by CAD          14
Start-Up Approval     approval                                           (Electronic Flight
Time                                                                     Strip System)
ASBT – Actual Start   Time passengers are entering bridge or bus to      Provided by              11
Boarding Time         the aircraft                                       AO/GH via the
                                                                         AODB
ASRT – Actual         Time the pilot requests start up clearance         This will not be         (13)
Start-Up Request                                                         available in the
Time                                                                     implementation
ATOT – Actual Take    The time the aircraft takes off from the runway    First priority is that   16
Off Time                                                                 is it provided by
                                                                         CAD (derived from
                                                                         their A-SMGCS)
                                                                         As the second
                                                                         priority it is
                                                                         generated by
                                                                         Aerobahn (derived
                                                                         from ground
                                                                         surveillance data
                                                                         from CAD)
CTOT – Calculated     Time calculated and issued by CAD as a result      Provided by CAD          2
Take Off Time         of tactical slot allocation at which a flight is
                      expected to become airborne.
EIBT – Estimated In   The estimated time that an aircraft will arrive    Initially by SIBT        3, 4, 5, 6
Block Time            in blocks.                                         from AO
                      Is updated as milestones 3, 4, 5 and 6 are         Updated
                      passed.                                            generated by




                                                                                                               4
                                                               HONG KONG INTERNATIONAL AIRPORT
                                                                   A-CDM OPERATIONS GUIDELINES

                                                                          Aerobahn based
                                                                          on ELDT + EXIT
ELDT – Estimated     The estimated time that an aircraft will touch       Initially generated   3, 4, 5
Landing Time         down on the runway                                   by Aerobahn based
                                                                          on EIBT – EXIT
                     Is updated as milestones 3, 4 and 5 are passed.
                                                                          Updates based on
                                                                          ELDT from CAD
                                                                          (AMAN)
EOBT – Estimated     The estimated time that an aircraft will start       Flight Plan EOBT      1
Off Block Time       movement associated with departure                   from CAD
ETD – Estimated      This is used to set the Target Off Block Time        From AO/GH (only      9
Time of Departure    (TOBT) in cases where AO/GH used data feed           from specified and
                     to set the TOBT.                                     approved airlines)
ETOT – Estimated     The estimated take off time taking into account      Generated by
Take Off Time        the EOBT and EXOT                                    Aerobahn
EXIT – Estimated     The estimated taxi time between landing and          Generated by
Taxi In Time         in block. This is also references as the Variable    Aerobahn and the
                     Taxi Time.                                           Variable Taxi Time
                                                                          Engine (VTT)
EXOT – Estimated     The estimated taxi time between off block and        Generated by
Taxi Out Time        take off. This is also references as the Variable    Aerobahn and the
                     Taxi Time.                                           Variable Taxi Time
                                                                          Engine (VTT)
MTTT – Minimum       The minimum turn-round time agreed with an           Provided by a table
Turn Round Time      AO/GH for a specified flight or aircraft type.       look-up in
                                                                          Aerobahn
POBT – Preliminary   A preliminary version of the TOBT taking EIBT+       Generated by
Off Block Time       MTTT or EOBT into account. This is used in the       Aerobahn
                     absence of an AO/GH entered TOBT.
PSAT – Preliminary   A preliminary version of a TSAT taking the           Generated by
Start Up Approval    POBT and CTOT into account. To be used as an         Aerobahn
Time                 advisory value for planning purposes prior to
                     having a TSAT issued.
SOBT – Scheduled     The time that an aircraft is scheduled to depart     Provided by AODB
Off Block Time.      from its parking position. Based upon the            (based on data
                     seasonal schedule values, one or more days in        from the AO)
                     advance of the flight.
TOBT – Target Off    The time that an AO/GH estimates that an             Provided via          9
Block Time           aircraft will be ready, all doors closed, boarding   AO/GH
                     bridge removed, push back vehicle available
                     and ready to start up/push back immediately
                     upon reception of clearance from the tower.




                                                                                                          5
                                                              HONG KONG INTERNATIONAL AIRPORT
                                                                  A-CDM OPERATIONS GUIDELINES

TSAT – Target Start   The time that an aircraft can expect start         Generated by    10
Up Approval Time      up/push back approval taking into account          Aerobahn but
                      TOBT and CTOT and/or the traffic situation         issued by CAD
TTOT – Target Take    The target take off time taking into account the   Generated by
Off Time              POBT/TOBT, PSAT/TSAT plus the EXOT                 Aerobahn




                                                                                              6
                                                                       HONG KONG INTERNATIONAL AIRPORT
                                                                           A-CDM OPERATIONS GUIDELINES

4   INTRODUCTION
4.1 A-CDM AT HONG KONG INTERNATIONAL AIRPORT
    The A-CDM project at Hong Kong International Airport (HKIA) is a joint initiative between all airport partners:
    the Airport Authority (AA), air traffic control (ATC), airline operators (AO), the ground handlers (GH), and
    Business Aviation Centre (BAC).
    The objective is for airport partners to work together to facilitate the sharing of timely and accurate
    operational data which will optimize the turn round process and assure the best possible co-ordination of
    resources.
    The aim is to move away from an operating mode where the pilot calls ATC for start approval when he/she
    deems the aircraft is ready to push back, and where estimated departure time is not always updated to truly
    reflect the situation on the ground.
    Most importantly, A-CDM is about cultural and behavioral change and re-addressing working practices and
    relationships.

4.2 BENEFITS OF A-CDM
    If the time that an airline expects to be ready to leave its stand, Target Off Block Time (TOBT), is accurate then
    this time can be used by ATC to determine a pre-departure sequence for departing aircraft.
    If every aircraft knows its order in the pre-departure sequence via the Target Start up Approval Time (TSAT)
    then this time can be shared with all relevant parties and the correct priority can be given in order to maintain
    the sequence. This time can also be used when assigning stands to arriving aircraft as well as enable the
    optimization of other airport infrastructure and resources, i.e. aircraft tractor, stands, runways … etc.
    If the outbound taxi time can be accurately determined before the aircraft starts to taxi, this will result in a
    good quality estimate of the Target Take-Off Time (TTOT). As a result of less waiting time and taxiing time
    around the airfield which would have a positive improvement on aircraft emission.
    Once an accurate take off time can be provided and shared, the whole network can benefit. Capacity in
    terminal resource and en-route sectors could be increased through less tactical regulations and minimum
    departure intervals.
    Similarly, for inbound aircraft, if the inbound taxi time can be determined before the aircraft has landed, the
    accuracy of estimated time when the aircraft will reach a stand improves. This will result in an appropriate
    stand being assigned and ground crew being ready.
    Potential benefits include:
           •    Reduction in taxi times and subsequently, fuel burn and engine running time
           •    Optimization of ground resources such as staff and equipment
           •    Greater asset utilization, e.g. aircraft, stands, airspace
           •    Better utilization of existing capacity in terminal resource and en-route sectors
           •    Improved situational awareness during disruption
           •    Improved recovery from disruption
           •    Provision of a management tool that supports performance monitoring and improvement
           •    Improved reputation with airport users and passengers
    Not all benefits are always immediately realizable as it takes time to refine the processes before they can be
    deemed fully optimized. In large, complex environments such as HKIA, this can take several years of continual
    improvement.




                                                                                                                         7
                                                                       HONG KONG INTERNATIONAL AIRPORT
                                                                           A-CDM OPERATIONS GUIDELINES

5   SUMMARY OF HKIA PROCESSES AND PROCEDURES
    This section provides the high-level summary of the operational processes and procedures. For the detailed
    information about all the processes and procedures please read section 6 to section 9.
     NORMAL FLIGHT PROCEDURES
       1.    The flight is activated in the A-CDM system when the ATC flight plan is activated, usually at EOBT -3
             hours.
       2.    After ATC flight plan activation a Preliminary Target Off Block Time (POBT) and Preliminary Target
             Startup Approval Time (PSAT) will be generated automatically by the A-CDM platform and made
             available via the A-CDM user interface.
       3.    At EOBT -40 minutes, the TOBT is automatically updated by using the A-CDM platform’s calculated
             POBT.
                  Direct update of TOBT can be done at any time after point 1 above. This is then done via the
                      A-CDM user interface.
                  If the TOBT is 15 minutes later than EOBT, the AO/GH is required to send a delay message to
                      ATC.
       4.    At TOBT -25 minutes, the TSAT will be issued.
                  If a direct update is done after the TSAT is issued a reason for the TOBT change shall be put
                      in via the A-CDM user interface. Direct update of the TOBT overrides system generated POBT.
       5.    At TOBT +/- 5 minutes, the pilot has to call ready to ATC Clearance Delivery. Missing the call at TOBT
             +5 minutes will result in loss of TOBT and TSAT.
                  If TOBT and TSAT is lost, AO/GH shall put in new TOBT to get a new TSAT
       6.    Flight Crew shall call Ground Control as soon as possible for start-up approval after instructed by
             ATC Clearance Delivery.
       7.    If flight crew has not pushed back at the +5 minutes window of ASAT (i.e. after push back approval
             has been granted by Ground Control), TSAT and TOBT will be lost and AO is required to re-enter
             TOBT to get a new TSAT to queue up again.
     REGULATED FLIGHT (FLOW CONTROL FLIGHT) PROCEDURES
     1.     If a flight is regulated, a CTOT will be issued and a corresponding TSAT and TTOT will be issued by the
            A-CDM platform. This will override the POBT and PSAT.
                   When a flight has a CTOT the EOBT shall never be changed via amendment of the flight plan.
     2.     Updates of the TOBT by AO/GH can be done up to the issued TSAT value to delay ground operations
            if needed such as boarding.

     INFORMATION TO PASSENGERS VIA FLIGHT INFORMATION DISPLAY SYSTEM (FIDS)
     1.     TOBT will not be reflected on the FIDS displays for passenger information.
     2.     Update Estimated Time of Departure (ETD) for passenger information can only be done via FIDS team
            to input manually or airlines’ autolink.




                                                                                                                      8
                                                                   HONG KONG INTERNATIONAL AIRPORT
                                                                       A-CDM OPERATIONS GUIDELINES

6   DETAILED HKIA PROCESSES AND PROCEDURES
    This section provides information about the procedural elements of any flight that will operate under A-
    CDM procedures at HKIA. The overview chart below depicts the time sphere and scope of the A-CDM
    procedure at HKIA from the time of ATC flight plan activation (~EOBT -3 hours) all the way up to airborne
    (take-off).
    In the drive to ensure completeness and accuracy of data throughout the flight processes, there are a
    number of automated alerts, which highlight the need for the potential adjustments, which may become
    necessary. It is in everyone's interest to ensure the HKIA A-CDM partners get accurate and timely TOBT
    with a stable and optimal TSAT as a result. Following this, the pilot must call for start-up to ensure this
    TSAT remains valid and relevant or take necessary actions to accommodate delays.




                                                                               Start-up and Push Back Procedure
                                                                   1.   Pilot calls “Ready” to Clearance Delivery who in turn
                                                                        record the ARDT and hand over the request to Ground
                                                                        Control
                                                                   2.   Pilot to call for start-up and push back approval.
                                                                   3.   Ground Control give Start-up approval (ASAT).




                                                                                                                                9
                                                                       HONG KONG INTERNATIONAL AIRPORT
                                                                           A-CDM OPERATIONS GUIDELINES




6.1 FLIGHT PLAN AND ESTIMATED OFF-BLOCK TIME (EOBT)

    Flight plan definition (from ICAO Doc 4444)
    Specified information provided to air traffic service units, relative to an intended flight or portion of a flight
    of an aircraft. The flight plan as filed with an ATS unit by the pilot or a designated representative, without any
    subsequent changes. The time the flight plan is filed for is Estimated Off-Block Time (EOBT)

    What is the relation between EOBT and SOBT?
    The time filed with Air Traffic Control on the flight plan is the Estimated Off-Block Time (EOBT). As HKIA is a
    slot coordinated airport each flight also has negotiated to operate at a certain time; the Scheduled Off-Block
    Time (SOBT).
    In a non-CDM world, these times can be very different and can give a distorted picture of the actual traffic
    demand for the runway and within the airspace network. Some airlines or Aircraft Operators file multiple
    flight plans with different routings for one and the same flight, which also affect air traffic demand
    calculations. If an airport has a high demand on peak hours, it needs airlines to adhere to their airport slot
    time, i.e. the SOBT.
    The following checks will automatically happen throughout the A-CDM process at an airport:
            Check filed ATC flight plan (EOBT) correlates to airport slot (SOBT)
            Check when no filed ATC flight plan appears to be available or when multiple ATC flight plans are
             filed for one and the same flight (with e.g. different routings, call signs or times)
            Check if the data for the filed ATC flight plan matches SOBT data (e.g. aircraft type, destination,
             times)




                                                                                                                         10
                                                                     HONG KONG INTERNATIONAL AIRPORT
                                                                         A-CDM OPERATIONS GUIDELINES

   The A-CDM system will monitor compliance, encourage honest updates and adherence to both SOBT and
   EOBT. Where discrepancies are noted in these checks, appropriate stakeholders will be alerted by an
   automated message from the Aerobahn A-CDM portal. These checks will be carried out when flight plan is
   activated, normally from EOBT -3 hours.

   What happens if the filed ATC flight plan is cancelled?
   If the ATC flight plan is cancelled, the TOBT is cancelled and the A-CDM process is stopped until a new flight
   plan is filed. A flight will only be completely cancelled when it is cancelled in AA’s AODB via currently
   established procedures.
   NOTE:
           If the AO needs to change the aircraft but have the latest known TOBT and TSAT to remain visible in
            the A-CDM Portal the AO needs to cancel the current flight plan and filing a new flight plan via ATC.
            This will not remove the flight in the AODB; hence, the flight is not completely cancelled.

6.2 A-CDM ARRIVAL DATA SOURCES AND UPDATES
   One of the key purposes of A-CDM is to link the arrival, turnaround and departure phase of a flight. Improving
   operational efficiency starts with early and better decision-making, based on collectively shared data.
   In the early inbound phase of the flight, the best-estimated landing and in-block-times (ELDT and EIBT) need
   to be established and uniformly shared with the airport partners. Once a flight has landed, the best source
   for the actual landing and in-block times need to be agreed upon (ALDT and AIBT).



   How is the Estimated In Block Time (EIBT) for a flight obtained?
   The initial value of the EIBT is based on the schedule:
          • Initial EIBT = Scheduled In-Block Time
   The updates of EIBT is based on Estimated Landing Time (ELDT) and Estimated Taxi In Time (EXIT):
         • EIBT = ELDT + EXIT

   How is the Estimated Landing Time (ELDT) for a flight obtained?
   The initial value of the ELDT is based on the initial Estimated In Block Time and the Estimated Taxi In Time:
          • Initial ELDT = Initial EIBT – Variable Taxi Time
   The updates of ELDT are based different sources of arrival data coming from Hong Kong Civil Aviation
   Department (CAD).

   How is the Actual Landing Time (ALDT) for a flight obtained?
   As the first priority source, the ALDT is provided by CAD.
   As the second priority source, it is generated by Aerobahn (derived from ground surveillance data from CAD).

   How is the Actual In Block Time (AIBT) for a flight obtained?
   As the first priority source, the AIBT is based on data from Airport Authority’s (AA) Airport Operations
   Database (AODB).




                                                                                                                    11
                                                                    HONG KONG INTERNATIONAL AIRPORT
                                                                        A-CDM OPERATIONS GUIDELINES

6.3 TARGET OFF-BLOCK TIME (TOBT) AND PRELIMINARY TARGET OFF-
    BLOCK TIME (POBT)

   TOBT Definition (EUROCONTROL, A-CDM Manual version 4)
   The time that an Aircraft Operator (AO) or Ground Handler (GH) estimates that an aircraft will be ready, all
   doors closed, boarding bridge removed, push back vehicle available and ready to start up/push back
   immediately upon reception of clearance from the tower.

   The importance of TOBT?
   TOBT is the most important time in the turnaround process and this time is essential for the calculation of
   TSAT. The TSAT is derived based on optimisation of aircraft ground movement and minimisation of apron
   congestion on taxiways.
   TOBT can be predicted by tracking the flight events that occur prior to landing and during the turnaround
   process. In order to achieve TOBT accuracy, close coordination of turnaround activities and sharing of
   operational information among different partners are needed.
   TOBT is initially automatically calculated by the A-CDM platform based on available flight information – this
   is called the Preliminary Off-Block Time (or POBT). Subsequently, airlines and ground handlers will coordinate
   and update it based on the operational situation.

   Calculation of the Preliminary Target Off-Block Time (POBT)?
   For all flights, the A-CDM platform will automatically start to calculate the Preliminary Target Off Block Time
   (POBT) at flight plan activation, typically at EOBT -3 hours.
           For an originating flight, the POBT will be equal to EOBT in the filed flight plan.
           For a turnaround flight, the initial POBT will be set to the later of EOBT or by calculation based on
            initial EIBT information. Subsequent updates to POBT will be done as the arrival flight approaches
            HKIA based on (EIBT or AIBT) + MTTT (Minimum Turn Round Time).
           These MTTT’s are stored in the A-CDM database based on the information from AO/GH provided to
            the Airport Authority.

   Who is responsible for the TOBT input?
   A TOBT update is a joint and coordinated effort between the AO and the GH. The responsibility of inputting
   the TOBT has to be clearly defined between the AO and the GH.
   Airlines have to ensure:
         The communication with the Flight Deck and relevant airline operational control centre
         The internal working procedures between the Ground Handler and Aircraft Operator on how to work
             with the TOBT are in place.

   What is the general TOBT updating process?
   TOBT will be generated automatically by using the calculated POBT at EOBT – 40 minutes. AO/HO can adjust
   the TOBT to fit the real operations situation if needed.




                                                                                                                     12
                                                                  HONG KONG INTERNATIONAL AIRPORT
                                                                      A-CDM OPERATIONS GUIDELINES

Direct update of TOBT?
The POBT may not always accurately predict when the aircraft is ready for departure, especially for cases of
delays caused by turnaround activities. As a result, airlines and ground handlers are required to continuously
assess the operational situation and directly input/update TOBT if needed.
        From the time POBT is available, a direct input/update can be input for differences of more than +/-
         5 minutes of the latest POBT/TOBT. Once a manual TOBT input occurs, A-CDM will no longer
         generate a POBT nor an automatically generated TOBT.
        At EOBT - 40 minutes the AO/GH is required to do the following:
              Ensure that the automatically generated or manually entered TOBT is correct (an incorrect
                 TOBT can result in the loss of TSAT)
              If it is not correct, it shall be updated via manual update.
        The input/update of the TOBT is to be done via the A-CDM platform user interface.
The following facts have to be taken into account for the input and/or update of the TOBT:
     The entered TOBT has to be at least 5 minutes later than current time.
     New and old TOBT must differ by at least 5 minutes.
     Changes of TOBT after TSAT issued (at TOBT-25 minutes) the AO/GH will be required to input the
         reason for the change.
     When a TOBT is entered, the POBT is removed and will no longer be automatically updated.




When will the POBT/TOBT be made available to A-CDM partners?
The A-CDM portal will show the POBT/TOBT at ATC flight plan activation (usually EOBT -3 hours) and onwards.

What if the TOBT does not match EOBT?
If the TOBT deviates from the EOBT of the ATC flight plan by more than 15 minutes, the AO/GH is required to
send a delay message to ATC.
The only exception from this rule is when a flight is under ATFM regulation (flow control), i.e. a CTOT has been
assigned. In that case a new flight plan should NOT be filed as it might result in a further delayed CTOT being
issued.




                                                                                                                   13
                                                                    HONG KONG INTERNATIONAL AIRPORT
                                                                        A-CDM OPERATIONS GUIDELINES

   What happens with the TOBT in case of a change of aircraft?
   If the AO needs to change the aircraft but have the latest known TOBT and TSAT to remain visible in the A-
   CDM Portal the AO needs to cancel the current flight plan and file a new flight plan via ATC. This will not
   remove the flight in the AODB; hence, it is not completely cancelled.

   What is the relation between TOBT and the FIDS departure time show to passengers?
   If the TOBT is updated directly in the A-CDM platform this will not be reflected on the FIDS displays.
   For any AO or GH that has a direct interface with the AODB and provides updated Estimated Time of
   Departure (ETD) due to a delay, this will directly be displayed on the FIDS and set the TOBT value in the A-
   CDM platform. However, once TOBT is updated manually, it shall then be updated by AO/GH via A-CDM
   platform manually.
   Remarks: TOBT updating is for A-CDM to generate TSAT for departure sequencing. To notify passenger of
   flight delay, ETD shall be updated through FIDS.

   Best Practice for On Time Performance (OTP)
   On Time Performance is one of the Key Performance Indicators for airlines and airport to measure their
   efficiency and services standard. The Best Practice to achieve OTP (STD + 0 minute) should be:
      Set TOBT = STD
      All ground activities should be completed and pilot calls HK Delivery (CDC) ready (ARDT) not later than
       STD - 5 minutes.
      Start-up approval (ASAT) provided by ATC Ground Control not later than STD - 2 minutes.
      Push back (AOBT) at TOBT.

   OTP measurement at HKIA
   HKIA is using the international standard (STD + 15 minutes) to evaluate the on time performance. To depart
   on time, all parties should target to achieve AOBT not later than STD + 15 minutes by following the procedure
   below in the operations:
      Set TOBT not later than STD + 5 minutes.
      All ground activities completed and pilot calls CDC ready (ARDT) before STD + 10 minutes.
      ATC Ground Control will endeavour to approve start-up not later than STD + 13 minutes.

6.4 TARGET START-UP APPROVAL TIME (TSAT)

   TSAT Definition (EUROCONTROL, A-CDM Manual version 4)
   The time provided by ATC that an aircraft can expect start-up/push back approval. It takes into account TOBT,
   CTOT and/or the traffic situations.

   How is TSAT Calculated?
   The Pre-Departure Sequencer (PDS) calculates the Target Start-up Approval Times (TSAT) and the Target Take-
   Off Times (TTOT) after taking multiple constraints and preferences into account. The PDS bases its TSAT
   calculation in accordance with the following parameters (not exhaustive):
           TOBT
           Operational capacity
           Take-off runway



                                                                                                                   14
                                                                 HONG KONG INTERNATIONAL AIRPORT
                                                                     A-CDM OPERATIONS GUIDELINES

        Wake turbulence category
        Variable taxi time
        SID’s
        Parking position/area
        CTOT in the case of regulated flights
        Sequencing of Departures

Which flights are planned by PDS?
        IFR (Instrument Flight Rules) flights that depart from HKIA (including Business and General Aviation)
        The flight has a valid flight plan
        The flight plan is available (i.e. present in the ATC system, normally at EOBT -3 hours)
        The flight’s TOBT is known

Which flights are NOT planned in PDS?
        VFR (Visual Flight Rules) flights are not included in the planning process.
        A flight that is suspended, will not take part in the planning process. The latest known TOBT and
         TSAT will remain visible in the A-CDM Portal. Flight plan de-suspension will reactivate the flight in
         the PDS process. This can be done by cancelling the current flight plan and filing a new flight plan.
        Flights that have a TSAT that is expired (i.e. HH:MM > TSAT + 5 min and the flight has not yet
         requested start-up) are no longer part of the PDS process. A valid updated TOBT will reactivate the
         flight in the PDS process.
        Flights that return to stand after push back (this does not apply to remote holding). An updated TOBT
         (where TOBT should be > current time) will reactivate the flight in the PDS process.

When does TSAT calculation start?
The PDS will start to calculate a Preliminary Target Start up Approval Time (PSAT) at EOBT -3 hours based on
the Preliminary TOBT (POBT) and other defined constraints (i.e. in-line with when the POBT is made available).
At TOBT -25 minutes, the PSAT is superseded by the issued TSAT.
NOTE:
        TSAT will be removed if pilot does not call Clearance Delivery (CDC) for “ready” before the end of
         the TOBT window (i.e. TOBT + 5 minutes). A new TOBT is required to generate a new TSAT.
        TSAT will be invalid if pilot does not call Ground Control (GMC) for “Start up request” before the end
         of the TSAT window (i.e. TSAT + 5 minutes). A new TOBT is required to generate a new TSAT.
        Change of TOBT will not trigger the reissuance of a new TSAT unless TOBT is greater than TSAT.




                                                                                                                  15
                                                                  HONG KONG INTERNATIONAL AIRPORT
                                                                      A-CDM OPERATIONS GUIDELINES




What happens with TSAT if TOBT is updated, not exceeding current TSAT?
The TOBT can be updated without affecting the TSAT as long as TOBT is earlier than or equal to the PSAT/TSAT
value. If the TOBT is later than the current PSAT/TSAT then a new PSAT/TSAT will be calculated.

When will the PSAT/TSAT be made available to A-CDM partners?
The PSAT information is published via:
        The A-CDM portal at Flight Plan activation (usually EOBT -3 hours) and onwards
The TSAT will published via:
        The A-CDM portal at TOBT -25 minutes

The CTOT and its relation to TSAT?
The Calculated Take-off Time (CTOT) is a regulated take off time issued by Air Traffic Flow Management
(ATFM) as a result of tactical slot allocation. The CTOT regulates the flight takes off from HKIA but is held on
ground by a flow control from destination airport. The CTOT at HKIA has a defined window of +/- 3 minutes
(also commonly known as the Slot Tolerance Window) that has to be met by ATC.
When a flight receives a CTOT this directly affects the TSAT in order to ensure that start-up and push back
procedures are done on time to meet the CTOT. The TSAT is therefore based on the CTOT and the variable
taxi time plus a buffer value. The buffer value is put in place to make sure the aircraft gets to the runway
when the CTOT window starts, i.e. CTOT -3 minutes.




                                                                                                                   16
                                                                     HONG KONG INTERNATIONAL AIRPORT
                                                                         A-CDM OPERATIONS GUIDELINES

   TOBT and TSAT handling in extreme situations?
   If TOBT and TSAT deviate from each other by more than 30 minutes because of CTOT issuance, airlines should
   consider to apply special procedure to avoid hassle to passenger such as waiting on board the aircraft for long
   time before departure. If this situation occurs, the following special procedure should be applied:
           The AO/GH assesses the delay situation based on available information (POBT, TSAT and CTOT for a
            regulated flight).
           Update TOBT to be closer to TSAT. This delays the whole ground handling process, including
            boarding of passengers.
   It is the responsibility of the AO to assess the situation and make the decision to adjust the TOBT.
   For an example Use Case please see section 8.3.

   If CTOT is removed, is there a priority of TSAT if TOBT has been updated… etc?
   The PDS will always try to give a better/earlier TSAT if the CTOT is removed. This means that a flight will get
   an earlier TSAT whenever possible, taking all known parameters into account. The new TSAT time will not be
   earlier than current time + 15min for push back tractor arrangement.
   In cases where active decision has been made to adjust the TOBT to be aligned or closer to the TSAT (e.g.
   delay due to a CTOT) the PDS will not provide a TSAT earlier than the entered TOBT if CTOT is removed.

6.5 START-UP AND PUSHBACK PROCEDURES

   What are the normal Start-up procedures?
       1.   Ground operations completion – Normally, “Completion of ground handling”’ is set at -5 minutes
            from TOBT which include push back tractor manned and monitoring of headset and ground staff
            shall inform Flight crew accordingly.
       2.   Flight Crew call Ready - At TOBT +/-5 minutes (TOBT window) Flight Deck reports “ready” to
            Clearance Delivery (CDC)
                  If TSAT is within TOBT window, CDC will instruct Flight Deck to contact Ground Control for
                      start-up approval.
                  If TSAT is outside TOBT window, CDC will instruct Flight Deck to “stand-by on frequency”
                      and communicate the delay in relation to the TSAT. Within TSAT window, CDC will call Flight
                      Deck and instruct Flight Deck to contact Ground Control for start-up approval.
       3.   Request for Start-up and Pushback:
                  Flight Crew shall call Ground Control for start-up approval as soon as possible after
                      instructed by CDC. If the flight has not pushed back +5 minutes after ASAT issuance, TSAT
                      and TOBT will be lost and AO is required to re-enter TOBT.




                                                                                                                     17
                                                                 HONG KONG INTERNATIONAL AIRPORT
                                                                     A-CDM OPERATIONS GUIDELINES




What if AO are not ready at TOBT + 5 minutes?
         If AO is not ready at TOBT +5 minutes, a new TOBT has to be entered by AO/GH.
         Consequently, the flight will be out of departure sequence and a new TSAT will not be available
          until a new TOBT is entered. Flights will be re-sequenced in the next available slot.
         If the TOBT is deleted (due to e.g. technical problems), the TSAT is automatically deleted as well.
          A new TOBT must be entered to obtain a new TSAT.

What if pilot does not call for Start-up Approval within the set window?
         If no request for start-up has been done at +5 minutes after hand over to Ground Control the TSAT
          will be deleted and the flight will be removed from the pre-departure sequence.
         A new TOBT has to be entered and this will result in a new TSAT. Flights will be re-sequenced in
          the next available slot.
NOTE:
         The Air Traffic Controller always has the right to issue the actual start-up and pushback clearance
          even if outside the +5 minute rule.

When is the pushback tractor allocated?
Allocating pushback tractor to aircraft is based on TSAT planning. Tractor should be arranged and ready at
least 10 minutes prior to TSAT.
Under the condition of CTOT issuance where the tractor is being held up by the aircraft and the TSAT is beyond
30 minutes to the current time, the tractor may be re-assigned to another assignment to ensure effective use
of resource. AO and GH coordinate to decide the return time of a tractor which should be back in place at
least 10 minutes before TSAT.




                                                                                                                 18
                                                                       HONG KONG INTERNATIONAL AIRPORT
                                                                           A-CDM OPERATIONS GUIDELINES

7   SPECIAL FLIGHT HANDLING AND FALL BACK PROCEDURES
7.1 AIR RETURN HANDLING
    In some cases and aircraft will have to return to the airfield after departure. When this happens specific
    actions needs to happen for the aircraft to re-enter the A-CDM process.
    a.    Upon received air return information from ATC or Airlines, AA FIDS team will create a new arrival flight
          with the same departure flight number ending with a suffix “R”. e.g. XXX123R.
    b.    The original departure flight will also be added a suffix “R” and changed destination to “HKG” by AA FIDS
          team. e.g. XXX123R
    c.    After the aircraft landed, AA FIDS team will create a new departure flight with the same flight number,
          STD, destination and the new estimate departure time (ETD) provided by airlines. e.g. XXX123
    d.    After the aircraft has landed, taxied into the stand and parked, the airlines should conduct the following
          to clear the A-CDM milestones.
     Step                                                                                      By whom
     1.    Find and select the Original Departure (without an ‘R’ – e.g. XXX123) in the        Airlines / Handling
           “Departures” tab in the A-CDM web portal (see image below).                         Agent
           NOTE - The flight should have some departure Milestone times (i.e. MS09, MS10,
           MS12, MS14, MS15 and MS16) completed.




                     2. Find the flight, e.g.
                            XXX123




     2.    Right click on the selected flight and select “Clear A-CDM Milestones” from the     Airlines / Handling
           drop down list in the A-CDM web portal. This will clear the milestone times for     Agent
           MS09, MS10, MS12, MS14, MS15, and MS16 and the related data fields (see
           image below).
           After selecting the “Clear A-CDM milestones”, a pop-up message will appear as
           illustrated in the image below. The user has to select “Remove” to complete this
           step in the process (see image below).




                                                                                                                       19
                                                                         HONG KONG INTERNATIONAL AIRPORT
                                                                             A-CDM OPERATIONS GUIDELINES




    3.    Cancel the original flight plan                                                           CAD
    4.    Refile the flight plan of the departure flight. Once this is completed, the flight will   Airlines / Handling
          be displayed in the “Active ACDM Flights” tab.                                            Agent
    5.    Follow the normal A-CDM procedure to input a new TOBT for the new departure
          flight.


7.2 GROUND RETURN HANDLING
   In some cases and aircraft will have to return to the gate after pushback. When this happens specific actions
   needs to happen for the aircraft to re-enter the A-CDM process.
   a.    Upon received ground return information, AA FIDS team will delete the chock of time of the in FIDS
         display.
   b.    After the aircraft back to the parking stand, the airlines should conduct the following to clear the A-CDM
         milestones.
    Step                                                                                            By whom
    1.    “Clear A-CDM Milestones” for the Original Departure in the A-CDM web portal.              Airlines / Handling
          This will clear the milestone times for MS09, MS10, MS12, MS14, MS15, and                 Agent
          MS16 and the related data fields (see image below).
          After selecting the “Clear A-CDM milestones”, a pop-up message will appear as
          illustrated in the image below. The user has to select “Remove” to complete this
          step in the process (see image below).




                                                                                                                          20
                                                                     HONG KONG INTERNATIONAL AIRPORT
                                                                         A-CDM OPERATIONS GUIDELINES




                 2. Find the flight, e.g.
                 XXX123 and right click
                       the mouse




    2.   Enter a new TOBT as per normal procedures for the flight.                        Airlines / Handling
                                                                                          Agent
    3.   Follow the normal A-CDM procedure for the new departure flight.



7.3 FALL BACK PROCEDURE
   If the A-CDM system is unserviceable and expected prolong system down, Airfield Department will notify the
   delegated contact points of system users via email. Airport Duty Manager will issue related message via SMS
   to Handling Agents and Airline Operators Committee (AOC) who will inform the airport community. ATC will
   issue ATIS message “A-CDM system is unserviceable” to inform pilots accordingly.
   Although TSAT cannot be provided in this situation, airlines should complete the aircraft ground serving
   activities by the TOBT. Pilot should call ready to CDC to request push back approval upon ground operations
   completed.




                                                                                                                 21
                                                                      HONG KONG INTERNATIONAL AIRPORT
                                                                          A-CDM OPERATIONS GUIDELINES

8   AIRCRAFT DOCKING GUIDANCE SYSTEM INFORMATION
    DISPLAY
    The Aircraft Docking Guidance System is the system to guide an aircraft to dock into a parking stand. The
    system has been upgraded to display TOBT and TSAT at the following locations of the parking stands.
             Terminal 1 parking stand at main centerline parking.
             Remote parking stand at main centerline parking (except V-stands which are not equipped with
              the system).
             Midfield Concourse
             West Cargo Apron

8.1 ARRIVAL DISPLAY
             When standby mode is on, current time will be displayed when there is no flight assigned to the
              parking stand.




             Flight information including Flight no., Registration Mark, Port of call, Best of time (BOT) and Count
              down time (Current time - BOT) will be displayed 15 minutes prior to Best of Time.

                                                                                          Flight No.

                                                                                      Registration Mark

                                                                                          Port of Call

                                                                                         Best of Time

                                                                                      Count Down Time
                                                                                    (Current time – BOT)
                                                                                          -ve number
             The flight information will disappear when aircraft docking
              starts.




                                                                                                                       22
                                                                 HONG KONG INTERNATIONAL AIRPORT
                                                                     A-CDM OPERATIONS GUIDELINES

8.2 DEPARTURE DISPLAY
          Current time will be displayed when there is no flight assigned to the parking stand or at Target
           off-block Time (TOBT) more than 40 minutes.
          Departing aircraft detection will be activated before the departure flight information is displayed
           on the screen, for instance, 40 minutes prior to TOBT.
          Flight information including Flight no., Registration Mark, TOBT, TSAT and Count down Time
           (Current time – TOBT) will then be displayed.


                                                                                        Flight No.

                                                                                   Registration Mark

                                                                                          TOBT

                                                                                          TSAT

                                                                                   Count Down Time
                                                                                 (Current time – TOBT)
                                                                                       -ve number
          Flight information will disappear when TOBT is deleted; or the
           system recognizes that the flight is pushed back; or TOBT is more than 120 minutes.




                                                                                                                 23
                                                                   HONG KONG INTERNATIONAL AIRPORT
                                                                       A-CDM OPERATIONS GUIDELINES


9   USE CASES
    This section details some of the most important Use Cases that can occur with A-CDM implemented. The Use Cases are:
           Normal Case – all processes are running as planned and no issues occurs to delay the flight
           Ad-Hoc delay – In the scenario, a “passenger delay” is used as the example but this can be applied to any delay reason like mechanical etc.
           Regulated Flight (Flow control with CTOT Allocation) – allowing the AO/GH to proceed according to two alternatives:
                • Alternative 1 – No adjustment of TOBT
                • Alternative 2 – Adjusting TOBT to delay turn around procedures e.g., boarding
    Each Use Case is described in a step-by-step approach highlighting the timing of events and the A-CDM actions that occur. To each of the steps an
    Illustration depicts the actions.




                                                                                                                                                          24
                                                                      HONG KONG INTERNATIONAL AIRPORT
                                                                          A-CDM OPERATIONS GUIDELINES

9.1 NORMAL FLIGHT WITH NO DELAYS

   Assumed scenario conditions:
           A flight is departing at 20:00 (i.e. Flight Plan EOBT).
           The flight from the airline side is running perfectly on time
           There are no flow control restrictions

   A-CDM Process (step-by-step):
        Time                A-CDM Actions
    1   17:00 (EOBT -       a) Flight plan has been activated for 20:00 EOBT. Any milestones that the inbound flight may have passed are calculated
        180 min)               and checked off.
                            b) The A-CDM platform will calculate a POBT and PSAT at 20:00 and make POBT and PSAT are made available in the A-CDM
                               Portal




                                                                                                                                                      25
                                                           HONG KONG INTERNATIONAL AIRPORT
                                                               A-CDM OPERATIONS GUIDELINES

    Time              A-CDM Actions
2   19:20 (EOBT -40   a)   TOBT (@20:00) is confirmed by AO/GH
    min)




                                                                                             26
                                                            HONG KONG INTERNATIONAL AIRPORT
                                                                A-CDM OPERATIONS GUIDELINES

    Time              A-CDM Actions
3   19:35 (TOBT -25   a)   TSAT (@20:00) is issued and published via A-CDM platform
    min)




                                                                                              27
                                                              HONG KONG INTERNATIONAL AIRPORT
                                                                  A-CDM OPERATIONS GUIDELINES

    Time               A-CDM Actions
4   19:55 - 20:05      a) At 19:55 flight deck calls Clearance Delivery (CD) with “ready” (i.e. inside the TOBT window of TOBT +/- 5 minutes)
    (Call “ready” at   b) At 20:01 CDC will instruct Flight Deck to contact Ground Control
    TOBT)




                                                                                                                                                28
                                                            HONG KONG INTERNATIONAL AIRPORT
                                                                A-CDM OPERATIONS GUIDELINES

    Time            A-CDM Actions
5   19:55 - 20:05   a) At 20:02 pilot calls ground control for start-up, push-back and taxi-clearance
    (Start-up and   b) At 20:05 ground control gives start-up, push-back and taxi-clearance
    push-back
    procedure at
    TSAT)




                                                                                                        29
                                                                     HONG KONG INTERNATIONAL AIRPORT
                                                                         A-CDM OPERATIONS GUIDELINES

9.2 AD-HOC DELAY (IN THIS SCENARIO, DUE TO MISSING PASSENGER)

    Assumed scenario conditions:
            A flight is departing at 20:00 (i.e. Flight Plan EOBT).
            The flight from the airline side is running perfectly on time up until 19:50 when a passenger is missing and baggage has to be removed off the
             flight.

    A-CDM Process (step-by-step):
         Time               A-CDM Actions
     1   17:00 (EOBT -      a) Flight plan has been activated for 20:00 EOBT. Any milestones that the inbound flight may have passed are calculated
         180 min)              and checked off.
                            b) The A-CDM platform will calculate a POBT and PSAT at 20:00 and make POBT and PSAT are made available in the A-
                               CDM Portal




                                                                                                                                                              30
                                                         HONG KONG INTERNATIONAL AIRPORT
                                                             A-CDM OPERATIONS GUIDELINES

    Time            A-CDM Actions
2   19:20 (EOBT -   a)   TOBT (@20:00) is confirmed by AO/GH
    40 min)




                                                                                           31
                                                           HONG KONG INTERNATIONAL AIRPORT
                                                               A-CDM OPERATIONS GUIDELINES

    Time            A-CDM Actions
3   19:35 (TOBT -   a)   TSAT (@20:00) is issued and published via A-CDM platform
    25 min)




                                                                                             32
                                                            HONG KONG INTERNATIONAL AIRPORT
                                                                A-CDM OPERATIONS GUIDELINES

    Time            A-CDM Actions
4   19:50 (TOBT -   a) AO has a missing passenger and decision is made to unload the luggage causing a delayed departure
    10 min)         b) New TOBT is entered by AO/GH at 20:10 including reason for the updated of TOBT
                    Once the new TOBT is entered, Aerobahn will recalculate the TSAT (since TOBT is later than current TSAT). Since there a no
                    delays TSAT is @20:10




                                                                                                                                                 33
                                                               HONG KONG INTERNATIONAL AIRPORT
                                                                   A-CDM OPERATIONS GUIDELINES

    Time               A-CDM Actions
5   20:05 - 20:15      a) At 20:05 flight deck calls Clearance Delivery (CD) with “ready” (i.e. inside the TOBT window of TOBT +/- 5 minutes)
    (Call “ready” at   b) At 20:07 CDC marks ARDT and hands over to GC
    TOBT)




                                                                                                                                                34
                                                            HONG KONG INTERNATIONAL AIRPORT
                                                                A-CDM OPERATIONS GUIDELINES

    Time            A-CDM Actions
6   20:05 - 20:15   a) At 20:08 pilot calls ground control for start-up, push-back and taxi-clearance
    (Start-up and   b) At 20:11 Ground Control gives start-up, push-back and taxi-clearance
    push-back
    procedure at
    TSAT)




                                                                                                        35
                                                                   HONG KONG INTERNATIONAL AIRPORT
                                                                       A-CDM OPERATIONS GUIDELINES

9.3 REGULATED FLIGHT (CTOT ALLOCATION)

   Assumed scenario conditions:
           Assume flight is departing at 20:00.
           The flight from the airline side is running perfectly on time
           There is a flow control restriction and the flight is assigned a CTOT at 21:40 creating a difference between TOBT and TSAT that is more than
            60 minutes
           Boarding time is 45 minutes
   When this delay <occurs, the AO/GH can proceed according to two alternatives:
           Maintain Boarding Process - Continue the turnaround process and aim to be ready at TOBT or:
           Delay Passenger Boarding - Decide to delay passenger boarding and update the TOBT accordingly to a new time ensuring they are ready in
            due time not to miss the TSAT and CTOT.

   A-CDM Process for Alternative 1 - Maintain Boarding Process (step-by-step):
        Time           A-CDM Actions
    1   17:00 (EOBT    a) Flight plan has been activated for 20:00 EOBT. Any milestones that the inbound flight may have passed are calculated and
        – 3 Hours)        checked off.
                       b) The A-CDM platform will calculate a POBT and PSAT at 20:00 and make POBT and PSAT are made available in the A-CDM
                          Portal




                                                                                                                                                           36
                                                           HONG KONG INTERNATIONAL AIRPORT
                                                               A-CDM OPERATIONS GUIDELINES

    Time          A-CDM Actions
2   18:00 (EOBT   a) CAD issues a CTOT for the flight at 21:40
    -2 hours)     b) A-CDM platform will generate a PSAT at 21:20 (PSAT = CTOT – EXOT – 5 minutes)
                  Due to the CTOT and change of PSAT the AO/GH is aware of the delay and can now make a decision to move TOBT to later and
                  delay the boarding. The AO/GH makes the decision not to change the TOBT and proceed as planned.




                                                                                                                                             37
                                                             HONG KONG INTERNATIONAL AIRPORT
                                                                 A-CDM OPERATIONS GUIDELINES

    Time          A-CDM Actions
3   19:20 (TOBT   a)   TOBT (@20:00) is confirmed by AO/GH
    -40 min)




                                                                                               38
                                                        HONG KONG INTERNATIONAL AIRPORT
                                                            A-CDM OPERATIONS GUIDELINES

    Time        A-CDM Actions
4   19:35:      b) TSAT (@21:20) is issued and published via A-CDM platform
    (TOBT -25
    min)




                                                                                          39
                                                              HONG KONG INTERNATIONAL AIRPORT
                                                                  A-CDM OPERATIONS GUIDELINES

    Time          A-CDM Actions
5   19:55 -       a)   At 19:58 flight deck calls Clearance Delivery (CD) with “ready” (i.e. inside the TOBT window of TOBT +/- 5 minutes)
    20:05 (Call
                  CDC marks ARDT and instructs pilot to call back at TSAT time
    “ready” at
    TOBT)




                                                                                                                                             40
                                                           HONG KONG INTERNATIONAL AIRPORT
                                                               A-CDM OPERATIONS GUIDELINES

    Time        A-CDM Actions
6   21:15 –     a)   At 21:17 pilot calls CDC who hands over to GC
    21:25
                At 21:20 Pilot requests start-up and push back approval from GC. GC gives the start-up and push back approval (ASAT)
    (Start-up
    and push-
    back
    procedure
    at TSAT)




                                                                                                                                       41
                                                              HONG KONG INTERNATIONAL AIRPORT
                                                                  A-CDM OPERATIONS GUIDELINES

A-CDM Process for Alternative 2 - Delay Passenger Boarding (step-by-step):
     Time              A-CDM Actions
 1   17:00 (EOBT – 3   a) Flight plan has been activated for 20:00 EOBT. Any milestones that the inbound flight may have passed are calculated
     Hours)               and checked off.
                       b) The A-CDM platform will calculate a POBT and PSAT at 20:00 and make POBT and PSAT are made available in the A-
                          CDM Portal




                                                                                                                                                 42
                                                             HONG KONG INTERNATIONAL AIRPORT
                                                                 A-CDM OPERATIONS GUIDELINES

    Time             A-CDM Actions
2   18:00 (EOBT -2   a) CAD issues a CTOT for the flight at 21:40
    hours)           b) A-CDM platform will generate a PSAT at 21:20 (PSAT = CTOT – EXOT – 5 minutes)
                     Due to the CTOT and change of PSAT the AO/GH is aware of the delay and can now make a decision to move TOBT to later
                     and delay the boarding. Since the boarding time for the flight is 45 minutes the decision has to be made no later than 19:15
                     (i.e. TOBT – Boarding time)




                                                                                                                                                    43
                                                           HONG KONG INTERNATIONAL AIRPORT
                                                               A-CDM OPERATIONS GUIDELINES

    Time            A-CDM Actions
3   19:15 (TOBT -   a)   AO/GH assesses the PSAT (and CTOT) and makes decision to move the TOBT until TSAT, i.e. at 21:20. By inputting the
    45 min)              TOBT the POBT is deleted and any sub-sequent updates has to be made directly by AO/GH




                                                                                                                                              44
                                                               HONG KONG INTERNATIONAL AIRPORT
                                                                   A-CDM OPERATIONS GUIDELINES

    Time               A-CDM Actions
4   20:55 (TOBT -      b) TSAT (@21:20) is issued and published via A-CDM platform
    25 min)




5   21:15 - 21:25      a) At 21:15 flight deck calls Clearance Delivery (CD) with “ready” (i.e. inside the TOBT window of TOBT +/- 5 minutes)
    (Call “ready” at   b) At 21:16 CDC marks ARDT and hands over to GC
    TOBT)




                                                                                                                                                45
                                                           HONG KONG INTERNATIONAL AIRPORT
                                                               A-CDM OPERATIONS GUIDELINES

    Time            A-CDM Actions
6   21:15 - 21:25   a) At 21:18 pilot calls Ground Control and requests push and start-up approval
    (Start-up and   b) At 21:20 Ground control gives start-up, push-back and taxi-clearance
    push-back
    procedure at
    TSAT)




                                                                                                     46
                                                                     HONG KONG INTERNATIONAL AIRPORT
                                                                         A-CDM OPERATIONS GUIDELINES



10 MEASUREMENT OF KEY PERFORMANCE INDICATORS
    In order to achieve full benefits of the A-CDM implementation it is important to measure and analyse the
    implemented processes and related data. This data is defined as the Key Performance Indicators (KPIs). These
    KPIs can then be used to measure strategic objectives defined by the A-CDM stakeholders.
    The Key Performance Indicators (KPIs) recommended to be measured during the A-CDM program are defined
    in the following subsection.

10.1 KPI AND DEFINITIONS


     KPI                                 Definition                                          Benchmark
                                                                                             value (if
                                                                                             applicable)
     KPI 1 (ARDT accuracy at             -5 >= ARDT-TOBT@MS9 >= +5
     milestone 9)
                                            Pilot call ready with +/- 5mins of the First
                                             TOBT.
                                            To analyse the predictability of the flight.
     KPI 2 (ARDT accuracy at             -5 >= ARDT-TOBT@MS15 >= +5
     milestone 15)
                                            Pilot call ready with +/- 5mins of the Last
                                             TOBT.
                                            To analyse the compliance of pilot to follow
                                             TOBT procedure.
     KPI 3 (TSAT accuracy)               ASAT – TSAT (at 0min and less than 5mins)
                                            To analyse the accuracy of TSAT and ATC to
                                             follow the TSAT procedure.


     KPI 4 (AOBT accuracy according      -5 >= AOBT – TSAT >= +5
     to TSAT)
                                            To analyse if push back according to TSAT.
     KPI 5 (AOBT accuracy according      AOBT – ASAT (within 1min, 2min and 3min)
     to ASAT)
                                            To analyse if pack back immediately after
                                             ATC approval.
     KPI 6 (Traffic Congestion)          TSAT= TOBT (%)
                                            To analyse ratio of TSAT = TOBT to
                                             determine airport congestion situation.




                                                                                                                   47
                                                                  HONG KONG INTERNATIONAL AIRPORT
                                                                      A-CDM OPERATIONS GUIDELINES



10.2 KPI MONITORING AND REPORTING
   The Airport Authority will conduct routine review of Key Performance Indicators (KPIs) of each individual
   airlines to identify any major non-compliance or misuse of the A-CDM procedures and system. The Airport
   Authority will contact the airlines/ground handling agent to seek for explanation and improvement measures.
   In order to enhance the transparency of the A-CDM performance, AA may consider to publish the KPIs result
   to all stakeholders periodically.




   END




                                                                                                                 48

