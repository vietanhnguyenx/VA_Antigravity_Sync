---
source_url: ""
document_type: "Domain Knowledge — trích xuất PDF (pdftotext -layout)"
extracted: "2026-06-16"
status: "Raw extract — chưa biên tập"
---

# Guidance-Material-for-End-to-End-Safety-and-Performance-Monitoring-of-ATS-Data-Link-Systems-November-2024

> **Nguồn (PDF):** 
> **Lưu ý:** Trích tự động bằng `pdftotext -layout` (qua WSL /mnt) — trung thực nội dung, có thể lệch định dạng bảng/cột. Đối chiếu PDF gốc khi cần.

---
 INTERNATIONAL CIVIL AVIATION ORGANIZATION

             ASIA AND PACIFIC OFFICE




              GUIDANCE MATERIAL FOR

END-TO-END SAFETY AND PERFORMANCE MONITORING OF

   AIR TRAFFIC SERVICE (ATS) DATA LINK SYSTEMS

            IN THE ASIA/PACIFIC REGION



                   Version 5.0 – November 2024




          Issued by the ICAO Asia and Pacific Office, Bangkok
                                         TABLE OF CONTENTS




1.   Background ........................................................................................................................1
2.   Requirements for Safety and Performance Monitoring......................................................2
3.   Purpose of Guidance Material ............................................................................................4
4.   Establishment and Operation of an Interoperability Team and CRA .................................4
5.   Interoperability Teams........................................................................................................5
6.   Central Reporting Agencies ...............................................................................................6
7.   Working Principles for Central Reporting Agencies..........................................................8
     Appendix A:            Methodology for Monitoring AIDC ........................................................12
     Appendix B:            CRA Tasks and Resource Requirements.................................................14
     Appendix C:            System Performance Criteria...................................................................15
 1.      Background

1.1.            The Asia Pacific Airspace Safety Monitoring (APASM) Task Force established by the
Asia Pacific Air Navigation Planning Implementation Regional Group (APANPIRG) during 2001 noted
that requirements for monitoring aircraft height-keeping performance and the safety of reduced vertical
separation minimum (RVSM) operations had been more comprehensively developed than for other Air
Traffic Management (ATM) services, such as reduced horizontal separation based on required navigation
performance (RNP) and the monitoring of ATS data link systems.

1.2.           For example, to assist RVSM operations a handbook with detailed guidance on the
requirements for establishing and operating Regional Monitoring Agencies (RMA) was developed by the
ICAO Separation and Airspace Safety Panel (SASP). There was no comparable document under
development by ICAO for ATS data link applications and so the APASM Task Force developed draft
guidance material covering safety and performance monitoring for ATS data link applications.

1.3.           The experience gained by the Informal Pacific ATC Coordinating Group (IPACG) and the
Informal South Pacific ATS Coordinating Group (ISPACG) FANS Interoperability Teams (FITs) and the
supporting Central Reporting Agencies (CRAs) to monitor automatic dependent surveillance - contract
(ADS-C) and controller pilot data link communication (CPDLC) performance for both aircraft and ground
systems was used as a resource from which to develop monitoring guidance material.

1.4.            From 2004, the APASM Task Force was succeeded by the Regional Airspace Safety
Monitoring Advisory Group (RASMAG) of APANPIRG, which decided to adopt and extend the APASM
material to become the standard guidance material for end-to-end safety and performance monitoring of
ATS data link systems in the Asia/Pacific region. Following significant development of the material,
APANPIRG/16 (2005) adopted the Guidance Material for the End-to-End Monitoring of ATS Data Link
Systems in the Asia/Pacific Region under the terms of Conclusion 16/20.

1.5.            Within the remainder of the Asia/Pacific Region, the Bay of Bengal and South East Asia
ATS Coordination Groups are following the lead of IPACG and ISPACG and have created FANS-1/A
implementation teams and data link CRAs to accomplish this activity. These implementation teams also
perform the interoperability activities which will continue after the implementation of CPDLC and ADS-
C is complete. This guidance material focuses on interoperability issues, both prior to and following
implementation of a data link system.

1.6.             During 2008, agreement was reached between Asia/Pacific and North Atlantic data link
interoperability/implementation groups that the global harmonization of data link monitoring activities
was desirable. Accordingly, the APANPIRG, NAT SPG and ICAO Secretariat would coordinate to the
extent possible in order to develop proposals to implement required monitoring infrastructure and
arrangements that would be global and cost effective.

