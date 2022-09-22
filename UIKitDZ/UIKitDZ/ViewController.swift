//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 22.09.2022.
//

import UIKit
/// Начальный VC
class ViewController: UIViewController {

    let lableWord = UILabel()
    let buttonWord = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
// Создаем Lable и Button
        let lableWordFrame = CGRect(x: 107, y: 100, width: 200, height: 100)
        lableWord.frame = lableWordFrame
        lableWord.textAlignment = .center
        view.addSubview(lableWord)
        
        let buttonWordFrame = CGRect(x: 107, y: 300, width: 200, height: 100)
        buttonWord.frame = buttonWordFrame
        buttonWord.setTitle("Слово", for: .normal)
        buttonWord.backgroundColor = .orange
        view.addSubview(buttonWord)
 
// Создаем наблюдатель за кнопкой
        buttonWord.addTarget(self, action: #selector(buttonWordAction), for: .touchUpInside)
    }

// Создаем метод кнопки
    @objc func buttonWordAction() {
        let alert = UIAlertController(title: "Введите слово", message: "Подсказака: leohl", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ок", style: .default) { _ in
            let myWord = alert.textFields?.first?.text
            self.lableWord.text = Model.model.convertWord(word: myWord ?? "")
        }
        alert.addTextField(configurationHandler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

// Создаем новую структуру
struct Model {
    public static let model = Model()
    func convertWord (word: String) -> String {
        if word == "leohl" {
            return "hello"
        } else {
            return "Неизвестное слово"
        }
    }
}
