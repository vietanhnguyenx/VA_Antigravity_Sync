---
source_url: ""
document_type: "Domain Knowledge — trích xuất PDF (pdftotext -layout)"
extracted: "2026-06-16"
status: "Raw extract — chưa biên tập"
---

# Guidance-for-Data-Link-Performance-Improvement-for-Aircraft-Operators

> **Nguồn (PDF):** 
> **Lưu ý:** Trích tự động bằng `pdftotext -layout` (qua WSL /mnt) — trung thực nội dung, có thể lệch định dạng bảng/cột. Đối chiếu PDF gốc khi cần.

---
                                                                                 RASMAG/24−WP/03
                                                                                      Attachment A

     GUIDANCE FOR DATA LINK PERFORMANCE IMPROVEMENT FOR AIRCRAFT
                               OPERATORS

1.      INTRODUCTION

1.1         The following information was provided by the Central Reporting Agency (CRA) to the
Ninth Meeting of the FANS Interoperability Team – Asia (FIT-Asia/9, Makassar, Indonesia, 01 to 05
July 2019). Over the course of investigating many problem reports, the CRA had found that certain
performance-related problems had common causes and therefore common solutions.

1.2         The information provided describes those problems and their solutions, to assist in
improving aircraft operator and other stakeholder awareness of potential options to improve datalink
performance.

1.3          The CRA noted that not all aircraft operators experience all problems described in this
paper and therefore that not all solutions apply to all aircraft operators. The CRA recommended that the
Performance-Based Communications and Surveillance (PBCS) monitoring and problem reporting
processes continues to operate, in order to identify performance-related problems, whether as discrete
events (such as a failed CPDLC transfer of authority) or as part of periodic PBCS monitoring.

2.      GUIDANCE

2.1         VHF-to-SATCOM Transitions: Transitions from using VHF to using SATCOM,
especially when they occur repeatedly in a short period of time, reduce datalink performance because
the ACARS protocols are generally designed to minimize cost (by persistently attempting to use less-
costly VHF), not maximize performance.

             2.1.1       Solution – Disable VHF datalink just prior to entering oceanic airspace:
             Implement flight crew procedures to disable VHF datalink (usually by placing the VHF
             radio used for VHF datalink into voice mode) just prior to entering oceanic airspace in
             order to proactively force SATCOM use. (Conversely, enable VHF datalink when exiting
             oceanic airspace.)
             2.1.2       Solution – Implement more precise VHF region definitions: In avionics that
             offer the capability to prefer specified subnetworks in defined geographic regions,
             implement more precise VHF region definitions that exclude areas of the world with only
             intermittent VHF subnetwork coverage in order to force SATCOM use in those areas.
             2.1.3      Solution – Implement ARINC 618 RAT1 timer: Upgrade ACARS router
             avionics (CMU or equivalent) software to include the new ARINC 618 RAT1 timer when
             it becomes available. This timer is intended to improve performance for FANS downlink
             messages during VHF-to-SATCOM transitions by additionally attempting to send a
             message via SATCOM when attempts to send it via VHF have not been successful for 60
             seconds (such as when exiting land-based VHF coverage).
2.2          HF datalink – next-on-busy: Airbus ATSU and Rockwell Collins CMU-900 avionics may
implement a feature called “next-on-busy” by which those avionics send a new downlink message via
HF datalink if SATCOM is busy sending a previous downlink, instead of waiting for SATCOM to
finish sending the previous downlink. This is a good design idea in theory, but in practice it reduces
datalink performance because the avionics can actually deliver the new downlink more quickly if they
wait for SATCOM to finish sending the previous downlink.

             2.2.1       Solution: Work with Airbus and Rockwell Collins to disable the next-on-busy
             feature. (For the Rockwell Collins CMU-900 with recent software, this can be done with
             a database update.)

                                                 A-1
RASMAG/24−WP/03
Attachment A

