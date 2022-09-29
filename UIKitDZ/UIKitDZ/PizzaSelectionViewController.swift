//
//  PizzaSelectionViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 29.09.2022.
//

import UIKit
///  Контроллер выбора пиццы
final class PizzaSelectionViewController: UIViewController {

    let pizzaNameOneLabel = UILabel()
    let pizzaNameTwoLabel = UILabel()
    let pizzaOneButton = UIButton(type: .roundedRect)
    let pizzaTwoButton = UIButton(type: .roundedRect)
    let pizzaOneImage = UIImage(systemName: "plus.square")
    let pizzaTwoImage1 = UIImage(systemName: "plus.square")
    var pizzaOneImageView = UIImageView()
    var pizzaTwoImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
