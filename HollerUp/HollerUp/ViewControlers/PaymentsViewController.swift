//
//  PaymentsViewController.swift
//  HollerUp
//
//  Created by Vamsi on 08/03/19.
//  Copyright © 2019 iOSDevelopers. All rights reserved.
//

import UIKit

class PaymentsViewController: UIViewController {

    @IBOutlet weak var headerTitleLbl: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.register(UINib(nibName: TableViewCellIdentifiers.PaymentCell, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifiers.PaymentCell)
        self.tableView.register(UINib(nibName: TableViewCellIdentifiers.PaymentHeaderCell, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifiers.PaymentHeaderCell)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.updateUI()
    }
    //MARK:- Update UI
    func updateUI(){
        self.tableView.tableFooterView = UIView()
        self.segmentControl.setTitleTextAttributes([NSAttributedStringKey.font: UIFont.appFont(.Bold)],for: .normal)
    }
    //MARK:- IB Action Outlets
    @IBAction func segmentControl(_ sender: Any) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            self.tableView.reloadData()
        case 1:
            self.tableView.reloadData()
        default:
            break
        }
    }
}
extension PaymentsViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifiers.PaymentHeaderCell) as! PaymentHeaderCell
            cell.selectionStyle = .none
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifiers.PaymentCell) as! PaymentCell
            cell.selectionStyle = .none
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return  UIDevice.isPhone() ? 80 : 100
        }
        return  UIDevice.isPhone() ? 100 : 120
    }
}
