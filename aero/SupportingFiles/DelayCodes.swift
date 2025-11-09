//
//  DelayCodes.swift
//  taillog
//
//  Created by Shubham Tiwari on 13/12/24.
//

import Foundation

class DelayCodes{
     static let delayCodeData = [
        DelayCodesModel(
            code_description: "",
            code_id: "",
            code_name: "",
            id: "00",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "",
            code_name: "",
            id: "01",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "",
            code_name: "",
            id: "02",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "",
            code_name: "",
            id: "03",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "",
            code_name: "",
            id: "04",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "",
            code_name: "",
            id: "05",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Due to own airline activity.",
            code_id: "OA",
            code_name: "No gate/stand available",
            id: "06",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Aircraft connection by maintenance.",
            code_id: "",
            code_name: "Aircraft connection",
            id: "07",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Aircraft connection by miscellaneous, traffic, marketing flight operations, ground handling, cabin services, etc.",
            code_id: "",
            code_name: "Aircraft connection",
            id: "08",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Planned turnaround time less than declared minimum.",
            code_id: "SG",
            code_name: "Scheduled ground time",
            id: "09",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Check-in reopened for late passengers.",
            code_id: "PD",
            code_name: "Late check-in",
            id: "11",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Check-in not completed by flight closure time.",
            code_id: "PL",
            code_name: "Late check-in",
            id: "12",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Error with passenger or baggage details.",
            code_id: "PE",
            code_name: "Check-in error",
            id: "13",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Booking errors – not resolved at check-in.",
            code_id: "PO",
            code_name: "Oversales",
            id: "14",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Discrepancies and paging, missing checked in passengers.",
            code_id: "PH",
            code_name: "Boarding",
            id: "15",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Local decision to delay for VIP or press; delay due to offload of passengers following family bereavement.",
            code_id: "PS",
            code_name: "Commercial publicity/passenger convenience",
            id: "16",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Late or incorrect order given to supplier.",
            code_id: "PC",
            code_name: "Catering order",
            id: "17",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Late or incorrectly sorted baggage.",
            code_id: "PB",
            code_name: "Baggage processing",
            id: "18",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Boarding/deboarding of passengers with reduced mobility.",
            code_id: "PW",
            code_name: "Reduced mobility",
            id: "19",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Late or incorrect documentation for booked cargo.",
            code_id: "CD",
            code_name: "Documentation",
            id: "21",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Late delivery of booked cargo to airport/aircraft.",
            code_id: "CP",
            code_name: "Late positioning",
            id: "22",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Acceptance of cargo after deadline.",
            code_id: "CC",
            code_name: "Late acceptance",
            id: "23",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Repackaging and/or re-labelling of booked cargo.",
            code_id: "CI",
            code_name: "Inadequate packing",
            id: "24",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Booked load in excess of saleable load capacity (weight or volume), resulting in reloading or off-load.",
            code_id: "CO",
            code_name: "Oversales",
            id: "25",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Late preparation in warehouse.",
            code_id: "CU",
            code_name: "Late preparation in warehouse",
            id: "26",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Incomplete and/or inaccurate documentation.",
            code_id: "CE",
            code_name: "Documentation, packing",
            id: "27",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Late delivery of mail to airport/aircraft.",
            code_id: "CL",
            code_name: "Late positioning",
            id: "28",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Acceptance of mail after deadline.",
            code_id: "CA",
            code_name: "Late acceptance",
            id: "29",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Late or inaccurate mass and balance documentation, general declaration, passenger manifest.",
            code_id: "GD",
            code_name: "Late/inaccurate aircraft documentation",
            id: "31",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Bulky items, special load, lack loading staff.",
            code_id: "GL",
            code_name: "Loading/unloading",
            id: "32",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Lack of and/or breakdown; lack of operating staff.",
            code_id: "GE",
            code_name: "Loading equipment",
            id: "33",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Lack of and/or breakdown; lack of operating staff.",
            code_id: "GS",
            code_name: "Servicing equipment",
            id: "34",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Late completion of aircraft cleaning.",
            code_id: "GC",
            code_name: "Aircraft cleaning",
            id: "35",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Late delivery of fuel; excludes late request.",
            code_id: "GF",
            code_name: "Fuelling/defuelling",
            id: "36",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Late and/or incomplete delivery; late loading.",
            code_id: "GB",
            code_name: "Catering",
            id: "37",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Lack of and/or unserviceable ULD's or pallets.",
            code_id: "GU",
            code_name: "ULD",
            id: "38",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Lack and/or breakdown; lack of operating staff; includes GPU, air start, pushback tug, de-icing.",
            code_id: "GT",
            code_name: "Technical equipment",
            id: "39",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Aircraft defects including items covered by MEL.",
            code_id: "TD",
            code_name: "Technical defects",
            id: "41",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Late release from maintenance.",
            code_id: "TM",
            code_name: "Scheduled maintenance",
            id: "42",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Special checks and/or additional works beyond normal maintenance schedule.",
            code_id: "TN",
            code_name: "Non-scheduled maintenance",
            id: "43",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Lack of spares, lack of and/or breakdown of specialist equipment required for defect rectification.",
            code_id: "TS",
            code_name: "Spares and maintenance",
            id: "44",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Awaiting AOG spare(s) to be carried to another station.",
            code_id: "TA",
            code_name: "AOG spares",
            id: "45",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "For technical reasons, e.g. a prolonged technical delay.",
            code_id: "TC",
            code_name: "Aircraft change",
            id: "46",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Standby aircraft unavailable for technical reasons.",
            code_id: "TL",
            code_name: "Standby aircraft",
            id: "47",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Scheduled cabin confguration/version adjustments.",
            code_id: "TV",
            code_name: "Scheduled cabin configuration/version adjustments",
            id: "48",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Bird or lightning strike, turbulence, heavy or overweight landing, collisions during taxiing.",
            code_id: "DF",
            code_name: "Damage during flight operations",
            id: "51",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Collisions (other than taxiing), loading/offloading damage, towing, contamination, extreme weather conditions.",
            code_id: "DG",
            code_name: "Damage during ground operations",
            id: "52",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Failure of automated systems, including check-in; load control systems producing mass and balance.",
            code_id: "ED",
            code_name: "Departure control",
            id: "55",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Failure of documentation and/or load control systems covering cargo.",
            code_id: "EC",
            code_name: "Cargo preparation documentation",
            id: "56",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Failure of automated flight plan systems.",
            code_id: "EF",
            code_name: "Flight plans",
            id: "57",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Failure of other computer system.",
            code_id: "EO",
            code_name: "Other automated system",
            id: "58",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Late completion of or change to flight plan.",
            code_id: "FP",
            code_name: "Flight plan",
            id: "61",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Late alteration to fuel or payload.",
            code_id: "FF",
            code_name: "Operational requirement",
            id: "62",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Late flight deck, or entire crew, other than standby; late completion of flight deck crew checks.",
            code_id: "FT",
            code_name: "Late crew boarding or departure procedures",
            id: "63",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Sickness, awaiting standby, flight time limitations, valid visa, health documents, etc.",
            code_id: "FS",
            code_name: "Flight deck crew shortage",
            id: "64",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Requests not within operational requirements.",
            code_id: "FR",
            code_name: "Flight deck crew special request",
            id: "65",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Late cabin crew other than standby; late completion of cabin crew checks.",
            code_id: "FL",
            code_name: "Late cabin crew boarding or departure procedures",
            id: "66",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Sickness, awaiting standby, flight time limitations, valid visa, health documents.",
            code_id: "FC",
            code_name: "Cabin crew shortage",
            id: "67",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Requests not within operational requirements.",
            code_id: "FA",
            code_name: "Cabin crew error or special request",
            id: "68",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Extraordinary requests outside mandatory requirements.",
            code_id: "FB",
            code_name: "Captain request for security check",
            id: "69",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Below operating limits.",
            code_id: "WO",
            code_name: "Departure station",
            id: "71",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Below operating limits.",
            code_id: "WT",
            code_name: "Destination station",
            id: "72",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Below operating limits.",
            code_id: "WR",
            code_name: "En-route or alternate",
            id: "73",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "WR",
            code_name: "Outside aircraft limits",
            id: "73",
            sub_code: "Z"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "WR",
            code_name: "Outside crew limits",
            id: "73",
            sub_code: "Y"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "WR",
            code_name: "ETOPS",
            id: "73",
            sub_code: "X"
        ),
        DelayCodesModel(
            code_description: "Removal of ice and/or snow; excludes equipment – lack of or breakdown.",
            code_id: "WI",
            code_name: "De-icing of aircraft",
            id: "75",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Runway, taxiway conditions.",
            code_id: "WS",
            code_name: "Removal of snow, ice, water, and sand from airport",
            id: "76",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "High winds, heavy rain, blizzards, monsoons etc.",
            code_id: "WG",
            code_name: "Ground handling impaired by adverse weather conditions",
            id: "77",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Standard demand/capacity problems.",
            code_id: "AT",
            code_name: "ATFM due to ATC en-route demand/capacity",
            id: "81",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AT",
            code_name: "ATC routeings",
            id: "81",
            sub_code: "Z"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AT",
            code_name: "High demand or capacity",
            id: "81",
            sub_code: "Y"
        ),
        DelayCodesModel(
            code_description: "Reduced capacity caused by industrial action or staff shortage, equipment failure, military exercise or extraordinary demand due to capacity reduction in neighbouring area.",
            code_id: "AX",
            code_name: "ATFM due to ATC staff/equipment enroute",
            id: "82",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AX",
            code_name: "Industrial action",
            id: "82",
            sub_code: "Z"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AX",
            code_name: "Equipment failure",
            id: "82",
            sub_code: "Y"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AX",
            code_name: "Staff shortage",
            id: "82",
            sub_code: "X"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AX",
            code_name: "Military activity",
            id: "82",
            sub_code: "W"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AX",
            code_name: "Special event",
            id: "82",
            sub_code: "V"
        ),
        DelayCodesModel(
            code_description: "Airport and/or runway closed due to obstruction, industrial action, staff shortage, political unrest, noise abatement, night curfew, special flights.",
            code_id: "AE",
            code_name: "ATFM due to restriction at destination airport",
            id: "83",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AE",
            code_name: "High demand/ATC capacity",
            id: "83",
            sub_code: "Z"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AE",
            code_name: "Industrial action",
            id: "83",
            sub_code: "Y"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AE",
            code_name: "Equipment failure",
            id: "83",
            sub_code: "X"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AE",
            code_name: "Staff shortage",
            id: "83",
            sub_code: "W"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AE",
            code_name: "Accident/incident",
            id: "83",
            sub_code: "V"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AE",
            code_name: "Military activity",
            id: "83",
            sub_code: "U"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AE",
            code_name: "Special event",
            id: "83",
            sub_code: "T"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AE",
            code_name: "Noise abatement/night curfew",
            id: "83",
            sub_code: "S"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AE",
            code_name: "Other",
            id: "83",
            sub_code: "R"
        ),
        DelayCodesModel(
            code_description: "Destination weather.",
            code_id: "AW",
            code_name: "ATFM due to weather at destination",
            id: "84",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Passengers, baggage, crew, etc.",
            code_id: "AS",
            code_name: "Mandatory security",
            id: "85",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Passengers, crew.",
            code_id: "AG",
            code_name: "Immigration, customs, health",
            id: "86",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Parking stands, ramp congestion, lighting, buildings, gate limitations etc.",
            code_id: "AF",
            code_name: "Airport facilities",
            id: "87",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AF",
            code_name: "Lack of parking stands",
            id: "87",
            sub_code: "Z"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AF",
            code_name: "Ramp congestion",
            id: "87",
            sub_code: "Y"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AF",
            code_name: "Lighting or buildings",
            id: "87",
            sub_code: "X"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AF",
            code_name: "Gate limitation/no gate available",
            id: "87",
            sub_code: "W"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AF",
            code_name: "Baggage sorting system down/slow",
            id: "87",
            sub_code: "V"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AF",
            code_name: "No push back clearance due to infrastructure",
            id: "87",
            sub_code: "U"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AF",
            code_name: "Jet bridge inoperative",
            id: "87",
            sub_code: "T"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AF",
            code_name: "Lack of check in counters",
            id: "87",
            sub_code: "S"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AF",
            code_name: "Electrical system failure",
            id: "87",
            sub_code: "R"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AF",
            code_name: "Passenger transport system failure",
            id: "87",
            sub_code: "P"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AF",
            code_name: "Public address/flight information display system failure",
            id: "87",
            sub_code: "N"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AF",
            code_name: "Insufficient fire cover",
            id: "87",
            sub_code: "M"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AF",
            code_name: "Ground communication system failure",
            id: "87",
            sub_code: "L"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AF",
            code_name: "No push back clearance due to construction breakdown of airport fuelling system",
            id: "87",
            sub_code: "K"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AF",
            code_name: "Late or lack of Follow me for push-back",
            id: "87",
            sub_code: "J"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AF",
            code_name: "Any of the above at the destination airport",
            id: "87",
            sub_code: "H"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AF",
            code_name: "N/A",
            id: "87",
            sub_code: "G"
        ),
        DelayCodesModel(
            code_description: "Airport and/or runway closed due to obstruction industrial action, staff shortage, political unrest, noise abatement, night curfew, special flights.",
            code_id: "AD",
            code_name: "Restrictions at destination airport",
            id: "88",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Including air traffic services, start-up and pushback, airport and/or runway closed due to obstruction or weather (restriction due to weather in case of ATFM only) industrial action, staff shortage, political unrest, noise abatement, night curfew, special flights.",
            code_id: "AM",
            code_name: "Restrictions at airport of departure",
            id: "89",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AM",
            code_name: "ATC capacity",
            id: "89",
            sub_code: "Z"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AM",
            code_name: "ATC industrial action",
            id: "89",
            sub_code: "Y"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AM",
            code_name: "ATC staffing",
            id: "89",
            sub_code: "X"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AM",
            code_name: "ATC equipment",
            id: "89",
            sub_code: "W"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AM",
            code_name: "ATC accident/incident",
            id: "89",
            sub_code: "V"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AM",
            code_name: "ATC due to de-icing",
            id: "89",
            sub_code: "U"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AM",
            code_name: "ATC special event",
            id: "89",
            sub_code: "T"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AM",
            code_name: "ATC weather",
            id: "89",
            sub_code: "S"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AM",
            code_name: "ATC restrictions due to curfew",
            id: "89",
            sub_code: "R"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AM",
            code_name: "ATC political unrest",
            id: "89",
            sub_code: "P"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AM",
            code_name: "ATC environmental",
            id: "89",
            sub_code: "N"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AM",
            code_name: "Airport closure",
            id: "89",
            sub_code: "M"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AM",
            code_name: "Runway closure",
            id: "89",
            sub_code: "L"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AM",
            code_name: "Start-up/pushback clearence delay (local ATC)",
            id: "89",
            sub_code: "K"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AM",
            code_name: "Lost flight plan by ATC",
            id: "89",
            sub_code: "J"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AM",
            code_name: "Construction work/maintenence",
            id: "89",
            sub_code: "H"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "AM",
            code_name: "Other",
            id: "89",
            sub_code: "G"
        ),
        DelayCodesModel(
            code_description: "Awaiting load from another flight.",
            code_id: "RL",
            code_name: "Load connection",
            id: "91",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Passenger or baggage check-in error at originating station.",
            code_id: "RT",
            code_name: "Through check-in error",
            id: "92",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Late arrival of aircraft from another flight or previous sector.",
            code_id: "RA",
            code_name: "Aircraft rotation",
            id: "93",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "RA",
            code_name: "Late arrival due departure delay at previous station",
            id: "93",
            sub_code: "Z"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "RA",
            code_name: "Late arrival due enroute delay",
            id: "93",
            sub_code: "Y"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "RA",
            code_name: "Late arrival due delay after landing",
            id: "93",
            sub_code: "X"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "RA",
            code_name: "Late arrival due to high demand for destination station",
            id: "93",
            sub_code: "W"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "RA",
            code_name: "Late arrival due to weather at destination",
            id: "93",
            sub_code: "V"
        ),
        DelayCodesModel(
            code_description: "",
            code_id: "RA",
            code_name: "Late arrival due to technical reasons",
            id: "93",
            sub_code: "U"
        ),
        DelayCodesModel(
            code_description: "Awaiting cabin crew from another flight.",
            code_id: "RS",
            code_name: "Cabin crew rotation",
            id: "94",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Awaiting flight deck, or entire crew, from another flight.",
            code_id: "RC",
            code_name: "Crew rotation",
            id: "95",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Re-routing, diversion, consolidation, aircraft change for reasons other than technical.",
            code_id: "RO",
            code_name: "Operations control",
            id: "96",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Industrial action within own airline.",
            code_id: "MI",
            code_name: "Industrial action within own airline",
            id: "97",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "Industrial action (except Air Traffic Control Services).",
            code_id: "MO",
            code_name: "Industrial action outside own airline",
            id: "98",
            sub_code: ""
        ),
        DelayCodesModel(
            code_description: "No suitable code; explain reason(s) in plain text.",
            code_id: "MX",
            code_name: "Miscellaneous",
            id: "99",
            sub_code: ""
        )
     ];
    
    static let delayCodesHeadingText = [
        "internal/others",
        "passenger & baggage",
        "cargo & mail",
        "aircraft & ramp handling",
        "technical & aircraft equipment",
        "damage to aircraft",
        "edp/automated equipment failure",
        "flight operations and crewing",
        "weather",
        "air traffic flow management restrictions",
        "airport & governmental authorities",
        "reactionary",
        "miscellaneous"
    ];
    static let delayCodesHeadingIndex: Set<Int> = [0, 10, 19, 28, 37, 45, 47, 51, 60, 69, 89, 128, 140]
    
    static let delayCodeMap = [
        0: "internal/others",
        10: "passenger & baggage",
        19: "cargo & mail",
        28: "aircraft & ramp handling",
        37: "technical & aircraft equipment",
        45: "damage to aircraft",
        47: "edp/automated equipment failure",
        51: "flight operations and crewing",
        60: "weather",
        69: "air traffic flow management restrictions",
        89: "airport & governmental authorities",
        128: "reactionary",
        140: "miscellaneous"
    ]
    
    static let pickerData: [[String]] = [
        Array(0...2000).map { "\(String(format: "%02d",$0 % 10))" },
            Array(0...2000).map { "\(String(format: "%02d",$0 % 60))" }
        ]
}
