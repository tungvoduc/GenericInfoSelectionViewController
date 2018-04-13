//
//  GenderSelectionViewController.swift
//  GenericInfoSelectionViewController
//
//  Created by Admin on 13/04/2018.
//  Copyright © 2018 Tung Vo. All rights reserved.
//

import UIKit

protocol GenderSelectionViewControllerDelegate: NSObjectProtocol {
    func genderSelectionViewController(_ viewController: GenderSelectionViewController, didSelectGender gender: Gender?)
}

class GenderSelectionViewController: GenericInfoSelectionViewController<GenderTableViewData> {
    weak var delegate: GenderSelectionViewControllerDelegate?
    
    init() {
        super.init(viewData: GenderTableViewData())
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        viewData = GenderTableViewData()
    }
    
    override func doneButtonTapped(_ button: UIBarButtonItem) {
        delegate?.genderSelectionViewController(self, didSelectGender: selectedInfoData.first)
        super.doneButtonTapped(button)
    }
}
