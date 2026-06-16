---
source_url: ""
document_type: "Domain Knowledge — trích xuất PDF (pdftotext -layout)"
extracted: "2026-06-16"
status: "Raw extract — chưa biên tập"
---

# Asia-Pacific-ATFM-Post-Operations-Analysis-Recommended-Framework

> **Nguồn (PDF):** 
> **Lưu ý:** Trích tự động bằng `pdftotext -layout` (qua WSL /mnt) — trung thực nội dung, có thể lệch định dạng bảng/cột. Đối chiếu PDF gốc khi cần.

---
       INTERNATIONAL CIVIL AVIATION ORGANIZATION




                 AIR TRAFFIC FLOW MANAGEMENT

 POST-OPERATIONS ANALYSIS RECOMMENDED FRAMEWORK



                          Version 1.0 November 2020



    This Guidance Material was developed by the Asia/Pacific Air Traffic Flow
                   Management Steering Group (ATFM/SG)


Approved by the Eighth Meeting of the ATM Sub-Group of APANPIRG (ATM/SG/8)
                              and published by the
                     ICAO Asia and Pacific Office, Bangkok
                                ATFM
              POST-OPERATIONS ANALYSIS
             RECOMMENDED FRAMEWORK
               This document provides recommendations on how ATFM operations analysis can be conducted,
                 with overview of analyses that can be carried out during each phase of ATFM operations from
                   planning demand and capacity to post-operations analysis of an ATFM program with various
                                                                                            ATFM measures.




ATFM Operations Analysis                                                                                1
Recommended Framework, v1.0
Table of Contents
List of Figures ................................................................................................................................................ 4
List of Tables ................................................................................................................................................. 4
Document Change Record ............................................................................................................................ 5
1. Introduction .............................................................................................................................................. 6
   Motivation................................................................................................................................................. 6
   Objectives ................................................................................................................................................. 7
   Document Structure ................................................................................................................................. 7
   Flight Event Times Nomenclature ............................................................................................................. 8
2. Post-Operations Analysis in the Guidance Documents ............................................................................ 9
   ICAO Manual on Collaborative ATFM (Doc 9971, 3rd Ed) .......................................................................... 9
   Asia/Pacific Regional ATFM Concept of Operations ............................................................................... 10
   Asia/Pacific Regional Framework for Collaborative ATFM ..................................................................... 11
3. Traffic Demand Accuracy and Reliability ................................................................................................ 13
   Strategic & Pre-Tactical Data Completeness .......................................................................................... 13
   Demand Look-Ahead............................................................................................................................... 15
   Demand Accuracy ................................................................................................................................... 17
   Tactical Demand Information ................................................................................................................. 20
4. Operational Capacity Determination and Analysis ................................................................................. 22
   General Considerations in Operational Capacity Determination ........................................................... 22
   Key Factors Impacting Operational Capacity .......................................................................................... 23
   Analysis of Operational Capacity Determination .................................................................................... 24
5. ATFM Measure Metrics and Analyses..................................................................................................... 25
   Analyzing an ATFM Program: 3-Part Story.............................................................................................. 25
   Ground Delay Program (GDP) ................................................................................................................. 27
   Miles-in-Trail / Minutes-in-Trail (MIT / MINIT) ....................................................................................... 34
   (Placeholder for Other ATFM Measures) ................................................................................................ 38
6. Collaborative ATFM Post-Operations Analysis ....................................................................................... 39
   Roles of Stakeholders in ATFM Post-Operations Analysis ...................................................................... 39
   Workflow for Collaborative Post-Operations Analysis ........................................................................... 40
   ATFM/CDM Planning Web Conference: A Channel for Collaboration .................................................... 41



ATFM Operations Analysis                                                                                                                                     2
Recommended Framework, v1.0
7. Case Studies ............................................................................................................................................ 42
   Case Study 1: India – Strategic Airport Slot Allocation Analyses ............................................................ 42
   Case Study 2: Thailand – Airport Ground Delay Program Analyses ........................................................ 47
   Case Study 3: Australia – Network Post Operational Performance ........................................................ 53




ATFM Operations Analysis                                                                                                                                  3
Recommended Framework, v1.0
List of Figures

Figure 1 - ATFM Phases ................................................................................................................................. 6
Figure 2 - ATFM Measure Selection Process ............................................................................................... 25
Figure 3 - 3-Part Story Approach to Post-Ops Analysis ............................................................................... 26
Figure 4 - Workflow for Collaborative POA................................................................................................. 40
Figure 5 - Case Study 1 - SOBT/EOBT Comparison...................................................................................... 43
Figure 6 - Case Study 1 - AOBT/SOBT Comparison ..................................................................................... 43
Figure 7 - Case Study 1 - ATOT/SOBT Comparison ..................................................................................... 44
Figure 8 - Case Study 1 - AIBT/SIBT Comparison......................................................................................... 44
Figure 9 - Case Study 1 - Block Time Comparison ....................................................................................... 45
Figure 10 - Case Study 2 - Overview Dashboard ......................................................................................... 48
Figure 11 - Case Study 2 - Program Dashboard .......................................................................................... 49
Figure 12 - Case Study 2 - Airline Dashboard .............................................................................................. 50
Figure 13 - Case Study 2 - Departure Aerodrome Dashboard .................................................................... 50
Figure 14 - Australian Flight Densities, FIRs & Top Airports ....................................................................... 53
Figure 15 - Daily Post Operational Performance Report ............................................................................ 56
Figure 16 - Overview of Network Performance Metrics ............................................................................. 57
Figure 17 - Excess Demand for December 2019 for YSSY, YMML, YBBN and YPPH ................................... 58


List of Tables

Table 1 - Flight Event Times .......................................................................................................................... 8
Table 2 - General ATFM Program Metrics .................................................................................................. 10
Table 3 - CDM Actions Metrics.................................................................................................................... 11
Table 4 - Post-Operations Analysis in Regional ATFM Framework ............................................................. 12
Table 5 - Schedule and Flight Plan Completeness ...................................................................................... 14
Table 6 - Pre-Departure Change Count ....................................................................................................... 14
Table 7 - Flight Plan Submission Lead Time Tabulation .............................................................................. 15
Table 8 - Demand Look-Ahead Analysis ...................................................................................................... 17
Table 9 - Pre-Tactical Demand Accuracy..................................................................................................... 18
Table 10 - Strategic Demand Accuracy ....................................................................................................... 20
Table 11 - Tactical Demand Information .................................................................................................... 21
Table 12 - Operational Capacity Analysis .................................................................................................... 24
Table 13 - 3-Part Story Approach to Post-Ops Analysis .............................................................................. 26
Table 14 - Characterizing GDP .................................................................................................................... 27
Table 15 - GDP Impact Analysis................................................................................................................... 28
Table 16 - GDP CDM Actions ....................................................................................................................... 29
Table 17 - GDP Compliance Assessment..................................................................................................... 30
Table 18 - GDP Effectiveness Measurement............................................................................................... 33
Table 19 - Characterizing MIT/MINIT .......................................................................................................... 35

ATFM Operations Analysis                                                                                                                             4
Recommended Framework, v1.0
Table 20 - MIT/MINIT Impact Analysis ........................................................................................................ 37
Table 21 - MIT/MINIT Compliance Assessment .......................................................................................... 37
Table 22 - MIT/MINIT Effectiveness Measurement .................................................................................... 38
Table 23 - Roles of Stakeholders in POA ..................................................................................................... 39


Document Change Record

The following table records the complete history of the successive editions of the document

     Version Number                        Effective Date                  Reason for Change                        Pages Affected
           1.0                              1 June 2020                  Original Release Version                         All




ATFM Operations Analysis                                                                                                                    5
Recommended Framework, v1.0
1. Introduction
Motivation

1.1           ICAO Manual on Collaborative ATFM (Doc 9971) specifies in great detail the planning,
implementation, and execution of ATFM services. Figure 1, taken from Figure II-4-1 in Doc 9971 (3rd ed.),
summarizes the different phases of ATFM operations.




                                          Figure 1 - ATFM Phases



1.2            The final phase in the ATFM operations is post-operations analysis, where an analysis is
conducted to measure, investigate, and report on operational processes and activities. This is the
cornerstone process to develop lessons learned and best practices for further improvement of the
operations.

1.3              As ATFM measures – particularly cross-border ones involving international flights and
stakeholders – become more common, it is essential that ANSPs / ATFMUs are able to perform
quantitative analyses of operational data effectively and apply the results for program improvements as
well as strategic capacity enhancement planning.

1.4               Taking experience from cross-border ATFM operational trial and implementation in
Asia-Pacific, this ATFM Post-Operations Analysis Recommended Framework was developed to provide a
guideline to States/Administrations looking to implement ATFM and to join the ATFM network in the
region. The framework ensures ATFM service providers are able to capture key results from ATFM
operations, and collaboratively assess ATFM operations with stakeholders using appropriate metrics.


ATFM Operations Analysis                                                                              6
Recommended Framework, v1.0
Objectives

1.5            The framework seeks to provide ANSPs and ATFM stakeholders with the following:

               (1) A recommended set of performance indicators to determine the effectiveness of
                   traffic demand prediction capability within their domain, which is a pre-requisite to
                   implementing an effective ATFM solution;

               (2) A recommended set of considerations and performance indicators to support
                   dynamic capacity determination and capacity accuracy assessment;

               (3) A recommended set of performance indicators to determine the impact and
                   effectiveness of various ATFM solutions prescribed in ICAO Doc 9971;

               (4) An understanding on the importance of collaboration between stakeholders for
                   ATFM post-operations analysis, and a recommended workflow to facilitate such
                   collaboration; and

               (5) Case studies from Asia-Pacific States / Administrations / ANSPs that have done post-
                   operations analysis in their domains.


Document Structure

1.6             The framework is divided into 5 parts, loosely aligning with ICAO Doc 9971 and following
the phases of ATFM implementation. The parts are as follows:

               (1) Traffic Demand Analyses - This section provides a recommendation on how an
                   ANSP may determine the accuracy and completeness of traffic demand used for
                   ATFM operations. The analyses in this section largely centers on the comparison
                   between predicted traffic demand and actual operations, as well as how far in
                   advance a most reliable traffic demand profile becomes available.

               (2) Operational Capacity Determination and Analysis – This section provides
                   recommendations on how an ANSP may determine operational (dynamic) capacities
                   at their ATM resources, and how actual operational capacities can also be analyzed
                   post-operations.

               (3) ATFM Measure Metrics and Analyses – This section provides a recommendation on
                   how an ANSP may characterize the ATFM solution, assess the impact, and analyze
                   effectiveness of different ATFM solutions described in ICAO Doc 9971. Indicators of
                   different ATFM solutions vary according to the natures, but all centralize on the
                   comparison between expected outcomes and actual / achieved outcomes.




ATFM Operations Analysis                                                                             7
Recommended Framework, v1.0
                 (4) Collaborative Post-Operations Analysis – This section highlights the importance of
                     collaboration between stakeholders in the post-operations analysis process. With a
                     focus on effective collection and sharing of data and information, this section
                     discusses a possible workflow for stakeholders to join hands in ATFM post-
                     operations analysis.

                 (5) Case Studies – This section provides case studies from various ANSPs in their ATFM
                     post-operations analysis, along with the lessons learned from their experiences.

1.7             In each of the metrics covered in various sections, the document also provides rationale
behind them. Post-operations analysis should not be conducted for the sake of reporting, but its result
should be used to identify areas of challenge and plans for operational improvements.

1.8              While this framework contains a large set of recommendations, it is by no means
complete. ANSPs should take this framework as a starting guideline, but adapt it to their own
operational environment, objectives, and maturity of their ATFM systems. The most important note to
keep is that post-operations analysis, along with associated data collection and processing workflow,
should be integrated into the implementation of ATFM either from the very beginning or in a later phase
but with clear roadmap. It should always be a cornerstone process throughout the ATFM operations.

Flight Event Times Nomenclature

1.9               In this document, several flight event times will be mentioned. To avoid confusion and
to ensure alignment with ICAO Doc 9971, the flight event time terminologies are defined in accordance
to Table II-6-3 in ICAO Doc 9971 (3rd ed.). The terminologies are shown here in Table 1.

Flight Event                                                  ATFM      ATFM System
                       Scheduled        Flight Plan                                          Actual
Times                                                        Measure      Estimate
Off-Block Time
                         SOBT             EOBT                  COBT                         AOBT
(OBT)
Take-Off Time
                                                                CTOT        ETOT             ATOT
(TOT)
Time Over
                                                                CTO          ETO              ATO
(TO)
Landing Time
                                                                CLDT        ELDT             ALDT
(LDT)
In-Block Time
                          SIBT                                                                AIBT
(IBT)
                                         Table 1 - Flight Event Times




ATFM Operations Analysis                                                                              8
Recommended Framework, v1.0
2. Post-Operations Analysis in the Guidance Documents
2.1             There are a number of guidance documents available on ATFM and ATFM
implementation. At the global level, there is ICAO Manual on Collaborative ATFM (Doc 9971) which
provides the basics and recommendations on every aspect of ATFM planning, implementation, and
execution. At the regional level, there are the Asia/Pacific Regional ATFM Concept of Operations and the
Asia/Pacific Regional Framework for Collaborative ATFM. All of these documents refer to post-
operations analysis as one of the key processes enabling improvements in the ATFM operations and
provide guidance on how the analysis may be conducted.

2.2             This framework does not aim to duplicate the work in the abovementioned documents,
but rather to supplement them with more details and techniques ANSPs can employ for their analytical
process. Prior to diving into the details and techniques, however, this section summarizes how post-
operations analysis is represented in each of the guidance.


       ICAO Manual on Collaborative ATFM (Doc 9971, 3rd Ed)