1.7.             The regional Performance-Based Communications and Surveillance (PBCS) monitoring
program requires continuous performance monitoring of data link operations utilizing separation standards
where Required Communications Performance (RCP) or Required Surveillance Performance (RSP)
specifications are required under the provisions of ICAO Annex 11 Air Traffic Services and Doc 4444
Procedures for Air Navigation Services – Air Traffic Management (PANS-ATM). In accordance with the
supporting guidance provided in ICAO Doc 9869 PBCS Manual, the Air Navigation Service Provider
(ANSP) should perform an analysis of actual communication performance (ACP) and actual surveillance
performance (ASP) at an interval suitable to verify system performance, and to enable continuous
performance improvement. The established lines of communication between airspace safety monitoring
organisations and their respective States are the most effective and efficient means for transmission of
problem or non-compliance reports between the ANSP detecting/reporting the problem or non-compliance
and the State of Operator/Registry of the aircraft concerned.




       Version 5.0 – November 2024                                                            Page 1
2 Requirements for Safety and Performance Monitoring
2.1.       Annex 11, at paragraph 2.29, states:

                “Any significant safety-related change to the ATC system, including the implementation
                of a reduced separation minimum or a new procedure, shall only be effected after a safety
                assessment has demonstrated that an acceptable level of safety will be met and users have
                been consulted. When appropriate, the responsible authority shall ensure that adequate
                provision is made for post- implementation monitoring to verify that the defined level of
                safety continues to be met.”

2.2.             The Manual of Air Traffic Services Data Link Applications (Doc 9694) describes ATS
data link applications as including DLIC, ADS, CPDLC, DFIS, AIDC and ADS-B. ATS data link
applications, such as ADS-C, CPDLC and ATS interfacility data communication (AIDC), are increasingly
being used in support reduced horizontal separation minima. It is therefore necessary to apply the safety
monitoring requirements of Annex 11 to these data link services.

                Note: For the purposes of this guidance material, ‘data link systems’ (or applications)
                generally refer to CPDLC, ADS-C and/or AIDC.

2.3.             Data link applications comprise both a technical and an operational element. The
guidelines in this document - which apply only to the technical element - propose a structure and
methodology for monitoring the technical end-to-end safety performance of air-ground and ground-air
data link services. The operational aspects of data link monitoring – such as reviewing the correct use of
CPDLC message elements - are carried out by the appropriate safety monitoring agency.

2.4.           Ground-ground data link systems supporting applications such as AIDC are essentially
simpler and more direct than air-ground systems and monitoring can be achieved directly between the
concerned ATSUs. However, it should be noted that States have a responsibility to ensure that monitoring
of ground-ground data link systems is carried out in support of the implementation of reduced separation
minima. Monitoring of ground-ground AIDC performance is outlined in Appendix A.

2.5.            The requirement for on-going monitoring after implementation of a data link system is
based on several factors, including:

                 a)      degradation of performance with time,

                 b)      increasing traffic levels, and

                 c)      changes to equipment and/or procedures which may occur from time to time.

2.6.             On-going monitoring also permits the detection of errors that may have been introduced
by a third party (e.g. a communications service provider).

2.7.             The use of ADS-B to support separation and the introduction of the Aeronautical
Telecommunication Network (ATN) will bring significant changes to operational systems that will also
require the establishment of monitoring programmes.

2.8.            ICAO Doc. 9869 Performance-based Communication and Surveillance Manual offers the
reader guidance on the establishment of a PBCS monitoring program, with detailed guidance in Appendix
D for compilation and handling of the data to support monitoring. Significant revisions are being
coordinated to provide clarification in Appendix D for Edition 3. Additional guidance can be found in
NAT Doc 011, 1st Ed. Amdt. 2, located on the ICAO website - ICAO APAC eDocuments>>ATM>>
Safety monitoring.

