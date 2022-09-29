//
//  SecondViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 28.09.2022.
//

import UIKit
///  Контроллер выбора еды
final class FoodSelectionViewController: UIViewController {

    let pizzaButton = UIButton(type: .roundedRect)
    let sushiButton = UIButton(type: .roundedRect)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createButton()

    }
    
    func createButton() {
        title = "Food"
        pizzaButton.frame = CGRect(x: 51, y: 145, width: 312, height: 119)
        pizzaButton.layer.borderWidth = 1
        pizzaButton.setTitle("Пицца", for: .normal)
       // pizzaButton.addTarget(self, action: #selector(singInAction(parametrSender:)),
        //                       for: .touchUpInside)
        view.addSubview(pizzaButton)
        
        sushiButton.frame = CGRect(x: 51, y: 321, width: 312, height: 119)
        sushiButton.layer.borderWidth = 1
        sushiButton.layer.borderColor = UIColor.red.cgColor
        sushiButton.setTitle("Суши", for: .normal)
        view.addSubview(sushiButton)
        
    }
}
