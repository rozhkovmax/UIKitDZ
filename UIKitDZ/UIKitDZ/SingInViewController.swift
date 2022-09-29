//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 22.09.2022.
//

import UIKit
/// Контроллер входа в приложение
final class SingInViewController: UIViewController {

    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let imageLabel = UILabel()
    let emailLabel = UILabel()
    let passwordLabel = UILabel()
    let singInButton = UIButton(type: .roundedRect)
    let singInImage = UIImage(systemName: "icloud.fill")
    var singInImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allMetod()
    }
    
    func createImage() {
        singInImageView.frame = CGRect(x: 126, y: 83, width: 162, height: 119)
        singInImageView.tintColor = .systemGray2
        singInImageView.image = singInImage
        view.addSubview(singInImageView)
     }
    
    func createButton() {
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
    
    func createLabel() {
        imageLabel.frame = CGRect(x: 182, y: 133, width: 50, height: 21)
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
    
    func createTextField() {
        emailTextField.frame = CGRect(x: 55, y: 388, width: 304, height: 34)
        emailTextField.borderStyle = .roundedRect
        emailTextField.keyboardType = .numberPad
        view.addSubview(emailTextField)
        
        passwordTextField.frame = CGRect(x: 55, y: 508, width: 304, height: 34)
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        view.addSubview(passwordTextField)
    }
    
    func allMetod() {
        createImage()
        createButton()
        createLabel()
        createTextField()
    }
    
    @objc func singInAction(parametrSender: Any) {
        let email = "1"
        let password = "1"
        if emailTextField.text == email && passwordTextField.text == password {
            let foodSelectionVC = FoodSelectionViewController()
            navigationController?.pushViewController((foodSelectionVC), animated: true)
        } else {
            let alertController = UIAlertController(title: "Внимание!",
                                                    message: "Введен неверный адрес почты и/или пароль",
                                                    preferredStyle: .alert)
            let alertControllerAction = UIAlertAction(title: "Ok", style: .default)
            alertController.addAction(alertControllerAction)
            present(alertController, animated: true, completion: nil)
        }
    }
}
