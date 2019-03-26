//
//  LoginViewController.swift
//  HollerUp
//
//  Created by Vamsi on 22/03/19.
//  Copyright © 2019 iOSDevelopers. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var viewInView: UIView!
    @IBOutlet weak var emailViewInView: UIView!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordViewInView: UIView!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var forgotPasswordBtn: UIButton!
    @IBOutlet weak var needHelpBtn: UIButton!
    @IBOutlet weak var signInBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.updateUI()
    }
    //MARK:- Update UI
    func updateUI(){
        self.viewInView.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black, radius: 3.0, opacity: 0.35 ,cornerRadius : 15)
         self.emailViewInView.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black, radius: 3.0, opacity: 0.35 ,cornerRadius : 10)
         self.passwordViewInView.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black, radius: 3.0, opacity: 0.35 ,cornerRadius : 10)
         self.signInBtn.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black, radius: 3.0, opacity: 0.35 ,cornerRadius : 10)
    }
    //MARK:- IB Action Outlets
    @IBAction func forgotPasswordBtn(_ sender: Any) {
        if let viewCon = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerIDs.ForgotPasswordVC) as? ForgotPasswordVC{
            self.navigationController?.pushViewController(viewCon, animated: true)
        }
    }
    @IBAction func needHelpBtn(_ sender: Any) {
    }
    @IBAction func signInBtn(_ sender: Any) {
        if validate(){
            
        }
    }
}
extension LoginViewController{
    //MARK:- Validation
    func validate() -> Bool{
        if (self.emailTF.text?.isEmpty)!{
            TheGlobalPoolManager.showToastView(ToastMessages.Invalid_Email)
            return false
        }else if (self.passwordTF.text?.isEmpty)!{
            TheGlobalPoolManager.showToastView(ToastMessages.Invalid_Password)
            return false
        }
        return true
    }
}
