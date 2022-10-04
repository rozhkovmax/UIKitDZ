//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 22.09.2022.
//

import UIKit
/// Контроллер изменения текста
final class ChangeTextViewController: UIViewController {
    
    // MARK: - Private Properties
    private let textLabel = UILabel()
    private let sizeTextSlider = UISlider()
    private let textColorPicker = UIPickerView()
    private let amountLinesPicker = UIPickerView()
    private let textShadowSwitch = UISwitch()
    private let textTransferSwitch = UISwitch()
    private let sizeLabel = UILabel()
    private let choiceColorLabel = UILabel()
    private let choiceLinesLabel = UILabel()
    private let shadowLabel = UILabel()
    private let transferLabel = UILabel()
    private var addTextbarButton = UIBarButtonItem()
    
    private let amountLines = [0, 1, 2]
    private let textColors = [UIColor.black, UIColor.orange, UIColor.red, UIColor.blue, UIColor.green]
    private let nameTextColors = ["Черный", "Оранжевый", "Красный", "Синий", "Зеленый"]
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        allMetod()
    }
    
    // MARK: - Private Methods
    private func createLable() {
        textLabel.frame = CGRect(x: 20, y: 98, width: 374, height: 295)
        textLabel.textAlignment = .center
        textLabel.backgroundColor = .lightGray
        textLabel.shadowColor = .black
        view.addSubview(textLabel)
        
        sizeLabel.frame = CGRect(x: 160, y: 480, width: 100, height: 30)
        sizeLabel.textAlignment = .center
        sizeLabel.adjustsFontSizeToFitWidth = true
        sizeLabel.text = "Размер шрифта"
        view.addSubview(sizeLabel)
        
        choiceColorLabel.frame = CGRect(x: 50, y: 690, width: 100, height: 30)
        choiceColorLabel.textAlignment = .center
        choiceColorLabel.adjustsFontSizeToFitWidth = true
        choiceColorLabel.text = "Выбор цвета"
        view.addSubview(choiceColorLabel)
        
        choiceLinesLabel.frame = CGRect(x: 250, y: 690, width: 100, height: 30)
        choiceLinesLabel.textAlignment = .center
        choiceLinesLabel.adjustsFontSizeToFitWidth = true
        choiceLinesLabel.text = "Выбор линий"
        view.addSubview(choiceLinesLabel)
        
        transferLabel.frame = CGRect(x: 255, y: 790, width: 100, height: 30)
        transferLabel.textAlignment = .center
        transferLabel.adjustsFontSizeToFitWidth = true
        transferLabel.text = "Перенос"
        view.addSubview(transferLabel)
        
        shadowLabel.frame = CGRect(x: 55, y: 790, width: 100, height: 30)
        shadowLabel.textAlignment = .center
        shadowLabel.adjustsFontSizeToFitWidth = true
        shadowLabel.text = "Тень"
        view.addSubview(shadowLabel)
    }
    
    private func createBarButton() {
        addTextbarButton = UIBarButtonItem(image: UIImage(systemName: "plus"),
                                           style: .plain, target: self, action: #selector(addTextAction))
        navigationItem.rightBarButtonItem = addTextbarButton
        addTextbarButton.tintColor = UIColor.black
    }
    
    private func createSlider() {
        sizeTextSlider.frame = CGRect(x: 20, y: 424, width: 374, height: 30)
        sizeTextSlider.minimumValue = 10
        sizeTextSlider.maximumValue = 70
        sizeTextSlider.addTarget(self, action: #selector(sizeTextAction), for: .valueChanged)
        view.addSubview(sizeTextSlider)
    }
    
    private func createPicker() {
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
    
    private func createSwitch() {
        textShadowSwitch.frame = CGRect(x: 80, y: 750, width: 0, height: 0)
        textShadowSwitch.addTarget(self, action: #selector(textShadowAction), for: .valueChanged)
        textShadowSwitch.isOn = false
        view.addSubview(textShadowSwitch)
        
        textTransferSwitch.frame = CGRect(x: 280, y: 750, width: 0, height: 0)
        textTransferSwitch.addTarget(self, action: #selector(textTransferAction), for: .valueChanged)
        textTransferSwitch.isOn = false
        view.addSubview(textTransferSwitch)
    }
    
    private func allMetod() {
        navigationItem.title = "Change Lable"
        navigationController?.title = "First VC"
        createLable()
        createBarButton()
        createSlider()
        createPicker()
        createSwitch()
    }
    
    // MARK: - objc Private Methods
    @objc private func textTransferAction() {
        if textTransferSwitch.isOn {
            textLabel.lineBreakMode = .byWordWrapping
        } else {
            textLabel.lineBreakMode = .byCharWrapping
        }
    }
    
    @objc private func textShadowAction() {
        if textShadowSwitch.isOn {
            textLabel.shadowOffset = CGSize(width: 2, height: 3)
        } else {
            textLabel.shadowOffset = CGSize(width: 0, height: 0)
        }
    }
    
    @objc private func sizeTextAction() {
        textLabel.font = textLabel.font.withSize(CGFloat(sizeTextSlider.value))
    }
    
    @objc private func addTextAction() {
        let alertController = UIAlertController(title: "Введите текст", message: nil, preferredStyle: .alert)
        let alertControllerAction = UIAlertAction(title: "Принять", style: .default) {_ in
            self.textLabel.text = alertController.textFields?.first?.text ?? ""
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
            return textColors.count
        case 2:
            return amountLines.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return nameTextColors[row]
        case 2:
            return String(amountLines[row])
        default:
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            textLabel.textColor = textColors[row]
        case 2:
            textLabel.numberOfLines = amountLines[row]
        default:
            break
        }
    }
}
