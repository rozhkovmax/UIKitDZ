//
//  PizzaSelectionViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 29.09.2022.
//

import UIKit
///  Контроллер выбора пиццы
final class PizzaSelectViewController: UIViewController {

    let pizzaNameOneLabel = UILabel()
    let pizzaNameTwoLabel = UILabel()
    let pizzaOneButton = UIButton(type: .roundedRect)
    let pizzaTwoButton = UIButton(type: .roundedRect)
    let pizzaOne = Pizza(pizzaName: "Маргарита", pizzaImage: "margarita")
    let pizzaTwo = Pizza(pizzaName: "Пеперони", pizzaImage: "peperoni")
    var pizzaOneImageView = UIImageView()
    var pizzaTwoImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allMetod()
    }

    func createImage() {
        pizzaOneImageView.frame = CGRect(x: 42, y: 155, width: 150, height: 150)
        pizzaOneImageView.image = UIImage(named: pizzaOne.pizzaImage ?? "")
        view.addSubview(pizzaOneImageView)
        
        pizzaTwoImageView.frame = CGRect(x: 42, y: 356, width: 150, height: 150)
        pizzaTwoImageView.image = UIImage(named: pizzaTwo.pizzaImage ?? "")
        view.addSubview(pizzaTwoImageView)
     }
    
    func createButton() {
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
    
    func createLabel() {
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
    
    func navigationItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"),
                                                           style: .done,
                                                           target: self, action: #selector(backBarButtonAction))
    }
    
    func allMetod() {
        title = "Pizza"
        createImage()
        createButton()
        createLabel()
        navigationItem()
    }
    
    @objc func backBarButtonAction() {
        navigationController?.popViewController(animated: false)
    }
    
    @objc func plusButtonAction() {
        let addIngredientVC = AddIngredientViewController()
        if pizzaOneButton.isTouchInside {
        addIngredientVC.pizza = pizzaOne
        } else if pizzaTwoButton.isTouchInside {
        addIngredientVC.pizza = pizzaTwo
        }
        present(addIngredientVC, animated: false)
    }
}
