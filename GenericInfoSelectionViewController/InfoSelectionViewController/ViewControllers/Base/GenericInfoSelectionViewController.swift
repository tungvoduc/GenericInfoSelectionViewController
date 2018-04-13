//
//  GenericInfoSelectionViewController.swift
//  GenericInfoSelectionViewController
//
//  Created by Admin on 13/04/2018.
//  Copyright © 2018 Tung Vo. All rights reserved.
//

import UIKit

private let kCellIdentifier = "Cell"

class GenericInfoSelectionViewController<ViewDataType: GenericInfoTableViewData>: UITableViewController {
    private enum Section: Int {
        case infoData = 0
        case total
    }
    
    var viewData: ViewDataType? {
        didSet {
            if viewIfLoaded != nil {
                tableView.reloadData()
            }
        }
    }
    
    init(viewData data: ViewDataType) {
        super.init(style: UITableViewStyle.plain)
        viewData = data
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var selectedInfoData: [ViewDataType.DataType] {
        set {
            if viewIfLoaded != nil {
                // Select rows based on
                for infoData in newValue {
                    if let index = viewData?.infoData.index(of: infoData) {
                        let indexPath = indexPathForInfoDataAtIndex(index)
                        tableView.selectRow(at: indexPath, animated: false, scrollPosition: UITableViewScrollPosition.top)
                    }
                }
            }
        }
        
        get {
            var datas = [ViewDataType.DataType]()
            
            if viewIfLoaded != nil {
                if let indexPaths = tableView.indexPathsForSelectedRows {
                    for indexPath in indexPaths {
                        if let data = infoDataAtIndexPath(indexPath) {
                            datas.append(data)
                        }
                    }
                }
            }
            
            return datas
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let viewData = viewData {
            title = viewData.title
            tableView.allowsMultipleSelection = viewData.allowsMultipleSelection
        }
        
        addRightBarButtonItem()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(BaseBasicInfoSelectionCell.self, forCellReuseIdentifier: kCellIdentifier)
    }
    
    // Right bar button item
    private func addRightBarButtonItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(doneButtonTapped(_:)))
    }
    
    // Indexpaths
    func indexPathForInfoDataAtIndex(_ index: Int) -> IndexPath {
        return IndexPath(row: index, section: Section.infoData.rawValue)
    }
    
    func infoDataAtIndexPath(_ indexPath: IndexPath) -> ViewDataType.DataType? {
        if indexPath.section == Section.infoData.rawValue {
            return viewData?.infoData[indexPath.row]
        }
        
        return nil
    }
    
    //MARK: ASTableDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Section.total.rawValue
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let viewData = viewData {
            if let section = Section(rawValue: section) {
                switch section {
                case .infoData: return viewData.infoData.count
                default: return 0
                }
                
            }
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier, for: indexPath) as! BaseBasicInfoSelectionCell
        
        if let data = infoDataAtIndexPath(indexPath) {
            cell.title = data.title
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if let _ = infoDataAtIndexPath(indexPath) {
            return indexPath
        }
        
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    // Selector
    @objc func doneButtonTapped(_ button: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
}
