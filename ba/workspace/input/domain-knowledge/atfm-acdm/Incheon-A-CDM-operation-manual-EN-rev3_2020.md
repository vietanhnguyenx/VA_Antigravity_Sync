---
source_url: ""
document_type: "Domain Knowledge — trích xuất PDF (pdftotext -layout)"
extracted: "2026-06-16"
status: "Raw extract — chưa biên tập"
---

# Incheon-A-CDM-operation-manual-EN-rev3_2020

> **Nguồn (PDF):** 
> **Lưu ý:** Trích tự động bằng `pdftotext -layout` (qua WSL /mnt) — trung thực nội dung, có thể lệch định dạng bảng/cột. Đối chiếu PDF gốc khi cần.

---
 Incheon A-CDM
Operation Manual




    Incheon International Airport
                          A-CDM 운영 매뉴얼                                                  Rev. 3




                              Log of Revision
       Date
 NO. applicable        Based on            Main Contents of Amendments                Remarks
                    IIAC, Aerodrome Establishment of A-CDM Operation
Rev.0 Nov 30 2017 Operations Group-4792 Manual
                                        - Inserted Log of Revision
                                        - Reflected ATCC COBT
                                        - Modified Milestones(inserted SOBT)
                                        - Modified the automatic TOBT generation
                  IIAC,  Aerodrome
Rev.1 May 28 2018 Operations Group-1688 - standard(considering    massive delay)
                                          Added VDGS introduction and features
                                        - Unified TSAT vocabularies (System
                                          TSAT/Tower TSAT)
                                        - Reflected system update and modified
                                          other phrases
Rev.2 Nov 5 2018 IIAC,   Aerodrome - Change Milestones Time
                  Operations Group-3996
                                        - Modified Inbound Milestones
                                           (deleted SLDT/inserted SIBT)
                                        - Reflected Mobile A-CDM System
                  IIAC,  Aerodrome      - Operation of A-CDM Operation center
Rev.3 Dec 26 2019 Operations Group-6930 - CTOT’s applying and sharing(deleted COBT)
                                        - Changed VDGS display
                                        - Added contingency procedure
                                        - Reflected system update and modified
                                          other phrases
A-CDM Operation Manual         Rev. 3




    Intentionally Left Blank
            A-CDM Operation Manual                                            Rev. 3


                               Table of Contents

 Chapter    Article                           Title                    Page
 Revision History and List of Effective Page                            -

 Table of Contents                                                      1

Chapter 1   General                                                     2

             1.1      Purpose                                           2

             1.2      Scope of Application                              2

             1.3      Relevant Rationale and International Standards    2

             1.4      Definitions                                       3

Chapter 2   Incheon A-CDM Introduction                                  8

             2.1      Overview                                          8

             2.2      Basic Procedure                                   10

             2.3      Major Milestones                                  18

             2.4      De-icing/Anti-icing                               28

Chapter 3   A-CDM System                                                31

             3.1      System Overview                                   31

             3.2      How to Access System                              31

             3.3      Layout of All Menus                               32

             3.4      Main Screens                                      33

             3.5      TOBT Update                                       42

             3.6      Mobile A-CDM                                      44

             3.7      Alarm Message                                     48

             3.8      State Message                                     49

Chapter 4   Contingency Plan                                            49

             4.1      Overview                                          50

             4.2      Types of Contingency                              50

             4.3      Response Procedure                                51




                                      - 1 -
              A-CDM Operation Manual                                     Rev. 3



                     Chapter 1 General
1.1 Purpose

   This manual is to help users to understand Airport-Collaborative Decision
   Making (A-CDM) developed to utilize limited resources effectively and to
   support efficient flight operation in response to the increasing demand for
   air traffic. It is aimed at sharing flight operation and resource information
   of the Incheon International Airport with air traffic controllers, Airport
   Corporation, aircraft operators, ground handlers and other collaborative
   partners and enabling efficient decision-making and rapid response by using
   A-CDM system and other associated systems in an effective manner.
1.2 Scope of Application

   This manual is applicable to Seoul Regional Office of Aviation, Incheon
   International Airport Corporation, aircraft operators, ground handlers, etc.
1.3 Relevant Rationale and International Standards

1.3.1 Domestic Rationale
    _________________(Notification of the Ministry of Land, Infrastructure
    and Transport )
1.3.2 International Rationale and Standards
    1. ICAO, Aviation System Block Upgrade (ASBU)
    2. ICAO, DOC 9971 (Manual on Collaborative Air Traffic Flow Management)
    3. Eurocontrol, Manual (Airport CDM Implementation Ver.5)

                                     - 2 -
              A-CDM Operation Manual                                    Rev. 3



1.4 Definitions
   Terms and abbreviations used in this Manual are defined as follows:
ATFMS          Air Traffic Flow Management System is used by the Air Traffic
            Command Center and provides CTOT and FIR time information.
DMAN        Departure Manager is a planning system to improve the
            departure flows at an airport by calculating the Target
            Take Off Time (TTOT) and Target Start up Approval
            Time (TSAT) for each flight, taking multiple constraints
            and preferences into account
FIA         Flight Information Assistant is a system that enables
            aircraft operator and ground handler to enter gate opening,
            passenger boarding, final call, etc. in front of the gate. It
            enables TOBT input.
Turn Around Turn-Around refers to a series of processes starting from
            the time an aircraft arrives at Incheon Airport, goes
            through ground handling and gets ready for departure, until
            the time it leaves.
Milestone   Milestones mean 16 reference points that affect the operation
            and preparations of a flight during the processes where an
            inbound aircraft takes off from the originating airport and
            arrives at Incheon Airport, and an outbound aircraft gets ready
            to take off from Incheon Airport. They consist of detailed time
            information. See <Table. A-CDM Milestone Information>
De-icing    De-icing is removal of frost, ice or snow piled up or formed
            on an import location of an aircraft surface for the purpose of
            the safety of an outbound flight. It is performed in a designated
            place equipped with de-icing equipment.
Return-to- Return-to-Gate means a situation in which an aircraft has
Gate        to return to a parking stand after push-back or taxiing for
            reasons such as technical problem, weather condition,
            passenger disembark, etc.

                                    - 3 -
                A-CDM Operation Manual                                             Rev. 3



Each milestone consists of the time information used in this manual, which
is defined Major Time Parameters are as below:
                  < Table. Major Time Parameters of A-CDM >
Acronyms              Term                                 Description

 ACGT Actual Commence of Ground
      handling Time
                                The time when ground handling on an aircraft starts.

                                       The time when spraying of de-icing/anti-icing
 AEZT      Actual End of De-icing Time fluid on an aircraft     and inspection are
                                       complete at the de-icing pad.
                                         The time when an aircraft actually enters the
 APIT      Actual de-icing Pad In Time
                                         pre-assigned de-icing pad for de-icing.
                                         The time when an aircraft actually exits the
 APOT Actual de-icing Pad Out Time       de-icing pad after de-icing.

 ACZT Actual Commence of De-icing Time The time when de-icing/anti-icing fluid starts to
                                       be sprayed on an aircraft on the de-icing pad.
                                         The time when an aircraft arrives in-blocks
 AIBT      Actual In Block Time          (the time when VDGS and ASDE recognize
                                         an aircraft in-blocks).
 ALDT Actual Landing Time                The time when an aircraft lands on a runway.
                                         The time when an aircraft is cleared by the
 AOBT Actual Off Block Time              Apron Control Tower and pushes back.
                                         The time recognized by Seoul Approach Control
 APP       Approach Control Unit         Unit that an inbound aircraft approaches a
                                         terminal control area.
                                         The time when an aircraft is ready for start up
 ARDT Actual Ready Time for movement     on the stand. It is calculated with the time when
                                         a boarding bridge is removed from an aircraft.
                                         The time when an aircraft approaches the
 ARIT      Actual Ramp In Time           apron after landing or when a pilot contacts the
                                         apron controller before approaching the apron.



                                         - 4 -
                 A-CDM Operation Manual                                              Rev. 3



Acronyms               Term                                  Description
                                            The time when an aircraft enters the
                                            maneuvering area from the apron or when the
