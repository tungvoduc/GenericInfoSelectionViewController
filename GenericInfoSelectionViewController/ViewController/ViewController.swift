//
//  ViewController.swift
//  GenericInfoSelectionViewController
//
//  Created by Admin on 13/04/2018.
//  Copyright © 2018 Tung Vo. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    enum Section: Int {
        case gender = 0
        case ethnicity
        case relationShipStatus
        case hobbies
        case total
        
        var title: String? {
            switch self {
            case .gender:
                return "Gender"
            case .ethnicity:
                return "Ethnicity"
            case .relationShipStatus:
                return "Relationship status"
            case .hobbies:
                return "Hobbies"
            default:
                return nil
            }
        }
    }
    
    private var datas: [Section: TitleData?] = [
        Section.gender: nil,
        Section.ethnicity: nil,
        Section.relationShipStatus: nil,
        Section.hobbies: nil
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return Section.total.rawValue
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if let section = Section(rawValue: indexPath.section), let title = datas[section]??.title {
            cell.textLabel?.text = title
        }
        else {
            cell.textLabel?.text = "Tap to update"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let section = Section(rawValue: section) {
            return section.title
        }
        
        return nil
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let section = Section(rawValue: indexPath.section) {
            let viewController: UIViewController
            switch section {
            case .ethnicity:
                let ethnicitySelectionViewController = EthnicitySelectionViewController()
                ethnicitySelectionViewController.delegate = self
                viewController = ethnicitySelectionViewController
                
            case .relationShipStatus:
                let relationshipStatusSelectionViewController = RelationshipStatusSelectionViewController()
                relationshipStatusSelectionViewController.delegate = self
                viewController = relationshipStatusSelectionViewController
                
            case .hobbies:
                let hobbySelectionViewController = HobbySelectionViewController()
                hobbySelectionViewController.delegate = self
                viewController = hobbySelectionViewController
                
            case .gender:
                let genderSelectionViewController = GenderSelectionViewController()
                genderSelectionViewController.delegate = self
                viewController = genderSelectionViewController
                
            default: return
            }
            
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    private func reloadSection(_ section: Section) {
        tableView.reloadSections(IndexSet(integer: section.rawValue), with: UITableViewRowAnimation.none)
    }
}

extension ViewController: EthnicitySelectionViewControllerDelegate {
    func ethnicitySelectionViewController(_ viewController: EthnicitySelectionViewController, didSelectEthnicity ethnicity: Ethnicity?) {
        datas[Section.ethnicity] = ethnicity
        reloadSection(Section.ethnicity)
    }
}

extension ViewController: GenderSelectionViewControllerDelegate {
    func genderSelectionViewController(_ viewController: GenderSelectionViewController, didSelectGender gender: Gender?) {
        datas[Section.gender] = gender
        reloadSection(Section.gender)
    }
}

extension ViewController: HobbySelectionViewControllerDelegate {
    func hobbySelectionViewController(_ viewController: HobbySelectionViewController, didSelectHobbies hobbies: [Hobby]) {
        datas[Section.hobbies] = Hobbies(hobbies: hobbies)
        reloadSection(Section.hobbies)
    }
}

extension ViewController: RelationshipStatusSelectionViewControllerDelegate {
    func relationshipStatusSelectionViewController(_ viewController: RelationshipStatusSelectionViewController, didSelectRelationshipStatus status: RelationshipStatus?) {
        datas[Section.relationShipStatus] = status
        reloadSection(Section.relationShipStatus)
    }
}
