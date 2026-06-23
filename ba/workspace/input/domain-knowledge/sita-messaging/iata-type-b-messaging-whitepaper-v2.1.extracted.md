**==> picture [91 x 57] intentionally omitted <==**

## **Whitepaper** 

## Type B Messaging Market Study and Insights 

**This whitepaper examines use, benefits, and constraints of Type B messaging, and assesses the need and options for change.** 

## BACKGROUND INFORMATION 

Type B messaging has been used by the civil aviation industry for over six decades. Over that period, despite many messaging technology advances, Type B messaging has endured due to extensive legacy infrastructure, reliability, widespread use, and security. 

Data transfer activity related to airline passenger handling accounts for about 90% of current Type B messaging. In 2019, an estimated 188 million messages were delivered each day. 

Recognizing that airlines currently pay over $1 billion for Type B messaging, IATA initiated a study to determine if more modern messaging techniques might provide a viable means of reducing operating costs. 

## METHODOLOGY 

Several methods were employed to define current issues, industry perceptions and possible solutions. 

## Literature Review 

A review was conducted using publicly available Type B literature seeking information on historical usage, current functionality, and concerns. 

## Surveys 

Surveys were used to capture data from: 

- Airlines. 

- End users (airports, ANSPs,[1] etc.). 

- Supply industry. 

> **1 Air Navigation Service Providers** 

1 Type B Messaging Version 2.1 - 14 June 2024 

The surveys were promulgated via IATA’s regional offices as well as directly to non-member airlines such as low-cost and charter carriers. 70 airlines and 30 ANSPs were invited to submit comments. 

## Interviews with specialists 

Informed by the surveys, follow-up interviews were conducted with selected airlines, suppliers, and end-users. The interviews explored implementation, specific applications, constraints, advantages and disadvantages, and decision making around future evolution. 

## CONTEXT AND DEVELOPMENT 

Since the beginning of the airline industry during the 1920s, data exchange has underpinned systematic operations. Initially, the required communications infrastructure was maintained by individual airlines utilizing teletype for data exchange. Over time this infrastructure evolved into the Aeronautical Fixed Telecommunications Network (AFTN) with leased telephone lines providing the backbone over which the teletype messages were sent. 

In the United States, Aeronautical Radio Incorporated (ARINC), originally owned by airlines and other aviation entities, coordinated aeronautical communication. 

In Europe, 11 airlines established Société Internationale de Télécommunications Aéronautiques (SITA) in 1949. 

## STANDARDIZATION 

As the volume of data exchange grew, it was recognized that a more efficient and standardized communications mechanism was required. This led the International Air Transport Association (IATA) to develop **Type B messages** in the 1960s. This provided a standardized, secure, and structured way of using teletype messages for the exchange of critical data throughout the airline industry. 

Over the decades, several iterations of Type B messages and technologies evolved, driven by business demands and the introduction of updated communications and computer technologies. However, despite the introduction of these new underlying technologies and transport mechanisms, Type B messaging has remained rooted in teletype formatting[2] . 

> **2 Note that “Type B” should refer to the format and structure of the message but is sometimes also used to describe the networking solution.** 

2 Type B Messaging 

Version 2.1 - 14 June 2024 

## EVOLUTION 

For the past few decades, transmission of Type B messaging has predominately used the ARINC and SITA global aeronautical networks. 

In parallel, the AFTN which was developed to facilitate Air Traffic Control (ATC) ground-ground communications, was also used to transport some Type B messages (e.g., flight planning information). 

Alternative means of distribution of Type B messages include: 

- Local and Wide Area Networks (LAN/WAN), either offered on a limited basis commercially or more often owned by an airline and operated to ensure communications with global stations within the airline’s network. 

- Limited satellite communication solutions. 

## SERVICE PROVISION 

There has been some incremental development of the ARINC and SITA service provision model. Providers such as Amadeus use ARINC and SITA technical solutions to build and offer services such as baggage tracking and tracing applications. 

Several iterations of the Type B standard have also enabled additional messages and facilitated the exchange of data between diverse networks and data formats. 

## TECHNICAL IMPLEMENTATION 

The growth in Type B messaging has led to technical infrastructure complexity. 

