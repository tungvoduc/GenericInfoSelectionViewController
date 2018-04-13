//
//  HobbyTableViewData.swift
//  GenericInfoSelectionViewController
//
//  Created by Admin on 13/04/2018.
//  Copyright © 2018 Tung Vo. All rights reserved.
//

import Foundation

extension Hobby: BasicInfoData {
    var title: String {
        switch self {
        case .biking: return "Biking"
        case .dancing: return "Dancing"
        case .drawing: return "Drawing"
        case .traveling: return "Traveling"
        case .cooking: return "Cooking"
        case .fashion: return "Fashion"
        case .videoGames: return "Video games"
        case .singing: return "Signing"
        case .watchingMovies: return "Watching movies"
        }
    }
}

struct HobbyTableViewData: GenericInfoTableViewData {
    var title: String { return "Hobbies" }
    
    var infoData: [Hobby] {
        return [
            Hobby.biking,
            Hobby.dancing,
            Hobby.drawing,
            Hobby.traveling,
            Hobby.cooking,
            Hobby.fashion,
            Hobby.videoGames,
            Hobby.singing,
            Hobby.watchingMovies
        ]
    }
    
    var allowsMultipleSelection: Bool { return true }
}