2.3            Part II, Chapter 4 of the ICAO Manual on Collaborative ATFM (Doc 9971) discusses at
length the ATFM phases and solutions. Within this chapter, subsection 4.1.4.4 provides high-level
guidance on post-operations analysis for ATFM. Some of the key excerpts are as follows:

                  (4.1.4.4.2) During this phase, an analytical process is carried out to measure,
                   investigate and report on operational processes and activities. This process is the
                   cornerstone in developing best practices and/or lessons learned that will further
                   improve the operational processes and activities. It should cover all ATFM domains
                   and all the external units relevant to an ATFM service.

                  (4.1.4.4.3) While most of the post-operations analysis process may be carried out
                   within the ATFM unit, close coordination and collaboration with ATFM
                   stakeholders will yield better and more reliable results.

                  (4.1.4.4.4) The post-operations analysis should be accomplished by evaluating the
                   ADP and its results. Reported issues and operational statistics should be evaluated
                   and analyzed in order to learn from experience and to make appropriate
                   adjustments and improvements in the future.

2.4              The document recommends the following process to ensure communication of analysis
results to and discussion with relevant ATFM stakeholders:

               (1) Collect and assess data by including a comparison with targets;
               (2) Hold a daily briefing for a broad review and further information exchange;
               (3) Conduct weekly operations management meetings to assess results and
                   recommend procedural, training and system changes, where necessary, to improve
                   performance; and
               (4) Conduct periodic operations review meetings with stakeholders, which could take
                   place, e.g., in conjunction with or after each seasonal scheduling conference


ATFM Operations Analysis                                                                             9
Recommended Framework, v1.0
                     (roughly every 6 months) or more frequently as deemed appropriate.

2.5            The recommended processes, specifically review briefing / conferences, are explored as
part of the Distributed Multi-Nodal ATFM Network Common Operating Procedure. It is pertinent,
however, that ANSPs also consider adding regular local stakeholder engagements in addition to cross-
border ones as well.


        Asia/Pacific Regional ATFM Concept of Operations

2.6             The Asia-Pacific Regional ATFM Concept of Operations had been developed through a
collaborative effort between Asia-Pacific States and partner organizations, and provides overview of
cross-border ATFM operational concept used in the region. Part 4 (Concept – Regional ATFM) of the
document provides a section on post-operations analysis (starting para. 4.36) with 2 tables listing
possible metrics for characterization and impact measurement of the program, as well as assessment of
Collaborative Decision Making (CDM) actions taken by stakeholders. The tables are copied here for
reference (Table 2 and Table 3):

        Metric                                    Description                               Type
                          The total number of flights that received calculated
Number of Flights                                                                    TMI Parameter
                          times
                          The start and end time of the TMI. The time period
Start / Stop Time                                                                    TMI Parameter
                          when the FMP wanted to control the demand.
                          The number of minutes the TMI was implemented
Lead Time                                                                            TMI Parameter
                          before the Start Time
Number of Exempt /        The number of flights that were exempt from the TMI
                                                                                     TMI Parameter
Non-Exempt Flights        according to the parameters specified by FMP
                          The number of FMP actions that reassigned flights in the
Number of TMI Events                                                                 Operational Activity
                          TMI (i.e. number of revisions and compressions)
Total Assigned Delay      The sum of delay assigned by TMI                           Operational Impact
Max / Average
                          The maximum and average delay                              Operational Impact
Assigned Delay
Total
                      The total actual delay taken at the gate, on the airport
Gate/Surface/Airborne                                                                Operational Impact
                      surface, and in the air
Delay
Number of                 The number of flights cancelled and were part of a given
                                                                                     Operational Impact
cancellations             TMI
Number of                 The number of flights that appeared after the TMI was
                                                                                     Operational Impact
Unexpected Flights        already implemented
                                    Table 2 - General ATFM Program Metrics




ATFM Operations Analysis                                                                             10
Recommended Framework, v1.0
                   Metric                                                                        Description
Number of Substitutions                             Total number of flights that were substituted
Number of Inter-Operator Slot
                                                    Total number of ISEs
Exchanges
Number of Bridged Flights                           The number of flights that were bridged
Number of Cancellations                             Total number of cancelled flights for a given time period
                                                    The amount of savings in minutes of flights that move forward as a
Substitution Savings
                                                    result of a substitution
                                                    The amount of savings in minutes of flights that move forward as a
Bridging Savings
                                                    result of being bridged
                                                            Table 3 - CDM Actions Metrics

*Note: The nomenclatures used in the tables are exactly as appeared in the Regional Concept of Operations at the time it was developed, and they may differ from
nomenclatures used currently and elsewhere. Key examples include:
           TMI = traffic management initiative; now commonly referred to as ATFM Measure
           FMP = flow management position; also commonly referred to as ATFMU Staff
           Assigned delay = delay assigned as part of the ATFM measure; also commonly referred to as ATFM delay



2.7            These indicators are good starting points for the characterization and impact
assessment of an ATFM program. They will be explored further in Chapter 5 – ATFM Measure Metrics
and Analyses.


            Asia/Pacific Regional Framework for Collaborative ATFM

2.8              The Regional Concept of Operations document formed the basis for Asia/Pacific
Regional Framework for Collaborative ATFM (“Regional Framework”). The Regional Framework provides
a common guideline, in terms of ATFM service capabilities and performance, for States in the region in
their ATFM implementation plan. In particular, the framework sets out Performance Improvement Plan
with details on elements of ATFM operations that States should aim to accomplish.

2.9             The Performance Improvement Plan divides ATFM implementation into 2 main phases
in alignment with the Asia-Pacific Seamless ATM Plan’s phased approach. Phase I has also been further
sub-divided into Phase IA and Phase IB. With respect to ATFM post-operations analysis, the following
have been recommended (Table 4):




ATFM Operations Analysis                                                                                                                                 11
Recommended Framework, v1.0
            Detail                                                             Target Implementation
            The accuracy and effectiveness of capacity and demand
            analyses and ADP preparation and distribution, including
            supporting information […], should be verified through
Phase IA                                                                            12 Nov 2015
            comparison with operational outcomes observed, and
            rectification of discrepancies included in planning for system and
            process improvements
            Procedures and agreements should be developed to ensure
            post-operational analysis of cross-border ATFM programs,
            including the canvassing and consideration of feedback from
            airspace users, airport operators, ATS and other ATFM units.
 Phase IB                                                                           25 May 2017
            Daily post-operations analysis conferences should be held,
            supplemented where necessary by ad-hoc conferences called to
            assess the outcomes of programs of ATFM measures responding
            to non-normal situations
            (No specific mention of post-operations analysis as Phase IB has
 Phase II                                                                            8 Nov 2018
            already covered all that need to be conducted)
                       Table 4 - Post-Operations Analysis in Regional ATFM Framework




ATFM Operations Analysis                                                                        12
Recommended Framework, v1.0
3. Traffic Demand Accuracy and Reliability
3.1             Traffic demand is one of the two main elements in the planning and execution of ATFM,
a service focused on balancing demand against ATM resource capacity. Obtaining accurate and reliable
traffic demand profile with sufficient lead time is an important pre-requisite to implementing successful
ATFM solutions. This section recommends various indicators an ANSP providing ATFM service can use to
determine the reliability of their traffic demand sources.

3.2              The analyses can be used to determine possible and appropriate ATFM solutions. They
can also be used as a basis for the establishment of regulatory process and procedure, such as advance
flight planning requirements, to ensure reliable traffic demand information furnished by stakeholders.

3.3              It should be noted that these traffic demand analyses are not limited to ANSPs providing
ATFM service but can also be carried out by States / Administrations / ANSPs that are not yet
implementing the service but looking to in the future. Analyzing traffic demand information and putting
in place necessary regulations and process to ensure completeness and accuracy, are good first steps to
planning for ATFM. Pre-implementation analysis results can also be used in comparison with post-
implementation results to determine the effectiveness of the implementation program and form the
basis for cost-benefit analysis in ATFM.


Strategic & Pre-Tactical Data Completeness

Schedule and Flight Plan Completeness

3.4             The first level of traffic demand analysis is to assess its reliability. Strategic and pre-
tactical demand profiles are made of (1) flight schedules obtained from marketing sources, seasonal
airport slot coordination, updated airline schedule, and/or flight permissions, and (2) flight plans
submitted prior to departures. Analyzing the completeness of these demand sources allow ANSPs to
assess how reliable their traffic demand predictions are, and to establish necessary process to ensure
they can capture sufficient information for ATFM program management.

Key Question:
                 How complete is the strategic and pre-tactical traffic demand information?

Data Needed:
                   Flight Schedule (e.g. strategic airport slot coordination, marketing information)
                   Updated Airline Schedules
                   Flight Plans

Analysis Complexity:
               Low complexity

Recommended Metrics:




ATFM Operations Analysis                                                                                13
Recommended Framework, v1.0
           Metric                                                   Description

Number of Flights with SCH       Total number of scheduled flights with no flight plan
but no FPL                       This represents extraneous strategic demand at the resource.

Number of Flights with           Total number of flights with flight plans but no strategic schedule
FPL, No SCH                      This represents traffic demand with limited advance information.

                                 Total number of flights with both strategic schedule (e.g. airport slot /
Number of Flights with
                                 marketing information) and flight plan
SCH + FPL
                                 This represents flights that make up the most reliable demand profile.
                                 Table 5 - Schedule and Flight Plan Completeness

How this helps:
                  The analysis can be used to support establishment of appropriate procedure to ensure a
large ratio of flights with both strategic schedule and flight plan information. With good portion of the
traffic demand captured strategically through schedule, ANSP can form initial demand profile for
effective capacity planning and strategic ATFM execution. Flight plan information will then supplement
with accurate flight models that can be used for pre-tactical / tactical ATFM execution if needed.

Pre-Departure Changes

3.5              While flight plan information should form the most reliable information about a flight,
pre-departure changes such as EET alterations or departure delays do happen. Tracking the number of
pre-departure changes for each flight through ATS messages (CHG / DLA / CNL) can provide insight into
how reliable initial flight plan information is.

Key Question:
                  How many pre-departure changes to flight plans occur?
                  How reliable are the initial flight plan information?

Data Needed:
                     Flight Plans
                     (Count of) ATS messages (CHA, DLA, CNL)

Analysis Complexity:
               Low / Medium complexity
               **
                  ANSPs will need a means to correlate the number of ATS messages with flight plans

Recommended Metrics:
        Metric                                                      Description

Number of FPL with (various)     Numbers (or ratios) of flight plans with various number of pre-departure
Pre-Departure Changes            changes, counted from associated ATS messages
                                     Table 6 - Pre-Departure Change Count



ATFM Operations Analysis                                                                                14
Recommended Framework, v1.0
How this helps:
                The analysis can be used to inform ANSP / regulator when establishing flight planning
requirement and procedure. The requirement should balance between attempting to capture traffic
demand with long lead time and getting accurate flight information from the operators. If, under the
existing FPL submission lead time requirement, a large number of pre-departure changes to flight plans
are encountered; it may mean the requirement should be shortened to allow operators time to collect
accurate operational information before filing more accurate flight plans.


Demand Look-Ahead

3.6              ATFM execution focuses on balancing demand against capacity, using various solutions
available. Figure II-4-3 in Section 4.5.2 of Doc 9971 describes an ATFM measure selection process, based
largely on the type of constraints and lead time available at the resource. As capacity constraints are
closely related to the traffic demand volume, lead time determination should also include a look at the
lead time an ANSP has on the traffic demand coming into the resource. This is what is described in this
section as demand look-ahead.

Flight Plan Submission Lead Time

3.7              The first level of assessing demand look-ahead starts with analyzing flight plans’
submission time. Most ANSPs prescribe that flight plans are submitted a certain amount of time prior to
their planned departure (Estimated Off-Block Time: EOBT). With appropriate flight plan submission lead
time, defined as the amount of time FPLs are submitted before EOBT, ANSPs can ensure they receive the
flight information with sufficient time to plan their ATM resources accordingly. In Asia-Pacific, especially
with the introduction of cross-border ATFM, a requirement of 3 hours (180 minutes) in lead time is a
common and recommended practice.

Key Question:
                  How far in advance (of EOBT) are flight plans submitted?

Data Needed:
                     Flight Plan submission times

Analysis Complexity:
               Medium complexity
               **
                  Practice of collecting FPL submission times may not be common for ANSPs

Recommended Metrics:
        Metric                                                       Description
                                 Times (in minutes or hours) the flight plans are submitted prior to their
                                 planned departure times (EOBT)
Tabulation of FPL submission
lead time
                                 The tabulation can be displayed as scatter plot on a time axis,
                                 distribution of lead times, or whisker plot.
                               Table 7 - Flight Plan Submission Lead Time Tabulation



ATFM Operations Analysis                                                                               15
Recommended Framework, v1.0
How this helps:
                        The analysis provides ANSP a sense of how far in advance flight plans are
submitted by operators. Different ATFM measures require different lead times in their execution, e.g. a
GDP generally requires a long lead time to allow for early CTOT delivery, and thus will require fairly long
FPL submission lead time. Understanding the make-up of lead times among FPLs in the system gives
ANSP a sense of which ATFM measures can be utilized when congestions happen. The analysis result can
also be used by ANSP / regulator to determine if a revision / new FPL submission time requirement is
needed for effective ATM planning

Demand Look-Ahead

3.8               Further to the FPL submission lead time analysis, ANSP can also analyze demand look-
ahead, defined as the amount of time flight information is available at the designated ATM resource
prior to its arrival. For example, a demand look-ahead at the arrival airport can be calculated as:

                  Demand Look-Ahead = FPL submission lead time + STT*+ total EET
                                                                               *STT = standard taxi-out time at departure



3.9             For a flight whose EET from departure airport (with standard taxi-out time of 15
minutes) to the arrival airport is 1:30 hours (90 minutes) and whose FPL is submitted 3 hours (180
minutes) prior to departure, the demand look-ahead is 180 + 15 + 90 which is 285 minutes (4 hours 45
minutes).

