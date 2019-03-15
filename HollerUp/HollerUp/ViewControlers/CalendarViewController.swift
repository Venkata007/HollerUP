//
//  CalendarViewController.swift
//  HollerUp
//
//  Created by Vamsi on 08/03/19.
//  Copyright © 2019 iOSDevelopers. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {

    @IBOutlet weak var calendarViewInView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: TableViewCellIdentifiers.AppointmentCell, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifiers.AppointmentCell)
        self.updateUI()
    }
    //MARK:- Update UI
    func updateUI(){
         self.tableView.tableFooterView = UIView()
    }
    //MARK:- IB Action Outlets
}
extension CalendarViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
            if cell == nil{
                cell = UITableViewCell.init(style: .default, reuseIdentifier: "Cell")
            }
            cell?.textLabel?.text = "Upcoming Appointments"
            cell?.textLabel?.font = UIFont.appFont(.Bold, size: 20)
            cell?.textLabel?.textColor = .themeColor
            return cell!
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifiers.AppointmentCell) as! AppointmentCell
            cell.selectionStyle = .none
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 30
        }
        return 100
    }
}
