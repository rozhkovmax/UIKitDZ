//
//  CaloriesViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 02.10.2022.
//

import UIKit
/// Контроллер колорийности
final class CaloriesViewController: UIViewController {

    private let backButton = UIButton(type: .roundedRect)
    private let nameLable = UILabel()
    private let orderLabel = UILabel()
    private let textLable = UILabel()
    var pizza: Pizza?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allMethod()
    }
    
    private func createButton() {
        backButton.frame = CGRect(x: 46, y: 44, width: 30, height: 30)
        backButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        backButton.tintColor = .black
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        view.addSubview(backButton)
    }
    
    private func createLable() {
        nameLable.frame = CGRect(x: 98, y: 93, width: 219, height: 60)
        nameLable.backgroundColor = .orange
        nameLable.textColor = .white
        nameLable.text = pizza?.pizzaName
        nameLable.font = .systemFont(ofSize: 25)
        nameLable.textAlignment = .center
        nameLable.layer.cornerRadius = 10
        nameLable.layer.borderWidth = 1
        nameLable.layer.masksToBounds = true
        view.addSubview(nameLable)
        
        orderLabel.frame = CGRect(x: 46, y: 173, width: 176, height: 44)
        orderLabel.text = "Колорийность:"
        orderLabel.font = .systemFont(ofSize: 20)
        orderLabel.textAlignment = .left
        view.addSubview(orderLabel)
        
        textLable.frame = CGRect(x: 46, y: 258, width: 322, height: 96)
        textLable.font = .systemFont(ofSize: 16)
        textLable.numberOfLines = 0
        view.addSubview(textLable)
    }
    
    private func createLabelText() {
        if nameLable.text == "Маргарита" {
            textLable.text = "Общая коллорийность = 203 кКал"
        } else {
            textLable.text = "Общая коллорийность = 272 кКал"
        }
    }
    
    private func allMethod() {
        view.backgroundColor = .white
        createButton()
        createLable()
        createLabelText()
    }
    
    @objc private func backButtonAction() {
        dismiss(animated: false)
    }
}