3.10            This demand look-ahead calculation can be carried out for any given ATM resource along
the route by substituting total EET with EET required for the flight to reach the resource. The look-ahead
times for the flights can then be tabulated and presented for analysis, which can be helpful in
determining appropriate ATFM measures as they require different lead times in execution.

Key Question:
                  How far in advance (to their arrivals) do flight information become available to the
                  ANSP, based on their FPL submission time and time required to arrival (at designated
                  ATM resource)?

Data Needed:
                     Flight Plan submission times
                     Estimate elapse times to designated ATM resource
                     (Standard taxi-out times at departure airports – added for accuracy)

Analysis Complexity:
               Medium complexity for data collection
               High complexity for data presentation
               **
                  Presenting and explaining distribution of demand look-ahead may be complicated

Recommended Metrics:




ATFM Operations Analysis                                                                                          16
Recommended Framework, v1.0
            Metric                                                 Description
                                  Times (in minutes or hours) the flight information become available in
                                  the ANSP’s system prior to their arrivals, generally defined as
                                  Demand Look-Ahead = FPL submission lead time + Time required to
Tabulation of flights’ demand     arrive at designated resource (STT + EET)
look-ahead times
                                  The tabulation can be displayed as distribution of look-ahead times, to
                                  give a sense of percentage of flights captured at various look-ahead
                                  points.
                                  Look-ahead time at which XX% of traffic demand at designated ATM
                                  resource is captured in the system
Look-Ahead Point for XX%
Traffic
                                  The percentage point can be defined based on the needs; generally 80%
                                  is chosen to represent a useful majority for ATFM measure execution.
                                      Table 8 - Demand Look-Ahead Analysis

How this helps:
                Demand Look-Ahead analysis can be used to determine appropriate ATFM measure for a
given ATM resource. Different ATFM measures require different lead time in their execution; a GDP
generally requires longer lead time for effective CTOT notification, while a Minutes-in-Trail does not
require as much since it can be readily applied through ATC intervention to airborne flights. Thus, the
different measures will be suitable for traffic set with different demand look-ahead distribution. While
the analysis may be complex, it can be useful as part of the decision-making process


Demand Accuracy

Pre-Tactical Demand Accuracy

3.11              Accurate ATFM measure execution relies on using the most accurate data available to
the system at the time of calculation. Generally, flight plan information are used for this purpose, thus
the reliability of the information should be always be assessed. At the most basic level, flight plans’ flight
timings – departure, enroute elapsed, arrival – can be compared against their actual timings and
distribution in the time difference analyzed.

Key Question:
                  How accurate are flight information, particularly flight timings, provided in flight plans?

Data Needed:
                     Flight plan timing information
                     Flights’ actual operation timings

Analysis Complexity:
               Low complexity

Recommended Metrics:


ATFM Operations Analysis                                                                                 17
Recommended Framework, v1.0
           Metric                                                 Description
                                Comparison of a flight’s estimated off-block time filed in the flight plan
                                against its actual push-back time from the parking bay at departure
                                airport.

                                Distribution of the difference in the set of flights can be plotted to get
Push-Back Time Comparison
                                overall picture of flight plan accuracy.
(AOBT – EOBT)
                                *
                                 Note that the actual off-block times (AOBT) for flights may not be
                                readily available to ANSPs without surface movement surveillance
                                system, and may require coordination with the airport operator or
                                airspace users to obtain such information.
                                Comparison of a flight’s estimated take-off time derived from flight plan
                                and default /standard taxi-out time at departure airport against its
                                actual take-off time.

Departure Time Comparison       Distribution of the difference in the set of flights can be plotted to get
(ATOT – ETOT)                   overall picture of flight plan accuracy.

                                *
                                 Note that tactical variations due to, e.g., operational issues and
                                departure ground congestion, do occur. The time difference should also
                                be attributed in part to those tactical variations.
                                Comparison of a flight’s estimated landing time derived from flight plan
                                information against its actual arrival time at destination airport.
Arrival Time Comparison
(ALDT – ELDT)                   *
                                 Note that, as with departure time comparison, tactical variations in
                                flight times do occur, thus the time difference should also be attributed
                                in part to those variations.
                                Comparison of a flight’s estimated elapse time to a given ATM resource
                                derived from flight plan information against its actual elapse time over
Elapse Time Comparison          the same area.
(AET – EET)
                                *
                                 Note that, as with departure and arrival times, tactical variations
                                should also be accounted for in the attribution of difference.
                                    Table 9 - Pre-Tactical Demand Accuracy

How this helps:
                Assessment of pre-tactical demand accuracy based on flight plan information provides
an initial view of how reliable flight plans are and whether they are suitable as bases for ATFM
execution. When flight plan information is not reliable, an ANSP may consider implementing additional
procedure to obtain accurate flight intents from airspace users prior to ATFM execution.

                  Note though that tactical variations in flight do occur, and minor time difference


ATFM Operations Analysis                                                                                 18
Recommended Framework, v1.0
between actual operations and the flight plans is common. When performing the analysis, these minor
tactical variations should be accounted for.

Strategic Demand Accuracy

3.12             Flight plan information is normally available between 3 – 5 hours before flight. While
they represent most accurate flight information prior to operations and are useful for tactical ATFM
measure calculation; they are not available early enough to facilitate strategic and pre-tactical ATFM
operations (e.g. demand-capacity outlook and ATFM daily plan preparation). In the strategic and pre-
tactical phases; operations are normally based on flight schedule information, obtained from airlines’
marketing schedules and/or airport slots, as they are available on a seasonal basis. This strategic
demand information should also be assessed for its reliability through comparison with the associated
flight plan information in a similar manner as Pre-Tactical Demand Accuracy assessment.

Key Question:
                How accurate are flight information available strategically?

Data Needed:
                   Strategic schedule timing information
                   Strategic airport slots information
                   Flight plan timing information

Analysis Complexity:
               Low complexity

Recommended Metrics:
        Metric                                                 Description
                                Comparison of a flight’s estimated off-block time from flight plan against
                                its scheduled off-block time, and similarly comparison of a flight’s actual
Push-Back Time Comparison       off-block time against its scheduled off-block time.
(EOBT – SOBT)
                                *
(AOBT – SOBT)                    Note that the scheduled information can come from airlines’ schedule
                                or from airport slots. Comparison between airport slot times and airlines’
                                schedule can also be assessed if they differ often.
                                Comparison of a flight’s actual arrival time at the parking bay (actual in-
                                block time) against its scheduled in-block time at destination airport.
Arrival Time Comparison
(AIBT – SIBT)                   *
                                 Note that the scheduled information can come from airlines’ schedule
                                or from airport slots. Comparison between airport slot times and airlines’
                                schedule can also be assessed if they differ often.




ATFM Operations Analysis                                                                               19
Recommended Framework, v1.0
           Metric                                                 Description
                                Comparison of a flight’s actual block time from push-back at departure
                                airport to destination gate arrival against its scheduled block time. This
                                can provide insight into “schedule buffer” worked into strategic
Schedule Buffer Analysis        planning process by airspace users. With large schedule buffer, the
(AIBT – AOBT) – (SIBT –         accuracy of strategic schedule becomes less and its reliability reduced.
SOBT)
                                *
                                 With good taxi-out and taxi-in estimates available, ANSPs can also
                                isolate scheduled airborne times to compare against actual airborne
                                times and gain insight into the airborne portion of the schedule buffer.
                                     Table 10 - Strategic Demand Accuracy

How this helps:
                  Assessment of strategic demand accuracy based on schedule provides a view of
reliability in the strategic schedule and whether they can be used as bases for strategic / pre-tactical
ATFM execution. With unreliable strategic schedule, the ANSP would have less time to enact appropriate
ATFM measures in response to congestions and may have to rely solely on tactical ATFM measures.

Tactical Demand Information

3.13              In effectively implementing ATFM programs, not only does an ANSP need to look at
traffic demand completeness, reliability, and lead time, but also needs an effective monitoring of tactical
traffic situation. Accurate and complete tactical demand information should be made available to the
ATFM unit for further usage, and the analysis should be carried out to determine whether a lapse in the
information is present and should be addressed.

3.14           At the most basic level, tactical demand information comes from flight movement
messages such as DEP and ARR. A simple analysis into the completeness of these messages can be
conducted, and measures taken to address the lack of deliveries appropriately.

Key Question:
                  How complete are tactical demand information supplied through movement messages
                  (e.g. DEP, ARR)

Data Needed:
                     Movement messages (DEP, ARR)

Analysis Complexity:
               Low complexity

Recommended Metrics:




ATFM Operations Analysis                                                                               20
Recommended Framework, v1.0
           Metric                                                  Description

% of DEP message received


                                  These represent completeness of tactical flight update information,
% of ARR message received
                                  based on the simple count of relevant ATS messages.

% of DLA message received         For ANSPs with more sophisticated flight trajectory update capability,
for delayed flights               other means of tactical update completeness analysis can be conducted.

% of CNL message received
for cancelled flights
                                     Table 11 - Tactical Demand Information

How this helps:
                 Accurate tactical updates to traffic demand rely heavily on completeness of flight
movement messages. Assessment of completeness of DEP, ARR, DLA, CNL can inform an ANSP if there is
an issue in this domain and whether measures need to be taken against non-deliveries. By ensuring that
movement messages are delivered appropriately, an ANSP will have accurately updated traffic demand
profile and can execute ATFM measures effectively. Alternatively, if movement message delivery is
proven to be a problem and cannot be resolved, an ANSP may also consider other sources of updated
traffic demand information.

3.15              (placeholder)




ATFM Operations Analysis                                                                                21
Recommended Framework, v1.0
4. Operational Capacity Determination and Analysis

4.1            ICAO Manual on Collaborative ATFM (Doc 9971) describes the various factors
contributing to ATM resource capacities (Part II, Chapter 3). The chapter also describes the two
common schools of thoughts on determining baseline capacity numbers at various ATM
resources. The baseline capacity numbers, however, often need to be adjusted by dynamic
factors such as weather and staffing level to create operational capacities. These operational
capacities, in turn, determine the needs for ATFM measure(s) when compared against
operational traffic demand.

4.2             On the one hand, accurate determination of traffic demand generally relies on
simply ensuring the completeness and reliability of demand data sources. Accurate
determination of dynamic operational capacities with the required lead time, on the other hand,
can be a relatively more complex exercise relying on many factors with varying effects.

4.3           This section describes key considerations in working with dynamic operational
capacities.

General Considerations in Operational Capacity Determination

Lead Time and ATFM Program Participation

4.4             Different ATFM measures require different lead time to be effective. For
example, a Ground Delay Program (GDP) requires that Calculated Take-Off Times (CTOTs) be
delivered to flights long before EOBT. That required lead time, in turn, determines the lead time
an ATFM unit needs to know about the operational capacity. When an ATFM unit is able to
determine the operational capacity far ahead of time, there is a higher chance that an
appropriate ATFM measure can be activated and managed effectively. The longer lead time also
enables stakeholders, especially airspace users, to participate in the ATFM program and
operate flights in compliance to the measure. Well-planned events with long lead times thus
permit greater certainty and larger number of flights participating in the ATFM program. On the
other hand, dynamic constraints with shorter lead times may not allow the ATFM program to
be activated in time to capture the level of participating flights required for efficient and
equitable distribution of ATFM measures.

4.5            Ideally, an ATFM unit (ANSP) should have in place a dynamic capacity
determination mechanism that allows for their ATFM programs to be activated with enough
lead time to capture at least the optimum 70% flight participation level where possible.

Coordination between ATFM Unit and ATS Units

4.6            ATFM Unit should ensure to collaborate closely with associated ATS Units to
understand and quantify the impacts that various dynamic constraints will have on particular
airports or airspace volumes. These may be unique to a particular airport layout or airspace


ATFM Operations Analysis                                                                     22
Recommended Framework, v1.0
location depending on local procedures. While general guidelines exist, a relationship between,
for example, specific weather phenomena in one area may affect another area differently. Only
through close coordination and exchanges between the ATFM unit and their associated ATS
units would effective operational capacity determination be achieved.

Target Level of Service and Sensitivity to Capacity Reductions

4.7          Once operational capacities have been determined, sensitivity to their
reductions should also be established. Sensitivity level determines how severe a capacity
reduction should be before an ATFM measure has to be activated. The sensitivity should be
determined based on analysis of impacts and implications from various capacity reduction
scenarios.

4.8            One helpful approach to establish the sensitivity level is to determine first a
target level of service. The target level of service, e.g. acceptable airborne delay threshold,
should be agreed upon with stakeholders to determine what level of capacity reduction
warrants ATFM measures to be implemented.

Key Factors Impacting Operational Capacity

4.9          The following lists, while not exhaustive, are some of the factors that should be
considered when determining operational capacity at airports and airspace sectors.

        Airport Capacity
             Average Runway Occupancy Time (ROT)
               o This can be determined for different aircraft / approach categories and for
                   different entry / exit taxiways.
               o Under some circumstances, ROT may be an overriding factor to the
                   separation minima on final approach/departure.
             Target Final approach spacing under different runway operating Modes e.g.
               independent, dependent, mixed, LVO Cat II/Cat III
             Traffic Mix
               o Weight or wake turbulence categories
               o Final approach speed
               o Arrival-to-Departure ratio
             Airport operational constraints
               o Taxiway and Rapid Exit Taxiway (RET) closure
               o CNS serviceability and instrument approach availability
               o Runway dependencies
             Critical meteorological conditions
               o Headwind / Crosswind components
               o Visibility
               o Ceiling
               o Wind shear

ATFM Operations Analysis                                                                   23
Recommended Framework, v1.0
              o Thunderstorm or thunderstorm cloud affecting initial approach areas or
                  sequencing / holding areas
       Airspace Capacity
            Average flight times in sector
              Traffic Mix
               o Arrivals / Departures / Enroute flights
              Traffic Complexity
               o Climbing / Descending
               o Uni-directional / Bi-directional routings
               o Confliction points
              Flight Level Allocation Scheme (FLAS) disruptions
              CNS serviceability
              ATS staffing level

