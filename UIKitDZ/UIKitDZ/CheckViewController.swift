//
//  CheckViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 01.10.2022.
//

import UIKit
/// Контроллер выставления счета
final class CheckViewController: UIViewController {

    let alertMessage = """
Ваш заказ доставят в течении 15 минут!
Приятного аппетита
"""
    let ingredientOneLabel = UILabel()
    let ingredientTwoLabel = UILabel()
    let ingredientThreeLabel = UILabel()
    let ingredientFourLabel = UILabel()
    let pizzaNameLabel = UILabel()
    let orderLabel = UILabel()
    let cashLabel = UILabel()
    let cardLabel = UILabel()
    let cashSwitch = UISwitch()
    let cardSwitch = UISwitch()
    let payButton = UIButton(type: .roundedRect)
    var pizza: Pizza?
    var addChees: Bool?
    var addHam: Bool?
    var addMashroom: Bool?
    var addOlive: Bool?
    weak var delegate: ViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Оплата"
        allMethod()
    }
    
    func createButton() {
        payButton.frame = CGRect(x: 79, y: 775, width: 257, height: 55)
        payButton.setTitle("Pay", for: .normal)
        payButton.setImage(UIImage(systemName: "applelogo"), for: .normal)
        payButton.tintColor = .white
        payButton.setTitleColor(.white, for: .normal)
        payButton.backgroundColor = .black
        payButton.layer.cornerRadius = 10
        payButton.layer.borderWidth = 1
        payButton.layer.masksToBounds = true
        payButton.addTarget(self, action: #selector(payButtonAction),
                               for: .touchUpInside)
        view.addSubview(payButton)
    }
    
    func createLabel() {
        pizzaNameLabel.frame = CGRect(x: 46, y: 239, width: 322, height: 44)
        pizzaNameLabel.textAlignment = .left
        pizzaNameLabel.text = pizza?.pizzaName ?? ""
        pizzaNameLabel.textColor = .black
        pizzaNameLabel.font = .systemFont(ofSize: 25)
        view.addSubview(pizzaNameLabel)

        ingredientOneLabel.frame = CGRect(x: 46, y: 291, width: 322, height: 44)
        ingredientOneLabel.textAlignment = .left
        ingredientOneLabel.textColor = .black
        ingredientOneLabel.text = ""
        ingredientOneLabel.font = .systemFont(ofSize: 25)
        view.addSubview(ingredientOneLabel)
        
        ingredientTwoLabel.frame = CGRect(x: 46, y: 343, width: 322, height: 44)
        ingredientTwoLabel.textAlignment = .left
        ingredientTwoLabel.textColor = .black
        ingredientTwoLabel.text = ""
        ingredientTwoLabel.font = .systemFont(ofSize: 25)
        view.addSubview(ingredientTwoLabel)
        
        ingredientThreeLabel.frame = CGRect(x: 46, y: 395, width: 322, height: 44)
        ingredientThreeLabel.textAlignment = .left
        ingredientThreeLabel.textColor = .black
        ingredientThreeLabel.text = ""
        ingredientThreeLabel.font = .systemFont(ofSize: 25)
        view.addSubview(ingredientThreeLabel)
        
        ingredientFourLabel.frame = CGRect(x: 46, y: 447, width: 322, height: 44)
        ingredientFourLabel.textAlignment = .left
        ingredientFourLabel.textColor = .black
        ingredientFourLabel.text = ""
        ingredientFourLabel.font = .systemFont(ofSize: 25)
        view.addSubview(ingredientFourLabel)
        
        orderLabel.frame = CGRect(x: 46, y: 136, width: 138, height: 60)
        orderLabel.textAlignment = .left
        orderLabel.text = "Ваш заказ:"
        orderLabel.textColor = .black
        orderLabel.font = .systemFont(ofSize: 20)
        view.addSubview(orderLabel)
        
        cashLabel.frame = CGRect(x: 79, y: 661, width: 167, height: 31)
        cashLabel.textAlignment = .left
        cashLabel.text = "Оплата наличными"
        cashLabel.textColor = .black
        cashLabel.font = .systemFont(ofSize: 15)
        view.addSubview(cashLabel)
        
        cardLabel.frame = CGRect(x: 79, y: 603, width: 167, height: 31)
        cardLabel.textAlignment = .left
        cardLabel.text = "Оплата картой"
        cardLabel.textColor = .black
        cardLabel.font = .systemFont(ofSize: 15)
        view.addSubview(cardLabel)
    }
    
    func createSwitch() {
        cashSwitch.frame = CGRect(x: 289, y: 603, width: 49, height: 31)
        cashSwitch.isOn = false
        cashSwitch.addTarget(self, action: #selector(cashSwitchAction), for: .touchUpInside)
        view.addSubview(cashSwitch)
        cardSwitch.frame = CGRect(x: 289, y: 661, width: 49, height: 31)
        cardSwitch.isOn = true
        cardSwitch.addTarget(self, action: #selector(cardSwitchAction), for: .touchUpInside)
        view.addSubview(cardSwitch)
    }
    
    func allMethod() {
        view.backgroundColor = .white
        createButton()
        createLabel()
        createSwitch()
        presentExstrasIngredients()
    }
    
    func checkIsEmptyLabel(text: String) {
        let stringIsEmpty = ""
        if ingredientOneLabel.text == stringIsEmpty {
            ingredientOneLabel.text = text
        } else if ingredientTwoLabel.text == stringIsEmpty {
            ingredientTwoLabel.text = text
        } else if ingredientThreeLabel.text == stringIsEmpty {
            ingredientThreeLabel.text = text
        } else if ingredientFourLabel.text == stringIsEmpty {
            ingredientFourLabel.text = text
        }
    }
    func presentExstrasIngredients() {
        if addChees ?? false {
            checkIsEmptyLabel(text: "Сыр Моцарелла")
        }
        if addHam ?? false {
            checkIsEmptyLabel(text: "Ветчина")
        }
        if addMashroom ?? false {
            checkIsEmptyLabel(text: "Грибы")
        }
        if addOlive ?? false {
            checkIsEmptyLabel(text: "Маслины")
        }
    }

    @objc func cardSwitchAction() {
        if cardSwitch.isOn {
            cashSwitch.setOn(false, animated: true)
        }
    }
    
    @objc func cashSwitchAction() {
        if cashSwitch.isOn {
            cardSwitch.setOn(false, animated: true)
        }
    }
    
    @objc func payButtonAction() {
        let alertController = UIAlertController(title: "Заказ оплачен!",
                                                message: alertMessage, preferredStyle: .alert)
        let alertControllerAction = UIAlertAction(title: "Ok", style: .default) {_ in
            self.dismiss(animated: false)
            self.delegate?.goBack()
        }
        alertController.addAction(alertControllerAction)
        present(alertController, animated: false)
    }
}