AROT Actual Ramp Out Time                   apron controller transfers the frequency of an
                                            outbound aircraft to the control tower before it
                                            enters the maneuvering area.
                                    The time when the Apron Control Tower gives
                                    push-back approval for an aircraft that
           Actual Start Up Approval
ASAT       Time
                                    received flight clearance so that it can depart
                                    (in case of remote spot, the time of approval
                                    for engine start-up).
                                            The time when an outbound aircraft starts
ASBT Actual Start Boarding Time             passenger boarding.
                                     The time when a pilot of an outbound flight
           Actual Start Up Clearance
ASRT       Request Time
                                     requests engine start-up or push-back for
                                     departure to the Apron Control Tower.
                                            The time when an aircraft takes off from the
ATOT Actual Take Off Time                   runway.
                                            The time required for an inbound aircraft to
 AXIT      Actual Taxi In Time              move from the runway to the aircraft stand
                                            after landing.
                                            The time required for an outbound aircraft to
AXOT Actual Taxi Out Time                   taxi from the aircraft stand to the runway.
                                            The take-off time calculated and issued by
                                            the Air Traffic Command Center, taking into
                                            account the route capacity and adjusting the
CTOT Calculated Take Off Time               airport capacity.
                                            *COBT(Calculated off block time) Off block time
                                            provided from the Air Traffic Command Center for
                                            non-A-CDM airport
                                            The estimated time when an aircraft arrives
 EIBT      Estimated In Block Time
                                            in-blocks after landing and taxiing.
                                            The estimated time when an aircraft arrives
 EPIT      Estimated de-icing Pad In Time
                                            in-blocks after landing and taxiing.




                                            - 5 -
                A-CDM Operation Manual                                              Rev. 3



Acronyms              Term                                  Description
                                      The estimated time when an aircraft leaves the
           Estimated de-icing Pad Out de-icing pad, factoring in the time required to
EPOT       Time                       move from the de-icing pad to the transfer of
                                      control point after de-icing/anti-icing.
                                        The estimated time when an aircraft will touch
                                        down on the runway. It refers to an estimated
                                        landing time automatically adjusted with AFTN,
ELDT Estimated Landing Time             the time notified by an airline via wired
                                        communication, or a landing time calculated by
                                        the approach control radar when an inbound
                                        flight enters a terminal control area.
                                        The estimated time at which an aircraft will start
EOBT Estimated Off Block Time           movement off-block for departure.
                                        The estimated time at which an aircraft will enter
ERIT       Estimated Ramp In Time
                                        the apron after landing and moving to the apron.
                                        The time when an outbound aircraft is
EROT Estimated Ramp Out Time            transferred from the Apron Control Tower to
                                        the control tower, after push-back.
                                        The estimated take-off time from the runway,
ETOT Estimated Take Off Time            which is calculated by adding EOBT and
                                        EXOT(or VTT).
                                        The estimated taxi time from the runway to the
 EXIT      Estimated Taxi In Time
                                        gate after landing.
                                        The estimated taxi time for an outbound
EXOT Estimated Taxi Out Time            aircraft from the gate to the runway after
                                        push-back clearance.
                                        The time recognized by the Air Traffic Control
 FIR       Flight Information Region    Center when an inbound aircraft approaches the
                                        Flight Information Region of the Republic of Korea.
                                        The minimum turn-round time agreed with an
                                        AO/GH for a specified flight or aircraft type. It
MTTT Minimum Turn-round Time            is set as the reference value for each aircraft
                                        operator or an average value of inbound/
                                                        —
                                        outbound quick turn aircraft.


                                        - 6 -
                 A-CDM Operation Manual                                               Rev. 3



Acronyms              Term                                Description

 SIBT      Scheduled In Block Time     Scheduled time that an aircraft is expected to
                                       arrive at its parking position after landing.
                                       Scheduled time an aircraft is expected to
SOBT Scheduled Off Block Time          depart from the parking position, derived by
                                       an aircraft operator schedule.
                                       Target estimated time when an aircraft will be ready,
                                       boarding completed, all doors closed, boarding
TOBT Target Off Block Time             bridge removed, push-back vehicle available and the
                                       pilot ready to start up immediately upon reception of
                                       push-back clearance.
                                    Target estimated time that the Apron Control
                                    Tower is expected to approve push-back for
                                    an outbound aircraft (in case of remote spot,
           Target Start Up Approval engine start-up approval time). It is calculated
TSAT       Time                     with TTOT generated by the control tower, on
                                    the basis of TOBT provided by an aircraft
                                    operator. However, it is restrictively issued
                                    and operated in Phase 1 Operation.
                                       The control tower’s target take-off time taking
                                       into account TOBT, CTOT, traffic conditions,
TTOT Target Take Off Time              en-route situation and altitude separation.
                                       However, it is issued and operated
                                       restrictively in Phase 1 Operation.
                                       The taxi time that an aircraft spends on the
                                       ground between its parking stand to the runway,
 VTT       Variable Taxi Time
                                       or vice versa. A-SMGCS calculates it, factoring
                                       in an aircraft’s ground taxing speed.




                                         - 7 -
                 A-CDM Operation Manual                                                Rev. 3



         Chapter 2                Incheon A-CDM Introduction

2.1 Overview

2.1.1 Incheon Airport A-CDM supports the decision-making based on accurate
       forecasting for all partners including airport operator, the Air Traffic Control
       Center, aircraft operator and ground handler that perform the aircraft operation
       at the airport and other related jobs. Furthermore, it enables users to respond
       to the continuously increasing demand for air traffic and utilize limited
       resources at the airport efficiently, thereby actively managing flight delays.
2.1.2 The success of A-CDM depends on collaboration and efforts of partners to
       share time information such as aircraft operation support, preparation and air
       traffic control, which has been managed separately by individual entity, and to
       predict and comply with the target time based on the shared time information.
2.1.3 Individual partners share the pre-estimated flight operation time information via
       A-CDM System, which enables them to perform better decision-making by
       taking accurate measures in a timely manner. The whole process will help
       them to realize that they serve in the same aviation community.
2.1.4 Decision-making based on accurate forecasting is environment-friendly and also
       enhances the operational efficiency at the airport in that it optimizes the distribution
       of resources among individual partners and reduces unnecessary aircraft delay on
       the ground, which will reduce not only fuel costs but also carbon emissions.
2.1.5 A-CDM system takes the milestone approach that divides aircraft movement
       time information into milestones and manages flight arrival and departure
       time, taxiing, ground handling and so forth as milestone time information.
                                            - 8 -
              A-CDM Operation Manual                                    Rev. 3



      Thus, it allows for information management by systematically integrating
      with other systems at the airport such as the Air Traffic Service Unit,
      aircraft operators and ground handlers.




             <Figure 2-1. Associated Systems of Incheon A-CDM>

2.1.6 The operation of Incheon Airport A-CDM is planned to be divided into
     3 phases as follows:
    - Phase 1 Operation (Dec. 2017 – Dec. 2019): Share basic time information
      with partners via A-CDM and implement system stabilization
    - Phase 2 Operation (Dec. 2020 – Dec. 2024): Improve TTOT/TSAT and
      enlarge the scope to cover de-icing/anti-icing information sharing by
      upgrading DMAN (Departure Manager)
    - Phase 3 Operation (Jan. 2025 – ): Implement integrated airport
      operation that covers L/S as well as A/S through application of future
      airport operation concepts such as TAM(Total Airport Management) and
      PBAM(Performance based Airport Management)

                                    - 9 -
                A-CDM Operation Manual                                   Rev. 3



2.2 Basic Procedure
2.2.1 Understanding of Milestones

2.2.1.1 Incheon Airport A-CDM defines the whole process as milestones from the
        moment an inbound aircraft gets ready and takes off from the originating
        airport toward Incheon Airport and arrives at Incheon Airport until it
        goes through turn-around including boarding and ground handling,
        becomes ready for departure and takes off from Incheon Airport.




        ATC
        Clearance




              <Figure 2-2. Incheon A-CDM Milestone and Process>