Analysis of Operational Capacity Determination

4.10           An ANSP (or ATFM unit), having determined operational capacities at their
resources, should regularly perform post-operational analysis to determine the actual
capacities achieved and how the various environmental factors affect them. The following lists
are examples of ways to analyze actual operational capacities at an airport and an airspace
volume.

                          Possible Analysis for Operational Capacity
                            Seasonal ROT study
                            Seasonal traffic mix study
                            Regular analysis on the comparison between target final approach spacing
                             vs. actual spacing achieved
Analyzing Airport
                            Sampling and comparison of predicted Airport Arrival Rate (AAR) vs.
Operational Capacity
                             actual rates achieved, particular on days with inclement meteorological
                             conditions affecting the airport capacity
                             o Note: Deviations of >10% between predicted AAR and actual AAR
                                  typically warrant further detailed analysis.
                            Sector entry and occupancy counts – peak, instantaneous, average
Analyzing Airspace
                            Hourly waypoint-crossing counts – peak, average
Operational Capacity
                            Analysis on instances of non-optimal assigned FL due to route overload
                                  Table 12 - Operational Capacity Analysis

4.11           (placeholder)




ATFM Operations Analysis                                                                         24
Recommended Framework, v1.0
5. ATFM Measure Metrics and Analyses
5.1             ICAO Manual on Collaborative ATFM (Doc 9971) specifies a number of ATFM measures
that can be used for different demand-capacity imbalance situations, as shown in Figure 2 (Figure II-4-3
in Doc 9971, 3rd Ed.). As these measures are suitable for different situations, they have different metrics
to measure their performance. This section describes the different ATFM measures and recommends a
set of metrics that can be used to assess their operational performance. As with other sections in this
document, the metrics provided should be used as a starting guideline supplemented by any additional
information/analysis relevant for local environment.




                                   Figure 2 - ATFM Measure Selection Process




Analyzing an ATFM Program: 3-Part Story

5.2             Performing post-operations analysis for an ATFM program can seem daunting, with the
amount of data available and the many facets of the program that can be reported. To simplify the
process and the reporting, this framework adopts a 3-Part Story approach to characterizing and
reporting on an ATFM program. The 3-Part Story approach organizes ATFM data into 3 main parts, which
together create a smooth flow of story about a given ATFM program; from characterizing the impact to
assessing compliance to evaluating its effectiveness.

5.3             The 3-Part Story approach to crafting post-operations analysis focuses on the following
(Table 13 and Figure 3):


ATFM Operations Analysis                                                                              25
Recommended Framework, v1.0
              Impact                          Compliance                              ATFM
              Analysis                        Assessment                          Effectiveness

                              Figure 3 - 3-Part Story Approach to Post-Ops Analysis

Key Performance Areas           Description
                                Key Question: Who are impacted by the ATFM program, and how?

                                This section should analyze the impact of the ATFM measure activated.
                                The analysis should include breaking down the various Airspace Users
                                and Airport Operators involved along with the impact – such as ATFM
Impact Analysis
                                delays – they face.

                                Impact analysis should be able to provide insights such as ATFM delay
                                trend, fairness in ATFM delay distribution, and particular areas where
                                further collaborations are needed.
                                Key Question: How well do stakeholders comply with the ATFM
                                measure?

                                This section should assess the level of ATFM compliance exhibited by
Compliance Assessment           impacted stakeholders. ATFM measure generally works best when
                                majority of flights included in the program comply with the
                                requirements assigned. Analyzing the compliance level from different
                                stakeholders can provide insight into areas where more collaboration or
                                even a change in governing procedure can improve the performance.
                                Key Question: How effective is the ATFM measure implemented in
                                delivering the intended level of traffic?

                                This section should evaluate the outcome at the ATM resource for
                                which the ATFM measure has been activated, against planned
                                objective(s). For example, if a Ground Delay Program (GDP) is required
                                to manage traffic into an airport during the 2-hour period with
ATFM Program Effectiveness
                                thunderstorms, the actual number of arriving traffic should be counted
                                in comparison to the plan.

                                The most important note to keep in mind is to ascertain that the ATFM
                                measure objective(s) are set appropriately and clearly prior to the
                                activation of the program. Once set, the objectives should be the main
                                driving force behind operational decisions taken.
                              Table 13 - 3-Part Story Approach to Post-Ops Analysis

5.4           The following sections describe different metrics for characterizing and analyzing
various ATFM measures post-operations, following the 3-part framework mentioned above.




ATFM Operations Analysis                                                                            26
Recommended Framework, v1.0
Ground Delay Program (GDP)

Definition and Implementation

5.5              GDP is a pre-tactical or tactical ATFM measure where aircraft are held on the ground in
order to manage capacity and demand in a specific volume of airspace or at a specific aerodrome. In the
process, departure times are assigned to corresponding available entry slots into the constrained
airspace or arrival / departure slots into / from the constrained aerodrome. A GDP aims to, among other
things, minimize airborne delays. It is a flexible program, and its form may therefore vary depending on
the needs of the ATM system. GDPs are best developed in a collaborative manner even though they are
typically administered and managed by an ATFMU or a national / international ATFM center. When a
GDP is scheduled to last for several hours, the likelihood of slots having to be revised increases, as
conditions could change. There should therefore be a system in place to advise stakeholders of
departure slots as well as of any changes to the GDP.

5.6             Generally, GDP is used to provide greater predictability to stakeholders and to shift
unavoidable airborne delays to less-taxing pre-departure ground delays. The ability of GDP to deliver the
predictability and the reduction in airborne delays should thus form the basis for the program’s
effectiveness assessment.

Characterizing a GDP

5.7             Characterizing a GDP involves recording basic parameters used when the program is
activated. These parameters can be used as a baseline in comparing between different GDPs over time.
Table 14 provides a sample list of basic parameters that can be recorded and used to characterize each
GDP.

          Parameters                                              Description
                                   The start and end times of the GDP, which signifies the time period
Start Time / End Time
                                   an ATFMU wants to control the traffic demand.
                                   The times that the GDP is cancelled, if it is cancelled before the
                                   intended time; while this signifies improvement in the constraint
Purge (Stop) Time
                                   situation, it can be disruptive for stakeholders who have already
                                   planned for ground delays.
                                   The amount of time GDP is announced prior to its activation, e.g.
                                   ADP delivery time compared to GDP start time; this indicates how
Lead Time to Activation
                                   much time is given to stakeholders to acknowledge and prepare for
                                   the ATFM measure.
                                   The amount of time CTOTs are delivered ahead of the associated
                                   flight’s Estimated Off-Block Time (EOBT); this indicates how much
CTOT Delivery Lead Time
                                   time is given to flight crews and related personnel to adjust their
                                   operations in an attempt to comply with CTOTs.
                                   Number of events resulting in the change in GDP, e.g. revision in the
Number of ATFM Events              End Time, changing of flow rates and consequently CTOTs, changing
                                   of the ATFM measure as situation improves or deteriorates.
                                        Table 14 - Characterizing GDP

GDP Impact Analysis

ATFM Operations Analysis                                                                            27
Recommended Framework, v1.0
5.8             Following the characterization of GDP, the program’s impact can be analyzed. This
should include analyses into the flights involved in the program and the ATFM delays assigned. In GDP,
ATFM delay should be defined as:

                                   𝑨𝑻𝑭𝑴 𝑫𝒆𝒍𝒂𝒚 = 𝑪𝑻𝑶𝑻 − 𝑬𝑻𝑶𝑻

where ETOT is the Estimated Take-Off Time based on the flight’s originally-intended operations.

5.9             Table 15 provides a sample list of impact parameters that should be included.

          Parameters                                                Description
Flight Count Impact
Total Number of Flights            Number of flights included in the GDP.
                                   Breakdown of the flights included in the GDP, e.g. by Airspace Users
Flight Breakdown
                                   / Airspace User Groups, departure aerodromes, departure FIRs.
                                   Number of flights included in the GDP but exempted from CTOT, i.e.
                                   flights that form part of the demand but are given zero-minute ATFM
Number of Exempted Flights         delay. Flights in this group could include flights outside of the GDP
                                   agreement or flights that are already airborne at the time the GDP is
                                   activated.
                                   Number of flights included in the GDP and given CTOT; this can be
                                   compared to the number of exempted flights and used to analyze if
Number of Included Flights
                                   GDP is actually an appropriate measure. If the rate of exemption is
                                   high, other ATFM measure may need to be considered.
                                   Number of flights whose CTOTs were cancelled, either due to flight
Number of Slot Cancellations       cancellation or re-timing such that they fall outside the regulated
                                   period.
ATFM Delay Impact
                                   Total ATFM delays assigned to flights as part of the GDP. Note that
                                   there may be difference between originally-assigned ATFM delay,
Total ATFM Delay
                                   which should be a function of capacity constraint or rate of
(Assigned vs Final)
                                   congestion, and the final ATFM delay, which could include CTOT
                                   revisions and thus may not reflect true capacity-induced delays.
ATFM Delay Descriptive             Descriptive statistics of ATFM delays; e.g. average, maximum,
Statistics                         minimum, variance.
                                   Breakdown of ATFM delays assigned to different stakeholders, e.g.
                                   Airspace Users / Airspace User Groups, departure aerodromes. This
                                   information can help determine if there is a skewed distribution of
                                   ATFM delays between stakeholders. Note that the amount of ATFM
ATFM Delay Breakdown
                                   delay assigned to each stakeholder should be viewed in conjunction
                                   with the associated traffic contribution, e.g. Airspace User with large
                                   number of flights operating during the GDP period should expect
                                   larger total ATFM delays.
                                        Table 15 - GDP Impact Analysis

5.10            Another characteristic of a GDP, per ICAO Doc 9971’s definition, is the possibility of slot


ATFM Operations Analysis                                                                              28
Recommended Framework, v1.0
management (revisions, additions, cancellations) that should be facilitated by the ATFMU initiating the
program. A recording and tabulation of these slot management actions, sometimes referred to as CDM
actions, can also be an indicator of stakeholders’ awareness and active participation in the program as
well as the impact they face. Table 16 provides a sample list of CDM action elements that can be
recorded.

         Parameters                                            Description
CDM Actions / Slot Management
Number of Slot Changes        Number of times a slot change (into open slot) occur.
Number of Slot Substitutions  Number of times a slot substitution between 2 flights occur.
                              Number of times assigned CTOTs are cancelled, either due to flight
Number of Slot Cancellations  cancellation or re-timing such that they fall outside the regulated
                              period.
                              Number of times additional slots / CTOTs have to be allocated to
                              flights after the initial distribution. This can be related to the number
Number of Added Slots
                              of “pop-up” flights which had not been accounted for during the
                              demand prediction process.
                                          Table 16 - GDP CDM Actions

5.11           Further analysis of CDM actions can help ANSPs better understand the behaviors of
stakeholders when a GDP is activated.

GDP Compliance Assessment

5.12             The next step after impact analysis is assessing compliance to GDP. An effective GDP
relies heavily on compliant departures from the points of origin, and low departure compliance can
result in unintended or undesirable effects at the constrained resource. There have been examples
where a large number of non-compliant departures adversely affect the smooth flow of traffic, often
forcing compliant flights to take undue additional airborne delays and reducing the overall effectiveness
of the GDP. Analyzing departure compliance against CTOT should be the first-level analysis done on
flights included in each GDP, and statistics surrounding compliance rate can provide insight into areas
where improvements are needed. For a GDP, CTOT compliance should be based on the comparison
between flight’s assigned CTOT and its actual take-off time (ATOT):

                              𝑫𝒆𝒑𝒂𝒓𝒕𝒖𝒓𝒆 𝑫𝒊𝒇𝒇𝒆𝒓𝒆𝒏𝒄𝒆 = 𝑨𝑻𝑶𝑻 − 𝑪𝑻𝑶𝑻

The departure difference should be evaluated against established compliance window. The compliance
window is a factor built into GDP to allow for variations in tactical operations at the departure side; it is
normally defined as (-5/+10) minutes in Asia-Pacific. Departure differences that fall outside of the
established window should be considered non-compliant. Table 17 provides a sample list of statistical
analysis that can be done on the departure difference and CTOT compliance.




ATFM Operations Analysis                                                                                29
Recommended Framework, v1.0
          Parameters                                              Description
                                    Counts and ratios of CTOT compliance statuses; this can include the
                                    counting of compliant, early, and late departures, or can include
CTOT Compliance Ratio               finer grouping e.g. 5-10 minutes early, >10 minutes early, 5-10
                                    minutes late, >10 minutes late. The degree of granularity in
                                    groupings depends on the use of the information.
                                    Grouping compliance into statuses (compliant, non-compliant) may
Departure Difference                not be sufficient to provide a picture of departure situation; a
Distribution                        (histogram) distribution of departure differences may provide a
                                    better picture and insight.
                                    Breakdown of CTOT compliance statuses among different
                                    stakeholders, e.g. Airspace Users / Airspace User Groups, departure
                                    aerodromes, Airport Operators, countries of origin. The breakdown
CTOT Compliance Breakdown
                                    can help ANSP identify particular area that needs improvement or
                                    particular stakeholder that needs to be investigated and
                                    collaborated.
                                    Table 17 - GDP Compliance Assessment



5.13             While a GDP generally focuses on the departure end, a similar compliance analysis can
be carried out at the arrival / constrained resource end as well. This can be done by comparing actual
times of arrival at the constrained / congested resource, e.g. actual landing time (ALDT) or actual time
over a significant point (ATO), against the associated calculated times (calculated landing time – CLDT, or
calculated time over a significant point – CTO). Similar to departure difference, the arrival difference
should be compared against established compliance window.

                               𝑨𝒓𝒓𝒊𝒗𝒂𝒍 𝑫𝒊𝒇𝒇𝒆𝒓𝒆𝒏𝒄𝒆 = 𝑨𝑳𝑫𝑻 − 𝑪𝑳𝑫𝑻

                               𝑻𝒊𝒎𝒆 𝑶𝒗𝒆𝒓 𝑫𝒊𝒇𝒇𝒆𝒓𝒆𝒏𝒄𝒆 = 𝑨𝑻𝑶 − 𝑪𝑻𝑶

