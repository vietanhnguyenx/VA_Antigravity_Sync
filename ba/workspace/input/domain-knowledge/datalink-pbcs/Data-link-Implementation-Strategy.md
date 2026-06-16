---
source_url: ""
document_type: "Domain Knowledge — trích xuất PDF (pdftotext -layout)"
extracted: "2026-06-16"
status: "Raw extract — chưa biên tập"
---

# Data-link-Implementation-Strategy

> **Nguồn (PDF):** 
> **Lưu ý:** Trích tự động bằng `pdftotext -layout` (qua WSL /mnt) — trung thực nội dung, có thể lệch định dạng bảng/cột. Đối chiếu PDF gốc khi cần.

---
                            Data link Implementation Strategy

Develop and define a Data link Concept of Operations
   Where will CPDLC be used (i.e. what airspace within the FIR will CPDLC be used in?)
   Is the implementation a “trial”, or permanent? If it is a trial, it should not extend longer than is
    necessary, and have a defined start and finish date. Will the trial be H24?

   Will CPDLC be used for primary communications, or as a backup to HF (or VHF)?

   What services will CPDLC be used for?
       Vertical clearances?
       Route clearances?
       Weather deviations?
       Issuing SSR codes?
       Frequency transfers?
       Everything?

   What services will ADS-C be used for?
       Situational awareness?
       Separation service?
       Conformance monitoring?
       Replacement for voice position reporting?

   What separation standards will be supported by ADS-C
       10 minutes?
       50NM?
       30NM?
       Establishing lateral separation?


Procedures
   Will the procedures as outlined in the GOLD be adopted?
        If so, consider liaising with the GOLD Editors to include the ATS Unit in the list of data
            link users

   Define logon procedures – these will be affected by:
        Where is CPDLC to be used (see Concept of Operations)
        Will the use of PDC by CPDLC be implemented? (This affects the timing of logons for
            departing aircraft)

   Develop specific CPDLC procedures in accordance with local requirements. Airlines will expect
    these to be in accordance with existing procedures in other regions

   Develop specific ADS-C procedures in accordance with local requirements.

   Be aware of voice phraseologies associated with the use of ADS-C and CPDLC
                                                 -2-

Documentation
   Publish data link information in AIP, including:
        logon codes;
        logon procedures;
        required flight crew procedures
        Standardised free text message elements in use;
        Position reporting procedures;
        Are there any specific CPDLC message elements not supported?

   Controller documents
        Develop and publish ATC procedures


Data Adaptation
The ATS Units’ adaptation data needs to be defined in order to support the use of data link described
in the Concept of Operations. Some specific data to consider include:

   ACARS address will need to be defined

   Are CPDLC Connections to be established automatically or manually?
         Manual ==> ATC controls who uses CPDLC and when
         Automatic ==> reduced ATC workload, but also means it is more difficult to control
          when CPDLC is used by flight crew

   Will data link transfers be effected to adjoining units?
        Yes ==> Need to define ACARS addresses of surrounding ATS units

   Will data link transfers be a manual or automatic process?
        Manual ==> Controller training/scanning issue
        Automatic ==> Data needs to be defined (NDA & Address Forwarding)

   Will CPDLC termination be automatic or manual?
        Manual ==> Controller training/scanning issue
        Automatic ==> Data needs to be defined (Auto EOS).

   Controller’s CPDLC interface – define the layout (the capability to do this will vary depending on
    the ATM system):
         Message categories
         Message elements within each message category. Will the entire CPDLC message set be
            available?
         Determine required standardised free text message elements
         Define standardised free text messages in AIP

   ADS-C data
       Define ADS-C periodic reporting rates – ensure that they are “reasonable” (i.e. not
          excessive), and are appropriate for the services being applied;
       Define parameters for ADS-C event contracts

   Adaptation data must be ‘controlled’
        Changes to data adaptation must be properly authorized;
        Prevent proliferation of non-standard standardised free text message elements
                                                    -3-

Coordination
   Airlines
         To assist in a smooth transition to data link operations, the major data link operators
             throughout the region should be contacted directly
         Are LOAs currently held with airlines? If so, do they need to be updated?
         Determine appropriate points of contact with airlines to rapidly address data link related
             problems with flight crews

   Adjoining data link capable ATSUs
        Are data link transfers from adjoining units for inbound aircraft required?
        Letters Of Agreement may need to be updated
        Determine appropriate points of contact with adjoining units to rapidly resolve data link
           transfer problems

   Regulator
        Is liaison with, or approval from, the regulator required?
        Is regulator approval required for other State aircraft to operate data link in the airspace?

   HF operators
        Need to be aware of how the implementation of data link will affect them;
        Are SELCAL checks still required?
        Will controllers issue CPDLC frequency transfers. If the frequency transfer is to an HF
           frequency, do controllers have access to up to date HF frequencies?

Controller training
   All aspects of ADS-C and CPDLC must be covered in controller training
         Standardisation in these areas is extremely important

Licencing
   Will data link be included in the existing controller licence, or an addition to it?
        Does the licence structure in use by the ATS Unit need to be updated?

   Update any controller written assessment questions to include data link related questions

   Update check controller procedures to include data link during the assessment

Data link Service Provider
   Determine preferred data link service provider

Data link performance monitoring
   Technical performance
        Routine performance data analysis
        Decoding CPDLC ACARS data
        Decoding ADS-C ACARS data
        Data link problem reporting

   Controller performance
        CPDLC routine sampling?
                                                  -4-


International Forums
   Establish contacts with other data link user groups
         There are lots of lessons to be learned (GOLD contains a number of them)

   Establish contact with one of the established Central Reporting Agencies (CRA) to report data
    link problems. It is important to report them, as some problems are very easy to solve!

Safety monitoring
Ensure that a means of reporting data link related occurrences is available, and that there are staff who
are trained to investigate data link related occurrences



                                              — END —