2.2.1.2 Incheon A-CDM shares essential flight operation information generated
       from a total of 16 milestones that cover arrival, turn-around and
       departure, and it also provides partners with individual event
       occurrence information according to the procedure. Therefore, they can
       make the use of the information in a timely manner, make decisions
       and take immediate measures based on the updated information.
                                     - 10 -
                   A-CDM Operation Manual                                                      Rev. 3


2.2.2 Role of Individual Collaborative Entity

2.2.2.1 Effects of Incheon Airport A-CDM can be maximized through active
        cooperation among partners such as the Air Traffic Service Unit,
        Incheon Airport Corporation, aircraft operators and ground handlers.
2.2.2.2 Ground handler shares accurate information on ground handling
        status and progress via the associated system automatically or
        manually. In addition, it may enter TOBT (Target Off Block Time)
        for an aircraft operator that cannot directly enter TOBT into the
        system under a separate agreement with aircraft operator.
2.2.2.3 Aircraft operator shares up-to-date flight arrival/departure schedule information
        with partners automatically via its own system or manually via A-CDM
        System(Portal/Mobile), and monitors aircraft preparation status of ground
        handlers and provides partners with TOBT of outbound aircraft. However, under
        a separate agreement with an aircraft operator that cannot directly enter TOBT,
        ground handlers may enter TOBT instead of the aircraft operator.
2.2.2.4 Control Tower produces TTOT (Target Take Off Time) and TSAT (Target Start Up
        Approval Time) for an aircraft for which ATFM (agreed take-off, etc.) is reflected,
        taking into account TOBT, CTOT, traffic conditions, en-route situation and altitude separation.
2.2.2.5 Apron Control Tower controls push-back clearance and taxiing of outbound
        aircraft, taking into account traffic conditions inside the apron and TSAT, TTOT
        produced by the control tower; provided that de-icing/anti-icing is performed, it
        shares de-icing/anti-icing information such as de-icing pad in/out time.
2.2.2.6 Apron Management Unit supports update of EOBT provided by
        aircraft operator as well as off-block time input, and allocates and
        adjusts aircraft stands according to the inbound/outbound schedule.
2.2.2.7 A-CDM Operation center performs monitoring and management of
        the Incheon Airport A-CDM. In case of an abnormal situation at the
        airport, the center forms A-CDM Cell and reports the situation(delay,
        etc.).

                                                - 11 -
               A-CDM Operation Manual                                                Rev. 3


2.2.2.8 Air Traffic Command Center may issue CTOT(Calculated Take Off Time) to
       spread the traffic volume information, and shares it via A-CDM system(Portal/Mobile).
2.2.3 Procedure for Inbound Operation

2.2.3.1 Inbound milestones of Incheon Airport A-CDM consists of 7 out of a
       total of 16 milestones, and manages and shares 14 time parameters.




            <Figure 2-3. Inbound Milestones and Time Parameters >

2.2.3.2 The inbound procedure starts with receiving and sharing departure
       information from the originating airport 3 hours and 1 hour prior to
       the off-block time of the inbound aircraft at the originating airport.
2.2.3.3 When an inbound aircraft takes off from the originating airport, the
       take-off time is received and shared via AFTN.


                                         - 12 -
                 A-CDM Operation Manual                                               Rev. 3



2.2.3.4 The estimated time of landing on the runway at Incheon Airport is
          provided as ELDT (Estimated Landing Time) when an inbound
          aircraft approaches Incheon Flight Information Region and Seoul
          Terminal Control Area in the Republic of Korea.
2.2.3.5 EIBT (Estimated In Block Time) of an inbound aircraft is calculated by
          adding EXIT (Estimated Taxi In Time) to the pre-assigned aircraft stand to
          ELDT prior to landing, and is calculated on the basis of the actual
          movement speed of the aircraft by using A-SMGCS system. However, EIBT
          does not consider a situation where an inbound aircraft stand is not open.
2.2.3.6    Therefore, an aircraft operator shall maintain correct and up-to-date
          information on the originating airport schedule and take-off of an inbound
          flight. At the same time, it shall actively maintain delayed and revised
          schedule of an aircraft departing Incheon Airport and share it with partners.
2.2.4 Procedure for Outbound Operation

2.2.4.1 Outbound milestones of Incheon A-CDM consists of 9 out of a total of
          16 milestones, and manages and shares 19 time parameters(except for
          6 de-icing parameters).
2.2.4.2 The outbound milestones start with the step to commence ground handling after the
          arrival, and estimate and automatically share TOBT of a turn-around aircraft, taking
          into account MTTT (MinimumTurn-round Time) and in-block time (EIBT and AIBT).
2.2.4.3 TOBT, which is the most important parameter in A-CDM, is input         by
          aircraft operators or ground handlers from 90 minutes prior to TOBT via
          A-CDM System(Portal/Mobile) or FIA system at the passenger terminal
          gate to be shared with partners. If TOBT deviates from the automatically
          calculated TOBT for 5 minutes or more, TOBT shall be revised.
                                           - 13 -
                 A-CDM Operation Manual                                                  Rev. 3




 <Figure 2-4. Outbound Milestones and Time Parameters of Incheon A-CDM >

2.2.4.4 In Phase 1 Operation, TTOT is automatically calculated in A-CDM based on
         TOBT provided by aircraft operator and then is color-coded in black and displayed
         on the system(Portal/Mobile). However, if ATFM (Air Traffic Flow Management)
         is issued and agreed take-off is in progress, the Control Tower provides TTOT at
         the time agreed with Incheon Air Traffic Control Regional Office, taking TOBT
         into account. This is revised and shared in blue on the system(Portal/Mobile).
2.2.4.5 In Phase 1 Operation, TSAT is automatically calculated in A-CDM based on TOBT and
         is displayed in black on the portal system. However, if ATFM (Air Traffic Flow
         Management) is issued and agreed take-off is in progress, TSAT calculated with the
         difference between TTOT provided by the Control Tower and EXOT (Estimated Taxi
         Out Time) is revised and shared in blue on the portal. The pilot can be informed of blue
         TSATthrough VDGS (Visual Docking Guidance System) or the company frequency.


                                            - 14 -
               A-CDM Operation Manual                                     Rev. 3



2.2.4.6 Aircraft operator can manage passenger boarding and flight departure with
        reference to TSAT provided by the Control Tower in blue based on ATFM
        (agreed take-off, etc.). Since route and weather conditions may cause
        sudden changes in TSAT, however, the aircraft operators shall monitor
        TSAT, ATFM and weather information and take a proper measure.




                 <Figure 2-5. TOBT and TSAT Flow Diagram >

2.2.4.7 If departure is delayed for internal reasons such as aircraft maintenance
        check, passenger, freight and ground handling, leading to a variance in
        TOBT of 5 minutes or more, TOBT shall be modified. If TOBT
        deviates from EOBT for 15 minutes or more, EOBT shall be modified,
        and TOBT changes to the value of EOBT.
2.2.4.8 The pilot shall request a ATC clearance to Control Tower within TOBT
        ±5 minutes window. However, if it is not possible due to maintenance
        check, etc, the pilot shall request the relevant aircraft operator or
        supporting ground staff of the aircraft operator to update TOBT or EOBT
        to ensure that a further delay caused by clearance omission is avoided.
                                     - 15 -
              A-CDM Operation Manual                                     Rev. 3


2.2.4.9 The pilot who received TSAT from the Control Tower keeps monitoring
       the Apron Control Tower frequency, and then contacts the Apron Control
       Tower within TSAT ±5 minutes window to request engine start-up and
       push-back. If he/her fails to request push-back within TSAT +5 minutes
       window, the flight clearance might be cancelled and TOBT(or EOBT)
       needs to be re-entered, and a clearance and TSAT re-issued.
2.2.4.10 The pilot without TSAT shall notify the Apron Control Tower that
        it is ready for departure, once the preparation is complete, and
        follow the instruction of the Apron Controller.




        <Figure 2-6. Role of Pilot and Flow Diagram in case of Delay>

2.2.4.11 TSAT produced in accordance with ATFM (agreed take-off, etc.) is
        color-coded in blue and displayed on the system(Portal/Mobile).
        Additionally, at the aircraft stand with VDGS (Visual Docking
        Guidance System), TSAT is provided via VDGS at the stand.