2.9.              The NAT Doc011 focused on the reporting and filtering of under-performing airframes as
well as guidance for State Oversight Authorities. The guidance is divided into three phases and reliant on
the positive participation of the aircraft operators in accordance with the PBCS Global Charter:
        Version 5.0 – November 2024                                                              Page 2
                Phase 1 - ATSP: This phase covers initial monitoring and reporting by the Air Traffic
                Service Provider (ATSP) at a local level. The ATSP is responsible for the collection,
                analysis and, if possible, classification of under-performance data as well as the
                transmission of that data, in the agreed format, to the Regional Monitoring Agency
                (RMA). (Refer to NAT Doc 011 Chapter 2).
                Phase 2 - RMA: This phase captures the administration of the regional monitoring
                requirements and the mechanism to achieve global reporting. The RMA is responsible for
                the collection and collation of the data reported by ATSPs for transmission to, either the
                States within their region of responsibility, or to other RMAs for transmission to States
                within their own regions of responsibility. (Refer to NAT Doc 011 Chapter 3).
                Phase 3 - State Oversight Authority: This phase covers the State Oversight Authority’s
                role in the management of reports of under-performance. The State Oversight Authority
                is responsible for the oversight of all aircraft operators registered in their respective states
                and ensuring that the performance of their airframes meets the required standards. (Refer
                to NAT Doc 011 Chapter 4).

                 PBCS Non-Compliance Reporting

2.10.              The En-route Monitoring Agency (EMA) or Regional Monitoring Agency (RMA) with
responsibility for the airspace associated with the ANSP reporting a non-compliance would notify the
EMA/RMA that has responsibility for the State of Operator/Registry associated with the aircraft/fleet
observed with non-compliant data link performance. The EMA/RMA receiving the notification would then
provide the report to the State of Operator/Registry of the aircraft/fleet observed with non-compliant data
link performance. It is possible that all EMAs/RMAs may have a role associated with Step 3 of Figure 1
to assist in initial contact due to the familiarity of State POC with RMAs.




             Figure 1: Communication flow for reports of non-compliance with PBCS performance
             requirements (Source: RASMAG24 WP/19 - RMA Contribution to the PBCS Monitoring
             Program and Documentation Development, Bangkok, Thailand, 09-12 July 2019)

2.11.           The process of PBCS non-compliance reporting was adopted by APANPIRG/34 and the
various actions by the stakeholders are detailed below. The PBCS non-compliance report submission
(including Nil Occurrence reports) and handling processes by various stakeholders is shown in Figure 2.
The guidance noted by APANPIRG/34 in Conclusion RASMAG/28-4 Removal of EMA handbook
Appendix A and Guidance for PBCS Non-Compliance Reporting refers.




       Version 5.0 – November 2024                                                                   Page 3
        Figure 2 - PBCS non-compliance submission flow chart

                  EMA/RMA actions

2.12.            En-route Monitoring Agency (EMA) handbook

                 item: k) to coordinate/establish appropriate contacts for PBCS via RMA POCS for PBCS
                 non-compliance, compile PBCS non-compliance reports received from States each
                 month and, where necessary, propose APANPIRG ATM Deficiencies, for lack of
                 reporting; and

                  ANSP action items

2.13.            PBCS Action List for ANSPs found in ICAO APAC e Documents

                 Paragraph 1.15 –Submit PBCS non-compliance report to designated EMA/RMA by 20th
                 of every month (if falls on a weekend then the next available working day), e.g.
                 Submission of PBCS non-compliance report Jan by 20th Feb.

                 Paragraph 1.16 –Submission of Nil report is required.

 3.      Purpose of Guidance Material

 3.1              The purpose of this guidance material is to:
                  a)       Provide a set of working principles common to all Asia/Pacific States
                           Implementing ATS data link systems;
                  b)       Provide detailed guidance on the requirements for establishing and operating
                           a FANS-1/A implementation/interoperability team (FIT);
                  c)       Provide detailed guidance on the requirements for establishing and operating
                           a Central Reporting Agency (CRA);
                  d)       Promote a standardized approach for implementation and monitoring within
                           the Asia/Pacific Region; and
                  e)       Promote interchange of information among different Regions to support
                           common operational monitoring procedures.
 4.      Establishment and Operation of an Implementation/Interoperability Team and CRA

 4.1          Recognising the safety oversight responsibilities necessary to support the implementation
 and continued safe use of ATS data link systems, the following standards apply to any organization

        Version 5.0 – November 2024                                                          Page 4