5.14             It is worth noting, however, that compliance at the arrival end may not fully fall under
the responsibility of Airspace Users unless otherwise agreed and appropriately announced during the
ATFM implementation process. Due regards should thus be given to tactical airborne variations that can
result from various uncontrollable factors such as weather deviations and tactical pilot and ATC
interventions. Analysis result from arrival compliance should be used cautiously and not without proper
accounting for the tactical variations.

GDP Effectiveness Measurement

5.15             Compliance analysis should lead naturally to the measure of GDP’s effectiveness in
regulating traffic against desired objectives. As mentioned in Table 13, clear objective statements
should be set by the ATFMU initiating the GDP prior to its activation and the post-operations analysis.
The objective statements should then be used as bases for effectiveness measurement.




ATFM Operations Analysis                                                                              30
Recommended Framework, v1.0
5.16              GDP, as with other ATFM measures, should have the main objective of balancing
demand against available operational capacity; applied at an aerodrome, airspace volume, a particular
waypoint, or a segment of route. Another objective often quoted along with demand-capacity balancing
is GDP’s ability to transfer unavoidable airborne delays into less-disruptive ground delays pre-departure,
adding predictability and reducing fuel consumption for Airspace Users while minimizing airborne air
traffic complexity for ATC.

5.17             Table 18 provides samples of 2 GDP performance objectives and possible associated
indicators as guideline for GDP effectiveness measurement in the post-operations analysis process.

          Parameters                                          Description
Performance Objective:
Balancing demand against available operational capacity at constrained / congested ATM resource
                                 Comparison of traffic demand achieved at the ATM resource for
                                 which GDP is activated against scheduled / intended / planned
                                 demands figures.

                                   The comparison should be made between:

                                    1. Scheduled / flight planned demand vs. GDP planned demand
                                    2. GDP planned demand vs. Actual demand
                                    3. Scheduled / flight planned demand vs. Actual demand

                                   Analysis (1) can show whether the parameters used in planning and
                                   executing the GDP is effective in regulating the original demand. If
                                   the GDP planned demand is very similar to the scheduled / flight
                                   planned demand, and is still over capacity, a revision in the GDP
                                   parameters – time period, flow rate, exemption/inclusion rules –
Comparison of Traffic Demand       may need to be revised.

                                   Analysis (2) can show whether the actual traffic demand fits the
                                   demand that had been planned with GDP. A large difference here
                                   may be resultant from low departure compliance or high tactical
                                   variations during flights. This can be ground for further investigation
                                   into the causes of low compliance or high airborne variations.

                                   Analysis (3) is closely related to ATFM delay analysis in the impact
                                   assessment section, as it shows the degree to which traffic demand
                                   is adjusted from its original schedule/intention. It may also be used
                                   in conjunction with compliance analysis to assess stakeholders’
                                   behaviors against GDP as well, e.g. whether Airspace Users or Airport
                                   Operators elect to adhere to original schedule/intention rather than
                                   the assigned ATFM delays. The insight can be ground for further
                                   coordination and awareness effort to improve the trend.




ATFM Operations Analysis                                                                              31
Recommended Framework, v1.0
           Parameters                                         Description
                                  Comparison of traffic demand achieved at the ATM resource for
                                  which GDP is activated against operational capacity available.

                                  The comparison should be made between:

                                   1. Scheduled / flight planned demand vs. operational capacity
                                   2. GDP planned demand vs. operational capacity
                                   3. Actual demand vs. operational capacity

                                  Analysis (1) can be used to justify the activation of a GDP as, ideally,
                                  GDP should only be activated when the intended demand (scheduled
                                  / flight planned) exceeds available operational capacity.

                                  Analysis (2) can be used to gauge the appropriateness of GDP
                                  activation parameters (time period, flow rate, exemption/inclusion
Capacity Utilization Ratio
                                  rules). Ideally, the GDP planned demand should closely match
                                  available operational capacity.

                                      If the planned demand exceeds capacity, the program is said to
                                       have over-utilized the resource and may not solve the problem.

                                      If the planned demand falls below capacity, the program is said
                                       to have under-utilized the resource and may be too stringent on
                                       the stakeholders, with possibly too much ATFM delays assigned.

                                  Analysis (3) can be used to gauge whether the GDP has helped to
                                  regulate the traffic demand against available operational capacity.
                                  The degree of difference between actual demand and operational
                                  capacity can be a function of CTOT compliance rate and/or degree of
                                  airborne variations in-flight.
Performance Objective:
Reducing or shifting airborne delays into less-taxing pre-departure ground delays




ATFM Operations Analysis                                                                             32
Recommended Framework, v1.0
          Parameters                                              Description
                                    Calculation, tabulation, and descriptive statistics of airborne delays
                                    for flights included in the GDP.

                                    There are a number of ways to calculate airborne delays for flights,
                                    each with varying complexities. 2 example ways at the opposite ends
                                    of complexity spectrum are:

                                        “Time-based” calculation – Calculating actual airborne time
                                         based on (ALDT – ATOT), and compare against “expected flight
                                         time” which can be defined as ATFM system estimate or based
Airborne Delay Analysis                  on flight plan’s total EET. This is the simplest calculation with
                                         data readily available from flight plan and ATS message
                                         processing systems.

                                      “Track-based” calculation – Calculating actual airborne time, or
                                       even actual flown track, from surveillance data and compare
                                       against “expected flight time” or “expected track”. The excess in
                                       flight time or extension in flight track can be considered
                                       airborne delays. This is a more complex way of deriving airborne
                                       delays, relying on high data-processing power and good
                                       surveillance data management.
                                    Comparison between a flight’s airborne delay and ground delay.

                                    The comparisons, especially when grouped based on CTOT
                                    compliance statuses, can show the effect of complying to CTOTs as
Airborne vs. Ground Delay           well as the GDP effectiveness in reducing airborne delays for
Comparison                          compliant flights. The analysis can also highlight any troubling trends
                                    such as adverse effects from uncontrollable factors, e.g. compliant
                                    flights seeing relatively higher airborne delays. The troubling trends
                                    are important areas that ANSPs should focus on when improving
                                    GDP further.
                                   Table 18 - GDP Effectiveness Measurement

5.18           GDP effectiveness measurement is, in a way, one of the most important aspects of post-
operations analysis. Its result is very closely related to, or can form a basis for, ATFM benefit analysis.
Successful GDPs should be able to demonstrate that they can achieve the performance objectives set out
from the beginning, and that they provide benefits to all stakeholders when they participate and comply
to the requirements.

Anecdotal Feedback from Stakeholders

5.19            GDP post-operations analysis should not rely on numerical analyses alone. Equal
importance should also be placed on obtaining and analyzing anecdotal feedback from stakeholders,
especially those supporting the compliance facilitation at the departure end. Anecdotal information
such as departure ground congestion due to weather or unforeseen aircraft problem are often obscured
from numerical analyses, and stakeholders can be misrepresented when the numerical analyses are
taken out of operational context. While consistently low compliance on the part of an Airspace User or a

ATFM Operations Analysis                                                                                33
Recommended Framework, v1.0
departure aerodrome may be indicative of the lack of awareness or supporting procedure to support
GDP, abnormally low compliance in a few instances may be a result of unusual departure circumstances.
These “unusual circumstances” can only be accounted for when numerical analyses are supplemented
by anecdotal information obtained through collaboration with stakeholders.

5.20            Coordination and collaboration with stakeholders should thus always be a part of GDP
post-operations analysis workflow. Section 6 in this Framework will provide an example of how such
collaborative workflow may be established.

Miles-in-Trail / Minutes-in-Trail (MIT / MINIT)

Definition and Implementation

5.21             Miles-in-Trail (MIT) and Minutes-in-Trail (MINIT) are tactical ATFM measures expressed
in terms of required spacing between successive aircraft overflying a given waypoint or crossing a sector
or FIR boundary. The measures are normally applied at FIR boundary waypoints. The main objective of
MIT/MINIT is to reduce the workload of ATC responsible for the receiving (downstream) FIR by keeping
entering aircraft further apart than usual. The measure, however, can create additional workload for the
ATC responsible for upstream FIR in managing the traffic to achieve required spacing. Additionally, this
ATFM measure can be expanded as the requirements get passed to further FIRs. As such, regular usage
of MIT/MINIT may indicate that more appropriate ATFM measures should be used in their places.

Characterizing a MIT/MINIT

5.22             Characterizing MIT/MINIT involves recording basic parameters used when the program
is announced, along with parameters describing the program’s predictability. Table 19 provides a
sample list of parameters that can be used to characterizing such ATFM program.

          Parameters                                            Description
Program Predictability
ADP Accuracy
                                   Comparison between planned MIT/MINIT announced in the ATFM
(Planned ATFM measure vs.
                                   Daily Plan (ADP) and actual MIT/MINIT activated.
actual ATFM measure)
                                   The amount of time MIT/MINIT is announced prior to its activation.
                                   This can be calculated from

Lead Time to Activation                     MIT/MINIT activation time – Coordination time
(Notification Lead Time)
                                   where coordination time can be defined as time at which MIT/MINIT
                                   requirements are coordinated with upstream units, e.g. NOTAM
                                   publication time if the requirements are notified by NOTAM.




ATFM Operations Analysis                                                                            34
Recommended Framework, v1.0
          Parameters                                             Description
                                   The amount of time MIT/MINIT revision is announced prior to its
                                   activation. This can be calculated from
Lead Time when Changing
Restrictions or Changing End               MIT/MINIT change/end time – Coordination time
Time
(Revision Notification Lead Time) where coordination time can be defined as time at which MIT/MINIT
                                  requirements are coordinated with upstream units, e.g. NOTAM
                                  publication time if the requirements are notified by NOTAM.
                                  Records of the changes to MIT/MINIT restrictions.

Restriction Change Records         These records can provide insight into how “stable” the restrictions
                                   are. The more volatile the restrictions, the less predictable the
                                   program becomes for stakeholders.
Restriction Severity
                                   The records of the original MIT/MINIT restrictions imposed by the
                                   first unit, and the final MIT/MINIT restrictions imposed on the same
                                   traffic flow by upstream FIRs.

                                   As an example, a 10-MINIT restriction may be initially assigned by
                                   ACC “D” to ACC “C”; the ACC “C” may expand the restriction and
                                   impose 20-MINIT restriction to ACC “B” to cater for their departure
Original Restriction Imposed
                                   within ACC “C”. Similarly, the ACC “B” may further expand the
Final Restriction Imposed
                                   restriction and impose 40-MINIT restriction to ACC “A”. In this
                                   scenario, the original restriction is 10 minutes while final restriction
                                   is 40 minutes.

                                   By recording and comparing between final and original restrictions,
                                   the degree of MIT/MINIT expansion can be seen, highlighting the
                                   potential problems such restrictions can cause to upstream units.
                                     Table 19 - Characterizing MIT/MINIT

MIT/MINIT Impact Analysis

5.23           Similar to GDP, impact of MIT/MINIT can be analyzed following the characterization of
the program. The impact analysis can be in terms of overall “size” of the restriction and/or the ATFM
delays imposed on the flights.

5.24           Unlike GDP, where each flight is given a specific departure slot and ATFM delay,
MIT/MINIT does not directly assign departure slots to flights. Thus, ATFM delays may not be readily
apparent. In some instances in Asia-Pacific, the MIT/MINIT restrictions are translated into GDP and
CTOTs are assigned to flights in lieu of the restrictions; in these cases the ATFM delay can be defined in
the same way as for a GDP:

                                   𝑨𝑻𝑭𝑴 𝑫𝒆𝒍𝒂𝒚 = 𝑪𝑻𝑶𝑻 − 𝑬𝑻𝑶𝑻

5.25            When MIT/MINIT restrictions are not translated into GDP, on the other hand, ATFM


ATFM Operations Analysis                                                                                35
Recommended Framework, v1.0
delay may be defined in terms of the difference between the flight’s actual take-off time (ATOT) and
estimated take-off time (ETOT):

                                    𝑨𝑻𝑭𝑴 𝑫𝒆𝒍𝒂𝒚 = 𝑨𝑻𝑶𝑻 − 𝑬𝑻𝑶𝑻

                 Note: A flight’s ATOT may not necessarily be due to only to the restriction but also to
other operational factors, e.g. delays due to boarding or aircraft turnaround process. Where possible,
delays due to other factors should be isolated possibly by obtaining operational log or collaboration with
airspace user / ground staffs.

5.26            With the ATFM delays computed and tabulated, Table 20 recommends various
indicators to analyze the impact of MIT/MINIT restrictions.

          Parameters                                             Description
Flight Count Impact
                                    Number of flights captured in the MIT/MINIT restriction.
Total Number of Flights
                                    Generally, MIT/MINIT restrictions would capture all flights in the
                                    specified traffic flow without exemption.
                                    Breakdown of the flights captured in the MIT/MINIT restriction, e.g.
                                    by Airspace Users / Airspace User Groups, departure aerodromes,
                                    departure FIRs.
Flight Breakdown
                                    The breakdown will provide insight into stakeholders impacted by
                                    the restriction.
Restriction Severity
                                    The records of
                                        - original MIT/MINIT restrictions imposed by the first unit;
                                        - intermediate MIT/MINIT restrictions imposed by
Original, Intermediate, and Final
                                            intermediate units enroute; and
Restrictions Imposed
                                        - final MIT/MINIT restrictions imposed
                                    on the same traffic flow by upstream FIRs.

                                    See Table 19 for detail.
