//
//  CheckView.swift
//  UIKitDZ
//
//  Created by Maxim on 24.09.2022.
//

import UIKit
/// Класс CheckView
class CheckView: ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func paymentButton(_ sender: Any) {
        let alertControllerCheck = UIAlertController(title: "Внимание!",
                                                message: "Сейчас оплата возможна только наличными",
                                                preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alertControllerCheck.addAction(action)
        present(alertControllerCheck, animated: true, completion: nil)
    }
}
