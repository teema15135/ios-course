//
//  ViewController.swift
//  ios-course
//
//  Created by odds on 28/12/2562 BE.
//  Copyright © 2562 odds. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var newLabelName: UILabel!
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var foodImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

//        addListener to non-action view
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectPhotoFromLibrary(_:)))
        foodImageView.addGestureRecognizer(tapGesture)
        
//        Like addListener; self === this
        firstTextField.delegate = self
        secondTextField.delegate = self
    }

    @IBAction func onClickSetLabelFromText(_ sender: Any) {
        newLabelName.text = firstTextField.text
    }
    
    @objc func selectPhotoFromLibrary(_ sender: UITapGestureRecognizer) {
        print("Tapped on image")
        let controller = UIImagePickerController()
        controller.delegate = self
        
//        Normally on iOS13 image picker will show non-fullscreen
        controller.modalPresentationStyle = .fullScreen

        present(controller, animated: true, completion: nil)
    }
}

// MARK: - UiTextFieldDelegate
extension ViewController: UITextFieldDelegate {
    
//    Like implement method onClick
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == secondTextField) {
            newLabelName.text = "Second Done"
        } else if (textField == firstTextField) {
            onClickSetLabelFromText(textField)
        }
        return true
    }
    
}

// MARK: - UIImagePickerControllerDelegate
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("Image selected")
        
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("พังเว้ยยยยย")
        }
        
        foodImageView.image = selectedImage
        
        dismiss(animated: true, completion: nil)
        return
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Image select canceled")
        dismiss(animated: true, completion: nil)
        return
    }
}
