//
//  GenderTableViewData.swift
//  GenericInfoSelectionViewController
//
//  Created by Admin on 13/04/2018.
//  Copyright © 2018 Tung Vo. All rights reserved.
//

import Foundation

extension Gender: BasicInfoData {
    var title: String {
        switch self {
        case .male: return "Male"
        case .female: return "Female"
        }
    }
}

struct GenderTableViewData: GenericInfoTableViewData {
    var title: String { return "Gender" }
    
    var infoData: [Gender] {
        return [
            Gender.male,
            Gender.female
        ]
    }
    
    var allowsMultipleSelection: Bool { return false }
}