2.2.4.12 Partners can check ASBT (Actual Start Boarding Time), ARDT (Actual
        Ready Time for movement), ASRT (Actual Start Up Clearance Request Time),
        ASAT (Actual Start Up Approval Time), AOBT (Actual Off Block Time),
                                    - 16 -
              A-CDM Operation Manual                                            Rev. 3


       EROT (Estimated apron Out Time), ETOT (Estimated Take Off Time)
       and so forth, which are automatically provided via A-CDM system(Portal/Mobile).
2.2.4.13 ETOT is calculated by adding pre-defined EXOT to TSAT. Also,
       after an outbound aircraft pushes back, it is provided as the
       estimated time required to reach the assigned runway, which is
       calculated on the basis of the actual taxing speed of the aircraft
       from A-SMGCS. Therefore, the value may be subject to change
       depending on push-back, traffic and taxiing speed.
2.2.4.14 If an outbound aircraft returns to gate after push-back due to
       aircraft maintenance check, passenger disembark, crew member,
       weather condition or for other reasons, the Apron Control Tower
       inputs the return-to-gate event, TTOT is cancelled and the TOBT,
       TSAT and TTOT values of the outbound aircraft remains
       unchanged. Thus, aircraft operator or ground handler shall revise
       EOBT and TOBT to get ready for departure.




                < Figure 2-7. Return-to-gate Flow Diagram >



                                       - 17 -
               A-CDM Operation Manual                                     Rev. 3



2.3 Major Milestones
2.3.1 TOBT (Target Off Block Time)

2.3.1.1 Definition
      TOBT is the time that an Aircraft Operator or Ground Handler
      estimates that an aircraft will be ready, all doors closed, boarding bridge
      removed, push back vehicle available and ready to start up / push back
      immediately upon reception of clearance from the apron control tower.
2.3.1.2 Necessity
      TOBT serves as basic time parameter for pre-departure management
      that takes into account take-off sequence of an outbound aircraft and
      for calculation of TSAT and TTOT. Therefore, it shall be accurately
      managed for the purpose of accurate pre-departure management and
      stable operation of A-CDM.
2.3.1.3 Automatic Generation and Update
      1. TOBT of an outbound aircraft is automatically generated from one
          day before the flight with reference to EOBT in the flight schedule.
      2. If TOBT is not manually input, TOBT is automatically updated as
          follows:
        - If EIBT(AIBT) of the inbound aircraft plus MTTT (Minimum
            Turn-round Time) is not earlier than EOBT, TOBT is updated to
            the calculated value.
           * MTTT is the total average value or pre-defined by aircraft
               operator.
        - For other outbound aircraft, the value remains the same as EOBT.
     3. Aircraft operator and ground handler that operate their own systems
         should integrate them with A-CDM and automatically update TOBT.
                                     - 18 -
               A-CDM Operation Manual                                                   Rev. 3



2.3.1.4 Input Management
     1. Aircraft operator or ground handler is responsible for generating,
         managing and complying with TOBT, and the responsibility for the
         overall management is on the relevant aircraft operator.
     2. An error in TOBT impedes the overall operational efficiency. Thus,
         in case of any change in TOBT, it shall be updated immediately.
     3. The accuracy of TOBT shall be within the range of ±5 minutes.
        Therefore, TOBT shall be updated in case of a variance by 5 minutes
        or more from automatically or manually input TOBT due to a delay
        caused by aircraft or ground handler including aircraft maintenance and
        passenger. The reliability of TOBT is separately monitored and shared.
     4. If it is not possible to predict a delay for reasons attributable to aircraft operator
        and ground handler, EOBT shall be updated as soon as possible taking into account
        the estimated time of departure so that TOBT can be automatically updated.
     5. A delay caused by external conditions such as en route and ground
        traffic is not reflected in TOBT. If CTOT and blue TSAT cause
        delay, the departure preparation time including the ground handling can
        be changed. If departure time is changed, TOBT should be changed.
2.3.1.5 Manual Input and Update
     Aircraft operator and ground handler manually input or update TOBT
     via A-CDM system(Portal/Mobile) and FIA system to ensure the
     reliability of TOBT according to the following procedure:
     1. TOBT can be manually input or updated from 90 minutes prior to EOBT and wil be
         displayed in green color. However, EOBTcan be updated before then, separately fromTOBT.
     2. If a variance of 5 minutes or more is expected, TOBT shall be updated
        to the estimated time. If a variance from EOBT of 15 minutes or more
        is expected, EOBT shall be updated. In case of EOBT update, TOBT is
        automatically updated to the value of EOBT.
     3. EOBT is updated as below.
       - Through the airlines system if the there is a system interface
            between the systems of airlines and Incheon Airport.
       - If the request for EOBT(ETD) update is made to the Apron management Unit.

                                           - 19 -
                A-CDM Operation Manual                                                  Rev. 3



      4. After manual input, TOBT is not automatically updated. However, if EOBT
         changes, TOBT will be automatically updated so that it equals EOBT.
      5. Aircraft operator and ground handler can input and update TOBT without
         limitation in number of times before TSAT is color-coded in blue on the
         system(Portal/Mobile). After the color code of TSAT changes to blue in
         the portal system, direct input by aircraft operator and ground handler is
         limited. Thus, new TOBT shall be notified to the Apron Management Unit
         for update via wired communication. Aircraft operator and ground handler
         can update TOBT up to three times and after the third update, they shall
         update and share EOBT. In case of revision, TOBT cannot be greater
         than TSAT, and if it is greater than TSAT, EOBT shall be modified, new
         TOBT shall be shared. and new TSAT shall be created by the Tower.
      6. After the Control Tower produces TSAT based on ATFM (agreed
         take-off, etc.), TOBT is not revised on the FIA system. Therefore,
         if TSAT is displayed on the FIA and it is not allowed to input the
         value in the FIA system, delay information shall be notified to the
         Apron Management Unit via wired communication to update EOBT
         and the modified time to be reflected on TOBT.
      7. If TSAT and TTOT change to blue color on the system(Portal/Mobile), it means that
         the take-off sequence has been set and take-off time and the off-block time determined.
         Therefore, if aircraft operator cannot comply with TSAT, it shall immediately
         update EOBT in order to avoid further delay caused by clearance re-issuance.
      8. If input TOBT shows a later time point than TSAT(orange)
         reflecting CTOT or TSAT(blue) by the Control Tower, it will be
         displayed in red color on the system(Portal/Mobile).
2.3.1.6 Input Tool
      Aircraft operator and ground handler can input TOBT on the departure
      management screen of A-CDM System(Portal/Mobile) and on the FIA system
      installed at the terminal gate. If the FIA system is not available, EOBT shall be notified
      to the Apron Management Unit via wired communication so that TOBT is updated.
                                           - 20 -
        A-CDM Operation Manual                                    Rev. 3




< Figure 2-8. TOBT entry screen on A-CDM System(Portal/Mobile)>




  < Figure 2-9. TOBT entry screen on A-CDM System(Mobile) >




          < Figure 2-10. TOBT input screen on FIA >



                             - 21 -
               A-CDM Operation Manual                                             Rev. 3


2.3.1.7 Display and Utilization
      TOBT is displayed on PDU (Pilot Display Unit) of VDGS from 30
      minutes prior to TOBT. Once the Control Tower issues TSAT with
      ATFM (agreed take-off, etc.), TOBT display will be terminated and
      TSAT will be displayed instead. At the aircraft stand without VDGS
      or at the aircraft stand where VDGS is under maintenance, aircraft
      operator can share it with the pilot by using the company frequency.
2.3.2 TSAT (Target Start-up Approval Time)

2.3.2.1 Definition
      TSAT (Target Start-up Approval Time) is the estimated time when the Apron Control
      Tower is expected to approve engine start-up and push-back for an outbound flight.
      It is calculated by the Control Tower, taking into account ATFM limitations,
      ground movement time, runway capacity, control separation, traffic situations, etc.
      However, in Phase 1 Operation, TSAT is divided and shared as follows:
      1. System TSAT : if there is no delay, or if delay is unpredictable, system
          TSAT is displayed as the same value of TOBT.
      2. TSAT reflecting CTOT : adjusted to CTOT which is provided from
          ATCC depending on VTT.
      3. Tower TSAT : adjusted to the pushback time which reflects TWR-provided
         take-off time after the consultation with ACC considering ATFM.