intending to fill the role of an implementation/interoperability team:
                 a) The organisation must receive a u t h o r i t y to act as an implementation/
                    interoperability team as the result of a decision by a State, a group of States or a
                    regional planning group, or by regional agreement.
                 b) States should appoint a CRA that has the required tools and personnel with the
                    technical skills and experience to carry out the CRA functions.
                 c) States should ensure that the CRA is adequately funded to carry out its required
                    functions.
                 d) States are urged to ensure that formal service arrangements are made with an
                    APANPIRG-recognized, competent Central Reporting Agency for the submission
                    and analysis of data link problem reports. APANPIRG Conclusion 34/8 - Formal
                    Service Arrangements with CRA refers.
5.      Interoperability Teams

5.1                ATS data link functionality exists in several different domains (e.g. aircraft, satellite,
ground network, air traffic service units and human factors) and these elements must be successfully
integrated across all domains. Airborne and ground equipment from many different vendors, as well
as the sub-systems of several different communication networks, must inter-operate successfully to
provide the required end-to-end system performance. In addition, standardised procedures must be
coordinated among many different airlines and States to provide the desired operational performance.
Technical a n d o p e r a t i o n a l elements m u s t then combine to allow the various applications to
demonstrate mature and stable performance. It is only when this has been achieved that benefits can
start being realized.

5.2               A team approach to interoperability is essential to the success of any ATS data link
implementation, an important lesson learned by ISPACG, whose members were the first to implement
CNS/ATM applications using FANS-1/A systems. Stakeholders had worked closely together during
the initial development and subsequent certification of FANS-1/A. However, even though a problem-
reporting system was in place when FANS-1/A operations commenced, many problems went
unresolved. Consequently, it was not possible in the short term to adopt the new operational procedures
that would provide the expected benefits of higher traffic capacity and more economic routes.

5.3               An interoperability team (the ‘FIT’) was formed and tasked to address both technical
and operational issues and to assist in ensuring that benefits would result. Because daily attention and
occasional significant research would be required, ISPACG realized that a traditional industry team
approach would not be effective. To address these concerns, the FIT created a dedicated sub-team,
the CRA, to perform the daily monitoring, coordination, testing and investigation of the problem reports
submitted by the team. This approach aligns with that taken for RVSM implementations where
specialist supporting groups provide height keeping monitoring services.

5.4             Although the monitoring process described above was developed for FANS-1/A based
CPDLC and ADS-C applications, it applies equally to AIDC and to ATN-based ATS applications. The
latter was validated during the Preliminary EUROCONTROL Test of Air/ground data Link (PETAL)
implementation of ATN-based ATS data link services in Maastricht ACC.

                 Role of the Interoperability Team

5.5              The FANS Interoperability Team (FIT) shall be responsible for overseeing system
configuration and the end-to-end monitoring process of datalink systems to ensure they are
implemented and continue to meet performance, safety, and interoperability requirements within the
Asian Region.

5.6            The specific tasks of an interoperability team are to: [specific tasks of an interoperability
team updated from FIT-Asia/13 – WP18]
      Version 5.0 – November 2024                                                                  Page 5
               Implementation

                   a) support the implementation and operational benefits of CPDLC and ADS-C;

               Reporting and problem resolution processes

                   b) establish a problem reporting system;
                   c) review problem reports, identify trends and determine appropriate resolution;
                   d) develop interim operational procedures to mitigate the effects of problems until
                      resolution;
                   e) monitor the progress of problem resolution;
                   f) prepare summaries of problems encountered and their operational implications;

               System performance and monitoring processes

                   g) establish a performance monitoring system;
                   h) assess system performance based on information from the CRA, and reported by
                      States;
                   i) coordinate system testing and trials;
                   j) identify accountability for each element of the end-to-end system;
                   k) develop, document and implement a quality assurance plan that will provide a
                      stable system;
                   l) ensure that such configurations are maintained by all stakeholders;

               New procedures

                   m) coordinate testing in support of implementation of enhanced operational
                      procedures

               Reporting
                   n) oversee the reporting of safety-related issues to the appropriate State or regulatory
                      authorities for action;
                   o) provide reports to relevant ATM coordinating groups;
                   p) coordinate the collation and analysis of aggregated regional data link performance
                      data; and
                   q) report to RASMAG.
                Interoperability Team Members

5.7            The principal members of an interoperability team are the major stakeholders of the sub-
systems that must interoperate to achieve the desired system performance and end-to-end operation. In
the case of ATS data link systems, the major stakeholders are aircraft operators, air navigation services
providers (ANSPs) and communication services providers (CSPs).             Other stakeholders such as
international organizations, and airframe and avionics manufacturers also play an important role and
should be invited by the major stakeholders to contribute their expertise.

