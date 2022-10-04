//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 22.09.2022.
//

import UIKit
/// Контроллер регистрации нового пользователя
final class RegistrationViewController: UIViewController {
 
    // MARK: - IBOutlet
    
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var userSurnameTextField: UITextField!
    @IBOutlet private weak var userEmailTextField: UITextField!
    @IBOutlet private weak var userPasswordTextField: UITextField!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        allMethod()
    }
    
    // MARK: - Private Methods
    private func transitionTextField() {
        userNameTextField.delegate = self
        userSurnameTextField.delegate = self
        userEmailTextField.delegate = self
        userPasswordTextField.delegate = self
    }
    
    private func notificationKeyboard() {
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillShowNotification,
            object: nil, queue: nil) { _ in
                self.view.frame.origin.y = -100
            }
        
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil, queue: nil) { _ in
                self.view.frame.origin.y = 0.0
            }
    }
    
    private func allMethod() {
        transitionTextField()
        notificationKeyboard()
    }
    
    // MARK: - objc Private Methods
}

// MARK: - UITextFieldDelegate
extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case textField where textField == userNameTextField: userSurnameTextField.becomeFirstResponder()
        case textField where textField == userSurnameTextField: userEmailTextField.becomeFirstResponder()
        case textField where textField == userEmailTextField: userPasswordTextField.becomeFirstResponder()
        case textField where textField == userPasswordTextField: userPasswordTextField.resignFirstResponder()
        default: break
        }
        return true
    }
}
