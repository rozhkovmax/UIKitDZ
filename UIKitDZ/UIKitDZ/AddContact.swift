//
//  AddContact.swift
//  UIKitDZ
//
//  Created by Maxim on 25.09.2022.
//

import UIKit
/// AddContactViewController
class AddContactViewController: UIViewController {

    let userImage = UIImage(named: "user")
    let userNameLable = UILabel()
    let userDateLable = UILabel()
    let userAgeLable = UILabel()
    let userGenderLable = UILabel()
    let userInstagramLable = UILabel()
    let backButton = UIButton(type: .roundedRect)
    let addButton = UIButton(type: .roundedRect)
    let changePhotoButton = UIButton(type: .roundedRect)
    let userNameTextField = UITextField()
    let userDateTextField = UITextField()
    let userAgeTextField = UITextField()
    let userGenderTextField = UITextField()
    let userInstagramTextField = UITextField()
    
    let datePicker = UIDatePicker()
    let agePicker = UIPickerView()
    let genderPicker = UIPickerView()
    let gender = ["Мужской", "Женский"]
    
    var userImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creationImage()
        creationLable()
        creationButton()
        creationTextField()
        
        creationPicker()
        toolbarDatePicker()
    }

// Создание Image
    func creationImage() {
        userImageView.frame = CGRect(x: 137, y: 174, width: 140, height: 140)
        userImageView.contentMode = .scaleAspectFill
        userImageView.layer.cornerRadius = 70
        userImageView.clipsToBounds = true
        userImageView.image = userImage
        view.addSubview(userImageView)
    }
    
// Создание Lable
    func creationLable() {
        userNameLable.frame = CGRect(x: 33, y: 395, width: 80, height: 33)
        userNameLable.textAlignment = .left
        userNameLable.text = "Имя"
        userNameLable.textColor = UIColor.systemBlue
        userNameLable.font = userNameLable.font.withSize(15)
        view.addSubview(userNameLable)
        
        userDateLable.frame = CGRect(x: 33, y: 478, width: 80, height: 33)
        userDateLable.textAlignment = .left
        userDateLable.text = "Дата"
        userDateLable.textColor = UIColor.systemBlue
        userDateLable.font = userDateLable.font.withSize(15)
        view.addSubview(userDateLable)
        
        userAgeLable.frame = CGRect(x: 33, y: 561, width: 80, height: 33)
        userAgeLable.textAlignment = .left
        userAgeLable.text = "Возраст"
        userAgeLable.textColor = UIColor.systemBlue
        userAgeLable.font = userAgeLable.font.withSize(15)
        view.addSubview(userAgeLable)
        
        userGenderLable.frame = CGRect(x: 33, y: 640, width: 80, height: 33)
        userGenderLable.textAlignment = .left
        userGenderLable.text = "Пол"
        userGenderLable.textColor = UIColor.systemBlue
        userGenderLable.font = userGenderLable.font.withSize(15)
        view.addSubview(userGenderLable)
        
        userInstagramLable.frame = CGRect(x: 33, y: 714, width: 80, height: 33)
        userInstagramLable.textAlignment = .left
        userInstagramLable.text = "Instagram"
        userInstagramLable.textColor = UIColor.systemBlue
        userInstagramLable.font = userInstagramLable.font.withSize(15)
        view.addSubview(userInstagramLable)
    }
    
// Создание Button
    func creationButton() {
        backButton.frame = CGRect(x: 20, y: 105, width: 92, height: 45)
        backButton.setTitle("Отмена", for: .normal)
        backButton.tintColor = .systemBlue
// Наблюдатель за положение кнопки перехода на предыдущий экран
        backButton.addTarget(self, action: #selector(goBackButton), for: .touchUpInside)
        view.addSubview(backButton)
        
        addButton.frame = CGRect(x: 302, y: 105, width: 92, height: 45)
        addButton.setTitle("Добавить", for: .normal)
        addButton.tintColor = .systemBlue
        view.addSubview(addButton)
        
        changePhotoButton.frame = CGRect(x: 137, y: 333, width: 140, height: 45)
        changePhotoButton.setTitle("Изменить фото", for: .normal)
        changePhotoButton.tintColor = .systemBlue
        view.addSubview(changePhotoButton)
    }
    
// Создание TextField
    func creationTextField() {
        userNameTextField.frame = CGRect(x: 20, y: 431, width: 374, height: 34)
        userNameTextField.borderStyle = .line
        view.addSubview(userNameTextField)
        
        userDateTextField.frame = CGRect(x: 20, y: 519, width: 374, height: 34)
        userDateTextField.borderStyle = .line
        view.addSubview(userDateTextField)
        
        userAgeTextField.frame = CGRect(x: 20, y: 598, width: 374, height: 34)
        userAgeTextField.borderStyle = .line
        view.addSubview(userAgeTextField)
        
        userGenderTextField.frame = CGRect(x: 20, y: 672, width: 374, height: 34)
        userGenderTextField.borderStyle = .line
        view.addSubview(userGenderTextField)
        
        userInstagramTextField.frame = CGRect(x: 20, y: 755, width: 374, height: 34)
        userInstagramTextField.borderStyle = .line
// Наблюдатель для вызова Алерта
        userInstagramTextField.addTarget(self, action: #selector(instaAction), for: .touchDown)
        view.addSubview(userInstagramTextField)
    }
    
// Picker
    func creationPicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        
        userAgeTextField.inputView = agePicker
        agePicker.tag = 1
        agePicker.dataSource = self
        agePicker.delegate = self
        
        userGenderTextField.inputView = genderPicker
        genderPicker.tag = 2
        genderPicker.dataSource = self
        genderPicker.delegate = self
    }
    
// Метод кнопки возвращения на предыдущий экран
    @objc func goBackButton (sender: UIButton) {
        dismiss(animated: true)
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
    
// Метод изменения DatePicker
    @objc func datePickerChange() {
        let format = DateFormatter()
        format.dateStyle = .long
        format.timeStyle = .none
        userDateTextField.text = format.string(from: datePicker.date)
        self.view.endEditing(true)
    }

// Метод для alert Инстаграма
    @objc func instaAction (sender: UITextField) {
        let alertControllerInstagram = UIAlertController(title: "Instagram",
                                                         message: "Введен логин",
                                                         preferredStyle: .alert)
        let actionOkAlertControllerInstagram = UIAlertAction(title: "Ok", style: .default) { _ in
            let textField = alertControllerInstagram.textFields?.first
            self.userInstagramTextField.text = textField?.text
        }
        let actionCancelAlertControllerInstagram = UIAlertAction(title: "Cancel", style: .default)
        alertControllerInstagram.addTextField()
        alertControllerInstagram.textFields?[0].placeholder = "Например @rozhkovmax"
        alertControllerInstagram.addAction(actionCancelAlertControllerInstagram)
        alertControllerInstagram.addAction(actionOkAlertControllerInstagram)
        present(alertControllerInstagram, animated: true, completion: nil)
    }
}

// Расширения для PickerView
extension AddContactViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return 100
        }
        if pickerView.tag == 2 {
            return gender.count
        }
        return 1
    }
}

extension AddContactViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            let result = "\(row)"
            return result
        }
        if pickerView.tag == 2 {
            return gender[row]
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            userAgeTextField.text = "\(row)"
            self.view.endEditing(true)
        }
        if pickerView.tag == 2 {
            userGenderTextField.text = gender[row]
            self.view.endEditing(true)
        }
    }
}