6.      Central Reporting Agencies

6.1                Work must be conducted on a daily basis for an interoperability team to achieve its
important goals of problem resolution, system performance assurance, and planning and testing of
operations that will enable benefits. A dedicated sub-team, the CRA, is required to do the daily
monitoring, coordination, testing and problem research tasks for the interoperability team. Appendix C
      Version 5.0 – November 2024                                                             Page 6
shows a table of CRA tasks and the associated resource requirements.

6.2               A CRA should be established in order to determine the safety performance of the
ADS-C and CPDLC data link systems before the implementation of reduced separation minima in a
particular area, and it should remain active throughout the early stages of implementation. However, as
the performance of the systems stabilises to a satisfactory level, it should be possible to reduce the
number of CRAs in the region by combining responsibility for different areas.

6.3             The functions of a CRA are:

                a)       To develop and administer problem report processes;

                b)       To maintain a database of problem reports;

                c)       To investigate and organise submitted problem reports;

                d)       To coordinate and test the implementation of new procedures resulting from
                         ATS data link systems for a given region;

                e)       To administer and monitor an informal end-to-end configuration process;

                f)       To manage data confidentiality agreements as required;

                g)       To identify trends; and

                h)       To provide regular reports to the interoperability team.

                CRA Resource Requirements

6.4                 To be effective, the CRA must have dedicated staff and adequate tools. Staffing
requirements will depend on the complexity of the region being monitored. There are several factors that
affect regional complexity from an ATS monitoring standpoint such as dimensions of the airspace,
variety in operating procedures, number of airlines, number of airborne equipment variants, number of
ANSPs, number of ground equipment variants and number of CSPs.

6.5                  The CRA must be able to simulate an ATS ground station operational capability to
the extent of exercising all combinations and ranges of CPDLC uplinks and ADS-C reports. The CRA
must also have access to airborne equipment: a test bench is adequate, though engineering simulators
that can be connected to either the ARINC or SITA communication network can offer additional
capability for problem solving. In support of the data link audit analysis task, the CRA must have
software that can decode CSP audit data and produce usable reports. Without these tools it is virtually
impossible for a CRA to investigate submitted problem reports.

6.6                 Coordination is an important component of the CRA’s function. In the pursuit of
problem resolution, action item resolution, monitoring and testing, many issues arise that require
coordination among the various stakeholders. The CRA has a primary responsibility to provide this
coordination function a s delegated by the implementation/interoperability team. Coordination between
CRAs is also important, particularly to expand the information database on problems and trends;
there may be a need for CRA coordination within the region and with CRAs in other regions. An
incident may appear to be an isolated case, but the collation of similar reports by a number of CRAs
might indicate an area that needs more detailed examination.




      Version 5.0 – November 2024                                                             Page 7
7.      Working Principles for Central Reporting Agencies

7.1             The working principles in this guidance material result from the combined experience
of the North Atlantic Technology and Interoperability Group (NAT TIG), ISPACG FIT, IPACG FIT,
and the ATN implementation in Maastricht ACC.

                Confidentiality Agreements

7.2              Confidentiality of information is an established principle for problem reporting, and
so reports must be de-identified before being made accessible to other agencies. However, it is necessary
for the CRA to retain the identity of the original reports so that problem resolution and follow-up
action can be taken.

7.3                The CRA must initiate and maintain confidentiality agreements with each entity
providing problem reports.

                Problem Identification and Resolution

7.4                 The problem identification and resolution process, as it applies to an individual
problem, consists of a data collection phase, followed by problem analysis and coordination with
affected parties to secure a resolution, and recommendation of interim procedures to mitigate the
problem in some instances. This is shown in the diagram below (Doc 9869 - PBCS manual 2nd Ed.).




      Version 5.0 – November 2024                                                              Page 8
7.5              The problem identification task begins with receipt of a report from a stakeholder,
usually an operator, ANSP or CSP. If the person reporting the problem has used the problem reporting
form provided in the appropriate regional manual, then data collection can begin. If not, additional
data may have to be requested from the reporter.

