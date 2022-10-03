//
//  CheckViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 01.10.2022.
//

import UIKit
/// Контроллер выставления счета
final class CheckViewController: UIViewController {

    private let alertMessage = """
Ваш заказ доставят в течении 15 минут!
Приятного аппетита
"""
    private let ingredientOneLabel = UILabel()
    private let ingredientTwoLabel = UILabel()
    private let ingredientThreeLabel = UILabel()
    private let ingredientFourLabel = UILabel()
    private let pizzaNameLabel = UILabel()
    private let orderLabel = UILabel()
    private let cashLabel = UILabel()
    private let cardLabel = UILabel()
    private let cashSwitch = UISwitch()
    private let cardSwitch = UISwitch()
    private let payButton = UIButton(type: .roundedRect)
    var pizza: Pizza?
    var isAddChees: Bool?
    var isAddHam: Bool?
    var isAddMashroom: Bool?
    var isAddOlive: Bool?
    weak var delegate: ViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Оплата"
        allMethod()
    }
    
    private func createButton() {
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
    
    private func createLabel() {
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
    
    private func createSwitch() {
        cashSwitch.frame = CGRect(x: 289, y: 603, width: 49, height: 31)
        cashSwitch.isOn = false
        cashSwitch.addTarget(self, action: #selector(cashSwitchAction), for: .touchUpInside)
        view.addSubview(cashSwitch)
        cardSwitch.frame = CGRect(x: 289, y: 661, width: 49, height: 31)
        cardSwitch.isOn = true
        cardSwitch.addTarget(self, action: #selector(cardSwitchAction), for: .touchUpInside)
        view.addSubview(cardSwitch)
    }
    
    private func allMethod() {
        view.backgroundColor = .white
        createButton()
        createLabel()
        createSwitch()
        presentExstrasIngredients()
    }
    
    private func checkIsEmptyLabel(text: String) {
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
    
    private func presentExstrasIngredients() {
        if isAddChees ?? false {
            checkIsEmptyLabel(text: "Сыр Моцарелла")
        }
        if isAddHam ?? false {
            checkIsEmptyLabel(text: "Ветчина")
        }
        if isAddMashroom ?? false {
            checkIsEmptyLabel(text: "Грибы")
        }
        if isAddOlive ?? false {
            checkIsEmptyLabel(text: "Маслины")
        }
    }

    @objc private func cardSwitchAction() {
        if cardSwitch.isOn {
            cashSwitch.setOn(false, animated: true)
        }
    }
    
    @objc private func cashSwitchAction() {
        if cashSwitch.isOn {
            cardSwitch.setOn(false, animated: true)
        }
    }
    
    @objc private func payButtonAction() {
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