2.3        HF datalink – general: HF datalink performance has not been demonstrated to meet the
RCP240 and RSP180 specifications, although for various reasons the avionics may send FANS
downlink messages via HF datalink.

            2.3.1     Solution – Manually prevent HF datalink use: Prevent HF datalink use
            manually by implementing flight crew procedures to disable HF datalink.
            2.3.2      Solution – Automatically prevent HF datalink use: Prevent HF datalink use
            automatically with capable avionics (for example, by deselecting HF datalink as an
            allowed subnetwork for FANS downlink messages in the 777 DCMF AMI or 787 CMF
            AMI).
2.4         “Ack-and-toss”: ACARS router (CMU or equivalent) avionics may for various reasons
acknowledge receipt of a FANS uplink message but then fail to deliver the message to the avionics that
host the FANS applications. This is colloquially known as “ack-and toss” behavior.

            2.4.1      Solution – Rockwell Collins CMU-900 software problem: For the 747-8 ,
            Boeing has certified core software -202 that fixes this problem. For the 737 and 767,
            Rockwell Collins is certifying core software -014 that fixes this problem. For the 747-400,
            757, and MD-11, Boeing and Rockwell Collins are investigating certification
            opportunities.
            2.4.2       Solution – Airbus A320/A330/A340 software problem: This problem occurs
            only in CSB/CLR7.x software versions. Airbus developed CSB/CLR9 software that fixes
            this problem.
            2.4.3       Solution – ARINC 618 false-positive duplicate uplink block identifier (UBI)
            determination: For the 777, Boeing is developing AIMS-2 BPV17B software that fixes
            this problem. For the 787, Boeing developed CMF BPV4 software that fixed this problem.
            Similar software upgrades are or will be available for other affected ACARS router (CMU
            or equivalent) avionics.
2.5            Internetworking: The CRA has observed that some performance problems are caused by
the challenges of effective CSP internetworking when an aircraft operator chooses to use one of the two
global CSPs (meaning ARINC [Rockwell Collins IMS] or SITA [SITAONAIR]) for VHF and the other
global CSP for SATCOM. (The CRA also realizes that some aircraft operators configure their avionics
to first prefer regional DSPs, such as Avicom in Japan.)

            2.5.1       Solution: Use the same global CSP for both VHF and SATCOM.
2.6           Large Pilot Operational Response Time (PORT) values: PORT is one component of Actual
Communications Performance (ACP), the other being Actual Communications Technical Performance
(ACTP). (For an uplink-downlink CPDLC transaction, PORT captures the human portion of the
transaction time and ACTP captures the technical [mainly network] portion of the transaction time.)
Accordingly, large PORT values reduce performance.

            2.6.1       Solution: Implement flight crew procedures to respond to CPDLC messages
            with STANDBY when appropriate; per ICAO Doc 9869, Performance-Based
            Communication and Surveillance (PBCS) Manual, ATS providers should exclude CPDLC
            transactions with STANDBY responses from performance monitoring. ICAO Doc 10037,
            Global Operational Data Link (GOLD) Manual explains when STANDBY responses are
            appropriate:




                                                A-2
                                                                             RASMAG/24−WP/03
                                                                                  Attachment A

                      “The flight crew should respond to CPDLC messages as soon as practical
                      after they are received. For most messages, the flight crew will have adequate
                      time to read and respond within one minute. However, the flight crew should
                      not be pressured to respond without taking adequate time to fully understand
                      the CPDLC message and to satisfy other higher priority operational demands.
                      If additional time is needed, the flight crew should send a RSPD-3 STANDBY
                      response.”

2.7        747-8 and 787 SATCOM problems: 747-8 and 787 aircraft occasionally experience
undiagnosed SATCOM problems that have been shown to reduce performance.

           2.7.1      Solution: Assist Boeing and Rockwell Collins with investigating these
           problems by promptly submitting service requests to Boeing for SATCOM problems and
           by providing any requested information (such as SDU logs).
2.8          Unknown causes: If a performance problem has an unknown cause, then the CRA
recommends submitting a problem report at http://www.fans-cra.com/ so that the CRA and other
involved stakeholders can determine the cause.

                                 ………………………….




                                             A-3

