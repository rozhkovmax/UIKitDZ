//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 22.09.2022.
//

import UIKit

/// Начальный VC
class ViewController: UIViewController {

    let lableName = UILabel()
    let lableSum = UILabel()
    let lableGame = UILabel()
    let sumButton = UIButton()
    let gameButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
// Создаем Lable и Button на View
        lableName.frame = CGRect(x: 107, y: 65, width: 200, height: 100)
        lableName.textAlignment = .center
        view.addSubview(lableName)
        
        lableSum.frame = CGRect(x: 107, y: 205, width: 200, height: 100)
        lableSum.adjustsFontSizeToFitWidth = true
        lableSum.numberOfLines = 2
        lableSum.textAlignment = .center
        view.addSubview(lableSum)
        
        lableGame.frame = CGRect(x: 107, y: 460, width: 200, height: 100)
        lableGame.adjustsFontSizeToFitWidth = true
        lableGame.numberOfLines = 2
        lableGame.textAlignment = .center
        view.addSubview(lableGame)
        
        sumButton.frame = CGRect(x: 107, y: 320, width: 200, height: 100)
        sumButton.setTitle("Сложение", for: .normal)
        sumButton.backgroundColor = .lightGray
        view.addSubview(sumButton)
        
        gameButton.frame = CGRect(x: 107, y: 600, width: 200, height: 100)
        gameButton.setTitle("Угадай число", for: .normal)
        gameButton.backgroundColor = .lightGray
        view.addSubview(gameButton)
        
// Наблюдатели за кнопками
        sumButton.addTarget(self, action: #selector(sumButtonAction), for: .touchUpInside)
        gameButton.addTarget(self, action: #selector(gameButtonAction), for: .touchUpInside)
    }
    
// Alert при запуске приложения с именем
    override func viewDidAppear(_ animated: Bool) {
        let alertController = UIAlertController(title: "Здравствуйте!",
                                                message: "Как Вас зовут?", preferredStyle: .alert)
        let action = UIAlertAction(title: "Подтвердить", style: .cancel) { _ in
            let text = alertController.textFields?.first?.text
            if text?.isEmpty == true {
                self.lableName.text = "Привет, гость!"
            } else {
                self.lableName.text = "Привет, \(text ?? "")!"
            }
        }
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
// Метод кнопки "Сложение"
    @objc func sumButtonAction() {
        let alertSum = UIAlertController(title: "Сложение чисел", message: "Введите два числа", preferredStyle: .alert)
        let actionSum = UIAlertAction(title: "Показать результат", style: .default) { _ in
            let firstNumber: Int? = Int(alertSum.textFields?.first?.text ?? "")
            let secondNumber: Int? = Int(alertSum.textFields?.last?.text ?? "")
            if (firstNumber != nil) && (secondNumber != nil) {
                let sum = (firstNumber ?? 0) + (secondNumber ?? 0)
                self.lableSum.text = "Сумма чисел = \(sum)"
            } else {
                self.lableSum.text = "Введены некорректные данные!"
            }
        }
        alertSum.addTextField(configurationHandler: nil)
        alertSum.addTextField(configurationHandler: nil)
        alertSum.addAction(actionSum)
        self.present(alertSum, animated: true, completion: nil)
    }
  
// Метод кнопки "Угадай число"
    @objc func gameButtonAction() {
        let alertGame = UIAlertController(title: "Угадайте число",
                                          message: "Введите число от 1 до 10", preferredStyle: .alert)
        let actionGame = UIAlertAction(title: "Испытать удачу", style: .default) { _ in
            let randomNumber = Int.random(in: 1...10)
            let myNumber: Int? = Int(alertGame.textFields?.first?.text ?? "")
            if myNumber == randomNumber {
                self.lableGame.text = "Поздравляю! Вы угадали! Загаданное число \(randomNumber)"
            } else {
                self.lableGame.text = "Вы не угадали. Загаданное число \(randomNumber)"
            }
        }
        alertGame.addTextField(configurationHandler: nil)
        alertGame.addAction(actionGame)
        self.present(alertGame, animated: true, completion: nil)
    }
}
