//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 22.09.2022.
//

import UIKit
/// Начальный VC
class ViewController: UIViewController {

    @IBOutlet weak var loginTextFild: UITextField!
    @IBOutlet weak var passwordTextFild: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func eyeButton(_ sender: Any) {
        if passwordTextFild.isSecureTextEntry {
            passwordTextFild.isSecureTextEntry = false
        } else {
            passwordTextFild.isSecureTextEntry = true
        }
    }
    
    @IBAction func goCafeView(_ sender: Any) {
        let email = "Maxim"
        let password = "123"
        if loginTextFild.text == email && passwordTextFild.text == password {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
            guard let cafeView = storybord.instantiateViewController(withIdentifier: "CafeView")
                    as? CafeView else { return }
            self.present(cafeView, animated: true)
        } else {
            let alertControllerSingIn = UIAlertController(title: "Внимание!",
                                                    message: "Введен неверный логин и/или пароль",
                                                    preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default)
            alertControllerSingIn.addAction(action)
            present(alertControllerSingIn, animated: true, completion: nil)
        }
    }
}
