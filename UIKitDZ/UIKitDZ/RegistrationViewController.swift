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
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var surnameTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    // MARK: - Private Propertys
    private let defaults = UserDefaults.standard
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        allMethod()
    }
    
    // MARK: - IBAction
    @IBAction private func registrationAction(_ sender: Any) {
        let username = emailTextField.text ?? ""
        if !username.isEmpty {
            UserDefaults.standard.set(username, forKey: "emailTextField")
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let singInVC = storyboard.instantiateViewController(withIdentifier: "SingInVC")
                as? SingInViewController else { return }
        singInVC.modalPresentationStyle = .fullScreen
        show(singInVC, sender: nil)
    }
    
    // MARK: - Private Methods
    private func transitionTextField() {
        nameTextField.delegate = self
        surnameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
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
        defaults.string(forKey: "emailTextField")
    }
}

// MARK: - UITextFieldDelegate
extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextField:
            surnameTextField.becomeFirstResponder()
        case surnameTextField:
            emailTextField.becomeFirstResponder()
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            passwordTextField.resignFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return false
    }
}