7.6              The data collection phase consists of obtaining message logs from the appropriate
parties, which will depend on which service providers were being used and the operator service
contracts in place at the time. Today, this usually means obtaining logs for the appropriate period
from the CSPs involved. In the future, with ATN development, additional providers will become
involved and airborne recordings as per EUROCAE ED-112 should become available. Usually, a log for
a few hours before and after the event that was reported will suffice but, once the analysis has begun, it
is sometimes necessary to request additional data, perhaps for several days prior to the event if the
problem appears to be an on-going one.

7.7               Additionally, some airplane-specific recordings may be available that may assist in
the data analysis task. These are not always requested initially as doing so would be an unacceptable
imposition on the operators but may occur when the nature of the problem has been clarified enough to
indicate the line of investigation that needs to be pursued. These additional records include:
                •    Aircraft maintenance system logs, and
                •    Built-In Test Equipment data dumps for some airplane systems, and
                •    SATCOM activity logs.

7.8              Logs and printouts from the flight crew and recordings/logs from the ATSUs involved
in the problem may also be necessary. It is important that the organization collecting data for the
analysis task requests all this data in a timely manner, as much of it is subject to limited retention.
7.9             Once the data has been collected, the analysis can begin. For this, it is necessary to be
able to decode all the messages involved, and a tool that can decode every ATS data link message type
used in the region is essential. These messages include:
                •    AFN (ARINC 622), ADS-C and CPDLC (RTCA DO-258A/EUROCAE ED-
                     100A) in a region operating FANS-1/A;
                •    Context Management, ADS-C and CPDLC applications (ICAO Doc 9705 and
                     RTCA DO-280/ED-110) in a region using ATN; and
                •    FIS or ARINC 623 messages used in the region.

7.10          The analysis of the decoded messages requires a thorough understanding of the complete
message traffic, including:
                •    Media management messages;
                •    Relationship of ground-ground and air-ground traffic; and
                •    Message envelope schemes used by the particular data link technology (ACARS,
                     ATN, etc).

7.11             The analyst must also have a good understanding of how the aircraft systems operate
and interact to provide the ATS data link functions, as many reported problems are airplane system
problems.

7.12              This information will enable the analyst to determine a probable cause by working
back from the area where the problem was noticed to where it began. In some cases, this may entail
manual decoding of parts of messages based on the appropriate standard to identify particular encoding
errors. It may also require laboratory testing using the airborne equipment (and sometimes the ground
networks) to reliably assign the problem to a particular cause.

      Version 5.0 – November 2024                                                               Page 9
7.13              Once the problem has been identified, the task of coordination with affected parties
begins. The stakeholder who is assigned responsibility for fixing the problem must be contacted and a
corrective action plan agreed.

7.14              This information (the problem description, the results of the analysis and the plan for
corrective action) is then entered into a database covering data link problems, both in a complete form
to allow continued analysis and monitoring of the corrective action and in a de-identified form for the
information of other stakeholders. These de-identified summaries are reported at the appropriate regional
management forum.

                 Mitigating Procedures

7.15             The CRA’s responsibility does not end with determining the cause of the problem and
identifying a fix. Procedural methods to mitigate the problem may have to be developed because a
considerable period may elapse while a solution is being developed and implemented, particularly if
software updates are to be applied to all aircraft in a fleet. The CRA should identify the need for such
procedures and develop recommendations for implementation by the service providers and operators
involved.

                 Routine Data Link Performance Reporting

7.16             An important part of data link safety performance is the measurement of the end-to-
end performance. This should be carried out prior to implementation of new separation minima, but
should continue regularly to provide assurance that the safety requirements continue to be met. Routine
data link performance assessment by ANSPs, usually carried out monthly, is based on regular
measurement of the continuity and availability.

7.17           For the purpose of standardising the presentation of performance data and to provide
guidance in the steps for analysis and reporting of PBCS performance Reporting templates and guidance
such as Data link performance analysis reporting, and PBCS action list for ANSPs were developed by
FIT/Asia 8 and agreed by RASMAG/28 , Conclusion RASMAG/23-2: PBCS Action List for ANSPs and
Conclusion RASMAG/23-3: Data Link Performance Analysis Reporting Templates refers located on the
ICAO website. ICAO APAC eDocuments>>ATM>> Datalink.

