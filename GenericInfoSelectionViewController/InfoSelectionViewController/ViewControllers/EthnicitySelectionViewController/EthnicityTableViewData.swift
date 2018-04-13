//
//  EthnicityTableViewData.swift
//  GenericInfoSelectionViewController
//
//  Created by Admin on 13/04/2018.
//  Copyright © 2018 Tung Vo. All rights reserved.
//

import Foundation

extension Ethnicity: BasicInfoData {
    var title: String {
        switch self {
        case .asian: return "Asian"
        case .southAsian: return "South Asian"
        case .latino: return "Latino"
        case .nativeAmerican: return "Native american"
        case .middleEastern: return "Middle Eastern"
        case .black: return "Black"
        case .white: return "White"
        case .mixed: return "Mixed"
        case .other: return "Other"
        }
    }
}

struct EthnicityTableViewData: GenericInfoTableViewData {
    var title: String { return "Ethnicity" }
    
    var infoData: [Ethnicity] {
        return [
            Ethnicity.asian,
            Ethnicity.southAsian,
            Ethnicity.latino,
            Ethnicity.nativeAmerican,
            Ethnicity.middleEastern,
            Ethnicity.black,
            Ethnicity.white,
            Ethnicity.mixed,
            Ethnicity.other
        ]
    }
    
    var allowsMultipleSelection: Bool { return false }
}
