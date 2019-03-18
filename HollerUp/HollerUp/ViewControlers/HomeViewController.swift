//
//  HomeViewController.swift
//  HollerUp
//
//  Created by Vamsi on 08/03/19.
//  Copyright © 2019 iOSDevelopers. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var professionLbl: UILabel!
    @IBOutlet weak var experienceLbl: UILabel!
    @IBOutlet weak var setAvailablitySwitch: UISwitch!
    @IBOutlet weak var onlineStatusLbl: UILabel!
    @IBOutlet weak var setAvailabiltyBgView: UIView!
    @IBOutlet weak var graphView: GraphView!
    @IBOutlet weak var detailsViewInView: UIView!
    
    var dataSource = [[QUATER_TITLE:"Q1",
                       AMOUNT:"1000",
                       DURATION:"100",
                       MONTH:"Jan-Mar"],
                      [QUATER_TITLE:"Q2",
                       AMOUNT:"2000",
                       DURATION:"200",
                       MONTH:"Apr-Jun"],
                      [QUATER_TITLE:"Q3",
                       AMOUNT:"3000",
                       DURATION:"300",
                       MONTH:"July-Sep"],
                      [QUATER_TITLE:"Q4",
                       AMOUNT:"4000",
                       DURATION:"400",
                       MONTH:"Oct-Dec"]] as [AnyObject]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.updateUI()
    }
    //MARK:- Update UI
    func updateUI(){
        self.detailsViewInView.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.lightGray, radius: 2.0, opacity: 0.35 ,cornerRadius : 0)
        self.setAvailablitySwitch.onTintColor = .themeColor
        self.setAvailablitySwitch.tintColor = .redColor
        self.setAvailablitySwitch.thumbTintColor = .whiteColor
        self.setAvailablitySwitch.backgroundColor = .secondaryColor1
        self.setAvailablitySwitch.layer.cornerRadius = self.setAvailablitySwitch.bounds.height / 2
        self.graphView.dataReceived = self.dataSource
        TheGlobalPoolManager.cornerAndBorder(self.setAvailabiltyBgView, cornerRadius: 0, borderWidth: 0.5, borderColor: .lightGray)
    }
    //MARK:- IB Action Outlets
}
extension UIView {
    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float , cornerRadius : CGFloat) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.cornerRadius = cornerRadius
        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
    }
}