7.18                 The implementation of Required Communication Performance (RCP) and Required
Surveillance Performance (RSP) in a region will assist the regulatory oversight by providing a statement
of the performance requirements for operational communication in support of specific ATS functions.
These requirements are set according to the separation minima being applied, and so may differ within
different areas according to usage. The R e g i o n a l F A N S 1 / A I n t e r o p e r a b i l i t y T e a m s
( F I T ) will use the information supplied by t h e i r ANSPs to produce the Regional Combined PBCS
Monitoring Report against the established data link requirements for their region.

7.19               The Regional Combined PBCS Monitoring Report should be made available to the
RVSM RMA and horizontal plane En-route Monitoring Agency (EMA) for their calculation of
system performance against the minimum values defined in the in PBCS Manual (ICAO Doc 9869
Second Edition). The PBCS system performance criteria and Post-implementation monitoring and
corrective actions are referenced in Appendix C.

7.20          AIDC round trip times may be obtained from the difference between message transmission
and reception of the associated application response (Logical Acknowledgement Message (LAM), or
Logical Rejection Message (LRM)). The success rate is expressed as the percentage of messages that
are delivered to the destination ATSU.




       Version 5.0 – November 2024                                                                  Page 10
7.21              The integrity of AIDC messaging is not normally monitored, although an analysis of
operational data over a long period could reveal undetected errors and their effects. It may also reveal
interoperability issues between ground systems in adjoining ATSUs.

                 Time Standards

7.22               It is critical to the successful measurement and analysis of the data link
performance that all elements of the system use a common time system and that the system time is
maintained within the required tolerance. In accordance with Annexes 2 and 11, all times used in data
link communications must be accurate to within 1 second of UTC.

                 New Procedures and Improved Performance Requirements

7.23             The CRA may recommend new end-to-end data link system performance
requirements, either to accommodate new operational procedures or to take account of recognised
problems.

7.24             The CRA may recommend the testing and implementation of new procedures.




                                        ---------------------------




       Version 5.0 – November 2024                                                            Page 11
                 APPENDIX A METHODOLOGY FOR MONITORING AIDC
1       Introduction

1.1              AIDC plays an important role in ATC coordination and may become a significant
element of ATC in the support of reduced separation minima. The performance of AIDC operations
should therefore be monitored as part of the required monitoring process prior to the implementation
of reduced separation minima.

1.2               AIDC operates essentially over fixed networks and generally has only two or three
involved parties, generally comprising the ATSUs at either end of the network and the network provider.
It is therefore generally unnecessary to develop a FIT-type approach to safety monitoring; instead such
monitoring and problem identification and resolution can be carried out directly by the concerned parties.

1.3               Because fixed networks are used for AIDC, continuous performance monitoring after
the implementation of reduced separation minima is not generally necessary, though annual performance
and availability checks are recommended. Monitoring should also take place after any changes to the
network or the end-user equipment. This will be particularly important during the implementation of
the ATN.


2       AIDC Technical Performance
2.1              Two major criteria for monitoring AIDC technical performance are the achievement
of acceptable delivery times and the reliability of message delivery. Delivery times can best be
measured in terms of the end-to-end round trip time. Reliability is measured as the AIDC message
delivery success rate.


3       End-to-End Round-Trip Time
3.1             The end-to-end round trip message time may be measured as the time difference
between the transmission of an AIDC message and the reception of the corresponding Logical
Acknowledgement Message (LAM) or Logical Rejection Message (LRM). If the originating AIDC
system receives neither a LAM nor an LRM from the receiving system within a specified time limit (a
variable system parameter, typically between 1 and 3 minutes), it will declare a time-out, and the
time-out parameter must be used as the round-trip time.

3.2              All AIDC message requiring a LAM response may be used; measuring results from a
variety of message types should give a more representative overall result.

3.3             Because of variations in circuits used for AIDC, separate measurements should be
made and reported for each ATSU with which AIDC messages are exchanged.

3.4           A large number of measurements of round-trip times should be averaged for performance
reporting.

Note: If it is not practical to measure end-to-end times, one-way trip times may be measured by
comparing the time stamps of the outgoing AIDC message and the received LAM or LRM. The reverse
path may be measured from the time stamps of the received AIDC message and the corresponding
LAM or LRM.




      Version 5.0 – November 2024                                                               Page 12
4       Message Delivery Success Rate

4.1              The Message Delivery Success Rate is expressed as the percentage of messages
successfully delivered to the destination ATSU.

4.2         Unsuccessful delivery is indicated by a time-out due to non-reception of either a
LAM or LRM within a specified time.

