//
//  AddCalendarEvent.swift
//  HollerUp
//
//  Created by Vamsi on 27/03/19.
//  Copyright © 2019 iOSDevelopers. All rights reserved.
//

import UIKit
import EZSwiftExtensions
import PopOverMenu


class AddCalendarEvent: UIViewController,UIAdaptivePresentationControllerDelegate {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var emailHeaderLbl: UILabel!
    @IBOutlet weak var eventNameTF: UITextField!
    @IBOutlet weak var fromDateTF: UITextField!
    @IBOutlet weak var fromTimeTF: UITextField!
    @IBOutlet weak var toDateTF: UITextField!
    @IBOutlet weak var toTimeTF: UITextField!
    @IBOutlet weak var showAsTF: UITextField!
    @IBOutlet weak var dropDownBtn: UIButton!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet var viewsInView: [UIView]!
    @IBOutlet weak var fromDatePickerBtn: UIButton!
    @IBOutlet weak var toDatePickerBtn: UIButton!
    
    let popOverViewController = PopOverViewController.instantiate()
    var titles:[String] = ["Busy","Invisible","None"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.updateUI()
    }
    //MARK:- Update UI
    func updateUI(){
        for view in viewsInView{
            view.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black, radius: 3.0, opacity: 0.35 ,cornerRadius : 10)
        }
        self.doneBtn.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black, radius: 3.0, opacity: 0.35 ,cornerRadius : 10)
    }
    //MARK:- IB Action Outlets
    @IBAction func backBtn(_ sender: UIButton) {
        ez.topMostVC?.popVC()
    }
    @IBAction func dropDownBtn(_ sender: UIButton) {
        //POP MENU
        self.popOverViewController.setTitles(titles)
        self.popOverViewController.setSeparatorStyle(UITableViewCellSeparatorStyle.singleLine)
        self.popOverViewController.popoverPresentationController?.sourceView = sender
        self.popOverViewController.popoverPresentationController?.sourceRect = sender.bounds
        self.popOverViewController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.up
        self.popOverViewController.preferredContentSize = CGSize(width: 120, height: 120)
        self.popOverViewController.presentationController?.delegate = self
        ez.runThisInMainThread {
            self.popOverViewController.completionHandler = { selectRow in
                print(self.titles[selectRow])
                self.showAsTF.text = self.titles[selectRow]
            }
        }
        self.present(self.popOverViewController, animated: true, completion: nil)
    }
    @IBAction func doneBtn(_ sender: UIButton) {
    }
}
extension AddCalendarEvent{
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
}
extension AddCalendarEvent{
    @IBAction func fromDatePickerBtn(_ sender: UIButton) {
    }
    @IBAction func toDatePickerBtn(_ sender: UIButton) {
    }
}
