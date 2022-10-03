//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 22.09.2022.
//

import UIKit
/// Контроллер таймера
final class TimerViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var timerPicker: UIPickerView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createPicker()
    }
    
    // MARK: - Private Method
    private func createPicker() {
        timerPicker.delegate = self
        timerPicker.dataSource = self
        timerPicker.setValue(UIColor.white, forKey: "textColor")
    }
}

    // MARK: - UIPickerViewDataSource, UIPickerViewDelegate
extension TimerViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 24
        case 1:
            return 60
        case 2:
            return 60
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(row)"
        case 1:
            return "\(row)"
        case 2:
            return "\(row)"
        default:
            return ""
        }
    }
}
