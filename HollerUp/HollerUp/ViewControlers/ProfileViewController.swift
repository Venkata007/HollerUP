//
//  ProfileViewController.swift
//  HollerUp
//
//  Created by Vamsi on 08/03/19.
//  Copyright © 2019 iOSDevelopers. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editBtn: UIButton!
    
    var titleArray = ["Mobile","Email ID","Bank Account Details","Address","Documents"]
    var detailsArray = ["+91 9533565007","vamsi@gmail.com","ICICI Bank","Madinaguda"," 4 Documents"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         self.tableView.register(UINib(nibName: TableViewCellIdentifiers.NameCell, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifiers.NameCell)
        self.tableView.register(UINib(nibName: TableViewCellIdentifiers.DetailsCell, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifiers.DetailsCell)
        self.tableView.register(UINib(nibName: TableViewCellIdentifiers.ProfileDetailsCell, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifiers.ProfileDetailsCell)
        self.tableView.register(UINib(nibName: TableViewCellIdentifiers.LogoutCell, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifiers.LogoutCell)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.updateUI()
    }
    //MARK:- Update UI
    func updateUI(){
        self.tableView.tableFooterView = UIView()
        self.editBtn.setImage(#imageLiteral(resourceName: "Edit").withColor(.whiteColor), for: .normal)
    }
    //MARK:- IB Action Outlets
    @IBAction func editBtn(_ sender: UIButton) {
    }
}
extension ProfileViewController: UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifiers.NameCell) as! NameCell
            cell.selectionStyle = .none
            return cell
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifiers.DetailsCell) as! DetailsCell
            cell.selectionStyle = .none
            return cell
        }else if indexPath.section == 7{
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifiers.LogoutCell) as! LogoutCell
            cell.selectionStyle = .none
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifiers.ProfileDetailsCell) as! ProfileDetailsCell
            cell.selectionStyle = .none
            cell.titleLbl.text = titleArray[indexPath.section - 2]
            cell.contentLbl.text = detailsArray[indexPath.section - 2]
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 70
        }else if indexPath.section == 1{
            return UITableViewAutomaticDimension
        }
        return 50
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1{
            return 10
        }else if section == 2{
            return 20
        }
        return 0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
}
