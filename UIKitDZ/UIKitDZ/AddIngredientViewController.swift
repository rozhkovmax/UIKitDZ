//
//  AddIngredientViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 01.10.2022.
//

protocol ViewControllerDelegate: AnyObject {
     func goBack()
 }

import UIKit
/// Контроллер добавления дополнительных ингредиентов
final class AddIngredientViewController: UIViewController {

    let ingredientCheesLabel = UILabel()
    let ingredieHamtHLabel = UILabel()
    let ingredientMashroomLabel = UILabel()
    let ingredientOliveLabel = UILabel()
    let pizzaNameLabel = UILabel()
    let chooseButton = UIButton(type: .roundedRect)
    let ingredientCheesSwitch = UISwitch()
    let ingredientHamSwitch = UISwitch()
    let ingredientMashroomSwitch = UISwitch()
    let ingredientOliveSwitch = UISwitch()
    let caloriesButton = UIButton(type: .roundedRect)
    var pizzaImageView = UIImageView()
    var pizza: Pizza?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allMetod()
    }

    func createImage() {
        pizzaImageView.frame = CGRect(x: 82, y: 209, width: 250, height: 250)
        pizzaImageView.image = UIImage(named: pizza?.pizzaImage ?? "")
        view.addSubview(pizzaImageView)
     }
    
    func createButton() {
        chooseButton.frame = CGRect(x: 82, y: 750, width: 98, height: 45)
        chooseButton.setTitle("Выбрать", for: .normal)
        chooseButton.tintColor = .white
        chooseButton.backgroundColor = .orange
        chooseButton.layer.cornerRadius = 10
        chooseButton.layer.borderWidth = 1
        chooseButton.layer.masksToBounds = true
        chooseButton.addTarget(self, action: #selector(checkButtonAction),
                               for: .touchUpInside)
        view.addSubview(chooseButton)
        
        caloriesButton.frame = CGRect(x: 234, y: 750, width: 98, height: 45)
        caloriesButton.setTitle("Колории", for: .normal)
        caloriesButton.tintColor = .white
        caloriesButton.backgroundColor = .orange
        caloriesButton.layer.cornerRadius = 10
        caloriesButton.layer.borderWidth = 1
        caloriesButton.layer.masksToBounds = true
        caloriesButton.addTarget(self, action: #selector(caloriesButtonAction),
                               for: .touchUpInside)
        view.addSubview(caloriesButton)
    }
    
    func createLabel() {
        pizzaNameLabel.frame = CGRect(x: 90, y: 106, width: 235, height: 50)
        pizzaNameLabel.textAlignment = .center
        pizzaNameLabel.text = pizza?.pizzaName ?? ""
        pizzaNameLabel.textColor = .black
        pizzaNameLabel.font = .systemFont(ofSize: 25)
        view.addSubview(pizzaNameLabel)

        ingredientCheesLabel.frame = CGRect(x: 82, y: 499, width: 120, height: 31)
        ingredientCheesLabel.textAlignment = .left
        ingredientCheesLabel.text = "Сыр Моцарелла"
        ingredientCheesLabel.textColor = .black
        ingredientCheesLabel.font = .systemFont(ofSize: 15)
        view.addSubview(ingredientCheesLabel)
        
        ingredieHamtHLabel.frame = CGRect(x: 82, y: 557, width: 98, height: 31)
        ingredieHamtHLabel.textAlignment = .left
        ingredieHamtHLabel.text = "Ветчина"
        ingredieHamtHLabel.textColor = .black
        ingredieHamtHLabel.font = .systemFont(ofSize: 15)
        view.addSubview(ingredieHamtHLabel)
        
        ingredientMashroomLabel.frame = CGRect(x: 82, y: 613, width: 98, height: 31)
        ingredientMashroomLabel.textAlignment = .left
        ingredientMashroomLabel.text = "Грибы"
        ingredientMashroomLabel.textColor = .black
        ingredientMashroomLabel.font = .systemFont(ofSize: 15)
        view.addSubview(ingredientMashroomLabel)
        
        ingredientOliveLabel.frame = CGRect(x: 82, y: 666, width: 98, height: 31)
        ingredientOliveLabel.textAlignment = .left
        ingredientOliveLabel.text = "Маслины"
        ingredientOliveLabel.textColor = .black
        ingredientOliveLabel.font = .systemFont(ofSize: 15)
        view.addSubview(ingredientOliveLabel)
    }
    
    func createSwitch() {
        ingredientCheesSwitch.frame = CGRect(x: 285, y: 499, width: 49, height: 31)
        view.addSubview(ingredientCheesSwitch)
        ingredientHamSwitch.frame = CGRect(x: 285, y: 557, width: 49, height: 31)
        view.addSubview(ingredientHamSwitch)
        ingredientMashroomSwitch.frame = CGRect(x: 285, y: 613, width: 49, height: 31)
        view.addSubview(ingredientMashroomSwitch)
        ingredientOliveSwitch.frame = CGRect(x: 285, y: 666, width: 49, height: 31)
        view.addSubview(ingredientOliveSwitch)
    }
    
    func allMetod() {
        view.backgroundColor = .white
        createImage()
        createButton()
        createLabel()
        createSwitch()
    }
    
    @objc func caloriesButtonAction() {
        let caloriesVC = CaloriesViewController()
        caloriesVC.pizza = pizza
        present(caloriesVC, animated: false)
    }
    
    @objc func checkButtonAction() {
        let checkVC = CheckViewController()
        checkVC.delegate = self
        checkVC.pizza = pizza
        checkVC.addChees = ingredientCheesSwitch.isOn
        checkVC.addHam = ingredientHamSwitch.isOn
        checkVC.addMashroom = ingredientMashroomSwitch.isOn
        checkVC.addOlive = ingredientOliveSwitch.isOn
        let navigationController = UINavigationController(rootViewController: checkVC)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: false)
    }
}

extension AddIngredientViewController: ViewControllerDelegate {
    func goBack() {
        guard let addIngredientVC = self.presentingViewController as? UINavigationController else { return }
        view.isHidden = true
        dismiss(animated: false)
        addIngredientVC.popToRootViewController(animated: false)
    }
}
