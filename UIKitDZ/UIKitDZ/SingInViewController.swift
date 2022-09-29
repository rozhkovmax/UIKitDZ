//
//  SingInViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 27.09.2022.
//

import UIKit
/// Контроллер входа в учетную запись магазина
class SingInViewController: UIViewController {

    let loginTextField = UITextField()
    let passwordTextField = UITextField()
    let singInLable = UILabel()
    let loginLable = UILabel()
    let passwordLable = UILabel()
    let eyeButton = UIButton()
    let singInButton = UIButton(type: .roundedRect)
    let registrationButton = UIButton(type: .roundedRect)
    let productButton = UIButton(type: .roundedRect)
    let singInImage = UIImage(named: "world_of_light")
    var singInImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        allMetod()
    }

    func createImage() {
        view.backgroundColor = .black
        singInImageView.frame = CGRect(x: 7, y: 44, width: 400, height: 275)
        singInImageView.contentMode = .scaleAspectFill
        singInImageView.image = singInImage
        view.addSubview(singInImageView)
    }

    func createLable() {
        singInLable.frame = CGRect(x: 45, y: 300, width: 300, height: 50)
        singInLable.textAlignment = .left
        singInLable.text = "Добро пожаловать!"
        singInLable.textColor = .systemYellow
        singInLable.font = singInLable.font.withSize(30)
        view.addSubview(singInLable)

        loginLable.frame = CGRect(x: 45, y: 380, width: 80, height: 25)
        loginLable.textAlignment = .left
        loginLable.text = "Логин"
        loginLable.textColor = UIColor.systemYellow
        loginLable.font = loginLable.font.withSize(20)
        view.addSubview(loginLable)

        passwordLable.frame = CGRect(x: 45, y: 450, width: 80, height: 25)
        passwordLable.textAlignment = .left
        passwordLable.text = "Пароль"
        passwordLable.textColor = UIColor.systemYellow
        passwordLable.font = passwordLable.font.withSize(20)
        view.addSubview(passwordLable)
    }

    func createTextField() {
        loginTextField.frame = CGRect(x: 45, y: 410, width: 325, height: 34)
        loginTextField.borderStyle = .line
        loginTextField.layer.cornerRadius = 10
        loginTextField.layer.borderWidth = 2
        loginTextField.layer.masksToBounds = true
        loginTextField.backgroundColor = .systemYellow
        view.addSubview(loginTextField)

        passwordTextField.frame = CGRect(x: 45, y: 480, width: 325, height: 34)
        passwordTextField.borderStyle = .line
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.borderWidth = 2
        passwordTextField.layer.masksToBounds = true
        passwordTextField.backgroundColor = .systemYellow
        view.addSubview(passwordTextField)
    }

    func createButton() {
        registrationButton.frame = CGRect(x: 92, y: 580, width: 230, height: 55)
        registrationButton.setTitle("Зарегистрироваться", for: .normal)
        registrationButton.tintColor = .black
        registrationButton.titleLabel?.font = .systemFont(ofSize: 20)
        registrationButton.backgroundColor = .systemYellow
        registrationButton.layer.cornerRadius = 10
        registrationButton.layer.borderWidth = 2
        registrationButton.layer.masksToBounds = true
        registrationButton.addTarget(self, action: #selector(registrationAction), for: .touchUpInside)
        view.addSubview(registrationButton)
        
        singInButton.frame = CGRect(x: 92, y: 680, width: 230, height: 55)
        singInButton.setTitle("Войти", for: .normal)
        singInButton.tintColor = .black
        singInButton.titleLabel?.font = .systemFont(ofSize: 20)
        singInButton.backgroundColor = .systemYellow
        singInButton.layer.cornerRadius = 10
        singInButton.layer.borderWidth = 2
        singInButton.layer.masksToBounds = true
        singInButton.addTarget(self, action: #selector(singInAction), for: .touchUpInside)
        view.addSubview(singInButton)
        
        productButton.frame = CGRect(x: 92, y: 780, width: 230, height: 55)
        productButton.setTitle("Продолжить без авторизации", for: .normal)
        productButton.tintColor = .black
        productButton.titleLabel?.numberOfLines = 2
        productButton.titleLabel?.textAlignment = .center
        productButton.titleLabel?.font = .systemFont(ofSize: 20)
        productButton.backgroundColor = .systemYellow
        productButton.layer.cornerRadius = 10
        productButton.layer.borderWidth = 2
        productButton.layer.masksToBounds = true
        productButton.addTarget(self, action: #selector(productAction), for: .touchUpInside)
        view.addSubview(productButton)

        eyeButton.frame = CGRect(x: 330, y: 480, width: 40, height: 33)
        eyeButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        eyeButton.tintColor = .black
        eyeButton.addTarget(self, action: #selector(eyeSecureButtonAction), for: .touchUpInside)
        view.addSubview(eyeButton)
    }

    func allMetod() {
        createImage()
        createLable()
        createTextField()
        createButton()
    }

    @objc func eyeSecureButtonAction(sender: UIButton) {
        if passwordTextField.isSecureTextEntry {
            passwordTextField.isSecureTextEntry = false
            eyeButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        } else {
            passwordTextField.isSecureTextEntry = true
            eyeButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        }
    }
    
    @objc func registrationAction(sender: UIButton) {
        let alertController = UIAlertController(title: "Рады приветствовать Вас!",
                                                            message: "Перейти к экрану регистрации?",
                                                            preferredStyle: .alert)
        let alertControllerYesAction = UIAlertAction(title: "Да!", style: .default) { _ in
            let storybord = UIStoryboard(name: "Main", bundle: nil)
            guard let registrationVC = storybord.instantiateViewController(withIdentifier: "RegistrationVC")
                as? RegistrationViewController else { return }
            registrationVC.modalPresentationStyle = .fullScreen
            self.show(registrationVC, sender: nil)
        }
        let alertControllerNoAction = UIAlertAction(title: "В другой раз", style: .default)
        alertController.addAction(alertControllerYesAction)
        alertController.addAction(alertControllerNoAction)
        present(alertController, animated: true, completion: nil)
    }

    @objc func productAction(sender: UIButton) {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        guard let creatureVC = storybord.instantiateViewController(withIdentifier: "CreatureVC")
            as? CreatureViewController else { return }
        creatureVC.modalPresentationStyle = .fullScreen
        show(creatureVC, sender: nil)
    }
    
    @objc func singInAction(sender: UIButton) {
        let email = "1"
        let password = "1"
        if loginTextField.text == email && passwordTextField.text == password {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
            guard let creatureVC = storybord.instantiateViewController(withIdentifier: "CreatureVC")
                as? CreatureViewController else { return }
            creatureVC.modalPresentationStyle = .fullScreen
            show(creatureVC, sender: nil)
        } else {
            let alertController = UIAlertController(title: "Внимание!",
                                                            message: "Введен неверный логин и/или пароль",
                                                            preferredStyle: .alert)
            let alertControllerAction = UIAlertAction(title: "Ok", style: .default)
            alertController.addAction(alertControllerAction)
            present(alertController, animated: true, completion: nil)
        }
    }
}
