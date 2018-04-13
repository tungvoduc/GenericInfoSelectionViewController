//
//  RelationshipStatusTableViewData.swift
//  GenericInfoSelectionViewController
//
//  Created by Admin on 13/04/2018.
//  Copyright © 2018 Tung Vo. All rights reserved.
//

import Foundation

extension RelationshipStatus: BasicInfoData {
    var title: String {
        switch self {
        case .single: return "Single"
        case .inRelationship: return "In relationship"
        case .married: return "Married"
        case .divorced: return "Divorced"
        }
    }
}

struct RelationshipStatusTableViewData: GenericInfoTableViewData {
    var title: String { return "Relationship status" }
    
    var infoData: [RelationshipStatus] {
        return [
            RelationshipStatus.single,
            RelationshipStatus.inRelationship,
            RelationshipStatus.married,
            RelationshipStatus.divorced
        ]
    }
    
    var allowsMultipleSelection: Bool { return false }
}