In the following graphic, multiple terminals indicated by the letters (A, B, C, D, E, F) might indicate different airlines, or they might all be departments within the same airline, each with a solution predicated on their role. 

As shown, this means that each (even within the same airline/airport) might be utilizing different transport types e.g., Internet, IPVPN, and X.25, along with their associated communication protocols such as MATIP, SITATEX, MQ, BATAP, and EMTOX, to facilitate the exchange of type B messages. 

3 Type B Messaging 

Version 2.1 - 14 June 2024 

**==> picture [447 x 288] intentionally omitted <==**

Note that users of ARINC or SITA can communicate with other Type B customers. However, where the link is provided through a third party or internal sub-systems, via custom middleware or utilizing integrated APIs, the routing complexity increases as does the need for translation services between more descriptive formats / protocols and Type B messages. 

Some airlines have also developed more complex infrastructure with multiple internal networks and bespoke applications, often due to past company merger activities. 

None the less, the primary protocols now supporting Type B messaging are TCP/IP MATIP B and MQ. But with the continued use of some legacy solutions, this results in a plethora of combinations and interactions depending on the platform and software used. 

## OPERATING PRINCIPLE 

The system operates on the principle of “store-and-forward”, where messages are sent via a service provider (e.g., ARINC or SITA) and stored, prior to onward forwarding to the addressed recipient(s). Hence, the networks can be considered non-real time as the information is not transmitted directly to the addressee(s) but distributed through an intermediary service. 

This store-and-forward mechanism facilitates guaranteed delivery as confirmation of receipt is provided and re-transmission is possible pending confirmation of conveyance. 

4 Type B Messaging 

Version 2.1 - 14 June 2024 

(Note that some messages related to Air Traffic Control clearances are subject to timeout criteria for flight safety reasons.) 

Given the business and operational criticality of the information transmitted via Type B messages, store-and-forward is an essential feature of the network and can sometimes result in repeated attempts to deliver messages until confirmation of receipt is received. Significant to this is the message header PDM (Possible Duplicate Message) helping to identify messages which may have already been received. 

## MESSAGE LENGTH 

As Type B messages are based on a legacy teletype format, the number and type of text characters that can be used in a message are defined in the standard. 

Message contents, addresses and lines are described within the specifications and limited to capitalized letters, numbers and three symbols as defined by the original teletype character set. Within each message, a maximum of 60 lines of 63 characters is permitted whilst remaining below 4 kilo bytes of data. 

For example, a Movement (MVT) message might read as follows: 

**MVT** Type of message. **BA018/25.GTYPE.LHR** Flight ID (callsign and date), a/c reg, dep. **AD1200 EO1330** Off-block time, Est take off time. **PX183** Number of passengers. **SI DEICING** Reason for delay. 

## SECURITY 

The use of VPNs[3] , message addressing, middleware, and specialized protocols provides a measure of end-to-end security. These, combined with store-and-forward techniques, mean that Type B messaging provides a way of ensuring delivery via trusted servers / switches if they are part of ARINC / SITA networks or private middleware, servers, and applications. 

No specific encryption techniques are applied to the Type B messages. The system relies on the architecture and distribution to ensure only known points / terminals receive the data. 

**3 Virtual Private Networks** 

5 Type B Messaging 

Version 2.1 - 14 June 2024 

Recent cybersecurity initiatives (e.g., NIS2 in the EU) may challenge Type B messaging given potential cyberattack vectors internal to an aviation organization with access to the network. 

## STANDARDIZED ADDRESSING 

Type B messaging follows a format analogous to structured text format files used for internet traffic today – e.g., HTML. The beginning of each Type B message defines the type of message that is being sent – i.e., the application it refers to and then the addressees for the message. 

The format allows for multiple addressees to be specified, based on IATA 7-character codes, so a message can be sent to multiple addresses simultaneously. The limitation here is that the more addressees specified, the less information can be transmitted in the message given the message length restrictions. 

## MESSAGE ORDER AND PRIORITIZATION 

Due to the store-and-forward nature of Type B messaging, the order in which messages are received cannot be guaranteed. This needs to be considered when messages are written as the recipient(s) may not yet have received previous messages or other contextual details to enable a proper understanding of the data contained in the current message. 

