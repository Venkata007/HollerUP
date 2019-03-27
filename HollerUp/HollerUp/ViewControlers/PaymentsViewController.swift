//
//  PaymentsViewController.swift
//  HollerUp
//
//  Created by Vamsi on 08/03/19.
//  Copyright © 2019 iOSDevelopers. All rights reserved.
//

import UIKit
import EZSwiftExtensions

class PaymentsViewController: UIViewController,SCPopDatePickerDelegate{

    @IBOutlet weak var headerTitleLbl: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewStatementViewInView: UIView!
    @IBOutlet weak var totalEarningsBgView: UIView!
    @IBOutlet weak var datesBgView: UIView!
    @IBOutlet weak var viewStatementViewInViewHeight: NSLayoutConstraint!
    @IBOutlet weak var fromDatePickerBtn: UIButton!
    @IBOutlet weak var toDatePickerPtn: UIButton!
    
    let datePicker = SCPopDatePicker()
    var selectedBtn : String!
    let date = Date()
    var startTime : String!
    var endTime : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.register(UINib(nibName: TableViewCellIdentifiers.PaymentCell, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifiers.PaymentCell)
        self.tableView.register(UINib(nibName: TableViewCellIdentifiers.PaymentHeaderCell, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifiers.PaymentHeaderCell)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.updateUI()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    //MARK:- Update UI
    func updateUI(){
        self.viewStatementViewInView.isHidden = true
        TheGlobalPoolManager.cornerAndBorder(fromDatePickerBtn, cornerRadius: 8, borderWidth: 1, borderColor: .lightGray)
        TheGlobalPoolManager.cornerAndBorder(toDatePickerPtn, cornerRadius: 8, borderWidth: 1, borderColor: .lightGray)
        ez.runThisInMainThread {
            self.totalEarningsBgView.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black, radius: 3.0, opacity: 0.35 ,cornerRadius : 8)
            self.datesBgView.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black, radius: 3.0, opacity: 0.35 ,cornerRadius : 8)
        }
        self.tableView.tableFooterView = UIView()
        self.segmentControl.setTitleTextAttributes([NSAttributedStringKey.font: UIFont.appFont(.Bold)],for: .normal)
    }
    //MARK:- IB Action Outlets
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            ez.runThisInMainThread {
                self.viewStatementViewInViewHeight.constant = 0
                self.viewStatementViewInView.isHidden = true
            }
            self.tableView.reloadData()
        case 1:
            self.viewStatementViewInViewHeight.constant =  UIDevice.isPhone() ? 95 :120
            self.viewStatementViewInView.isHidden = false
            self.tableView.reloadData()
        default:
            break
        }
    }
}
extension PaymentsViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            return 7
        case 1:
            return 6
        default:
            break
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            if indexPath.row == 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifiers.PaymentHeaderCell) as! PaymentHeaderCell
                cell.selectionStyle = .none
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifiers.PaymentCell) as! PaymentCell
                cell.selectionStyle = .none
                return cell
            }
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifiers.PaymentCell) as! PaymentCell
            cell.selectionStyle = .none
            return cell
        default:
            break
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if segmentControl.selectedSegmentIndex == 0{
            if indexPath.row == 0{
                return  UIDevice.isPhone() ? 80 : 100
            }
            return  UIDevice.isPhone() ? 100 : 120
        }else{
             return  UIDevice.isPhone() ? 100 : 120
        }
    }
}
extension PaymentsViewController{
    @IBAction func fromDatePickerBtn(_ sender: UIButton) {
        self.view.endEditing(true)
        selectedBtn = "Start"
        self.datePickerView()
    }
    @IBAction func toDatePickerBtn(_ sender: UIButton) {
        self.view.endEditing(true)
        selectedBtn = "End"
        self.datePickerView()
    }
    func datePickerView(){
        self.datePicker.tapToDismiss = true
        self.datePicker.datePickerType = SCDatePickerType.date
        self.datePicker.showBlur = true
        self.datePicker.datePickerStartDate = self.date
        self.datePicker.btnFontColour = UIColor.white
        self.datePicker.btnColour = .themeColor
        self.datePicker.showCornerRadius = false
        self.datePicker.delegate = self
        self.datePicker.show(attachToView: self.view)
    }
    //MARK : - Gertting Age  based on DOB
    func scPopDatePickerDidSelectDate(_ date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY"
        dateFormatter.timeZone = NSTimeZone.init(abbreviation: "UTC")! as TimeZone
        let strDate = dateFormatter.string(from: (date))
        print(strDate)
        if selectedBtn == "Start"{
            fromDatePickerBtn.setTitle(strDate, for: .normal)
            startTime = strDate
        }
        else{
            toDatePickerPtn.setTitle(strDate, for: .normal)
            endTime = strDate
        }
    }
}