ATFM Delay Impact
                                    Total ATFM delays assigned to flights due to MIT/MINIT restrictions.

Total ATFM Delay                    If MIT/MINIT restrictions are translated into GDP, the total ATFM
                                    delays should reflect both the original number induced by the
                                    restrictions and also the final number with revisions included.
ATFM Delay Descriptive              Descriptive statistics of ATFM delays; e.g. average, maximum,
Statistics                          minimum, variance.




ATFM Operations Analysis                                                                                36
Recommended Framework, v1.0
          Parameters                                             Description
                                   Breakdown of ATFM delays assigned to different stakeholders, e.g.
                                   Airspace Users / Airspace User Groups, departure aerodromes. This
                                   information can help determine if there is a skewed distribution of
                                   ATFM delays between stakeholders. Note that the amount of ATFM
ATFM Delay Breakdown
                                   delay assigned to each stakeholder should be viewed in conjunction
                                   with the associated traffic contribution, e.g. Airspace User with large
                                   number of flights operating during the restriction period on the
                                   affected flow should expect larger total ATFM delays.
                                    Table 20 - MIT/MINIT Impact Analysis

MIT/MINIT Compliance Assessment

5.27            MIT/MINIT are tactical ATFM measures that work by prescribing required spacing
between successive aircraft overflying a waypoint. Measuring MIT / MINIT compliance thus focuses on
assessing the actual spacing between aircraft against the restriction, as described in Table 21




          Parameters                                          Description
                                   Comparison between actual spacing between successive aircraft and
                                   the MIT / MINIT requirement.

                                   Note that this analysis will require ability to process a large amount
MIT / MINIT Compliance             of surveillance data. Note also that tactical airborne variations and
                                   originally-planned timing parameters of the aircraft can result in
                                   aircraft achieving different spacings than the imposed restriction.
                                   These factors should be considered when analyzing MIT/MINIT
                                   compliance levels.
                                Table 21 - MIT/MINIT Compliance Assessment

MIT/MINIT Effectiveness Measurement

5.28           Similar to GDP, clear objective statements should be set by the ATFMU initiating the
MIT/MINIT prior to its activation and the post-operations analysis. The objective statements should then
be used as bases for effectiveness measurement. One of the main objectives for MIT/MINIT is to reduce
ATC’s workload by preventing a large number of aircraft from arriving into the area at the same time
through the regulation of their successive spacings. Under this performance objective, TABLE
recommends an indicator to assess MIT/MINIT effectiveness.

         Parameters                                          Description
Performance Objective:
Reducing ATC workload by regulating the number of arriving traffic at an airport




ATFM Operations Analysis                                                                              37
Recommended Framework, v1.0
         Parameters                                            Description
                                   Comparison of traffic demand achieved at the ATM resource for
                                   which MIT/MINIT is activated against scheduled / intended / planned
                                   demands figures.

                                   This analysis would require planned demand (e.g. AAR), aircraft
Comparison of Traffic Demand       estimated landing times (ELDT), and aircraft actual landing times
                                   (ALDT).

                                   See Table 18 for recommended indicators on traffic demand
                                   comparisons for GDP. Similar comparisons can be utilized to
                                   determine the effectiveness of MIT/MINIT.
                               Table 22 - MIT/MINIT Effectiveness Measurement

(Placeholder for Other ATFM Measures)
5.29          (Placeholder)




ATFM Operations Analysis                                                                               38
Recommended Framework, v1.0
6. Collaborative ATFM Post-Operations Analysis
Roles of Stakeholders in ATFM Post-Operations Analysis

6.1             Post-Operations Analysis is the final phase in an ATFM execution process. In this phase;
analytical process is carried out, utilizing data analysis techniques based on recommendation in the
previous sections, to measure the impact and successfulness of an ATFM program. Lessons learned from
this process will be used to further improve the operational processes and activities for future
operations.

6.2              While many of the analyses can be carried out within a single ATFMU or ANSP, close
collaboration and coordination with other ATFM stakeholders will yield better and more reliable results.
An ANSP/ATFMU initiating the ATFM measure may also be limited in their data available without the
support from stakeholders, such as the case of actual ground operation information, which is normally
only available to ANSP on the departure side or the Airspace User.

6.3           Recognizing the importance of all stakeholders in the post-operations analysis effort,
Table 23 summarizes roles each stakeholder can play in the process.

ATFM Stakeholder                              Roles in Post-Operations Analysis Effort
                          - Lead Post-Ops Analysis effort, from data collection to data analysis
ATFMU / ANSP              - Develop procedure to obtain feedback and share lessons learned with
initiating the              stakeholders
ATFM measure              - Develop procedure to ensure analyses, feedback, and lessons learned are
                            used to improve subsequent operations
                          - Perform Post-Ops Analysis to the extent possible within their domain, e.g.
                            departure compliance analysis and time estimation accuracy assessment
ATFMU / ANSP
                          - Ensure complete submission of required data, e.g. DEP messages, to the
facilitating compliance
                            initiating ATFMU / ANSP
to the ATFM measure
                          - Record challenges and anecdotal feedback on the operations, and provide
                            them to the initiating ATFMU / ANSP for Post-Ops Analysis effort
                          - Record flight operations data such as OOOI for use in the Post-Ops Analysis
                            effort
                          - Provide additional data to the initiating ATFMU / ANSP for better Post-Ops
Airspace Users              Analysis, e.g. OOOI information to aid in Standard Taxi-Out Time accuracy
                            assessment
                          - Record challenges and anecdotal feedback on the operations, and provide
                            them to the initiating ATFMU / ANSP for Post-Ops Analysis effort
                          - Conduct study of airport operations data such as gate occupancy time
                            variation and ground movement time to aid the initiating ATFMU / ANSP in
                            improving the accuracy of ATFM operations
Airport Operators         - Provide additional data to the initiating ATFMU / ANSP for better Post-Ops
                            Analysis
                          - Record challenges and anecdotal feedback on the operations, and provide
                            them to the initiating ATFMU / ANSP for Post-Ops Analysis effort
                                   Table 23 - Roles of Stakeholders in POA




ATFM Operations Analysis                                                                            39
Recommended Framework, v1.0
Workflow for Collaborative Post-Operations Analysis

6.4               To help stakeholders in supporting Post-Operations Analysis effort with the roles
mentioned in Table 23, ATFMU / ANSP initiating the ATFM measure should establish an effective
workflow to ensure flight and related operational information get collected in a timely manner. This
enables the Originating ATFMU to process information and share result with stakeholders following the
ATFM program, possibly through a debriefing web-/teleconference. In the case of long-term ATFM
program spanning several days, a debriefing session can also serve as planning session for the upcoming
day(s) as well. Figure 4 provides an example of a workflow that can be established.




                                  Figure 4 - Workflow for Collaborative POA

6.5              In the figure, the emphasis is placed on the sharing of operational information between
stakeholders, and timely debriefing session hosted by the initiating ATFMU along with the importance
of using analysis result for improvement of subsequent ATFM programs.

6.6            In a distributed ATFM environment, such as explored in the Distributed Multi-Nodal
ATFM Network, each initiating ATFMU may establish slightly different workflow with stakeholders. It is
important to communicate these workflow and expectations to all involved clearly.

6.7            The importance should also be placed on internal work process for each stakeholder.
Internal procedure may need to be established to ensure appropriate operational data are collected by
operational personnel or local support system. This may introduce additional workload in some cases,
but the information provided can greatly enhance the programs in future rounds.

6.8            ATFM is a collaborative operation, involving and impacting several stakeholders
throughout all phases. Post-Operations Analysis should also be collaborative in nature, with ATFMU /
ANSP leading the effort to objectively analyze the data collected and information gathered; and with all
stakeholders working together to continually assess and improve ATFM operations.


ATFM Operations Analysis                                                                           40
Recommended Framework, v1.0
ATFM/CDM Planning Web Conference: A Channel for Collaboration

6.9              One channel that can allow ATFMU to exchange information, including post-operations
analysis results and lessons learned, with stakeholders is ATFM/CDM Planning Web-/Teleconferences.
These conferences are recognized as an essential part of ATFM communication as discussed in Chapter 6
of ICAO Manual on Collaborative ATFM (Doc 9971). In the Manual, ICAO recommends 2 types of
planning web-/teleconferences:

                (a) Scheduled web-/teleconferences held by ATFMUs periodically (e.g. daily or weekly)
                    to discuss operational context and outlook with affected stakeholders; and

                (b) Ad-hoc web-/teleconferences held by ATFMUs as required to address unforeseen
                    circumstances.

6.10            As participation in these web-/teleconferences can be comprehensive, spanning ANSPs,
Airspace Users, and Airport Operators, the conferences can also be used as a channel for post-
operations discussions. Attendees can be provided with post-operations analysis results and be given
opportunities to discuss operational circumstances they have faced during the ATFM process within
their domains. The discussions can help bring to light system and operational issues and can lead to a set
of lessons learned shared among all stakeholders.

6.11           The holding of scheduled web-conferences has already been taken up by 2 regional
ATFM initiatives, namely the Distributed Multi-Nodal ATFM Network Project in Asia/Pacific and the
CANSO ATFM Data Exchange Network for the Americas (CADENA) in Latin America and the Caribbean.
Specifically:

                (a) Distributed Multi-Nodal ATFM Network Project holds scheduled planning web-
                    conferences once every 2 weeks, with participation from ATFM units (ANSPs) in the
                    network. The primary purposes are to discuss (i) operational outlook and possible
                    ATFM measures for the coming 2 weeks and (ii) operational issues and lessons
                    learned from the previous 2 weeks. It is expected that ATFM units (ANSPs) will have
                    discussed issues with local stakeholders prior to the planning web-conferences.

                (b) CADENA holds scheduled web-conferences once every week, with participation
                    from ANSPs in the network. The primary purposes are to discuss expected
                    constraints, traffic management initiatives, and special activity for the week.
                    Lessons learned from previous web-conferences are also discussed here. It is also
                    expected that local stakeholders are represented by their overlying ANSPs.

6.12            States with mature domestic ATFM system such as the USA and Australia also conduct
regular web-/teleconferences with their stakeholders at least once daily, with post-operations
discussion an important part of the conferences.

6.13           As ATFM/CDM Planning Web-/Teleconferences is a common practice in ATFM
operations, they should be leveraged as a channel by which post-operations analysis results can be
shared and discussed with stakeholders. Lessons learned should be developed following these discussions
and shared with all units involved in the ATFM process.

ATFM Operations Analysis                                                                             41
Recommended Framework, v1.0
7. Case Studies
Case Study 1: India – Strategic Airport Slot Allocation Analyses
                                                    Case Study supplied by Airport Authority of India (AAI)
Note:
This case study provides an example of how an ANSP can assess the reliability of flight schedules based
on strategic airport slot allocation process. By assessing various aspects of schedule information, the
ANSP can build a picture of whether strategic airport slot allocation provides high enough reliability for
demand prediction or if an improvement in the process is required.

Introduction

7.1              In India today, the primary method for strategic (long-term) demand-capacity balancing
is the Airport Slot Coordination process, with fixed numbers of arrival and departure slots assigned to
scheduled aircraft operating into and out of India’s most congested airports. Slot allocations are made
on a bi-annual basis, with the capacity numbers adjusted for seasonal weather and traffic conditions.
The slots equitably distribute restricted airport capacities to aircraft operators, ensuring appropriate
distribution of traffic while catering also to non-scheduled aircraft at these major airports. The program
includes aircraft operating into and out of Delhi (VIDP), Mumbai (VABB), and Bengaluru (VOBL) airports,
which accounts for roughly 60% of the Indian air traffic volume.

7.2               AAI has observed high traffic volumes with significant airborne holdings and delays
during peak traffic periods, with non-adherence to strategic slots – in particular early arrivals – being a
major contributing factor. The ATM directorate of AAI has decided to combat the issue through in-depth
analysis trials of strategic slot adherence between October – November 2018. As part of the trial, data
from 22,606 flights in October 2018 and 23,772 flights in November 2018 were analyzed. Key results and
lessons learned from the trials are provided in this Case Study.

Analysis Results

        Analysis 1 – Comparison between planned and scheduled departures
7.3             In this analysis, a flight’s planned departure (EOBT, per filed flight plan) is compared
against its scheduled departure (SOBT, per allocated departure slot). “Early filing” denotes a flight
whose flight plan shows EOBT is >5 minutes earlier than SOBT. Figure 5 shows result from the trial.




ATFM Operations Analysis                                                                                42
Recommended Framework, v1.0
                                Figure 5 - Case Study 1 - SOBT/EOBT Comparison

7.4             From the figure, India’s major airports saw an average of 6% of scheduled flights filing
early departures in October 2018. In November 2018, the average was reduced to 3.2%.

       Analysis 2 – Comparison between actual pushback and scheduled departures
7.5             In this analysis, a flight’s actual pushback/start up (AOBT, per data from the airport) is
compared against its scheduled departure (SOBT, per allocated departure slot). “Early pushback”
denotes a flight whose actual pushback/start-up is >5 minutes earlier than SOBT. Figure 6 shows result
from the trial.




                                Figure 6 - Case Study 1 - AOBT/SOBT Comparison

7.6            From the figure, India’s major airports saw an average of 23.5% of scheduled flights
pushing back early in October 2018. In November 2018, the average was reduced to 19.8%.

        Analysis 3 – Comparison between actual take-off times and scheduled departures
7.7               In this analysis, a flight’s actual take-off times (ATOT, per data from the airport) is
compared against its scheduled departure (SOBT, per allocated departure slot). “Early departure”
denotes a flight whose actual take-off time is earlier than SOBT which would mean the flight had pushed
back far earlier than its allocated slot. Figure 7 shows result from the trial.


ATFM Operations Analysis                                                                             43
Recommended Framework, v1.0
                                Figure 7 - Case Study 1 - ATOT/SOBT Comparison