It may also be that a batch of messages is received over a short timeframe due to the storeand-forward feature. This, as well as the possibility that previous messages are received later, must be considered within applications developed on Type B messaging such as ticketing systems where time plays a critical role. 

Part of the Type B messaging format is the inclusion of a priority indicator at the beginning of the message that allows the distribution system to determine how the message should be handled. The priority indicator combined with the store-and-forward feature allows the server to prioritize urgent messages. 

## CURRENT TYPE B USAGE 

These include: 

- Flight plan and air traffic control data. 

- Weight and load balancing information (e.g., via ACARS). 

- Passenger booking and reservations data, integrated with Global Distribution Systems (GDS) such as Amadeus, Sabre and Travelport. 

- Baggage tracking and tracing. 

- Advanced Passenger Information (API), e.g., as sent to government customs and immigration agencies. 

6 Type B Messaging 

Version 2.1 - 14 June 2024 

- Cargo tracking and manifests. 

- Aircraft maintenance information. 

- Weather data. 

Passenger booking activities account for most of the Type B use, with a high percentage of such messages being passed via peer-to-peer links with GDS to circumvent high Type B costs. 

**==> picture [356 x 297] intentionally omitted <==**

7 Type B Messaging 

Version 2.1 - 14 June 2024 

## AIRLINE USE AND PERCEIVED VALUE 

Airlines were asked which Type B applications they used. 

**==> picture [428 x 255] intentionally omitted <==**

Flight plan / ATC data includes ACARS messaging, ops control messages, airport messaging, etc. ANSP notifications, ground handling (movement messages), CPDLC[4] 

Value ranking highlighted that flight plan / ATC data is the most valuable Type B application. 

**==> picture [334 x 175] intentionally omitted <==**

The relatively high standard deviations for cargo vs passenger is because the sample included both mainline and cargo carriers, each placing higher value on applications supporting their core business model. 

**4 Controller Pilot Datalink Communications** 

8 Type B Messaging 

Version 2.1 - 14 June 2024 

## NON-AIRLINE USERS OF TYPE B 

ANSPs, airports and ancillary services users indicated that the following are their key Type B applications: 

- ANSPs and airports regularly use flight planning and ATC data (e.g., MVT / Movement messages). 

- Airports also benefit from cargo tracking and manifests. 

   - Airports also noted that the need for real-time monitoring of aircraft behavior is increasing, for example for environmental or noise monitoring. 

      - Whilst this can be done via external monitoring sensors, it would be helpful to receive the aircraft data directly (e.g., over ACARS). 

- Depending on the airport, there may also be Type B messaging passed directly to the Airport Operations Data Base (AODB) or specific ancillary services (e.g., ground-handling, de-icing). 

This user group also confirmed that flight plans, cargo tracking, and aircraft maintenance are the most useful Type B applications. 

**==> picture [519 x 269] intentionally omitted <==**

9 Type B Messaging 

Version 2.1 - 14 June 2024 

## TYPE B SERVICE PROVISION 

Two global service providers 

ARINC and SITA operate the global store-and-forward infrastructure supporting Type B messaging. Each handle ~30 million Type B messages daily. 

AFTN also carries a subset of Type B messages. 

Multiple internet applications integrated with ARINC / SITA 

Several providers have developed “wrap-around” internet-based solutions to meet specific needs, but still rely on ARINC or SITA (or both) for global delivery. Amadeus’ Message Net functions in this manner. 

Multiple LAN / WAN links at organizational or local level 

Larger organizations may develop their own Wide Area Network to route Type B messages without using ARINC or SITA. Examples include Lufthansa and United Airlines. In the latter case, they have developed enhanced format Type B messages to meet their internal business needs. 

Substitutes 

Where interoperability challenges can be overcome, either by assuring all parties have access to a common cloud-based solution or by utilizing a separate VPN or message broker and dedicated servers, more providers are offering Type B alternatives – sending messages via the internet. 

One example is Amadeus, who provides baggage tracking and tracing applications to the industry, claiming substantial savings through improved effectiveness and reduced Type B costs where a dominant airline and airport can equip all stakeholders with the cloud-based solution. 

