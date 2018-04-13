//
//  HobbySelectionViewController.swift
//  GenericInfoSelectionViewController
//
//  Created by Admin on 13/04/2018.
//  Copyright © 2018 Tung Vo. All rights reserved.
//

import UIKit

protocol HobbySelectionViewControllerDelegate: NSObjectProtocol {
    func hobbySelectionViewController(_ viewController: HobbySelectionViewController, didSelectHobbies hobbies: [Hobby])
}

class HobbySelectionViewController: GenericInfoSelectionViewController<HobbyTableViewData> {
    weak var delegate: HobbySelectionViewControllerDelegate?
    
    init() {
        super.init(viewData: HobbyTableViewData())
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        viewData = HobbyTableViewData()
    }
    
    override func doneButtonTapped(_ button: UIBarButtonItem) {
        delegate?.hobbySelectionViewController(self, didSelectHobbies: selectedInfoData)
        super.doneButtonTapped(button)
    }
}
