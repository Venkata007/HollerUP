//
//  ProfessionalDetailsVC.swift
//  HollerUp
//
//  Created by Vamsi on 28/03/19.
//  Copyright © 2019 iOSDevelopers. All rights reserved.
//

import UIKit

class ProfessionalDetailsVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var professionTF: UITextField!
    @IBOutlet weak var departmentTF: UITextField!
    @IBOutlet weak var experienceTF: UITextField!
    @IBOutlet weak var certificationTF: UITextField!
    
    var selectedImage :UIImage!
    var selectedImageBase64String : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.updateUI()
    }
    //MARK:- Update UI
    func updateUI(){
        professionTF.setBottomBorder()
        departmentTF.setBottomBorder()
        experienceTF.setBottomBorder()
        certificationTF.setBottomBorder()
    }
    //MARK:- IB Action Outlets
}
class DocumentsCell : UITableViewCell{
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var deleteBtn: UIButton!
}
class AddNewCell : UITableViewCell{
    @IBOutlet weak var addNewBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        TheGlobalPoolManager.cornerAndBorder(addNewBtn, cornerRadius: 0, borderWidth: 1, borderColor: .themeColor)
        self.addNewBtn.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black, radius: 3.0, opacity: 0.35 ,cornerRadius : 10)
    }
}
class SaveButtonCell : UITableViewCell{
    @IBOutlet weak var saveBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.saveBtn.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black, radius: 3.0, opacity: 0.35 ,cornerRadius : 10)
    }
}
extension ProfessionalDetailsVC: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifiers.AddNewCell) as! AddNewCell
            return cell
        }else if indexPath.row == 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifiers.SaveButtonCell) as! SaveButtonCell
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifiers.DocumentsCell) as! DocumentsCell
            cell.titleLbl.text = "Document 0\(indexPath.row + 1)"
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 4{
            return 70
        }else if indexPath.row == 5{
            return 100
        }else{
           return 40
        }
    }
}
extension ProfessionalDetailsVC{
    
}