Another example is EDIfly, who provides dedicated servers to airlines, enabling them to bypass ARINC and SITA for high frequency message pairs (i.e., the EDIfly gateway acts as a broker, routing messages via the internet, and avoiding Type B charges). 

Factors impacting decisions and contracts 

The specifications for distribution of Type B messages originally allowed a plethora of interfaces and exchanges built on RFC 2351 (Mapping of Airline Reservation, Ticketing, and Messaging Traffic over IP (MATIP)) which was originally developed by SITA and was last updated in 2013. 

Over the past decade, transmissions over IP have increased, enabling local distributions to be built which allow communication of Type B messages outside the ARINC / SITA networks or by 

10 Type B Messaging 

Version 2.1 - 14 June 2024 

using AFTN and AMHS[5] (terrestrial or satellite). Sending messages via email or other third-party solutions is also possible (e.g., IBM z / Transaction Processing Facility), but still requires the use of unique IATA addresses. 

These alternatives don’t always match the performance, continuity, and security of the ARINC / SITA networks. 

- The store-and-forward mechanism (and contractual agreements for guaranteed delivery) enables resilience and continuity. 

- The traditional private networks also provide enhanced security and enable traceability of messages. 

Decision making factors can include: 

- the number of applications (use cases) being enabled via Type B messaging. 

- the number of clients served and flexibility of that client base over time. 

- the volume of messages (charging is per million characters). 

- gateway costs (if your airline is on SITA, and many other stakeholders you work with are on ARINC or others, you may require significant gateway infrastructure). 

- the desired technical performance of the communication solution – dependent on the applications being utilized, local context and the individual airline’s operations. 

Perceived cost effectiveness of Type B solutions 

Pricing of Type B varies. For ARINC and SITA the picture is complicated by combining communications services, where Type B forms one part of an overall contract. 

38% of survey respondents were on a scaled model (i.e., by message volume). The remainder were on a fixed price model, often with a pricing cap in place for further negotiation. Note that prices do not drop in line with volumes if a fixed cap is in place, something airlines found out during COVID. 

The figures in the chart below show a spread of value perception of Type B messaging. During interviews, several airlines made it clear that it is very difficult to get a realistic appraisal (costbenefit) given the variety of applications making use of Type B messaging and multiple connections via APIs and servers. Two or three airlines were clear that they felt that Type B messaging was not currently good value. 

> **5 Aeronautical Message Handling System** 

11 Type B Messaging 

Version 2.1 - 14 June 2024 

**==> picture [429 x 223] intentionally omitted <==**

Perhaps clearer is the perception that alternative solutions are more cost effective. This is often because of the assumption that an internet-based solution can function on minimal operational cost once the solution is implemented. It also assumes that the characteristics of Type B can be replicated outside of the solution involving ARINC and SITA. 

## BENEFITS AND CONSTRAINTS 

Summary of the high-level benefits and constraints 

Often the term ‘Type B’ is used in reference to **two separate** but **interrelated functions.** 

## **1. Type B as a universal format** 

Teletype messages to communicate various flight related information. 

## **Benefits:** 

Interoperability: This code is universally recognized across the industry as the standard way of communicating flight information allowing seamless global communication. It synthesizes information into a standardized abbreviated code, making data transfer more efficient. 

## **Constraints:** 

Format limits: With a limit of 60x63 characters combined with an increase in data needs and volume of messages being sent, the format limitations present challenges. 

## **2. Type B as a set of networks** 

A set of connected networks which store and send Type B messages. 

12 Type B Messaging 

Version 2.1 - 14 June 2024 

## **Benefits:** 

Security: the store and forward functionality, error detection and closed networks help to provide a measure of security. 

Reliability: messages are sent and received with a greater reliability than via alternatives, due to acknowledgement of messages and store-and-forward mechanisms. 

Global Reach: Worldwide coverage and interoperable standardized addressing. End-toend traceability provides assurance. 

## **Constraints:** 

Short message format: As “big data” increases the need for interoperable data exchange of rich data, network constraints limit the possibilities. 

