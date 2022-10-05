//
//  SingInViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 04.10.2022.
//

import UIKit
/// Контроллер входа в приложение
final class SingInViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Private Properties
    private var key = ""
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        transitionTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        key = UserDefaults.standard.string(forKey: "emailTextField") ?? ""
    }

    // MARK: - IBAction
    @IBAction func singInButton(_ sender: Any) {
        if emailTextField.text == key {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let restoranVC = storyboard.instantiateViewController(withIdentifier: "RestoranVC")
                    as? RestoranViewController else { return }
            restoranVC.modalPresentationStyle = .fullScreen
            show(restoranVC, sender: nil)
        }
        print("\(key)")
    }
    
    @IBAction func registrationButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let registrationVC = storyboard.instantiateViewController(withIdentifier: "RegistrationVC")
                as? RegistrationViewController else { return }
        registrationVC.modalPresentationStyle = .fullScreen
        show(registrationVC, sender: nil)
    }
    
    // MARK: - Private Methods
    func transitionTextField() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
}

// MARK: - UITextFieldDelegate
extension SingInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
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
