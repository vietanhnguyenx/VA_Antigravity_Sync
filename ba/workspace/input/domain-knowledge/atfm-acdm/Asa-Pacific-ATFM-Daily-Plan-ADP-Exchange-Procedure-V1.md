---
source_url: ""
document_type: "Domain Knowledge — trích xuất PDF (pdftotext -layout)"
extracted: "2026-06-16"
status: "Raw extract — chưa biên tập"
---

# Asa-Pacific-ATFM-Daily-Plan-ADP-Exchange-Procedure-V1

> **Nguồn (PDF):** 
> **Lưu ý:** Trích tự động bằng `pdftotext -layout` (qua WSL /mnt) — trung thực nội dung, có thể lệch định dạng bảng/cột. Đối chiếu PDF gốc khi cần.

---
                            Asia/Pacific
             ATFM Daily Plan (ADP) Exchange Procedure
       To facilitate network-wide situational awareness, ATFM Units (ATFMUs) in the
Asia/Pacific region shall exchange the ATFM Daily Plans (ADPs) in accordance with the
following procedure:

1. ADP Content and Format

        The ADP is a document outlining situations and possible issues affecting ATC capacities
at various ATM resources within the ATFMU’s area of responsibilities for the upcoming day
(24 hours). It should also include planned and/or expected ATFM measures that will be
activated to manage excessive traffic demand. The purpose of exchanging ADP is to ensure
that all ATFMUs and stakeholders are aware of the situation and can plan their operations
accordingly.

      For the purpose of ADP exchange within Asia/Pacific, the ADP should include, at
minimum, information contained in Appendix A to this procedure.

2. ADP Exchange Protocols

        In the absence of digital information exchange model for ADP, ATFMUs shall distribute
their active ADP as a PDF file attached to an email disseminated to all other ATFMUs in the
network with the following specifications:

-   E-Mail Subject:
    ADP_[FIR Name 1][FIR Name 2]…[FIR Name n]_[Effective Date, yyyymmdd]_[Version]

-   PDF File Name:
    ADP_[FIR Name1][FIR Name 2]…[FIR Name n]_[Effective Date, yyyymmdd]_[Version]

-   Example:
       ADP_VTBB_20191122_1
       ADP_YBBBYMMM_20191122_1

where FIR Name refers to the FIR(s) for which the ATFMU is responsible and Effective Date
refers to the date on which information in the ADP applies.

       The use of common email subject and file name will enable ADP recipients to develop
or procure a system to automatically process the ADPs if necessary.

        In the future, when digital information exchange model for ADP is developed and
SWIM infrastructure is implemented, the exchange of ADPs may be moved to a SWIM-based
service accordingly.

3. ADP Exchange Frequency


                                                                                             1
       ATFMUs with capability to activate ATFM measure should disseminate ADPs at least
once (1x) per day regardless of whether an ATFM measure is required.

4. Dissemination of ADP to Local Stakeholders

       To facilitate common situational awareness among stakeholders (airspace users,
airport operators, ground handling agencies, etc.), it is the responsibility of ATFMUs to
determine whether the ADPs received should be further disseminated to local
stakeholders. In general, whenever an ATFM measure is expected to be active, stakeholders
with expected impact should be provided with the information.

5. Contact Information for ADP Exchange

       The contact information for ADP exchange is included in Asia/Pacific ADP Exchange
Contact List. This includes, where available, direct ATFM unit or other ATS unit contact details
of respective States/Administrations. The Contact List is maintained by ICAO Asia/Pacific
Regional Office separately, and States/Administrations wishing to update the contact details
can send email to ICAO APAC office at apac@icao.int.




                                                                                              2
                                                                            Appendix A


                      Asia-Pacific ATFM Network
                    ATFM Daily Plan (ADP) Template
ADP Template

ORIGINATOR                    ICAO 4 LETTER CODE [E.G. VTBB]
DATE / TIME OF ISSUANCE       DD MMM YYYY / HHMM UTC [E.G. 14 OCT 2024 / 0800 UTC]
VERSION                       1

                               CONSTRAINTS AND IMPACT
               APPLICABLE PERIOD (UTC)
  LOCATION                                    DESCRIPTION            CAPACITY IMPACT
                 START         END
   AD or FIR    DD MMM      DD MMM
    ICAO 4        YYYY         YYYY            [FREE TEXT]              [FREE TEXT]
 LETTER CODE     HHMM         HHMM
                 14 OCT       15 OCT
    VTBS          2024         2024         TFC CONGESTION               AAR = 32
                  2300         1100
                 15 OCT       15 OCT
    VTBB
                  2024         2024         TFC CONGESTION                 (Nil)
  SECTOR 1S
                  0200         1100


                                    ATFM MEASURE
               APPLICABLE PERIOD (UTC)
  LOCATION                                              DESCRIPTION
                 START         END
   AD or FIR    DD MMM      DD MMM
    ICAO 4        YYYY        YYYY                       [FREE TEXT]
 LETTER CODE     HHMM        HHMM
                 14 OCT      15 OCT
    VTBS          2024        2024                 GDP FOR FLT DEST VTBS
                  2300        1100
                 15 OCT      15 OCT       GDP FOR FLT INTO 1S DEST VTBD, VTBS, VTBU
    VTBB
                  2024        2024                  DURING CONGESTION
  SECTOR 1S
                  0200        1100                 (FLOW RATE: MINIT = 4)



                                 OTHER INFORMATION

ANY OTHER PERTINENT INFORMATION AS FREE TEXT
E.G. ATFMU CONTACT INFORMATION




                                                                                      A-1
                                                                               Appendix A


ADP Field Description

 Field                  Format              Description
 Header
 Originator             ICAO 4-letter FIR   FIR code representing the originator of the
                        code                ADP
 Date/Time of           DD MMM YYYY /       Date and time, in UTC, of the issuance of the
 Issuance               HH MM UTC           ADP
 Version                Integer             Version number of the ADP, starting from 1
 Constraints and Impact
 Location               ICAO 4-letter FIR   Location of the constrained ATM resource,
                        and                 which could be an aerodrome, a waypoint or
                        sector/waypoint     sector of an airspace, or an ATS route or
                        name or             route segment
                        aerodrome code
 Applicable Period      DD MMM YYYY         Date and time, in UTC, corresponding to the
                        HHMM                anticipated start and end of the constraint
 Description            Free Text           Description of the constraint at the
                                            associated location and time period
 Capacity Impact        Free Text           Anticipated impact to the capacity; this can
                                            be in the form of capacity number or flow
                                            rate or percent reduction.
                                            Note: this can be left blank if the issue is
                                            traffic congestion with no capacity shortfall
 ATFM Measure
 Location               ICAO 4-letter FIR   Location of the ATM resource for which the
                        and                 ATFM measure is activated, which could be
                        sector/waypoint     an aerodrome, a waypoint or sector of an
                        name or             airspace, or an ATS route or route segment
                        aerodrome code
 Applicable Period      DD MMM YYYY         Date and time, in UTC, corresponding to the
                        HHMM                anticipated start and end of the ATFM
                                            measure
 Description            Free Text           Description of the ATFM measure to be
                                            implemented, with affected traffic flows
                                            specified
 Other Information
 Other Information      Free Text           Any other pertinent information that will be
                                            helpful for readers of the ADP, e.g. contact
                                            information of the originating ATFMU/ANSP




                                                                                      A-2