2.3.2.2 Necessity
      TSAT is provided so that aircraft operator can predict push-back time in
      advance to manage passenger boarding and to get ready for departure efficiently.



                                        - 22 -
                A-CDM Operation Manual                                             Rev. 3


2.3.2.3 Automatic Generation
      1. System TSAT : Automatically generated TSAT refers to the time when a
         pilot makes preparation for departure according to TOBT, gets a ATC
         clearance for the flight and obtains approval for engine start-up and
         push-back when there is no delay. It is shared on the system(Portal/Mobile)
         from one day earlier, color-coded in black. However, if delay occurs due to
         surrounding traffic conditions and route congestion, automatically generated
         TSAT may be different from an actual push-back time.
      2. TSAT depending on CTOT : adjusted to CTOT(provided from ATCC for
         ATFM due to weather conditions and en-route congestion) depending on VTT and it
         is displayed in orange. However, if TSAT reflecting CTOT displays an earlier time
         point than the airlines-provided TOBT, it is displayed in red. If push-back is not
         possible at the timing of shared TSAT, it is necessary to contact ATCC to get a
         new CTOT issued.
2.3.2.4 Manual Generation and Update
      The Control Tower inputs TTOT when it agrees with Incheon Air Traffic Control
      Regional Office on take-off time due to ATFM (agreed take-off, etc.). Then, TSAT
      is calculated by taking into account the time required to taxi from the gate to the
      assigned runway, together with TTOT. Manually generated TSAT changes previous
      TSAT(Automatically generated A-CDM System or recalculated depending on CTOT )
      and shares them in blue.
2.3.2.5 Display and Provision
      TSAT is divided into System TSAT automatically generated on A-CDM
      System(Portal/Mobile) and Tower TSAT calculated with manual input of TTOT by
      the Control Tower, and TSAT reflecting CTOT from ATCC.
      1. System TSAT automatically generated on A-CDM System(Portal/Mobile) is
         displayed in black, and TSAT reflecting CTOT is displayed in orange. In this case,
         the pilot does not receive TSAT information, and it is not displayed on VDGS.

                                         - 23 -
           A-CDM Operation Manual                                      Rev. 3




                <Figure 2-11. TSAT display screen >

2. If the Control Tower produces Tower TSAT taking into account ATFM,
   it is displayed in blue at the System(Portal/Mobile). The pilot can receive
   TSAT upon request, or if needed, when obtaining a ATC clearance by
   the Control Tower or when contacting the Apron Control Tower.
   However, there might be a delay in providing TSAT, depending on the
   consultation with Incheon Air Traffic Control Regional Office for reasons
   such as en route and consultation with surrounding countries.
3. At the aircraft stand that has VDGS, Tower TSAT produced by the
   Control Tower with ATFM (agreed take-off, etc.) is displayed.
    - Terminal 1/2 VDGS : TOBT and Tower TSAT both displayed on PDU.
    - Concourse VDGS : TOBT displayed on PDU is changed to Tower TSAT
4. In case VDGS is inoperable or the aircraft stand does not have VDGS,
   aircraft operator or ground handler can provide TSAT for the pilot by
   using company frequency, if necessary.

 Display



               < Figure 2-12. TSAT display screen >

                                - 24 -
                 A-CDM Operation Manual                                                     Rev. 3


2.3.2.6 Utilization
      If there is a big difference between TOBT and TSAT, aircraft operator and ground
      handler can perform departure management including ground handling and boarding based
      on Tower TSAT produced by the Control Tower. However, TSATmay be subject to change
      due to environmental changes (change in take-off sequence as the preceding flight fails to
      depart, additional delay in the route or early termination of ATFMdue to improved weather
      condition at the destination, etc.), and if TSATchanges, the cell background color of TSATon
      the system(Portal/Mobile) will change to sky-blue color. Thus, it is required for the aircraft
      operator to keep monitoring whether TSAT was revised continuously and secure sufficient
      time to get ready.
2.3.2.7 Cancellation
      The pilot shall request engine start-up and push-back to the Apron Control Tower within
      ±5 minutes window of TSAT produced by the Control Tower. If a delay occurs for
      internal reasons of aircraft operator such as aircraft maintenance check, delay information
      shall be provided to the control tower and Apron Control Tower immediately. Also,
      aircraft operator shall request to change EOBT through the Apron Management Unit.
2.3.3 TTOT (Target Take-Off Time)

2.3.3.1 Definition
      TTOT is the estimated time of take-off from the runway. The Control Tower
      calculates TTOT based on TOBT, taking into account ATFM limitations, ground
      taxing time, runway capacity, control separation and traffic conditions.
      However, in Phase 1 Operation, TTOT is divided and shared as follows:
      1. System TTOT : if there is no delay, or if delay is unpredictable, system
          TSAT is TOBT + aircraft moving time from the stand to the runway.
      2. TTOT reflecting CTOT : take-off time provided by ATCC
          considering ATFM(agreed take-off, etc.) and airspace conditions.
      3. Control Tower TTOT : take-off time provided from the Control Tower
          after the consultation with ACC considering restriction on operations and
          traffic conditions at Incheon Airport, etc.
                                             - 25 -
                A-CDM Operation Manual                                                  Rev. 3


2.3.3.2 Necessity
      TTOT serves as the reference time that becomes the basis for
      accurate TSAT estimation and calculation. It enables each partner to
      predict when the flight will take off.
2.3.3.3 Automatic Generation
       1. System TTOT : Automatically generated TTOT refers to the time when
     the pilot gets ready according to TOBT, obtains a clearance, pushes back and
     taxies and is fully ready to take off from the runway. It is automatically shared
     via System(Portal/Mobile) one day before, color-coded in black. Therefore,
     automatically generated TTOT may be different from actual take-off time,
     depending on delay or taxiway congestion.
      2. TTOT reflecting CTOT : adjusted to the same time of CTOT, which
     is provided from ATCC for ATFM considering weather conditions and en route
     congestion, reflecting VTT. TTOT is displayed in orange. However, if TSAT reflecting
     CTOTis earlier than the airlines-provided TOBT, it is displayed in red. If push-back is not
     possible at the time of shared TSAT, it is necessary to contact ATCC to get a new
     CTOT issued.
2.3.3.4 Manual Generation and Update
      The Control Tower issues TTOT when it agrees with Incheon Air Traffic Control
      Regional Office on take-off time due to ATFM (agreed take-off, etc.). TTOT
      provided by the Control Tower substitutes System TTOT automatically generated
      on the System(Portal/Mobile) and TTOT reflecting COBT.
2.3.3.5 Display and Provision
      On the portal system, TTOT is divided into System TTOT automatically
      generated on A-CDM System(Portal/Mobile) and blue Tower TTOT provided from
      the Control Tower, and TTOT reflecting COBT from ATCC. If the blue TTOT
      changes due to the en-route situation, the cell background color on the portal
      system will change to sky-blue color.

                                           - 26 -
               A-CDM Operation Manual                                   Rev. 3




                       <Figure 2-13. TTOT display screen >

2.3.3.6 Utilization
      1. The calculated TTOT may change due to congestion on the runway
         and the taxiway and sudden change of the runway, and may be
         different from ATOT (Actual Take-Off Time).
      2. In case an outbound aircraft is on standby on the taxiway or in
         another area after push-back due to aircraft maintenance check, etc.
         and taxis again (except for return-to-gate), automatically calculated
         TTOT may be different from ATOT (Actual Take-Off Time).
2.3.3.7 Cancellation
      In case an outbound aircraft returns to the stand after push-back or
      during taxing, TTOT is cancelled and the TOBT, TSAT and TTOT
      values of the flight remain unchanged. Therefore, aircraft operator
      shall revise EOBT and obtain a new ATC clearance to avoid any
      confusion in departure.




                                     - 27 -
               A-CDM Operation Manual                                       Rev. 3



