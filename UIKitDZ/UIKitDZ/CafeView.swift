//
//  CafeView.swift
//  UIKitDZ
//
//  Created by Maxim on 23.09.2022.
//

import UIKit
/// Класс CafeView
class CafeView: ViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numberOfGuestTextField: UITextField!
    @IBOutlet weak var tableNumberTextField: UITextField!
    
    @IBOutlet weak var bookedTableSwitch: UISwitch!
    @IBOutlet weak var prepaymentSwitch: UISwitch!
    @IBOutlet weak var vipRoomSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goCheckView(_ sender: Any) {
        let alertControllerBill = UIAlertController(title: "Внимание!",
                                                message: "Выставить счёт?",
                                                preferredStyle: .alert)
        let actionBack = UIAlertAction(title: "Отмена", style: .default)
        let actionCheck = UIAlertAction(title: "Чек", style: .default) { _ in
            let storybord = UIStoryboard(name: "Main", bundle: nil)
                guard let chackView = storybord.instantiateViewController(withIdentifier: "CheckView")
                        as? CheckView else { return }
            self.present(chackView, animated: true)
        }
        alertControllerBill.addAction(actionBack)
        alertControllerBill.addAction(actionCheck)
        present(alertControllerBill, animated: true, completion: nil)
    }
}
