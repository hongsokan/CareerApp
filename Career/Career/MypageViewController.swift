//
//  MypageViewController.swift
//  Career
//
//  Created by 안홍석 on 2020/06/29.
//  Copyright © 2020 안홍석. All rights reserved.
//

import UIKit

class MypageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        image.backgroundColor = .gray
        return image
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
        
        self.setViews()
    }
    
    func setViews() {
        self.view.addSubview(self.imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
            make.height.equalTo(self.imageView.snp.width)
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
