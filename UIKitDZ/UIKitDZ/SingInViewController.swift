//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 22.09.2022.
//

import UIKit
/// Контроллер входа в приложение
final class SingInViewController: UIViewController {

    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let imageLabel = UILabel()
    private let emailLabel = UILabel()
    private let passwordLabel = UILabel()
    private let singInButton = UIButton(type: .roundedRect)
    private let singInImage = UIImage(systemName: "icloud.fill")
    private var singInImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allMetod()
    }
    
    private func createImageView() {
        singInImageView.frame = CGRect(x: 126, y: 83, width: 162, height: 119)
        singInImageView.tintColor = .systemGray2
        singInImageView.image = singInImage
        view.addSubview(singInImageView)
     }
    
    private func createButton() {
        singInButton.frame = CGRect(x: 79, y: 691, width: 257, height: 48)
        singInButton.setTitle("Войти", for: .normal)
        singInButton.tintColor = .white
        singInButton.backgroundColor = .link
        singInButton.layer.cornerRadius = 10
        singInButton.layer.borderWidth = 1
        singInButton.layer.masksToBounds = true
        singInButton.addTarget(self, action: #selector(singInAction(parametrSender:)),
                               for: .touchUpInside)
        view.addSubview(singInButton)
    }
    
    private func createLabel() {
        imageLabel.frame = CGRect(x: 182, y: 143, width: 50, height: 21)
        imageLabel.textAlignment = .center
        imageLabel.text = "Bringo"
        imageLabel.textColor = .link
        view.addSubview(imageLabel)
        
        emailLabel.frame = CGRect(x: 55, y: 359, width: 41, height: 21)
        emailLabel.textAlignment = .left
        emailLabel.text = "Email"
        emailLabel.textColor = .link
        view.addSubview(emailLabel)
        
        passwordLabel.frame = CGRect(x: 55, y: 479, width: 74, height: 21)
        passwordLabel.textAlignment = .left
        passwordLabel.text = "Password"
        passwordLabel.textColor = .link
        view.addSubview(passwordLabel)
    }
    
    private func createTextField() {
        emailTextField.frame = CGRect(x: 55, y: 388, width: 304, height: 34)
        emailTextField.keyboardType = .numberPad
        emailTextField.placeholder = "+79000000000"
        view.addSubview(emailTextField)
        
        passwordTextField.frame = CGRect(x: 55, y: 508, width: 304, height: 34)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = "password"
        view.addSubview(passwordTextField)
    }
    
    private func allMetod() {
        createImageView()
        createButton()
        createLabel()
        createTextField()
    }
    
    @objc private func singInAction(parametrSender: Any) {
            let foodSelectVC = FoodSelectViewController()
            let navigationController = UINavigationController(rootViewController: foodSelectVC)
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: false)
    }
}
