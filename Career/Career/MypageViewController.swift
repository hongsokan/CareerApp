//
//  MypageViewController.swift
//  Career
//
//  Created by 안홍석 on 2020/06/29.
//  Copyright © 2020 안홍석. All rights reserved.
//

import UIKit

class MypageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
    
    let resumeButton: UIButton = {
        let button = UIButton()
        button.setTitle("my resume", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.systemIndigo, for: .highlighted)
        button.addTarget(self, action: #selector(clickResumeButton), for: .touchUpInside)
        return button
    }()
    
    let introButton: UIButton = {
        let button = UIButton()
        button.setTitle("my introduction", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.systemIndigo, for: .highlighted)
        button.addTarget(self, action: #selector(clickIntroButton), for: .touchUpInside)
        return button
    }()
    
    lazy var picker: UIImagePickerController = {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary // 방식 선택. 앨범에서 가져오는걸로 선택.
        picker.allowsEditing = false // 수정가능하게 할지 선택. 하지만 false
        picker.delegate = self // picker delegate
        return picker
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(pickImage))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = "My Page"
        
        self.setViews()
    }
    
    
    func setViews() {
        
        // imageView
        self.view.addSubview(self.imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(8)
            make.leading.equalTo(view).offset(8)
            make.trailing.equalTo(view.snp.centerX).offset(-8)
            make.height.equalTo(self.imageView.snp.width)
        }
        
        // userName UILabel
        self.view.addSubview(self.userName)
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(imageView.snp.centerY).offset(-8)
            make.leading.equalTo(imageView.snp.trailing).offset(8)
            make.trailing.equalTo(view).offset(-8)
            make.height.equalTo(24)
        }
        
        // my resume UIButton
        self.view.addSubview(self.resumeButton)
        resumeButton.translatesAutoresizingMaskIntoConstraints = false
        resumeButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(imageView.snp.bottom).offset(16)
            make.leading.equalTo(view.snp.centerX).multipliedBy(0.2)
            make.trailing.equalTo(view.snp.centerX)
            make.height.equalTo(32)
        }
        
        // my introduction UIButton
        self.view.addSubview(self.introButton)
        introButton.translatesAutoresizingMaskIntoConstraints = false
        introButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(resumeButton.snp.bottom).offset(16)
            make.leading.equalTo(view.snp.centerX).multipliedBy(0.2)
            make.trailing.equalTo(view.snp.centerX)
            make.height.equalTo(32)
        }
    }
    
    @objc func pickImage() {
        self.present(self.picker, animated: true, completion: nil)
    }
    
    // MARK: imagePicker 델리데이트
    // 취소하면 모달 dismiss
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // 선택하면
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.image = originalImage
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: Methods
    
    @objc func clickResumeButton() {
        
    }
    
    @objc func clickIntroButton() {
        
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
