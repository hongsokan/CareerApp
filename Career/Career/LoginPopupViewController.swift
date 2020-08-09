//
//  LoginPopupViewController.swift
//  Career
//
//  Created by 안홍석 on 2020/08/08.
//  Copyright © 2020 안홍석. All rights reserved.
//

import UIKit

class LoginPopupViewController: UIViewController {

    // UIView
    let popupView: UIView = {
        let view: UIView = UIView()
//        view.backgroundColor = .black
        return view
    }()
    
    // Email, Password TextField
    let emailLabel: UILabel = {
        let lable: UILabel = UILabel()
        lable.text = "email"
        lable.textColor = .black
        lable.textAlignment = .center
        return lable
    }()
    
    let emailField: UITextField = {
        let field: UITextField = UITextField()
        
        return field
    }()
    
    let passwordLabel: UILabel = {
        let lable: UILabel = UILabel()
        lable.text = "password"
        lable.textColor = .black
        lable.textAlignment = .center
        return lable
    }()
    
    let passwordField: UITextField = {
        let field: UITextField = UITextField()
        
        return field
    }()
    
    // SignIn, Cancel UIButton
    let signinButton: UIButton = {
        let button: UIButton = UIButton()
        
        return button
    }()
    
    let cancelButton: UIButton = {
        let button: UIButton = UIButton()
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setConstraint()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



extension LoginPopupViewController {
    
    // MARK: Views
    func setConstraint() {
        
        // popupView UIView
        self.view.addSubview(self.popupView)
        popupView.translatesAutoresizingMaskIntoConstraints = false
        popupView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view.snp.centerY).multipliedBy(0.8)
            make.leading.equalTo(view.snp.centerX).multipliedBy(0.2)
            make.trailing.equalTo(view.snp.centerX).multipliedBy(1.8)
            make.bottom.equalTo(view.snp.bottom).multipliedBy(0.8)
        }
        
        // TextField
        // TextField
        
        /*
        // userName UILabel
        self.view.addSubview(self.userName)
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(imageView.snp.centerY).offset(-8)
            make.leading.equalTo(imageView.snp.trailing).offset(8)
            make.trailing.equalTo(view).offset(-8)
            make.height.equalTo(24)
        }   */
    }
    
    
}