7.8              From the figure, India’s major airports saw an average of 8.7% of scheduled flights take-
off early (pushing back really early) in October 2018. In November 2018, the average was significantly
reduced to 3.2%.

       Analysis 4 – Comparison between actual in-block times and scheduled arrivals
7.9             In this analysis, a flight’s actual in-block time (AOBT, per data from the airport) is
compared against its scheduled arrival (SIBT, per allocated arrival slot). “Early arrival” denotes a flight
whose actual in-block (gate arrival) time is >15 minutes earlier than SIBT. Figure 8 shows result from the
trial.




                                 Figure 8 - Case Study 1 - AIBT/SIBT Comparison

7.10              From the figure, India’s major airports saw an average of 22.2% of scheduled flights
arriving at their gates early in October 2018. In November 2018, the average was reduced but remained
significant at 15.3%.

        Analysis 5 – Block time comparison
7.11             In this analysis, a flight’s actual gate-to-gate block time (AOBT – AIBT) is compared
against its scheduled block time (SOBT – SIBT) per allocated slots. The analysis was conducted for flights
departing from Delhi (VIDP) to other major airports in India (Mumbai, Hyderabad, Chennai, Kolkata,


ATFM Operations Analysis                                                                              44
Recommended Framework, v1.0
Bengaluru). Figure 9 shows tabulated result.




                                 Figure 9 - Case Study 1 - Block Time Comparison

7.12           From the figure, flights from Delhi to Mumbai consistently achieved shorter block times
than their approved slots during all hours of the days. Flights from Delhi to Chennai saw similar result
with the exception of flights between 1800 – 2100 UTC. On the contrary, flights from Delhi to
Hyderabad, Kolkata, and Bengaluru consistently saw longer block times than their slots.

Key Findings and Forward Plan

7.13             Non-adherence to strategic airport slots can be one of the major contributing factors to
overloading traffic at the busiest airports in India. The issue is particularly problematic when flights
arrive significantly earlier than their assigned times, as they could create airport ground congestion. The
airport ground congestion could, consequently, create knock-on effect on air traffic operations in the
terminal area.

7.14              Through the analyses of airport slot adherence, AAI was able to identify major causes
for early arrivals as follows:
                   Airspace users filing flight plans with earlier EOBTs than their approved slots;
                   Flights departing – both pushing back and taking off – earlier than their SOBTs; and
                   Airspace users requested and were approved inflated block times (SIBT – SOBT), i.e.
                       receiving slots that would result in significantly larger block times that necessary.
                           o This was particularly pronounced in the case of Delhi – Mumbai sector.

7.15           AAI plans to further the work by conducting a detailed year-long analysis and looking
toward separation between taxi and flight times in the slot allocation process. AAI also plans to raise
awareness on airport slot adherence focusing on SIBT at destination airports and EOBT/CTOT at
departure airports.




ATFM Operations Analysis                                                                               45
Recommended Framework, v1.0
Lessons Learned

        Lesson 1 – Data-driven analytical process can identify true underlying demand-capacity problem.
7.16            Through the analysis trial, AAI has uncovered a key problem causing over-demand issues
at major airports in India; that strategic airport slot adherence was a major issue. By looking through the
right data, AAI was able to identify the specific issues – e.g. early departures and inflated block
schedules – and developed plan to strategically address them accordingly.

7.17              Without careful analysis of the data, AAI could have attempted to address the issue with
pre-tactical / tactical ATFM measures only to find that they would not solve the issue at the root cause.
AAI could also have mistakenly attributed ATFM delays to ATM resource capacity problem, when in
reality part of the issue could be inappropriate scheduling practice. Only through data-driven analytical
process did the issue become visible.

        Lesson 2 – Awareness campaign with stakeholders can improve situations even without undue
        punitive measures.
7.18             One finding of note from AAI’s analysis trial is the marked improvements in slot
adherence in November 2018 relative to October 2018. The reason for this due, in large part, to an
awareness campaign which was a by-product of the analysis trial. By conducting the trial, AAI
demonstrated to stakeholders – particularly airspace users – that strategic airport slot adherence was an
important issue and non-adherence could cause over-demand problem. Through a simple data-
gathering exercise without unnecessary punitive actions, AAI found that airspace users actually started
to focus on their slot adherence and thereby reducing the level of problems seen previously.




ATFM Operations Analysis                                                                              46
Recommended Framework, v1.0
Case Study 2: Thailand – Airport Ground Delay Program Analyses
                                                                        Case Study supplied by AEROTHAI

Note:
This case study provides an example of how an ANSP analyzes their Ground Delay Program using the
framework discussed in Section 5. The case also provides a practical example of how the analyses can be
presented for use in further discussion with stakeholders.

Introduction

7.19             Thailand saw the establishment of Bangkok ATFM Unit (Bangkok ATFMU) since 2007,
with the advent of the Bay of Bengal Cooperative ATFM System (BOBCAT) for westbound flights from
Southeast Asia and South Asia into the European continent over Afghanistan airspace. After nearly 10
years of experience providing ATFM service in another region, AEROTHAI and several partner ANSPs in
Asia-Pacific came together to build a distributed ATFM network for the region. It was during this time –
2014 – that Bangkok ATFMU began to expand its ATFM service to include the management of traffic
demand within Bangkok FIR using mainly Ground Delay Programs (GDPs). The focus of the service is on
regulating traffic demand into and over the most constrained and congested airports and airspace
sectors over the country.

7.20            As is recommended by ICAO Doc 9971, post-operations analysis is slowly becoming a
cornerstone process in Thailand’s ATFM operations as AEROTHAI ATFM team and Bangkok ATFMU gain
more experience. Using the aforementioned 3-Part Story approach to post-operations analysis, this case
study provides an example of how AEROTHAI ATFM team conducts an analysis of GDPs activated for
constrained airports throughout 2018.

2018 Airport Ground Delay Programs: Example Analyses

7.21             In characterizing and assessing Ground Delay Programs, AEROTHAI adopts the 3-Part
Story approach as recommended in Section 5 of the framework. The approach ensures that ATFM
operational data are analyzed in terms of GDP impact, CTOT compliance, and the program’s
effectiveness in delivering the right level of traffic demand while minimizing airborne delays. The results
are tabulated and visualized using various plots and charts as shown below.

        Year-in-Review: Overview Dashboard

7.22             Error! Reference source not found. shows an overview dashboard summarizing results
from all GDPs conducted for constrained / congested arrival airports in Thailand throughout 2018. The
left side of the dashboard (Overview Table, Causes of GDP, and Constrained Location) provides Impact
Analysis of the programs, giving a quick look on the number of GDPs conducted and ATFM delays
distributed along with their reasons in the form of delay codes. In the top-right corner (CTOT Compliance



ATFM Operations Analysis                                                                              47
Recommended Framework, v1.0
Overview), overview of CTOT compliance is shown, categorized by the participation levels1 of the
impacted departure airports. In the bottom-right corner (Average Delay Comparison), a comparative
view of airborne and ground delays is shown, categorized by the flights’ CTOT compliance status. This is
one view of GDP Program Effectiveness, under an assumption that flights operating in compliant to
CTOTs will have less airborne delays than their non-compliant counterparts.




                                       Figure 10 - Case Study 2 - Overview Dashboard

