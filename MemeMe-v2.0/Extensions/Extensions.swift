//
//  Extensions.swift
//  MemeMe-v1.0
//
//  Created by Herbert Dodge on 7/9/20.
//  Copyright © 2020 Herbert Dodge. All rights reserved.
//

import UIKit

//MARK: - UIViewController Helpers

extension UIViewController {
    func configureNavigationBar(withTitle title: String) {
        navigationController?.navigationBar.topItem?.title = title
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}

//MARK: - UIView Helpers
extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }

}

//MARK: - UITableView Helpers
extension UITableView {
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}

//MARK: - UIImagePickerDelegate

extension CreateMemeVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imagePickerView.image = image
            
        }
        
        self.shareButton.isEnabled = true
        self.dismiss(animated: true, completion: nil)
        
    }
}

//MARK: - UITextfieldDelegate
extension CreateMemeVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}


//MARK: - KeyboardNotificationObservers & Helpers

extension CreateMemeVC {
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func getKeyboardHeight(_ notification: Notification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
        
        return keyboardSize.cgRectValue.height
    }
}