Airline perception of benefits and drawbacks 

The surveyed airlines saw the greatest benefits to be availability / reliability, speed of delivery and global reach. 

**==> picture [452 x 261] intentionally omitted <==**

Several drawbacks were identified by survey respondents and during interviews, including cost, message size limitations, security concerns, interoperability issues and difficulty to change. 

13 Type B Messaging 

Version 2.1 - 14 June 2024 

Cost: 

- Total cost of messages 

- Need for dedicated leased line(s) 

Messaging size limitations: 

- Outdated technology (need to move to XML / JSON) 

- Lack of graphics 

Security concerns: 

- Hacking 

- End-to-end assurance 

Interoperability challenges: 

- Recipient may not subscribe to Type B --> leads to a mix of email and Type B 

- Network interconnect "traffic jams" between providers 

Ease of change: 

- Legacy systems provide challenges to defining clear upgrade paths 

- Complexity of change 

- Resourcing 

- Finding the required skillset internally 

Case study 1: When interoperability is broken… 

Two large airlines independently shared information regarding difficulties caused by a single airport. The end user insisted on receiving Type B application data directly to an email address (although in Type B format), leading to significant efforts to achieve interoperability. Manual workarounds were required for typical automated functions, and the airlines noted the resolution took weeks. 

The airlines reinforced the point that maintaining the same interoperable standard is easier, and replacing the current system may not yield substantial benefits if the interoperability challenge is not overcome coherently and globally. 

Case study 2: Complex change 

When considering transitioning away from Type B related infrastructure, it is also important to consider the internal organizational functionalities reliant on Type B. This can include routers and / or gateways, servers, and specific APIs. 

During their interview, one global airline highlighted how many of their internal processes, including two separate networks that operate in parallel due to a past merger, use Type B 

14 Type B Messaging 

Version 2.1 - 14 June 2024 

solutions. To move away from this implementation would be highly complex, requiring a great deal of effort to ensure all mission-critical applications remained fully operational. 

What do airlines currently use as an alternative? 

69% of airline respondents currently use an alternative format to Type B messaging for specific applications. 

Alternative formats include: 

- Email 

- Internet 

- Internal proprietary systems 

- XML (including AIDX) and JSON 

- Wi-Fi / GSM (e.g., for Electronic Flight Bag applications) 

- Secure File Transfer Protocol 

Note: These may not be full like-for-like replacements for Type B dedicated networks. For example, during the interviews some airlines noted that although other mechanisms are used, they cannot replace the Type B networks data delivery capability with a global set of stakeholders. 

## **Benefits:** 

The stated advantages of currently used alternative formats included their cost-effectiveness, flexibility, ease of use (e.g., addressing, formatting, parsing) and the greater data exchange potential with partners. 

## **Constraints:** 

The stated disadvantages of currently used alternative formats included reliability, connectivity (with some internal destinations e.g., Wi-Fi interchange with GSM), traceability, the need to convert legacy systems, and potential heavy administrative effort. 

What alternatives would airlines like to see in the future? 

Many respondents stated that a future internet based Commercial Off The Shelf (COTS) format would be preferred. Other suggestions included wideband satellite communications and specific solutions such as Simple Queue Service (SQS) and REST APIs. 

15 Type B Messaging 

Version 2.1 - 14 June 2024 

50% of respondents stated that cost was the main driver. 

20% of respondents mentioned that overcoming obsolescence (or introducing new applications) was the key driver to move to a new format. 

End-users noted that cloud-based solutions would enable local, regional, or organizational networks to replace Type B messaging networks, if all stakeholders were known. 

One airline also highlighted that an internal Type B gateway able to translate incoming messages to a variety of formats would help them manage any change across various applications – for example, by sending some messages on internal servers in Type B format and converting others to XML for internal API use. 

Constraints (moving to another format): 

Airline respondents identified the following: 

- Need to reconfigure operational systems and retrofit certain solutions, including implementing new interfaces. 

- Lack of knowledge internally – either due to a lack of understanding of Type B importance across the organization, or due to the attrition of competence in the subject (particularly in small-medium airlines). 

- Supplier factors, including the cost-benefit of moving from current network contracts with ARINC and / or SITA. 

