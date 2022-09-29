//
//  RegistrationViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 27.09.2022.
//

import UIKit
/// Контроллер регистрации новых пользователей
class RegistrationViewController: UIViewController {
    
    let userImage = UIImage(named: "welcome")
    let userNameLabel = UILabel()
    let userDateLabel = UILabel()
    let userPhoneLabel = UILabel()
    let userGenderLabel = UILabel()
    let userEmailLabel = UILabel()
    let backButton = UIButton(type: .roundedRect)
    let addButton = UIButton(type: .roundedRect)
    let userNameTextField = UITextField()
    let userDateTextField = UITextField()
    let userPhoneTextField = UITextField()
    let userGenderTextField = UITextField()
    let userEmailTextField = UITextField()
    
    let datePicker = UIDatePicker()
    let genderPicker = UIPickerView()
    let gender = ["Мужской", "Женский"]
    
    var userImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allMetod()
    }
    
    func createImage() {
        view.backgroundColor = .black
        userImageView.frame = CGRect(x: 82, y: 92, width: 250, height: 250)
        userImageView.contentMode = .scaleAspectFill
        userImageView.layer.cornerRadius = 125
        userImageView.clipsToBounds = true
        userImageView.image = userImage
        view.addSubview(userImageView)
    }
    
    func createLabel() {
        userNameLabel.frame = CGRect(x: 33, y: 395, width: 80, height: 33)
        userNameLabel.textAlignment = .left
        userNameLabel.text = "Имя"
        userNameLabel.textColor = UIColor.systemBlue
        userNameLabel.font = userNameLabel.font.withSize(20)
        view.addSubview(userNameLabel)
        
        userDateLabel.frame = CGRect(x: 33, y: 478, width: 80, height: 33)
        userDateLabel.textAlignment = .left
        userDateLabel.text = "Дата"
        userDateLabel.textColor = UIColor.systemBlue
        userDateLabel.font = userDateLabel.font.withSize(20)
        view.addSubview(userDateLabel)
        
        userPhoneLabel.frame = CGRect(x: 33, y: 561, width: 180, height: 33)
        userPhoneLabel.textAlignment = .left
        userPhoneLabel.text = "Номер телефона"
        userPhoneLabel.textColor = UIColor.systemBlue
        userPhoneLabel.font = userPhoneLabel.font.withSize(20)
        view.addSubview(userPhoneLabel)
        
        userGenderLabel.frame = CGRect(x: 33, y: 640, width: 80, height: 33)
        userGenderLabel.textAlignment = .left
        userGenderLabel.text = "Пол"
        userGenderLabel.textColor = UIColor.systemBlue
        userGenderLabel.font = userGenderLabel.font.withSize(20)
        view.addSubview(userGenderLabel)
        
        userEmailLabel.frame = CGRect(x: 33, y: 714, width: 80, height: 33)
        userEmailLabel.textAlignment = .left
        userEmailLabel.text = "Почта"
        userEmailLabel.textColor = UIColor.systemBlue
        userEmailLabel.font = userEmailLabel.font.withSize(20)
        view.addSubview(userEmailLabel)
    }
    
    func createButton() {
        backButton.frame = CGRect(x: 20, y: 30, width: 92, height: 45)
        backButton.setTitle("Отмена", for: .normal)
        backButton.tintColor = .systemBlue
        backButton.addTarget(self, action: #selector(goBackAction), for: .touchUpInside)
        view.addSubview(backButton)
        
        addButton.frame = CGRect(x: 302, y: 30, width: 92, height: 45)
        addButton.setTitle("Добавить", for: .normal)
        addButton.tintColor = .systemBlue
        addButton.addTarget(self, action: #selector(addAction), for: .touchUpInside)
        view.addSubview(addButton)
        
    }
    
    func createTextField() {
        userNameTextField.frame = CGRect(x: 20, y: 431, width: 374, height: 34)
        userNameTextField.borderStyle = .line
        userNameTextField.layer.cornerRadius = 10
        userNameTextField.layer.borderWidth = 2
        userNameTextField.layer.masksToBounds = true
        userNameTextField.backgroundColor = .systemBlue
        view.addSubview(userNameTextField)
        
        userDateTextField.frame = CGRect(x: 20, y: 519, width: 374, height: 34)
        userDateTextField.borderStyle = .line
        userDateTextField.layer.cornerRadius = 10
        userDateTextField.layer.borderWidth = 2
        userDateTextField.layer.masksToBounds = true
        userDateTextField.backgroundColor = .systemBlue
        view.addSubview(userDateTextField)
        
        userPhoneTextField.frame = CGRect(x: 20, y: 598, width: 374, height: 34)
        userPhoneTextField.borderStyle = .line
        userPhoneTextField.layer.cornerRadius = 10
        userPhoneTextField.layer.borderWidth = 2
        userPhoneTextField.layer.masksToBounds = true
        userPhoneTextField.backgroundColor = .systemBlue
        view.addSubview(userPhoneTextField)
        
        userGenderTextField.frame = CGRect(x: 20, y: 672, width: 374, height: 34)
        userGenderTextField.borderStyle = .line
        userGenderTextField.layer.cornerRadius = 10
        userGenderTextField.layer.borderWidth = 2
        userGenderTextField.layer.masksToBounds = true
        userGenderTextField.backgroundColor = .systemBlue
        view.addSubview(userGenderTextField)
        
        userEmailTextField.frame = CGRect(x: 20, y: 755, width: 374, height: 34)
        userEmailTextField.borderStyle = .line
        userEmailTextField.layer.cornerRadius = 10
        userEmailTextField.layer.borderWidth = 2
        userEmailTextField.layer.masksToBounds = true
        userEmailTextField.backgroundColor = .systemBlue
        userEmailTextField.addTarget(self, action: #selector(showEmailAlertAction), for: .touchDown)
        view.addSubview(userEmailTextField)
    }
    
    func createPicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        
        userGenderTextField.inputView = genderPicker
        genderPicker.tag = 1
        genderPicker.dataSource = self
        genderPicker.delegate = self
    }
    
    func toolbarDatePicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self, action: #selector(datePickerChange))
        toolbar.setItems([doneButton], animated: true)
        userDateTextField.inputAccessoryView = toolbar
        userDateTextField.inputView = datePicker
    }
    
    func allMetod() {
        createImage()
        createLabel()
        createButton()
        createTextField()
        createPicker()
        toolbarDatePicker()
    }
    
    @objc func goBackAction(sender: UIButton) {
        dismiss(animated: true)
    }
    
    @objc func addAction(sender: UIButton) {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        guard let creatureVC = storybord.instantiateViewController(withIdentifier: "CreatureVC")
                as? CreatureViewController else { return }
        creatureVC.modalPresentationStyle = .fullScreen
        show(creatureVC, sender: nil)
    }
    
    @objc func datePickerChange() {
        let format = DateFormatter()
        format.dateStyle = .long
        format.timeStyle = .none
        userDateTextField.text = format.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    @objc func showEmailAlertAction(sender: UITextField) {
        let alertController = UIAlertController(title: "Почта",
                                                message: "Введите электронный адрес",
                                                preferredStyle: .alert)
        let alertControllerOkAction = UIAlertAction(title: "Ok", style: .default) { _ in
            let textField = alertController.textFields?.first
            self.userEmailTextField.text = textField?.text
        }
        let alertControllerCancelAction = UIAlertAction(title: "Отмена", style: .default)
        alertController.addTextField()
        alertController.addAction(alertControllerCancelAction)
        alertController.addAction(alertControllerOkAction)
        present(alertController, animated: true, completion: nil)
    }
}

/// UIPickerViewDataSource, UIPickerViewDelegate
extension RegistrationViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return gender.count
        }
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return gender[row]
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            userGenderTextField.text = gender[row]
            view.endEditing(true)
        }
    }
}
