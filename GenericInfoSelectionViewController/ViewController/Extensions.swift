//
//  Extensions.swift
//  GenericInfoSelectionViewController
//
//  Created by Admin on 13/04/2018.
//  Copyright © 2018 Tung Vo. All rights reserved.
//

import Foundation

extension Gender: TitleData { }
extension RelationshipStatus: TitleData { }
extension Ethnicity: TitleData { }

struct Hobbies: TitleData {
    var hobbies: [Hobby]
    
    init(hobbies: [Hobby]) {
        self.hobbies = hobbies
    }
    
    var title: String {
        return hobbies.map { $0.title }.joined(separator: ", ")
    }
}