7.23               Few things can be readily observed from the overview figure, namely:
                    The leading cause for airport GDPs in Thailand in 2018 was aerodrome capacity
                      issue, represented by the delay code GA 83. This issue accounted for 39 rounds of
                      GDP during the year;
                    Don Mueang International Airport (VTBD) was the leading arrival airport for which
                      GDPs were activated, accounting for 26 rounds of GDP and impacting 966 arriving
                      flights;
                    Departure airports within Thailand did fairly well in facilitating CTOT compliance,
                      with nearly 80% of departures complying to CTOTs. In contrast, level-3 and level-2
                      airports in the region (see footnote # 1) still had rooms for improvement. Flights
                      from outside the regional agreement, as expected, departed earlier than their
                      CTOTs presumably with no knowledge of the active restrictions; and
                    Flights departing in compliant to CTOTs saw, on average, lower airborne delays than
                      their non-compliant counterparts2.


1
  In the Distributed Multi-Nodal ATFM Network Project, participating airports are grouped by their abilities to comply with
CTOTs distributed by ATFMUs in the network. MN-3 and MN-2 are departure airports which are expected to have established
local procedure to facilitate departing flights in compliant to CTOTs. MN-1 are member airports that are still without such
procedure, while Out-of-Area are airports not involved in the project.
2
  Note that, in this context, airborne delay is inferred from the comparison between flight’s actual flying time (ALDT – ATOT)
and its planned flight time (total EET field in the flight plan). AEROTHAI ATS units have no policy on giving airborne punitive
action against non-compliant flights.

ATFM Operations Analysis                                                                                                 48
Recommended Framework, v1.0
        Program-Specific Review: Program Dashboard

7.24            Figure 11 shows a dashboard summarizing result from a specific GDP on a given day.
The dashboard follows the same structure as the Overview Dashboard. The right side of the dashboard
shows the Impact Analysis in terms of ATFM delays statistics and impacted departure airports. The top-
right corner shows Compliance Assessment, categorized by the participation levels of departure
airports. The bottom-right corner shows a different view of GDP Program Effectiveness, displaying the
comparison between regulated traffic count (based on CLDTs) and actual traffic count (based on ALDTs).
The assumption is that, with GDP properly activated and CTOTs complied to, the actual traffic level
should closely match the regulated one.




                                  Figure 11 - Case Study 2 - Program Dashboard

7.25            Few things can be readily observed from the figure for this particular GDP, activated on
8 January 2018 for arrivals into VTBD, namely:
                 31 flights were affected by the program. Most of them came from domestic airports
                    with a few flights from international airports in the network and a small number of
                    flights from airports outside the area;
                 Domestic departure airports, as expected, contributed satisfactorily with 95% CTOT
                    compliance rate; and
                 The actual traffic arriving at VTBD almost perfectly matched the expected traffic
                    level based on the activated GDP, with the exception of 2 flights arriving earlier than
                    expected. This could presumably be due to the 2 early departures from airport
                    outside the ATFM network area, though investigation was needed to verify the
                    assumption.




ATFM Operations Analysis                                                                              49
Recommended Framework, v1.0
7.26             Overall; the effectiveness of this particular GDP, in terms of its ability to regulate traffic
level during the constrained period, is satisfactory; possibly thanks to high CTOT compliance rate
particularly from domestic traffic.

        Airline Dashboard and Departure Airport Dashboard

7.27            In addition to the big picture views through Overview and Program dashboards, airline-
specific and departure airport-specific dashboards are also provided; shown in Figure 12 and Figure 13.




                                    Figure 12 - Case Study 2 - Airline Dashboard




                             Figure 13 - Case Study 2 - Departure Aerodrome Dashboard




ATFM Operations Analysis                                                                                  50
Recommended Framework, v1.0
7.28            In these dashboards, emphasis is placed on the impact to the specific airline and
departure airport and the responsibility borne by the stakeholder in supporting the programs. Impact
Analysis, in terms of ATFM delay statistics, are shown on the right side. Compliance Assessment, in
terms of CTOT compliance over the different days GDPs were activated, is shown on the bottom-right
corner.

7.29             Another indicator under the Compliance Assessment category is also introduced here:
the compliance to advance flight plan submission requirement. Per AIP Thailand section ENR 1.9, flights
subjected to ATFM measures are required to have their flight plans submitted no less than 3 hours
before their EOBT. This is seen as primarily a responsibility of the airline, but the responsibility may also
be shared by the ATS unit operating the departure airport. As such, the compliance rates for advanced
flight planning requirement are also shown in the Airline and Departure Aerodrome dashboards on the
top-right corner. In general, over the years, most airlines have been able to comply with the 3-hour
requirement without much trouble.

        Accessing and Using the Dashboards

7.30             Insofar as possible, the post-operations analysis dashboards such as shown above are
made accessible by stakeholders online. For the above examples, they can be accessed – and interacted
with – at http://bit.ly/2018gdpairport.

7.31            These dashboards are normally presented during performance review discussions and
seminars with stakeholders and other member ANSPs in the ATFM network. Having easily accessible
visualizations has proven useful for AEROTHAI ATFM team in identifying areas of concerns and in
engaging with stakeholders to continually improve the operations.

Stakeholder Engagement

7.32              In addition to processing data and producing post-operations analysis dashboards,
stakeholder engagement is also an important process built into Thailand’s ATFM operations. AEROTHAI
ATFM team has been, since the expansion of ATFM service in the country, attempting to conduct regular
performance reviews through periodic seminars with local stakeholders. The aim has been to conduct
such seminars on a quarterly basis, adjusted for availabilities and necessity as appropriate. During these
seminars, all stakeholders – flight crews, dispatchers, ground service agents, airport operators, as well as
internal staffs from the ATS units and the ATFMU – are included in the conversation. The outcome is a
forum where experiences are shared, and ideas are exchanged openly between partners in the entire
ATFM process.




ATFM Operations Analysis                                                                                51
Recommended Framework, v1.0
7.33              Additional to the regular (approx. quarterly) seminars, the team also makes regular
visits to flight operations centers of major local air carriers. The purpose of the visits is to enable open,
honest, and in-depth conversation about ATFM in a more relaxed environment compared to large
seminars. These visits have allowed smaller air carriers to voice their feedback and challenges directly to
the team. On many occasions, these visits have brought out issues that may have been overlooked
during the seminars.

Lessons Learned

        Lesson 1 – Designing data collection and post-operations analysis capabilities as part of the
        ATFM software specification will be very helpful.
7.34             The sample GDP analysis dashboard shown in this case study was made possible
through extensive post-event data extraction from ATFM system database, a static process carried out
periodically. The extraction and processing of data into dashboard is not yet, at the time of this writing,
automated and integrated into the ATFM system. Consequently, data-driven post-operations analysis do
not always get carried out immediately following an operation. Instead, comprehensive analysis – such
as a year-long dashboard shown above – is used during quarterly reviews with stakeholders. The lack of
automated and integrated post-operation analysis capability is one area of improvement facing
AEROTHAI at the moment.

7.35             A key lesson from this predicament is the usefulness of having extensive analytical
capability automated and integrated into the ATFM system. To do so, the capability should be included
during the initial software specification and design phase. While the system may become more complex
and the design more difficult, having the integrated post-operations analysis feature would really help
ANSPs learn from and improve their ATFM operations in a timely manner.

        Lesson 2 – Periodic performance reviews with stakeholders should be an integral part of ATFM
        operations.
7.36              Through the regular seminars, the team has been able to obtain valuable feedback from
front-end users and to attempt to improve the system and procedure regularly. The team has also been
able to clarify, and sometimes dispel, any misunderstanding in the procedure and misconceptions in the
ATFM philosophy with key stakeholders.

7.37            Through the operation center visits, the team has not only been able to obtain feedback
and discuss overlooked issues but also to understand – first-hand – the challenges and limitations faced
by many air carriers. The visits were opportunities for the team to empathize with the counterparts and
to learn to be mindful of stakeholders when designing operational procedures.

7.38          Both the regular seminars and operation center visits epitomizes stakeholder
engagement in Thailand, a process believed to be integral to the success of ATFM operations in the
country.


ATFM Operations Analysis                                                                                52
Recommended Framework, v1.0
Case Study 3: Australia – Network Post Operational Performance
                                                                                  Case Study supplied by Airservices

Note:
This case study provides an example from an ANSP with a comprehensive CDM process where the
analysis results are used in different layers of stakeholder consultation. By establishing a reporting and
consultation process – daily, monthly, and quarterly – the ANSP has established a close relationship with
their stakeholders and has been able to continually improve their ATFM process over the years.

Australian Operating Environment

7.39            The Australian ATM Network comprises of a single state with operations managed by
Airservices Australia. The airspace assigned by ICAO to Australia covers 11% of the earth’s surface,
divided into two Flight Information Regions (FIRs) controlled from two major centers as shown in Figure
14. The Melbourne FIR (YMMM) covers the southern part of the Australian continent and large parts of
the Indian and South Pacific Oceans, the Brisbane FIR (YBBB) covers the northern part of the Australian
continent and half of the Tasman Sea (with the other half administered by New Zealand).




                             Figure 14 - Australian Flight Densities, FIRs & Top Airports

7.40             Due to vast travel distances and population concentration to only a few metropolitan
areas, air transportation is the major form of inter-city travel in Australia, with approximately 1.4 million
flights and 156 million passengers per year. While these numbers are a lot lower compared to the US
and Europe, relative to Australia’s smaller population, it represents an air transportation system roughly
twice the size per capita.

7.41              Despite its large airspace, the Australian ATM Network has a unique characteristic in
that a relatively high proportion of air traffic occurs between just three major airports within a relatively
short flying time: Sydney (YSSY), Melbourne (YMML) and Brisbane (YBBN), often referred to as “The
Triangle”. Approximately 30% of the flights from these three airports departs towards the other two.

ATFM Operations Analysis                                                                                       53
Recommended Framework, v1.0
These three city pairs are in the top 15 busiest city pairs in the world (by aircraft movement), with a
flight taking off between Sydney and Melbourne (and vice versa) approximately every 10 minutes during
peak hours.

7.42             Due to runway configurations and constraints on airport layout, Melbourne and Sydney
airports in particular can experience large fluctuations in declared capacity. Even in visual conditions,
wind can have a significant impact on capacity dropping the maximum arrival rates from 50 and 40 for
dual runway operations, to 23 and 22 for single runway operations at Sydney and Melbourne
respectively, essentially halving the available capacity.

7.43             Demand and capacity challenges in the Australian ATM Network therefore generally
originate from capacity reductions at one or more of three major airports, which quickly propagate to
the other two and affect the flow of traffic in and out of The Triangle. The Airservices Network
Coordination Centre (NCC) in Canberra manages the day-to-day demand for Australia’s airspace and
airports in close collaboration with all relevant stakeholders.

Collaborative Decision Making and ATFM Process Review

7.44             Australia has a mature implementation of Collaborative Decision Making (CDM)
between ATC and the major domestic airlines to mitigate the impact of disruptions across the Australian
ATM Network. In principle, Air Traffic Flow Management (ATFM) measures are preferred that provide a
high level of predictability and enable airline collaboration such as a Ground Delay Program (GDP).

7.45          CDM in Australia is governed through a set of Business Rules agreed and accepted by all
CDM stakeholders and is used to supplement the ATFM process.

7.46             Planning for the ATFM measure – specifically the GDP – occurs the day prior to
operations to provide airlines early notice of any constraints that may be present for the day of
operations through the publication of the ATFM Daily Plan (ADP). This allows the airlines to take actions
to mitigate any likely delays and start informing their passengers prior to them departing for the airport.
To support the ATFM planning process to start the day prior, the Australian ATFM systems works off
schedules in first instance, which get updated by flight plans once filed on the day of operations. The
planning follows a 3-step process:

            1. As the first step in this planning process, airlines upload their confirmed flight schedules
               to ATFM system the day prior to operations to inform of the demand for the following
               day. At most major airports a form of schedule coordination occurs preventing more
               flights from being scheduled than the airport can accept in nominal VMC conditions (e.g.
               seasonal slot allocation through the IATA Slot Coordination scheme).

            2. In the second step, the NCC establishes available capacity through a collaborative
               process with major domestic airlines and the Australian Bureau of Meteorology, in a
               process referred to as Meteorological Collaborative Decision Making (MET-CDM). The
               major aim of the MET-CDM process is to assess any weather risks that may affect
               capacity of the ATM Network and mitigate operational impact. As previously explained,


ATFM Operations Analysis                                                                              54
Recommended Framework, v1.0
                capacity at Australia’s major airports is very sensitive to weather. With flights
                concentrated in The Triangle, adverse weather at one of the airports can ripple through
                the ATM Network and impact airline businesses.

            3. In the third step, if deemed required, the NCC publishes a GDP – with CTOTs assigned to
               flights based on the uploaded confirmed schedule – to balance the demand with the
               available capacity, as established in the first two steps.

7.47               By publishing the GDP the day prior, airlines have the opportunity to optimize their fleet
operations and inform passengers of changed departure times the night before they travel. Sometimes
the available capacity can be reduced to such an extent that airlines make the decision to cancel some
of their flights. Flight cancellations are careful commercial and logistic considerations by airlines, outside
of the control and influence of Airservices. Often airlines will try to combine flights on the busy triangle
to get passengers to their destination with as little disruption as possible. Airlines will use the slots they
‘freed-up’ to reduce delays on the remainder of their fleet by swapping them into the vacant slots.

7.48            Through the application of CDM, all stakeholders have a buy-in to the decisions made to
mitigate against disruptions. Being too conservative can mean under-delivery due to high GDP delays
and potential cancellations, while being too optimistic leads to over-delivery of demand causing
airborne delays and potential disruptive GDP revisions as en-route sectors and tactical arrivals
management (AMAN) cannot safely deal with the high demand.

Post Operational Performance Reporting

7.49            Post Operational Performance Reporting is integral to the success of CDM, and goes
beyond performance metrics as it should also include the analysis of operational decision making. Each
stakeholder has a part to play in the CDM process, with a predictable ATM Network the responsibility of
all stakeholders. Post Operational Performance Reporting is as much about providing insight into the
performance of the ATM Network as about driving a culture of accountability by every stakeholder in
the CDM process.

7.50             The Australian implementation of the Post Operational Performance framework is
therefore focussed on regular engagements between the ANSP, major airlines and major airports at
various levels across the different organisations (e.g. operational and management).

7.51           Within the framework, the comparison of the operational plan outcome is key. The
associated reporting products revolve around answering the following type of questions:

                    What was planned, and what actually occurred?
                    What assumptions were made as part of the plan and did these assumptions
                     eventuate?
                    What elements do we have control of, and to what degree was this control
                     exercised to influence the level of service delivery and operational outcome
                     achieved?
                    Were customer (airline) expectations met?


ATFM Operations Analysis                                                                                 55
Recommended Framework, v1.0
       Daily Post Operational Performance Conference Call

7.52             Each (business) day a Post Operational Performance conference call is held by the NCC
in collaboration with Airservices Network Performance & Analysis unit. During this call the performance
of the network of the day past is being assessed.

7.53            The discussion is based on an automatically generated Daily Post Operational
Performance Report (example provided in Figure 15). The report contains data on achieved throughput,
how close the planned ATFM rates matched the tactical arrival manager rates, ground delay, airborne
delay and effectiveness of any GDP that may have been in place (compliance and accuracy in terms of
how close actual arrival demand presented compared to what was planned in the GDP). Besides metrics,
the report contains commentary by air traffic control staff to clarify operational decision making.

7.54             After the conference call, the final Daily Post Operational Performance Report is
distributed to all CDM stakeholders (ANSP, airlines and airports).




                              Figure 15 - Daily Post Operational Performance Report

       Weekly Network Operations Debrief Conference Call and “Deep-Dives”

7.55          Each week a Weekly Network Operations Debrief conference call is organized by the
NCC with CDM stakeholders to (1) discuss ATM Network performance of the week past, (2) discuss
upcoming events that may impact the ATM Network (e.g. airport works, air shows, etc.) for the week
ahead.

7.56           The Weekly Network Operations Debrief conference call is attended by operational staff
and middle management. This representation greatly enhances the understanding of each other’s
operational environment and constraints. For example, airline operational representatives can ask


ATFM Operations Analysis                                                                          56
Recommended Framework, v1.0
questions on why certain decisions were being made, which can be immediately answered by air traffic
control representatives. Involvement of middle management allows for the identification of matters
that require a more strategic resolution.

7.57             Discussion on performance of the week past often focusses on operational decision
making, and where CDM processes may have broken down. If warranted, CDM stakeholders can request
a “deep-dive” referred to as Post Operational Performance Report (POPR) where the Network
Performance & Analysis unit will work together with internal and external CDM stakeholders to perform
an investigative analysis into a certain event focusing on data and stakeholder interviews.

7.58            A POPR generally makes recommendations on how decision making can be improved to
deliver better outcomes when similar events may present again sometime in the future. The outcomes
of a POPR are presented during the following Weekly Network Operations Debrief conference call.

       Monthly Network Performance Report

7.59           A Monthly Network Performance Report is produced focusing on key metrics and trends
in performance of the ATM Network and made publicly available on the Airservices website. Relevant
POPRs for the months are included as an appendix to the report.

7.60            The current Monthly Network Performance Report has a strong focus on demand and
airborne delays, but metrics are under development to provide a holistic overview of Network
performance. These include demand (traffic growth and mix), capacity (weather impacts and utilized
airport modes), effectiveness on ATFM measures utilized (compliance, accuracy) and outcomes (delays
experienced by airspace users and capacity utilization), see Figure 16.




                              Figure 16 - Overview of Network Performance Metrics

7.61          The Monthly Network Performance Report also considers strategic aspect of ATM
Network performance. For example, trends are identified where demand is consistently exceeding the


ATFM Operations Analysis                                                                        57
Recommended Framework, v1.0
available capacity. Figure 17 shows the count of instances where scheduled demand exceeded available
capacity (as influenced by weather) by weekday and hour for December 2019. From this plot it can be
seen that during the 0700 local hour (morning peak), scheduled demand for YSSY, YMML and YBBN
often cannot be accommodated by the available capacity (result of weather impact). A GDP is therefore
required in most cases. This data helps to inform whether the use or amendment of more strategic
measures as airport slot management may be more appropriate than pre-tactical ATFM.




                   Figure 17 - Excess Demand for December 2019 for YSSY, YMML, YBBN and YPPH

        Quarterly Operational Service Enhancement Forums

7.62          Airservices hosts four times per year a face-to-face Operational Service Enhancement
forum attended by management representatives from Airservices, airlines and airports.

7.63              The purpose of the face-to-face conferences is to discuss strategic matter and
improvement initiatives, some of which identified as part of the Weekly Network Operations Debrief
conference call. Typical agenda items include: Quarterly Network Performance, update on airport and
airspace initiatives, review of CDM Business Rules and CDM continuous improvement activities.

Lessons Learned

        Lesson 1 – Post Operational Performance Review is as much about providing insight into the
        performance of the ATM Network as it is about driving a culture of accountability by every
        stakeholder in the CDM process.

7.64            As the introduction of CDM is a cultural change, so is the introduction of Post
Operational Performance Review. Review of operational decision making can be regarded by individual
stakeholders as a ‘blame game’. It is essential all stakeholders understand review is about getting ‘better

ATFM Operations Analysis                                                                              58
Recommended Framework, v1.0
not bitter’; such understanding builds upon individual relationships build between stakeholders through
structured regular engagement at all levels (operational and management).

       Lesson 2 – Identify the fundamental aspects of your local CDM implementation and tailor your
       Post Operational Performance Framework accordingly

7.65              Each operational environment is different due to different traffic patterns, different
airlines, and different cultures. What works for one environment does not necessarily work for another
environment.

7.66          Work with your stakeholders to identify their key interests and develop your Post
Operational Performance Framework accordingly in terms of reporting products and engagement
activities.

       Lesson 3 – Involve CDM stakeholders other than the ANSP in Post Operational Performance
       Reviews

7.67            Each CDM stakeholder views performance through a different lens. Especially when
specific operational events are being reviewed, performing a full 360-degree review that takes into
account the perspective of all stakeholders, is essential to identify improvements that drive better
service outcomes to service the customer (airline).

7.68             Allow CDM stakeholders to identify key performance metrics to be reported on. Where
an ANSP might measure their performance on reducing airborne delays at the destination airport, an
airline might be more interested in on-time-performance at the departure airport.


                                                 ---o---




ATFM Operations Analysis                                                                           59
Recommended Framework, v1.0

