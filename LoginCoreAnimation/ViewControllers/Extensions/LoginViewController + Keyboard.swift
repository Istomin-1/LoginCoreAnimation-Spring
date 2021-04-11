//
//  LoginViewController + AddButton.swift
//  LoginCoreAnimation
//
//  Created by Mikhail on 10.04.2021.
//

import UIKit

// MARK: - KeyboardCustomization
extension LoginViewController {
    func addDoneButtonTo() {
        let keyboardToolbar = UIToolbar()
        let doneButton = UIBarButtonItem(title:"Cancel",
                                         style: .done,
                                         target: self,
                                         action: #selector(didTapDone))
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)
        keyboardToolbar.setItems([flexBarButton, doneButton], animated: true)
        keyboardToolbar.sizeToFit()
        
        loginTextField.inputAccessoryView = keyboardToolbar
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    @objc func kbWillShow(_ notification: Notification) {
        let userInfo = notification.userInfo
        let keyboardValue = userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        scrollView.contentOffset = CGPoint(x: 0, y: keyboardScreenEndFrame.height * 0.25)
    }
    
    @objc func kbWillHide() {
        scrollView.contentOffset = CGPoint.zero
    }
    
    func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