- Cost of change, including capex, effort, and time. 

- Updating applications and associated documentation. 

- Finding available alternatives. 

- Higher priorities at management level – although Type B messaging involves a cost, there are other more material items (e.g., fuel, labor) occupying management attention. 

End user (airport, ANSP) perceptions on Type B and alternatives 

All end users that responded to the survey contracted SITA as their Type B messaging provider. However, it was standard to benefit from different providers for different Type B applications. For example, 50% of end user respondents also use ARINC as a provider. 

- 50% use alternatives to Type B messaging in place of traditional Type B applications. 

16 Type B Messaging 

Version 2.1 - 14 June 2024 

- 33% of end users have considered switching providers. 

- End users are concerned with the cost and effect on business continuity of switching to other Type B providers. 

- 50% feel the industry is not currently offering solutions that meet their need. 

This final point overlaps with the interview findings that cloud-based solutions are preferred in a local environment. 

## **Most valued benefit:** 

End users identified the global reach and reliability of Type B messaging solutions as providing the highest value. 

**==> picture [463 x 272] intentionally omitted <==**

17 Type B Messaging 

Version 2.1 - 14 June 2024 

## SCENARIOS FOR CHANGE 

A mixed response from airlines and end-users 

The benefits and constraints outlined in the previous section paint a mixed picture of the Type B ecosystem. 

For some stakeholders, the message was clear: if it isn’t broken, don’t try to fix it. The reason Type B messaging is still extensively used is that it is fit-for-purpose, and meeting missioncritical needs. For these stakeholders, there is a risk of operational disruption and unknown cost if initiatives are launched to replace Type B messaging. 

This risk is exacerbated by the complexity of Type B messaging integration in individual airlines. Each airline has its own set-up and unique proprietary application solutions (APIs) for processing Type B messages. 

Despite these risks, some airlines and end-users are implementing other solutions, particularly through LANs and WANs. 

In discussing the scenarios for change during the interviews, we identified several drivers for decision making: 

1. Limiting characteristics. 

2. Evolving application requirements such as task digitalization and the need to apply big data techniques. 

3. Innovations in technical architecture. 

4. Cybersecurity drivers. 

5. Commercial and cost drivers. 

The sections below explore each in turn, focusing on the decision making within airlines. 

## **Limiting characteristics:** 

Many features of Type B technology are a major constraint, particularly when considering future data requirements. The character limit in messages restricts data rich messaging and this will be a growing problem for some applications. 

18 Type B Messaging 

Version 2.1 - 14 June 2024 

## **Evolving application requirements:** 

The future requirements of various applications will likely require richer data and will therefore be more costly or unfeasible under the current technical and commercial model. For example, several interviewees and survey respondents noted the increasing amount of information required from certain governments for advanced passenger information (API) leading to increased message costs. 

Future data requirements such as real-time emissions monitoring could be transmitted via Type B using existing aircraft maintenance messages, assuming cost and privacy concerns could be managed. 

## **Innovation in technical architecture:** 

IATA’s Airline Industry Data Model (AIDM) provides a framework for future development of data flows and applications, including a repository of layered architecture models and a development methodology. This includes all Type B messages as well as EDIFACT and XML formats, with the Travel Standards Board, Plan Standards Board and Architecture & Technology Standards Board managing the updated models. 

ACI is developing a standard set of interfaces (akin to Interface Control Documents) for the Airport Operations Data Base, through the ACRIS initiative. This may impact airlines’ interactions with the airport and ground stakeholders in the future. 

There are also some initiatives to explore blockchain as a solution, building on decentralized financial services work on open secure architectures and single points of truth. An example is the UK government funded Fly2Plan initiative, which focused on using blockchain for flight plans. 

Many airlines would like clarity on a potential roadmap, building on the benefits of Type B messaging but taking advantage of the latest technical developments. 

## **Cybersecurity requirements:** 

Concerns were expressed that Type B messaging allows for certain physical and cyberattack pathways (i.e., has certain vulnerabilities) which are only tolerable because very few people know about them. This issue is not unusual with legacy infrastructure and software. 

