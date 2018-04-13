//
//  RelationshipStatusSelectionViewController.swift
//  GenericInfoSelectionViewController
//
//  Created by Admin on 13/04/2018.
//  Copyright © 2018 Tung Vo. All rights reserved.
//

import UIKit

protocol RelationshipStatusSelectionViewControllerDelegate: NSObjectProtocol {
    func relationshipStatusSelectionViewController(_ viewController: RelationshipStatusSelectionViewController, didSelectRelationshipStatus status: RelationshipStatus?)
}

class RelationshipStatusSelectionViewController: GenericInfoSelectionViewController<RelationshipStatusTableViewData> {
    weak var delegate: RelationshipStatusSelectionViewControllerDelegate?
    
    init() {
        super.init(viewData: RelationshipStatusTableViewData())
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        viewData = RelationshipStatusTableViewData()
    }
    
    override func doneButtonTapped(_ button: UIBarButtonItem) {
        delegate?.relationshipStatusSelectionViewController(self, didSelectRelationshipStatus: selectedInfoData.first)
        super.doneButtonTapped(button)
    }
}
