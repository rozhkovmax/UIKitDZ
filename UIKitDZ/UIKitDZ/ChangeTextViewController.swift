//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 22.09.2022.
//

import UIKit
/// Контроллер изменения текста
class ChangeTextViewController: UIViewController {
    // MARK: - Private Properties
    let textLable = UILabel()
    let sizeTextSlider = UISlider()
    let textColorPicker = UIPickerView()
    let amountLinesPicker = UIPickerView()
    let amountLinesArray = [0, 1, 2]
    let textColorArray = [UIColor.black, UIColor.orange, UIColor.red, UIColor.blue, UIColor.green]
    let nameTextColorArray = ["Черный", "Оранжевый", "Красный", "Синий", "Зеленый"]
    let textShadowSwitch = UISwitch()
    let textTransferSwitch = UISwitch()
    let sizeLable = UILabel()
    let choiceColorLable = UILabel()
    let choiceLinesLable = UILabel()
    let shadowLable = UILabel()
    let transferLable = UILabel()
    var addTextbarButton = UIBarButtonItem()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        allMetod()
    }
    
    // MARK: - Private Methods
    func createLable() {
        textLable.frame = CGRect(x: 20, y: 98, width: 374, height: 295)
        textLable.textAlignment = .center
        textLable.backgroundColor = .lightGray
        textLable.shadowColor = .black
        view.addSubview(textLable)
        
        sizeLable.frame = CGRect(x: 160, y: 480, width: 100, height: 30)
        sizeLable.textAlignment = .center
        sizeLable.adjustsFontSizeToFitWidth = true
        sizeLable.text = "Размер шрифта"
        view.addSubview(sizeLable)
        
        choiceColorLable.frame = CGRect(x: 50, y: 690, width: 100, height: 30)
        choiceColorLable.textAlignment = .center
        choiceColorLable.adjustsFontSizeToFitWidth = true
        choiceColorLable.text = "Выбор цвета"
        view.addSubview(choiceColorLable)
        
        choiceLinesLable.frame = CGRect(x: 250, y: 690, width: 100, height: 30)
        choiceLinesLable.textAlignment = .center
        choiceLinesLable.adjustsFontSizeToFitWidth = true
        choiceLinesLable.text = "Выбор линий"
        view.addSubview(choiceLinesLable)
        
        transferLable.frame = CGRect(x: 255, y: 790, width: 100, height: 30)
        transferLable.textAlignment = .center
        transferLable.adjustsFontSizeToFitWidth = true
        transferLable.text = "Перенос"
        view.addSubview(transferLable)
        
        shadowLable.frame = CGRect(x: 55, y: 790, width: 100, height: 30)
        shadowLable.textAlignment = .center
        shadowLable.adjustsFontSizeToFitWidth = true
        shadowLable.text = "Тень"
        view.addSubview(shadowLable)
    }
    
    func createBarButton() {
        addTextbarButton = UIBarButtonItem(image: UIImage(systemName: "plus"),
                                           style: .plain, target: self, action: #selector(addTextAction))
        navigationItem.rightBarButtonItem = addTextbarButton
        addTextbarButton.tintColor = UIColor.black
    }
    
    func createSlider() {
        sizeTextSlider.frame = CGRect(x: 20, y: 424, width: 374, height: 30)
        sizeTextSlider.minimumValue = 10
        sizeTextSlider.maximumValue = 70
        sizeTextSlider.addTarget(self, action: #selector(sizeTextAction), for: .valueChanged)
        view.addSubview(sizeTextSlider)
    }
    
    func createPicker() {
        textColorPicker.frame = CGRect(x: 20, y: 530, width: 170, height: 160)
        textColorPicker.delegate = self
        textColorPicker.dataSource = self
        textColorPicker.tag = 1
        view.addSubview(textColorPicker)
        
        amountLinesPicker.frame = CGRect(x: 220, y: 530, width: 170, height: 160)
        amountLinesPicker.delegate = self
        amountLinesPicker.dataSource = self
        amountLinesPicker.tag = 2
        view.addSubview(amountLinesPicker)
    }
    
    func createSwitch() {
        textShadowSwitch.frame = CGRect(x: 80, y: 750, width: 0, height: 0)
        textShadowSwitch.addTarget(self, action: #selector(textShadowAction), for: .valueChanged)
        textShadowSwitch.isOn = false
        view.addSubview(textShadowSwitch)
        
        textTransferSwitch.frame = CGRect(x: 280, y: 750, width: 0, height: 0)
        textTransferSwitch.addTarget(self, action: #selector(textTransferAction), for: .valueChanged)
        textTransferSwitch.isOn = false
        view.addSubview(textTransferSwitch)
    }
    
    func allMetod() {
        navigationItem.title = "Change Lable"
        navigationController?.title = "First VC"
        createLable()
        createBarButton()
        createSlider()
        createPicker()
        createSwitch()
    }
    
    @objc func textTransferAction() {
        if textTransferSwitch.isOn {
            textLable.lineBreakMode = .byWordWrapping
        } else {
            textLable.lineBreakMode = .byCharWrapping
        }
    }
    
    @objc func textShadowAction() {
        if textShadowSwitch.isOn {
            textLable.shadowOffset = CGSize(width: 2, height: 3)
        } else {
            textLable.shadowOffset = CGSize(width: 0, height: 0)
        }
    }
    
    @objc func sizeTextAction() {
        textLable.font = textLable.font.withSize(CGFloat(sizeTextSlider.value))
    }
    
    @objc func addTextAction() {
        let alertController = UIAlertController(title: "Введите текст", message: nil, preferredStyle: .alert)
        let alertControllerAction = UIAlertAction(title: "Принять", style: .default) {_ in
            self.textLable.text = alertController.textFields?.first?.text ?? ""
        }
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(alertControllerAction)
        present(alertController, animated: true)
    }
}

// MARK: - UIPickerViewDataSource, UIPickerViewDelegate

extension ChangeTextViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return textColorArray.count
        case 2:
            return amountLinesArray.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return nameTextColorArray[row]
        case 2:
            return String(amountLinesArray[row])
        default:
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            textLable.textColor = textColorArray[row]
        case 2:
            textLable.numberOfLines = amountLinesArray[row]
        default:
            break
        }
    }
}