Note: For the purpose of this measurement, even if an AIDC message is responded to with an LRM, it
is considered to have been “successfully delivered”.

4.3            The time-out indicates non-delivery of the message (and initiates various actions
within the AIDC system).

                                                             TO
                  Message Delivery Success Rate = 1 −
                                                            TOT

                         Where:
                         TO = number of Time Outs
                         TOT = total number of messages

4.4               A large number of measurements of delivery success rates should be averaged for
performance reporting. Non-typical extensive transit times should also be investigated.


5       Results
5.1          An ANSP should share the results of AIDC performance monitoring with relevant
ANSPs. This will enable problems to be identified and remedial actions agreed upon.


6        Caution
6.1               It is known that there are incompatibilities between some ATS end-systems leading to
a situation in which a satisfactorily received message may not be able to be properly processed. In at
least one case, the receiving system has been programmed to send neither LAM nor LRM in response
to such messages.

6.2                 This will result in a distortion of the average round-trip time and success rate for
the originating end-system.

6.3               It is recommended that ANSPs ensure that all involved parties are aware of such
situations so that affected messages may be excluded from the performance measurement data.



                                      -------------------------




      Version 5.0 – November 2024                                                             Page 13
                 APPENDIX B CRA TASKS AND RESOURCE REQUIREMENTS


                              CRA Task                                  Resource Requirement

                                                                        Legal services
Manage data confidentiality agreements as required.
                                                                        Technical expertise
Develop and administer problem report process:
    •    de-identify all reports,                                       Problem reporting data base,
                                                                        ATS audit decode capability
    •    enter de-identified reports into a database,                   and Airborne test bench as a
    •    keep the identified reports for processing,                    minimum, simulator highly
                                                                        recommended as well as ATS
    •    request audit data from communication service                  simulation capability (CPDLC
         providers,                                                     and ADS-C)
    •    assign responsibility for problem resolution where
         possible,
    •    analyse the data, and
    •    identify trends.

                                                                        Airborne test bench as a
Coordinate and test the implementation of new procedures
                                                                        minimum, simulator capability
                                                                        highly recommended
                                                                        ATS simulation capability
                                                                        (CPDLC and ADS-C)
                                                                        ATS audit decode and report
                                                                        capability.
                                                                        Technical expertise
                                                                        Operational expertise

Administer and monitor an informal end-to-end configuration
                                                                        Technical expertise
process.

Report to the interoperability team.                                    Technical expertise




                                          ---------------------------




        Version 5.0 – November 2024                                                              Page 14
                       APPENDIX C SYSTEM PERFORMANCE CRITERIA
In 2008, the ANC approved a work programme to reconvene the OPLINKP, and tasked the panel to update
the Manual on Required Communication Performance (RCP) (Doc 9869) by taking into account significant
advances by ICAO Member States and regions, in the areas of qualification and monitoring, commercial
service contracts/agreements and operational approvals, thereby also avoiding the imposition of regional or
State-specific criteria on aircraft operators and aircraft/avionics manufacturers.

In 2010, OPLINKP reconvened and agreed to develop an amendment to Doc 9869, renaming it to the
Performance-based Communication and Surveillance (PBCS) Manual, and expanding its scope by
incorporating parts of the GOLD and SVGM, and other material that was developed by the regions since 2007.
The RCP and RSP specifications are described within the performance-based communication and surveillance
(PBCS) framework, thereby providing the means to prescribe the appropriate RCP and RSP specifications and
initially qualify different subsystems, as well as manage operational (end-to-end) system performance in
continued operations.


Refer to ICAO DOC 9869 Appendix B contains a “merged” version of the RCP specifications taken from the
regional guidance material (GOLD and SVGM), Appendix B in each document. These specifications are
considered a requirement when they are prescribed or guidance if applied only to PBCS monitoring
programmes. Appendix C contains a “merged” version of the RSP specifications taken from the regional
guidance material (GOLD and SVGM), Appendix C in each document. These specifications are considered a
requirement when they are prescribed or guidance if applied only to PBCS monitoring programmes. Appendix
D contains the guidance on post-implementation monitoring at ANSP, regional and inter-regional levels, taken
from GOLD. Appendix E contains the guidance on post-implementation monitoring at ANSP, regional and
interregional levels, taken from the SVGM.




                                          -----------------------




       Version 5.0 – November 2024                                                            Page 15