2.4 De-icing/Anti-icing
2.4.1 De-icing/Anti-icing Procedure

2.4.1.1 Aircraft operator or ground handler shall manage TOBT in preparation
        for the operation during snowfall. If de-icing/anti-icing is necessary, the
        pilot makes a request for de-icing/anti-icing to the Apron Control
        Tower after preparations for departure is completed and confirmed.
2.4.1.2 The Apron Control Tower allocates a de-icing pad according to the
        de-icing/anti-icing request from the pilot and the order of flight
        ready for departure, and approves push-back considering the order of
        de-icing/anti-icing and traffic conditions in the apron. EPIT (Estimated
        De-icing Pad In Time) and EPOT (Estimated De-icing pad Out Time) are
        automatically generated when the aircraft that requested
        de-icing/anti-icing begins push-back. However, in Phase 1 Operation,
        EPIT and EPOT, both automatically generated, are provided as
        reference information.
2.4.1.3 The Apron Control Tower allocates de-icing pads, taking into account
        traffic conditions in the apron and de-icing pads. Allocation
        information can be viewed in De-icing Information in the airside
        control menu of the Integrated Information System (IIS).
2.4.1.4 After an aircraft enters the de-icing pad, EPOT is updated and the Control
        Tower can issue a clearance for the aircraft and provide TTOT with
        reference to updated EPOT. However, the timing of TTOT calculation at
        the Control Tower and the time may change depending on ATFM
        limitations, traffic conditions, etc. and TTOT may not be issued.

                                      - 28 -
              A-CDM Operation Manual                                      Rev. 3




          <Figure 2-14. De-icing/Anti-icing Operation Flow Diagram>

2.4.2 Display and Provision

2.4.2.1 If an outbound aircraft requests de-icing/anti-icing to the Apron
       Control Tower, de-icing/anti-icing information will be displayed on
       the left side of the outbound flight information management screen on
       A-CDM System(Portal/Mobile).




        < Figure 2-15. De-icing/Anti-icing information display screen >


                                    - 29 -
              A-CDM Operation Manual                                  Rev. 3


2.4.2.2 EPOT, which is generated when the de-icing aircraft pushes back, is
       updated when the aircraft enters the de-icing pad, taking into
       account APIT (Actual De-icing Pad In Time).
2.4.2.3 In Phase 1 Operation, ACZT(Actual Commence of De-icing Time) and
        AEZT(Actual End of De-icing Time) display the time provided from the
        de-icing ground handlers.




                                   - 30 -
               A-CDM Operation Manual                                                Rev. 3



   Chapter 3 A-CDM System(Portal/Mobile)
3.1 System Overview

   A-CDM System(Portal/Mobile) is one module of the Integrated Information
   System (IIS) and enables partners (Air Traffic Control Unit, Airport
   Corporation, aircraft operator, ground handler) to share flight movement time
   including departure from Incheon Airport or arrival at Incheon Airport, and
   departure again.
   Key inbound/outbound information provided by the portal system is also
   displayed on the mobile A-CDM System.
3.2 How to Access Portal System

3.2.1 Request for Account and Password Management
     Those who wish to use the portal system shall prepare and request an application
     for account online according to the guidance on the Airport Corporation website
     (www.airport.kr/acdm). If the application is submitted successfully, a text message
     ‘completed’ will be sent to the phone number in the application form.
3.2.2 System Installation and Login
    1. Installs the system using the link http://iis.airport.kr:21781/ui/Install/install.html
       and then icon            will be created on the desktop.
    2. Execute the icon, enter ID and password and click on the Login button.
    3. A message for OTP (One Time Password) authentication will be called. Click the OK
        button, and authentication method combo box and OTP Send button will be activated.


                                          - 31 -
            A-CDM Operation Manual                                        Rev. 3




                 < Figure 3-1. Portal system login screen >

   4. After OTP authentication is complete, log in and click on A-CDM Portal.




       < Figure 3-2. Initial screen after login to the portal system >


3.3 Layout of All Menus
          Menu Name                              Description
   Display Notice                Display notices on airport conditions
                                 including ATFM and the portal system
   Display Airport Weather
   Information                   Display  weather
                                 International     information at Incheon
                                               Airport
   Status Flight Schedule and
   Manage                        Manage
                                 status flight schedule information and
   Manage Inbound Flight         Enter, change, delete and display arrival
   Information                   time information
   Manage   Outbound Flight
   Information                   Enter, change, delete and display departure
                                 information


                                   - 32 -
              A-CDM Operation Manual                                 Rev. 3



3.4 Main Screens

3.4.1 Display Notice

3.4.1.1 Register and Display
      A user can register and display system notices and various notices on
      airport operation.




                    < Figure 3-3. Screen to view notices >

     ① A user can display notices by entering search conditions (Register
        Date, Title, Context).
     ② A user can enter a new notice by clicking the Register button.
3.4.1.2 Display ATFM (Air Traffic Flow Management) Information
      A user can check implementation information of flow management
      (ATFM) transmitted from ATFMS of the Air Traffic Command Center.
      At the initial moment when AFTM is generated by ATCC, the system
      will open up a pop-up window that contains ATFM. Afterwards, a user
      can view the information in the Notice in the menu.

                                    - 33 -
             A-CDM Operation Manual                                   Rev. 3




                < Figure 3-4. Notice detailed view screen >

     ① If a user wants to view details of the ATFM flow management, double
       click the implementation number and date, and double-click the field.
     ② A user can view details and a reason of the implementation of
     ATFM flow management.
3.4.2 Display Airport Weather Information
     In this screen, users can display information on airport weather
     conditions that affect the operation of milestones. Information is
     automatically refreshed every two minutes. It displays information on
     runways currently in use and other weather conditions. However, there
     might be delay or difference from the actual information due to an
     environment of the interface with the Aviation Meteorological Office.


                                  - 34 -
               A-CDM Operation Manual                                                 Rev. 3




         < Figure 3-5. Screen to display airport weather information >

     ① Runway weather information : Runway currently in use, wind, fog, cloud information
     ② Terminal Aerodrome forecast : The latest TAF information as of the current date
     ③ Meteorological Aerodrome Report : The latest METAR information
       as of the current date
     ④ Significant Metoerological information : The latest SIGMET information
       as of the current date
3.4.3 Manage Flight Schedule and Status
     This screen enables A-CDM users to view departure/arrival time information by aircraft.
     A user enters Airline Code, Date, Time, Completed, SVC Type, RWY, STATUS and
     RTE (outbound flight) to search for results and manage information. Airline code can be
     found in IATA and ICAO information, and it is also possible to filter the search results.

                                          - 35 -
            A-CDM Operation Manual                                             Rev. 3




< Figure 3-6. Screen to manage flight schedule information and status >

  ① Fields to enter search conditions
    - Airline Code (IATA, ICAO), DATE, TIME, Completed, SVC
       Type, RWY, STATUS, RTE (for outbound flight)
  ② Define the refresh interval (Refresh Term).
     Not Term, 30 sec, 1 min, 3 min, 5 min
  ③ Click the Search button to display the up-to-date information.
  ④ Select Inbound or Outbound to display flight schedule information.
  ⑤ Display departure/arrival status information (normal, slightly congested,
     congested, emergency)
    - Normal: delayed flights per hour account for less than 5 %
    - Slightly congested: delayed flights per hour, ATA/ATD against
       STA/STD, account for 5 – 10%
    - Congested: delayed flights per hour, ATA/ATD against STA/STD,
       account for 10—30%
    - Emergency: Abnormal situation (delayed flights per hour account for 30%or higher)
  ⑥ Display milestone time information.
                                     - 36 -
                A-CDM Operation Manual                                               Rev. 3


3.4.4 Manage Inbound Flight Information

