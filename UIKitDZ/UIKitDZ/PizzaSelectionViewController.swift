//
//  PizzaSelectionViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 29.09.2022.
//

import UIKit
///  Контроллер выбора пиццы
final class PizzaSelectViewController: UIViewController {

    private let pizzaNameOneLabel = UILabel()
    private let pizzaNameTwoLabel = UILabel()
    private let pizzaOneButton = UIButton(type: .roundedRect)
    private let pizzaTwoButton = UIButton(type: .roundedRect)
    let pizzaOne = Pizza(pizzaName: "Маргарита", pizzaImageName: "margarita")
    let pizzaTwo = Pizza(pizzaName: "Пеперони", pizzaImageName: "peperoni")
    private var pizzaOneImageView = UIImageView()
    private var pizzaTwoImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allMetod()
    }

    private func createImageView() {
        pizzaOneImageView.frame = CGRect(x: 42, y: 155, width: 150, height: 150)
        pizzaOneImageView.image = UIImage(named: pizzaOne.pizzaImageName ?? "")
        view.addSubview(pizzaOneImageView)
        
        pizzaTwoImageView.frame = CGRect(x: 42, y: 356, width: 150, height: 150)
        pizzaTwoImageView.image = UIImage(named: pizzaTwo.pizzaImageName ?? "")
        view.addSubview(pizzaTwoImageView)
     }
    
    private func createButton() {
        pizzaOneButton.frame = CGRect(x: 308, y: 202, width: 57, height: 57)
        pizzaOneButton.setImage(UIImage(systemName: "plus"), for: .normal)
        pizzaOneButton.tintColor = .white
        pizzaOneButton.backgroundColor = .orange
        pizzaOneButton.layer.cornerRadius = 5
        pizzaOneButton.layer.masksToBounds = true
        pizzaOneButton.addTarget(self, action: #selector(plusButtonAction),
                               for: .touchUpInside)
        view.addSubview(pizzaOneButton)
        
        pizzaTwoButton.frame = CGRect(x: 308, y: 403, width: 57, height: 57)
        pizzaTwoButton.setImage(UIImage(systemName: "plus"), for: .normal)
        pizzaTwoButton.tintColor = .white
        pizzaTwoButton.backgroundColor = .orange
        pizzaTwoButton.layer.cornerRadius = 5
        pizzaTwoButton.layer.masksToBounds = true
        pizzaTwoButton.addTarget(self, action: #selector(plusButtonAction),
                               for: .touchUpInside)
        view.addSubview(pizzaTwoButton)
    }
    
    private func createLabel() {
        pizzaNameOneLabel.frame = CGRect(x: 200, y: 211, width: 100, height: 40)
        pizzaNameOneLabel.textAlignment = .left
        pizzaNameOneLabel.text = pizzaOne.pizzaName
        pizzaNameOneLabel.textColor = .black
        pizzaNameOneLabel.font = .systemFont(ofSize: 18)
        view.addSubview(pizzaNameOneLabel)
        
        pizzaNameTwoLabel.frame = CGRect(x: 200, y: 412, width: 100, height: 40)
        pizzaNameTwoLabel.textAlignment = .left
        pizzaNameTwoLabel.text = pizzaTwo.pizzaName
        pizzaNameTwoLabel.textColor = .black
        pizzaNameTwoLabel.font = .systemFont(ofSize: 18)
        view.addSubview(pizzaNameTwoLabel)
    }
    
    private func navigationItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"),
                                                           style: .done,
                                                           target: self, action: #selector(backBarButtonAction))
    }
    
    private func allMetod() {
        title = "Pizza"
        createImageView()
        createButton()
        createLabel()
        navigationItem()
    }
    
    @objc private func backBarButtonAction() {
        navigationController?.popViewController(animated: false)
    }
    
    @objc private func plusButtonAction() {
        let addIngredientVC = AddIngredientViewController()
        if pizzaOneButton.isTouchInside {
        addIngredientVC.pizza = pizzaOne
        } else if pizzaTwoButton.isTouchInside {
        addIngredientVC.pizza = pizzaTwo
        }
        present(addIngredientVC, animated: false)
    }
}
