//
//  GenericInfoTableViewData.swift
//  GenericInfoSelectionViewController
//
//  Created by Admin on 13/04/2018.
//  Copyright © 2018 Tung Vo. All rights reserved.
//

import Foundation
import UIKit

protocol BasicInfoData: Equatable {
    var title: String { get }
}

protocol GenericInfoTableViewData {
    associatedtype DataType: BasicInfoData
    var title: String { get }
    var infoData: [DataType] { get }
    var allowsMultipleSelection: Bool { get }
}