3.4.4.1 General
      A-CDM users can view time information of inbound flight. Users enter
      Airline Code, DATE, TIME, Completed, SVC Type, RWY and
      STATUS to search for results and manage information. IATA and
      ICAO airline code can be used for searching, and it is also possible to
      filter the search results.




          < Figure 3-7. Screen to manage inbound flight information >

      ① Fields to enter search conditions.
        - Airline Code (IATA, ICAO), DATE, TIME, Completed, SVC Type,
           RWY, STATUS
      ② Define the refresh interval (Refresh Term).
         Not Term, 30 sec, 1 min, 3 min, 5 min
      ③ Click the Search button to display the up-to-date information.
      ④ Click on the Excel download button to export the data on the screen to an excel file.
      ⑤ Select the current time information Type(IIAC-Local, UTC).
                                          - 37 -
                   A-CDM Operation Manual                                           Rev. 3


          ⑥ Display the number of flights for which alert was generated.
          ⑦ Indicate the flights for which alert was generated.
          ⑧ Display milestone time information of inbound flights.
          ⑨ Select among Flight Information tap, Ground Movement Information
             tap and Alarm Information tap.
          ⑩ Check the change history of flight milestones.
3.4.4.2     Display the detailed status of inbound flight
           In the flight information displayed, move the cursor to FLIGHT, REG,
          TYP, ORG (DEST) columns and double-click them, which will open a
          pop-up window that shows the detailed status of the selected flight.




     < Figure 3-8. Screen to display the detailed status of inbound flights >

3.4.4.3 Display alert information in the inbound flight information Click the image
           shown on Alert item in the flight information displayed (Alert defined in 3.6),
           and the alarm information generated for the flight will be displayed on the tap.

                                           - 38 -
               A-CDM Operation Manual                                       Rev. 3




              < Figure 3-9. Screen to display inbound flight alert >

3.4.4.4 Display the status of flight operation
       Double-click the STATUS colum-*9+n in the flight information
       displayed and the system will open a pop-up window that shows the
       operation status of the selected flight operation.




        < Figure 3-10. Screen to display the status of flight operation >


                                      - 39 -
                  A-CDM Operation Manual                                    Rev. 3



3.4.4.5 Display flight, ground movement and alarm information
       Click the Flight tab, the Ground Movement tab and the Alarm tab, and
       the information will be displayed for each tap as follows:




     < Figure 3-11. Screen to display detail taps for inbound flight status >


3.4.5 Manage Outbound Flight Information

3.4.5.1 General
      A-CDM users can view time information by outbound flight. Users
      enter Airline Code, DATE, TIME, Completed, SVC Type, RWY,
      STATUS and RTE to search for results and manage information.
      IATA and ICAO airline code can be used for searching, and it is also
      possible to filter the search results.

                                      - 40 -
          A-CDM Operation Manual                                                     Rev. 3




                                                                       08:56 08:33




   < Figure 3-12. Screen to manage outbound flight information >

① Fields to enter search conditions
   - Airline Code (IATA, ICAO), DATE, TIME, Completed, SVC
       Type, RWY, STATUS,
② Define the refresh interval (Refresh Term).
   - Not Term, 30 sec, 1 min, 3 min, 5 min
③ Click the Search button to display the up-to-date information.
④ Click on the Excel download button to export the data on the screen to an excel file.
⑤ Select the current time information Type(IIAC-Local, UTC).
⑥ Display the number of flights for which alert was generated.
⑦ Indicate the flights for which alert was generated.
⑧ Display milestone time information of outbound flights.
⑨ Select among Flight Information tap, Ground Movement Information
     tap and Alarm Information tap.
⑩ Check the change history of flight milestones.
Detailed functions are same as Manage Inbound Flight Information described in 3.4.4.
                                    - 41 -
              A-CDM Operation Manual                                        Rev. 3


3.4.6 Display Milestones of De-icing/Anti-icing Aircraft
    Users can display milestone time of a de-icing/anti-icing aircraft in the
    Manage Outbound Flight Information screen.




    < Figure 3-13. Screen to check and display de-icing/anti-icing aircraft >

    ① For de-icing/anti-icing aircraft, a snow icon will be shown on the
      left column of the flight name. When a pilot requests
      de-icing/anti-icing to the Apron Control Tower after the aircraft is
      fully ready for departure, the flight is marked as de-icing/anti-icing
      aircraft as shown above.
    ② Users can display milestone time information of de-icing/anti-icing aircraft.
3.5 TOBT Update

3.5.1 TOBT Input on A-CDM System(Portal/Mobile)

     ① Click TOBT on the Manage Outbound Flight Information screen, and the
       system will open a pop-up window to register milestone time information.

                                     - 42 -
               A-CDM Operation Manual                                                Rev. 3




           < Figure 3-14. TOBT input screen on the portal system >

     ② Aircraft operator/ground handler revises TOBT time, selects/enters a
       reason and then clicks on the Save button. After the Control Tower
       produces TSAT (color-coded in blue on the portal system), aircraft
       operator/ground handler is not allowed to directly revise TOBT, but
       needs to contact the Apron Management Unit to request TOBT update.
3.5.2 TOBT Input via Gate FIA

    ① Check the outbound flight on the FIAscreen and enter the time in the TOBTchange field.
    ② Push the function key ‘F6' and only the revised TOBT will be saved.
    ③ Push ‘F3' or click on the Save button and all the revised values on
      the screen will be saved.




         < Figure 3-15. TOBT input screen on the Gate FIA system >

                                         - 43 -
             A-CDM Operation Manual                                Rev. 3



3.5.3 TOBT Input via Mobile A-CDM

     ① After logging in the mobile A-CDM, revise TOBT by clicking
       TOBT of the flights on the screen of outbound flight.
     ② Make sure that the revised TOBT is successfully reflected on the
       screen of outbound flight.




         < Figure 3-16. TOBT Input screen on the Mobile A-CDM >


3.6 Mobile A-CDM

3.6.1 Overview

     Mobile A-CDM(acdm.airport.kr) is a system that allows users to check
     key inbound/outbound milestones via mobile anywhere and anytime. It
     displays data from A-CDM portal system.


                                 - 44 -
                A-CDM Operation Manual                                     Rev. 3



3.6.2 How to Access System

3.6.2.1 Request for Account and Password Management




                < Figure 3-17. Initial Screen of Mobile A-CDM >

      Those who wish to use the system shall click an account request
      button on Mobile A-CDM and complete the application form according
      to the guidance (However, the airlines/ground handlers who will input
      TOBT via mobile must send their agency and employee information to
      iis@airport.kr). If the application is submitted successfully, the applicant
      will receive a temporary password to phone number in the application
      form. The applicant must log in and change the initial password.
3.6.2.2 Login
     Connect to the Mobile A-CDM, enter your ID and password, click the Login
     button, and enter the OTP number sent to your account’s phone number.

                                     - 45 -
              A-CDM Operation Manual                                 Rev. 3



3.6.3 Main Screen




              < Figure 3-18. Main Screen of Mobile A-CDM >

3.6.3.1 NOTICE
     Be able to check the contents by clicking titles on the list such as
     ATFM.
3.6.3.2 Arrival Milestones
      Be able to check the key arrival milestones of the flights and search
     for them with the flight name and departure key words.
3.6.3.3 Departure Milestones
      Be able to check the key departure milestones of its own flights and
     those of third party flights that Tower TSAT are issued. Users can
     search for them with the flight name and destination key words.

                                  - 46 -
             A-CDM Operation Manual                                Rev. 3



    The color information used is the same as the portal system, and more
    milestones can be checked by clicking on the flight names. Account
    users who have applied for TOBT inputs access may modify their own
    flights’ TOBT as follows. After modification, users need to make sure
    that the modified time is reflected.




           < Figure 3-19. TOBT entry screen on Mobile A-CDM >


3.6.3.4 Changing user information
     Be able to change mobile phone number and password by clicking on
     the user name at the upper right.




                                    - 47 -
              A-CDM Operation Manual                                                          Rev. 3