Type B messaging is a relatively secure system, given the closed network, message acknowledgement and reliability of delivery, but it does not allow for encryption, authentication keys, or protection against address spoofing. 

19 Type B Messaging 

Version 2.1 - 14 June 2024 

One industry user noted potential non-compliance with GDPR and NIS2 (Network and Information Security – EU Reg No 2022/2555), with a need to develop “secure-by-design” architecture and principles in the long-term vision for multi-stakeholder information exchange. 

## **Commercial and cost:** 

The most significant complaint regarding Type B messaging was the cost. It has been previously reported that Type B messages cost the industry $1 billion annually. There is a clear incentive for airlines and end-users to move away from this messaging method if an efficient, cheaper alternative was available. 

Furthermore, some airlines reported that the commercial models of the major providers often involved fixed rates with message caps, thus not incentivizing the airline to lower their usage (as there was no change in cost). 

Balanced against this is the fact that for individual airlines, Type B messaging is not a priority cost. It is dwarfed by fuel and labor costs, and any change management must take this into account (i.e., deciding where effort will be allocated). The costs are fragmented across the industry. It is the type of situation where, if a centralized solution can be found, everyone will benefit, but one party will rarely instigate action by themselves on a pure cost basis. 

**==> picture [468 x 246] intentionally omitted <==**

20 Type B Messaging 

Version 2.1 - 14 June 2024 

Future of Type B Messaging: 

There are a variety of possible options for the future of Type B messaging, with some solutions focused on rectifying the specific constraints discussed previously. 

Change is not straightforward, and guidance will be required for airlines to pursue alternative solutions. For many airlines, a barrier to change is fragmented decision making across the organization, with those in leadership responsible for the commercial arrangements being unaware of the usage, limitations, and alternative solutions for Type B messages in their organization. 

Type B messaging is also not a single “thing”. It is used in multiple applications, some internal, some external, with some relying on traditional global networks (e.g., ARINC / SITA) and others using a WAN or other cloud-based network. 

Thus, moving to a more modern technology or protocol cannot realistically be carried out as a “big bang” solution. 

## **Specifying the scenarios:** 

Given this context, four high-level scenarios have been identified to help the civil aviation industry explore potential next steps. 

1. Maintain the status quo. 

2. Evolve - application by application. 

3. Drive enhancements through substitutes. 

4. Interoperable alternatives. 

The following sections explore each scenario, assessing them against the drivers and constraints to identify advantages and disadvantages. 

## **Scenario 1: Maintaining the Status Quo:** 

The simplest choice is to maintain the status quo of current Type B solutions. A common observation in the survey and interviews was that the current Type B solution is generally fit for purpose. 

Despite this, the issue of cost is a clear driver for alternative solutions, as well as the anticipated increase in data transmission from future applications and requirements. 

21 Type B Messaging 

Version 2.1 - 14 June 2024 

The survey and interviews indicated that most airlines and end-users were considering change in some areas of Type B messaging, and so the status quo is unlikely to be a realistic option going forward. 

## **Benefits:** 

- Maintains the benefits of the current Type B arrangements. 

- Does not require a change process that will be a strain on resource and requires deep knowledge of Type B. 

## **Constraints:** 

- Does not reduce cost. 

- Does not given the opportunity for richer data transfer or technical innovation. 

## **Scenario 2: Change segmented by application:** 

The range of applications that rely on Type B messages is very broad, and it would be laborious and complex for an organization to shift all of their usage to an alternative solution. 

A simpler approach would be to consider each application in turn and transition to the best alternative for each use case over a longer time-period. 

This scenario best represents the current situation – airlines and end-users are making improvements, but not necessarily in a coordinated manner. Critically, the interconnection at the global level still needs to be provided via the Type B networks. 

## **Benefits:** 

- Is not an intense transition that requires excessive resources. 

- Allows priority applications to shift to alternative solutions that offer richer data options. 

## **Constraints:** 

- Commercial contracts may limit an organization’s ability to reduce costs due to data caps and contract lengths. 

## **Scenario 3: Change driven by improved technical substitutes:** 

Alternative solutions such as Wide Area Networks or satellite communications may be considered to overcome many of the constraints of traditional Type B. 

