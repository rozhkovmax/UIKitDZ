//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 22.09.2022.
//

import UIKit
/// ShareViewController
class ShareViewController: UIViewController {

    @IBOutlet weak var sharePicker: UIPickerView!
    
    var shareButton = UIButton()
    var shareTextField = UITextField()
    var sharePickerValue = ["1 раздел", "2 раздел", "3 раздел"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allMetod()
    }
    
    @IBAction func activityVCActionButton(_ sender: Any) {
        let url = URL(string: "https://github.com")
        let buttonActivityViewController = UIActivityViewController(activityItems: [url ?? ""],
                                                                    applicationActivities: nil)
        present(buttonActivityViewController, animated: true)
    }
    
    func createTextField() {
        shareTextField.frame = CGRect(x: 0, y: 0, width: 300, height: 34)
        shareTextField.center = view.center
        shareTextField.borderStyle = .roundedRect
        shareTextField.placeholder = "Enter text to share"
        shareTextField.delegate = self
        view.addSubview(shareTextField)
    }
    
    func createButton() {
        shareButton = UIButton(type: .roundedRect)
        shareButton.frame = CGRect(x: 67, y: 330, width: 280, height: 45)
        shareButton.setTitle("Расшарить", for: .normal)
        shareButton.addTarget(self, action: #selector(shareAction), for: .touchUpInside)
        view.addSubview(shareButton)
    }
    
    func allMetod() {
        sharePicker.dataSource = self
        sharePicker.delegate = self
        createTextField()
        createButton()
    }
    
    @objc func shareAction(paramSender: Any) {
        let text = shareTextField.text
        if text?.count == 0 {
            let massege = "Cначало введите текст, потом нажмите кнопку"
            let shareAlertController = UIAlertController(title: nil,
                                                         message: massege, preferredStyle: .alert)
            let actionShareAlertController = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            shareAlertController.addAction(actionShareAlertController)
            present(shareAlertController, animated: true, completion: nil)
        }
        let link = URL(string: "https://www.facebook.com")
        let activityViewController = UIActivityViewController(activityItems:
                                                                [shareTextField.text ?? "nil",
                                                                 "https://www.facebook.com",
                                                                 link ?? "nil"], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
}

/// UITextFieldDelegate
extension ShareViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        shareTextField.resignFirstResponder()
        return true
    }
}

/// UIPickerViewDelegate, UIPickerViewDataSource
extension ShareViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int { return 1 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sharePickerValue.count }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sharePickerValue[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            view.backgroundColor = .systemGray
        case 1:
            view.backgroundColor = .systemGray2
        case 2:
            let activityPicker = UIActivityViewController(
                            activityItems: ["3 раздел Picker"],
                            applicationActivities: nil)
            present(activityPicker, animated: true, completion: nil)
        default:
            return
        }
    }
}