3.7 Alarm Message

 ALERT                                           Description
           (Situation) The aircraft type does not correspond with the type in the flight plan.
 ACDM003   (Display) The aircraft type does not correspond with the type in the flight
                   plan. It is needed to check and correct the flight type.
           (Situation) The aircraft registration does not correspond with the registration
                        in the flight plan.
 ACDM004
           (Display) The aircraft registration does not correspond with the registration
                      in the flight plan. It is needed to check and correct the aircraft registration.
           (Situation) The aircraft destination airport does not correspond to the
                        destination in the flight plan.
 ACDM005
           (Display) The aircraft destination airport does not correspond to the destination in
                      the flight plan. It is needed to check and correct the destination airport.
           (Situation) EIBT+MTTT exceeds TOBT+5 min.
 ACDM007
           (Display) Check SOBT of the outbound flight and update EOBT or TOBT, if necessary.
           (Situation) TOBT is outside EOBT +/-15 min window.
 ACDM008
           (Display) TOBT and EOBT have a discrepancy by 15 min. or more. Update EOBT.
           (Situation) ASBT has not occurred until TOBT-10 min.
 ACDM009
           (Display) The aircraft boarding has not started. Update EOBT or TOBT.
           (Situation) ARDT value does not exist within TOBT+5 min window.
 ACDM011
           (Display) TOBT tolerance (5 min) was exceeded. Update EOBT or TOBT.
           (Situation) ASRT is not input until Tower TSAT +5min is exceeded.
 ACDM022   (Display) The pilot is not compliant with Tower TSAT. Update EOBT or
                      TOBT for new TSAT.
           (Situation) No ATC flight plan available.
 ACDM013
           (Display) There is no ATC flight plan.
           (Situation) Return-to-stand
 ACDM034
           (Display) The outbound aircraft has returned back to the stand. Update EOBT.
           (Situation) TSAT reflecting CTOT is less than TOBT
 ACDM035   (Display) TSAT reflecting CTOT is earlier than TOBT, so please contact
                      Air Traffic Command Center for a new CTOT.




                                            - 48 -
             A-CDM Operation Manual                       Rev. 3



3.8 Flight Status Information

   A/D       Status                         Description
              SCH     Schedule
              AIR     Airborne(Take off from ORG)
              FIR     Flight entered local FIR
  Arrival     APP     Final Approach
              LND     Landing
              TAX     Taxing
              IBK     On Block
              SCH     Schedule
              INI     Ground handling Initiates
              BOR     Boarding
              GTC     Gate Closed
              RDY     Ready (in case of PBB release)
              OBK     Off Block
 Departure    TAX     Taxing
              DCI     De-icing pad in
              DCS     De-icing Start
              DCE     De-icing End
              DCO     De-icing pad out
              RRT     Ramp Return
              DEP     Take Off
              DEL     Delay
    -         CNL     Cancel
              DIV     Divert


                                 - 49 -
             A-CDM Operation Manual                                    Rev. 3




         Chapter 4 Contingency Procedures
4.1 Overview

   Air Traffic Service Unit, Airport operator, aircraft operators and ground
   handlers share TOBT, TSAT, TTOT and so on via A-CDM
   System(Portal/Mobile). The information provided by the system enables
   individual partners to perform reasonable decision-making. Nonetheless, if
   such information is not shared normally due to a problem of A-CDM
   system or other associated systems, relevant parties shall respond to the
   situation according to the following procedure to minimize confusion.
4.2 Types of Contingency

4.2.1 Interruption of A-CDM System(Portal/Mobile)
    A situation in which all information sharing and services are completely
    unavailable due to system failure in Incheon Airport A-CDM.
4.2.2 Interruption of Mobile A-CDM System
    A situation in which mobile service is unavailable due to failure of
    Mobile system or A-CDM Portal.
4.2.3 Interruption of Interfaced System
    A situation in which some of information sharing and provision are
    unavailable due to system failure or interface failure in a system linked
    with Incheon Airport A-CDM. The situation includes an interface
    problem with an aircraft operator system as well.


                                   - 50 -
              A-CDM Operation Manual                                        Rev. 3



4.2.4 System Failure due to User Operation Interface
    A situation in which information sharing and provision are partially
    unavailable in a certain area due to a partner’s internal circumstance although
    other systems linked with Incheon Airport A-CDM are in normal condition.
4.2.5 In the event of a massive delay due to abnormal situation
    Massive delay due to abnormal situation is as follows:
     1. In case of airport congestion and massive delays caused by the
        take-off stop continued for more than one hour due to bad weather
        such as low visibility(not applicable for late and non-congested hours)
     2. In case CTOT is not issued due to complicated ATFM restrictions and
        there are massive delays of outbound flights and congestion in the airside.
4.3 Response Procedure

4.3.1 In Case of A-CDM Portal Service Unavailable

4.3.1.1 Non A-CDM Procedure
     1. Without TOBT input, aircraft operator and ground handler should comply with
        ETD (EOBT) and in case of delay, they should update ETD (EOBT) to get
        ready for departure.
     2. Pilot should comply with the departure procedure in Incheon AIP.
4.3.2 In Case of Mobile A-CDM System Service Failure
     1. Follow the normal A-CDM Operation procedure with A-CDM Portal system.
     2. However, in the event of a Mobile A-CDM failure due to A-CDM
        Portal System failure, the system is operated in accordance with
        Non A-CDM procedure.

                                     - 51 -
               A-CDM Operation Manual                                         Rev. 3



4.3.3 In Case of Interface failure

4.3.3.1 Failure of ATC system (including ACC)
      1. TSAT and TTOT supposed to be provided by the Control Tower are
         not provided while only TSAT and TTOT automatically calculated in
         A-CDM are provided. VDGS at the stand displays TOBT only. If the
         TSAT produced by the Control Tower is shared with A-CDM Operation
         Center, however, A-CDM Operation Center provides Tower TSAT via
         A-CDM System.
      2. Aircraft operator should manage TOBT as usual so that TSAT and
         TTOT can be provided normally once the system is restored.
      3. Also, aircraft operator should input and manage TOBT continuously
         because TOBT from aircraft operator is utilized for the purpose of
         aircraft stand operation and adjustment for inbound flights.
4.3.3.2 Failure in Interface with the Air Traffic Command Center
      CTOT/COBT from the Air Traffic Command Center is not transmitted
      to A-CDM System(Portal/Mobile).
4.3.3.3 Failure in Interface with Aircraft Operator/Ground Handler System
      1. Flight information shared by the relevant aircraft operator/ground handler
         is displayed as the previous STD and information established before failure.
      2. Aircraft operator/ground handler should provide TOBT via the portal
         system and Gate FIA, and request EOBT update to the Apron
         Management Unit via wired communication to share TOBT with partners.
4.3.3.4 VDGS Failure
      1. Since TOBT and TSAT provided by the Control Tower with
         ATFM (agreed take-off, etc.) are not displayed in VDGS, aircraft
         operator and ground handler need to refer to A-CDM System.
                                       - 52 -
               A-CDM Operation Manual                                           Rev. 3



      2. The pilot is provided with TSAT when he/she contacts the Control Tower
         for ATC clearance. If the pilot needs to reconfirm TSAT, he/she is able to
         communicate via ATC frequency or company frequency.
4.3.3.5 Gate FIA Failure
      As it is not possible to input TOBT at the gate, aircraft operator or
      ground handler should input TOBT on A-CDM System(Portal/Mobile),
      and requests EOBT update to the Apron Management Unit via wired
      communication to share TOBT with partners as soon as possible.
4.3.3.6 A-SMGCS Failure
      Given that it is not possible to calculate and provide the estimated
      movement time using the actual speed of the aircraft, statistical
      average figures are provided for ETOT after outbound flight
      push-back and for EIBT after inbound flight landing.
4.3.4 In the event of a system limitation due to user operation interface
     In case information sharing is limited due to internal circumstances of partners
     such as PC terminal problems such as breakdown or network failure, aircraft
     operator or ground handler should input TOBT on the portal system, and requests
     EOBT update to the Apron Management Unit via wired communication to share
     TOBT with partners as soon as possible.
4.3.5 In the event of a massive delay due to abnormal situation
      1. The Control Tower determines necessity and possibility whether or not the
         departure list can be calculated. If necessary, it produces pre-departure list
         before departure and provide it to A-CDM Operation Center.
      2. A-CDM Operation Center shares the pre-departure list provided via
         notice on A-CDM System(Portal/Mobile)
      3. Aircraft operators prepare aircraft operations in consideration of
         ATFM condititions, pre-departure list provided and delays, etc.
                                        - 53 -

