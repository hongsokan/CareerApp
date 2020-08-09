//
//  MypageViewController.swift
//  Career
//
//  Created by 안홍석 on 2020/06/29.
//  Copyright © 2020 안홍석. All rights reserved.
//

import UIKit


class MypageViewController: UIViewController {
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        image.backgroundColor = .gray
        return image
    }()
    
    let userName: UILabel = {
        let name = UILabel()
        name.text = "user name"
        name.textAlignment = .center
        return name
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
//        button.setTitle("Login", for: .normal)
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .systemGray
        button.addTarget(self, action: #selector(loginPopup(_:)), for: .touchUpInside)
        return button
    }()
    
    let introTitle: UITextField = {
        let field = UITextField()
        field.allowsEditingTextAttributes = true
        //        field.backgroundColor = .systemBlue
        field.text = "자기소개 (제목)"
        return field
    }()
    
    let introField: UITextField = {
        let field = UITextField()
        field.allowsEditingTextAttributes = true
        //        field.backgroundColor = .systemBlue
        field.text = "자기소개 (내용)"
        return field
    }()
    
    /*
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("add", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.systemIndigo, for: .highlighted)
//        button.addTarget(self, action: #selector(addButton), for: .touchUpInside)
        return button
    }()
    
    let deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("delete", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.systemIndigo, for: .highlighted)
//        button.addTarget(self, action: #selector(deleteButton), for: .touchUpInside)
        return button
    }()
    */
    
    lazy var picker: UIImagePickerController = {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary // 방식 선택. 앨범에서 가져오는걸로 선택.
        picker.allowsEditing = false // 수정가능하게 할지 선택. 하지만 false
        picker.delegate = self // picker delegate
        return picker
    }()
    
    let popupVC = LoginPopupViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(pickImage))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationItem.title = "My Page"
        
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


extension MypageViewController {
    
    // MARK: Views
    func setConstraint() {
        
        // imageView
        self.view.addSubview(self.imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(8)
            make.leading.equalTo(view).offset(8)
            make.trailing.equalTo(view.snp.centerX).offset(-8)
            make.height.equalTo(self.imageView.snp.width)
        }
        imageView.layer.cornerRadius = 50
        imageView.layer.masksToBounds = true
        
        // userName UILabel
        self.view.addSubview(self.userName)
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(imageView.snp.centerY).offset(-8)
            make.leading.equalTo(imageView.snp.trailing).offset(8)
            make.trailing.equalTo(view).offset(-8)
            make.height.equalTo(24)
        }
        
        // loginButton UIButton
        self.view.addSubview(self.loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(userName.snp.bottom).offset(8)
            make.leading.equalTo(imageView.snp.trailing).offset(8)
            make.trailing.equalTo(view).offset(-8)
            make.height.equalTo(24)
        }
        
        
        // introTitle UITextField
        self.view.addSubview(self.introTitle)
        introTitle.translatesAutoresizingMaskIntoConstraints = false
        introTitle.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(imageView.snp.bottom).multipliedBy(1.1)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.centerX)
            make.bottom.equalTo(imageView.snp.bottom).multipliedBy(1.3)
        }
        introTitle.borderStyle = .roundedRect
        
        // introField UITextField
        self.view.addSubview(self.introField)
        introField.translatesAutoresizingMaskIntoConstraints = false
        introField.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(introTitle.snp.bottom).multipliedBy(1.05)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo((self.tabBarController?.tabBar.snp.top)!)
        }
        introField.borderStyle = .roundedRect
        
        
        /*
        // add UIButton
        self.view.addSubview(self.addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(introTitle.snp.top)
            make.leading.equalTo(view.snp.centerX)
            make.trailing.equalTo(view.snp.trailing)
            make.height.equalTo(introTitle.snp.bottom)
        }
        
        // delete UIButton
        self.view.addSubview(self.deleteButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(imageView.snp.bottom).multipliedBy(1.1)
            make.leading.equalTo(self.addButton.snp.trailing)
            make.trailing.equalTo(self.addButton.snp.trailing).multipliedBy(1.2)
            make.height.equalTo(32)
        }
        */
    }
    
}


extension MypageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: imagePicker Method
    @objc func pickImage() {
        self.present(self.picker, animated: true, completion: nil)
    }
    
    // MARK: imagePicker 델리데이트
    // 취소하면 모달 dismiss
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // 선택 화면
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.image = originalImage
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
}


extension MypageViewController {
    
    // MARK: TextField Keyboard Event (다른 곳 터치하면 키보드 내려가게)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    // MARK: Login (Popup)
    @objc func loginPopup(_ sender: UIButton) {
        popupVC.modalPresentationStyle = .overCurrentContext
        self.present(popupVC, animated: true, completion: nil)
    }
    
    
    
}
