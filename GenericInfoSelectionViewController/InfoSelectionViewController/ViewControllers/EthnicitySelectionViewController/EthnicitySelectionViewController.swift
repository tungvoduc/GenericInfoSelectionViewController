//
//  EthnicitySelectionViewController.swift
//  GenericInfoSelectionViewController
//
//  Created by Admin on 13/04/2018.
//  Copyright © 2018 Tung Vo. All rights reserved.
//

import UIKit

protocol EthnicitySelectionViewControllerDelegate: NSObjectProtocol {
    func ethnicitySelectionViewController(_ viewController: EthnicitySelectionViewController, didSelectEthnicity ethnicity: Ethnicity?)
}

class EthnicitySelectionViewController: GenericInfoSelectionViewController<EthnicityTableViewData> {
    weak var delegate: EthnicitySelectionViewControllerDelegate?
    
    init() {
        super.init(viewData: EthnicityTableViewData())
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        viewData = EthnicityTableViewData()
    }
    
    override func doneButtonTapped(_ button: UIBarButtonItem) {
        delegate?.ethnicitySelectionViewController(self, didSelectEthnicity: selectedInfoData.first)
        super.doneButtonTapped(button)
    }
}
