//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 22.09.2022.
//

import UIKit
/// SingInViewController
class SingInViewController: UIViewController {

    let loginTextField = UITextField()
    let passwordTextField = UITextField()
    let singInLable = UILabel()
    let loginLable = UILabel()
    let passwordLable = UILabel()
    let eyeButton = UIButton()
    let singInButton = UIButton(type: .roundedRect)
    let singInImage = UIImage(named: "zapisnaya-knizhka")
    var singInImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creationImage()
        creationLable()
        creationTextField()
        creationButton()
    }
    
// Cоздание Image
    func creationImage() {
        singInImageView.frame = CGRect(x: 72, y: 80, width: 270, height: 160)
        singInImageView.contentMode = .scaleAspectFill
        singInImageView.image = singInImage
        view.addSubview(singInImageView)
    }
    
// Создание Lable
    func creationLable() {
        singInLable.frame = CGRect(x: 45, y: 300, width: 80, height: 50)
        singInLable.textAlignment = .left
        singInLable.text = "Вход"
        singInLable.font = singInLable.font.withSize(30)
        view.addSubview(singInLable)
        
        loginLable.frame = CGRect(x: 45, y: 380, width: 80, height: 25)
        loginLable.textAlignment = .left
        loginLable.text = "Логин"
        loginLable.textColor = UIColor.systemBlue
        loginLable.font = loginLable.font.withSize(20)
        view.addSubview(loginLable)
        
        passwordLable.frame = CGRect(x: 45, y: 450, width: 80, height: 25)
        passwordLable.textAlignment = .left
        passwordLable.text = "Пароль"
        passwordLable.textColor = UIColor.systemBlue
        passwordLable.font = passwordLable.font.withSize(20)
        view.addSubview(passwordLable)
    }
    
// Создание TextField
    func creationTextField() {
        loginTextField.frame = CGRect(x: 45, y: 410, width: 325, height: 34)
        loginTextField.borderStyle = .line
        view.addSubview(loginTextField)
        
        passwordTextField.frame = CGRect(x: 45, y: 480, width: 325, height: 34)
        passwordTextField.borderStyle = .line
        view.addSubview(passwordTextField)
    }
    
// Создание Button
    func creationButton() {
        singInButton.frame = CGRect(x: 92, y: 680, width: 230, height: 55)
        singInButton.setTitle("Войти", for: .normal)
        singInButton.tintColor = .black
        singInButton.backgroundColor = .systemBlue
// Наблюдатель за положение кнопки перехода на следующий экран
        singInButton.addTarget(self, action: #selector(singInNextButton), for: .touchUpInside)
        view.addSubview(singInButton)
        
        eyeButton.frame = CGRect(x: 330, y: 480, width: 40, height: 33)
        eyeButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        eyeButton.tintColor = .systemBlue
// Наблюдатель за положением кнопки скрытия пароля
        eyeButton.addTarget(self, action: #selector(eyeSecureButton), for: .touchUpInside)
        view.addSubview(eyeButton)
    }
    
// Метод для скрытия пароля
    @objc func eyeSecureButton (sender: UIButton) {
        if passwordTextField.isSecureTextEntry {
            passwordTextField.isSecureTextEntry = false
            eyeButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        } else {
            passwordTextField.isSecureTextEntry = true
            eyeButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        }
    }
    
// Метод для сравнения логина и пароля и перехода на следующий экран
    @objc func singInNextButton (sender: UIButton) {
        let email = "1"
        let password = "1"
        if loginTextField.text == email && passwordTextField.text == password {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
            guard let contactList = storybord.instantiateViewController(withIdentifier: "contactListViewController")
                    as? ContactListViewController else { return }
            contactList.modalPresentationStyle = .fullScreen
            self.show(contactList, sender: nil)

        } else {
            let alertControllerSingIn = UIAlertController(title: "Внимание!",
                                                             message: "Введен неверный логин и/или пароль",
                                                             preferredStyle: .alert)
            let actionAlertControllerSingIn = UIAlertAction(title: "Ok", style: .default)
            alertControllerSingIn.addAction(actionAlertControllerSingIn)
            present(alertControllerSingIn, animated: true, completion: nil)
        }
    }
}
