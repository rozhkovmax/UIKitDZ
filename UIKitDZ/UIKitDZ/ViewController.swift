//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 22.09.2022.
//

import UIKit
/// Класс с товаром
class CreatureViewController: UIViewController {
    
    let imageArray = [UIImage(named: "discharge_lamp"),
                      UIImage(named: "incandescent_lamp"),
                      UIImage(named: "LED_lamp")]
    let basketButton = UIButton()
    let priceLable = UILabel()
    var priceArrayLable = UILabel()
    var productDescriptionLable = UILabel()
    var segmentControl = UISegmentedControl()
    var imageView = UIImageView()
    var menuSegmentControlArray = ["Накаливания", "Люминисцентная", "Диодная"]
    var priceArray = ["50р.", "200р.", "400р."]
    var productDescriptionArray = ["Свет испускает тепло накала",
                                   "Газоразрядный источник света",
                                   "Источник света, основанный на светодиодах"]
    override func viewDidLoad() {
        super.viewDidLoad()
        allMetod()
    }
    
// Cоздание Image
    func createImage() {
        view.backgroundColor = .black
        imageView.frame = CGRect(x: 42, y: 132, width: 330, height: 279)
        imageView.contentMode = .scaleAspectFill
        imageView.image = imageArray[0]
        view.addSubview(imageView)
    }
    
// Cоздание Lable
    func createLable() {
        priceLable.frame = CGRect(x: 40, y: 580, width: 80, height: 50)
        priceLable.textAlignment = .left
        priceLable.text = "Цена:"
        priceLable.textColor = .systemRed
        priceLable.font = priceLable.font.withSize(30)
        view.addSubview(priceLable)
        
        priceArrayLable.frame = CGRect(x: 170, y: 580, width: 80, height: 50)
        priceArrayLable.textAlignment = .center
        priceArrayLable.text = "50р."
        priceArrayLable.textColor = .systemRed
        priceArrayLable.font = priceArrayLable.font.withSize(30)
        view.addSubview(priceArrayLable)
        
        productDescriptionLable.frame = CGRect(x: 52, y: 625, width: 310, height: 160)
        productDescriptionLable.textAlignment = .left
        productDescriptionLable.text = "Описание"
        productDescriptionLable.textColor = .systemRed
        productDescriptionLable.font = productDescriptionLable.font.withSize(25)
        productDescriptionLable.numberOfLines = 0
        view.addSubview(productDescriptionLable)
    }
    
// Создаем SegmentedControl
    func createSegmentControl() {
        segmentControl = UISegmentedControl(items: menuSegmentControlArray)
        segmentControl.frame = CGRect(x: 7, y: 480, width: 400, height: 31)
        segmentControl.backgroundColor = .systemRed
        segmentControl.selectedSegmentTintColor = .systemPurple
        view.addSubview(segmentControl)
// Наблюдатель за SegmentControl
        segmentControl.addTarget(self, action: #selector(selectedValue), for: .valueChanged)
    }
    
// Создаем Button
    func createButton() {
        basketButton.frame = CGRect(x: 340, y: 50, width: 50, height: 50)
        basketButton.setImage(UIImage(systemName: "cart"), for: .normal)
        basketButton.imageView?.tintColor = .systemRed
// Наблюдатель за положение кнопки корзины
        basketButton.addTarget(self, action: #selector(showBasketAction), for: .touchUpInside)
        view.addSubview(basketButton)
    }
    
// Объединяем все вместе
    func allMetod() {
        createImage()
        createSegmentControl()
        createButton()
        createLable()
    }
    
// Метод кнопки корзины
    @objc func showBasketAction (sender: UIButton) {
        let alertController = UIAlertController(title: "ОЙ! :(",
                                                message: "Корзина сейчас недоступна Приносим свои извинения",
                                                preferredStyle: .alert)
        let alertControllerAction = UIAlertAction(title: "Окей", style: .cancel)
        alertController.addAction(alertControllerAction)
        present(alertController, animated: true, completion: nil)
    }
    
// Метод изменения SegmentControl
    @objc func selectedValue(target: UISegmentedControl) {
        if target == segmentControl {
            let segmentIndex = target.selectedSegmentIndex
            imageView.image = imageArray[segmentIndex]
            priceArrayLable.text = priceArray[segmentIndex]
            productDescriptionLable.text = productDescriptionArray[segmentIndex]
        }
    }
}