22 Type B Messaging 

Version 2.1 - 14 June 2024 

Most of these solutions do not have the same character constraints, enabling richer data to be transmitted. The variety of options also provides an incentive for competitive pricing which is difficult to achieve in the traditional Type B marketplace given the duopoly of global network providers. 

However, implementation of these substitutes may require an increased amount of effort and an advanced understanding of the complexity of each airlines’ system to ensure a smooth and safe transition. This change process could be enabled through clear categorization of suitable solutions for each application type. 

## **Benefits:** 

- Provides solutions that enable richer data communications. 

- Likely to be cheaper than traditional Type B messaging. 

## **Constraints:** 

- Changing to such alternatives could be complex for organizations, requiring significant resources and technical expertise. 

## **Scenario 4: Interoperable internet-based alternative:** 

Another option is an internet-based alternative solution that could be made open source and, for example, distributed to airlines via IATA, resulting in much lower costs for Type B messages in the longer term. 

This could be designed as part of a data architecture coordinated with ACI and ICAO, with the implementation managed in such a way as to allow legacy Type B global solutions as well as the new internet-based solution. 

## **Benefits:** 

- A major reduction in costs. 

- Enables airlines to maintain much of their existing internal networks on an as needed basis (e.g., Type B APIs) so does not cause largescale disruption. 

## **Constraints:** 

- Requires significant information technology design and implementation expertise. 

23 Type B Messaging 

Version 2.1 - 14 June 2024 

## CHALLENGES AND NEXT STEPS 

Change management and execution of the outlined scenarios must be assessed at an industry, organization, and individual decision maker level. The next sections identify key factors raised by airlines that could influence successful change. 

## **Commercial structures and distributed decision making:** 

The major providers of global Type B network solutions are likely to maintain their commercial position. Some participants reported how providers will offer discounted rates to airlines if they start considering switching to an alternative solution. 

The length of contracts for Type B solutions also restrict airlines in considering shifting to an alternative solution as it would not have any financial benefit as they are committed to their current arrangement. 

Often the financial benefit of alternative solutions is not realized as decision makers at the commercial level are not confronted with the limitations of Type B messaging in their day-to-day work. While those with technical knowledge and an understanding for the need to move to a new solution are not able to influence these commercial decisions. 

Feedback from airline representatives suggested they would welcome assistance in communicating the complexity of the Type B messaging environment to their senior decision makers. 

## **Resources needed:** 

Transition to an alternative solution would require significant internal effort and even though there may be cost savings in the longer term, it may not be realized initially due to the cost and effort required for the transition process. 

## **Lack of focused technical expertise:** 

One prominent issue inherent in legacy technology is a lack of focused technical expertise within organizations. One limitation and frustration expressed by users during the survey and interview process was the difficulty in finding the correct person within each organization who had the knowledge to comment on their organizations overall use of and offer their perspective on Type B messaging. In many cases, the available technical expertise was distributed amongst different application leads. 

Whilst some of the larger airlines continue to train staff on specific application-level solutions, many others have seen those with the needed expertise retire and not be replaced. 

24 Type B Messaging 

Version 2.1 - 14 June 2024 

## **Complexity of change:** 

The process for an airline to transition to an alternate solution is complex. In most cases, the range of stakeholders involved is broad extending from commercial decision makers to application technical experts, to those managing communications with various end-users. It is evident that the number of applications reliant on Type B messaging creates a multitude of considerations for any transition process. 

An interim step towards a more expansive solution might be to focus on a gateway or router protocol translation technology on the boundary of an organization’s domain. This might permit continued use of an organizations disparate internal systems while interconnecting with a more modern global solution. 

## **Change management and communications support:** 

Several airlines requested assistance from IATA to document best practices, lessons learnt, and potential solutions. 

Some larger airlines also requested help communicating the need for change to their senior management. 

## **Protocols:** 

Some stakeholders requested further consideration of transfer of applications to modern protocols (e.g., JSON or XML). 

The IATA AIDM already has the foundations for this – specific work may be needed to explore possible evolutions and new standards in the longer term. 

--- END --- 

25 Type B Messaging 

Version 2.1 - 14 June 2024 

