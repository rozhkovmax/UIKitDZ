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
    let userNameLable = UILabel()
    let userDateLable = UILabel()
    let userPhoneLable = UILabel()
    let userGenderLable = UILabel()
    let userEmailLable = UILabel()
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
    
// Создание Image
    func createImage() {
        view.backgroundColor = .black
        userImageView.frame = CGRect(x: 82, y: 92, width: 250, height: 250)
        userImageView.contentMode = .scaleAspectFill
        userImageView.layer.cornerRadius = 125
        userImageView.clipsToBounds = true
        userImageView.image = userImage
        view.addSubview(userImageView)
    }
    
// Создание Lable
    func createLable() {
        userNameLable.frame = CGRect(x: 33, y: 395, width: 80, height: 33)
        userNameLable.textAlignment = .left
        userNameLable.text = "Имя"
        userNameLable.textColor = UIColor.systemBlue
        userNameLable.font = userNameLable.font.withSize(20)
        view.addSubview(userNameLable)
        
        userDateLable.frame = CGRect(x: 33, y: 478, width: 80, height: 33)
        userDateLable.textAlignment = .left
        userDateLable.text = "Дата"
        userDateLable.textColor = UIColor.systemBlue
        userDateLable.font = userDateLable.font.withSize(20)
        view.addSubview(userDateLable)
        
        userPhoneLable.frame = CGRect(x: 33, y: 561, width: 180, height: 33)
        userPhoneLable.textAlignment = .left
        userPhoneLable.text = "Номер телефона"
        userPhoneLable.textColor = UIColor.systemBlue
        userPhoneLable.font = userPhoneLable.font.withSize(20)
        view.addSubview(userPhoneLable)
        
        userGenderLable.frame = CGRect(x: 33, y: 640, width: 80, height: 33)
        userGenderLable.textAlignment = .left
        userGenderLable.text = "Пол"
        userGenderLable.textColor = UIColor.systemBlue
        userGenderLable.font = userGenderLable.font.withSize(20)
        view.addSubview(userGenderLable)
        
        userEmailLable.frame = CGRect(x: 33, y: 714, width: 80, height: 33)
        userEmailLable.textAlignment = .left
        userEmailLable.text = "Почта"
        userEmailLable.textColor = UIColor.systemBlue
        userEmailLable.font = userEmailLable.font.withSize(20)
        view.addSubview(userEmailLable)
    }
    
// Создание Button
    func createButton() {
        backButton.frame = CGRect(x: 20, y: 30, width: 92, height: 45)
        backButton.setTitle("Отмена", for: .normal)
        backButton.tintColor = .systemBlue
// Наблюдатель за положение кнопки перехода на предыдущий экран
        backButton.addTarget(self, action: #selector(goBackAction), for: .touchUpInside)
        view.addSubview(backButton)
        
        addButton.frame = CGRect(x: 302, y: 30, width: 92, height: 45)
        addButton.setTitle("Добавить", for: .normal)
        addButton.tintColor = .systemBlue
// Наблюдатель за положение кнопки перехода на предыдущий экран
        addButton.addTarget(self, action: #selector(addAction), for: .touchUpInside)
        view.addSubview(addButton)
        
    }
    
// Создание TextField
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
// Наблюдатель для вызова Алерта
        userEmailTextField.addTarget(self, action: #selector(showEmailAlertAction), for: .touchDown)
        view.addSubview(userEmailTextField)
    }
    
// Picker
    func createPicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        
        userGenderTextField.inputView = genderPicker
        genderPicker.tag = 1
        genderPicker.dataSource = self
        genderPicker.delegate = self
    }
    
// Создаем кнопку Done DatePicker
    func toolbarDatePicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
// Наблюдатель за DatePicker
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self, action: #selector(datePickerChange))
        toolbar.setItems([doneButton], animated: true)
        userDateTextField.inputAccessoryView = toolbar
        userDateTextField.inputView = datePicker
    }
    
// Объединяем все вместе
    func allMetod() {
        createImage()
        createLable()
        createButton()
        createTextField()
        createPicker()
        toolbarDatePicker()
    }
    
// Метод кнопки возвращения на предыдущий экран
    @objc func goBackAction (sender: UIButton) {
        dismiss(animated: true)
    }
    
// Метод для перехода на экран с товаром
    @objc func addAction (sender: UIButton) {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        guard let creatureVC = storybord.instantiateViewController(withIdentifier: "CreatureVC")
                as? CreatureViewController else { return }
        creatureVC.modalPresentationStyle = .fullScreen
        show(creatureVC, sender: nil)
    }
    
// Метод изменения DatePicker
    @objc func datePickerChange() {
        let format = DateFormatter()
        format.dateStyle = .long
        format.timeStyle = .none
        userDateTextField.text = format.string(from: datePicker.date)
        view.endEditing(true)
    }
    
// Метод для alert почты
    @objc func showEmailAlertAction (sender: UITextField) {
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

// Расширения для PickerView
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
