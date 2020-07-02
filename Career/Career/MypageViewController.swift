//
//  MypageViewController.swift
//  Career
//
//  Created by 안홍석 on 2020/06/29.
//  Copyright © 2020 안홍석. All rights reserved.
//

import UIKit

class MypageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()
    
    var imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        return image
    }()
    
    func touchUpSelectImageButton(_ sender: UIButton) {
        self.present(self.imagePicker, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white
        
        self.setConstraint()
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
    
    func setConstraint() {
        self.view.addSubview(imageView)

        // imageView 레이아웃
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
            make.height.equalTo(imageView.snp.width)
        }
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
