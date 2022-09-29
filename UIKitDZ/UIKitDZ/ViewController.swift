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
    let priceLabel = UILabel()
    var priceArrayLabel = UILabel()
    var productDescriptionLabel = UILabel()
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
    
    func createImage() {
        view.backgroundColor = .black
        imageView.frame = CGRect(x: 42, y: 132, width: 330, height: 279)
        imageView.contentMode = .scaleAspectFill
        imageView.image = imageArray[0]
        view.addSubview(imageView)
    }
    
    func createLabel() {
        priceLabel.frame = CGRect(x: 40, y: 580, width: 80, height: 50)
        priceLabel.textAlignment = .left
        priceLabel.text = "Цена:"
        priceLabel.textColor = .systemRed
        priceLabel.font = priceLabel.font.withSize(30)
        view.addSubview(priceLabel)
        
        priceArrayLabel.frame = CGRect(x: 170, y: 580, width: 80, height: 50)
        priceArrayLabel.textAlignment = .center
        priceArrayLabel.text = "50р."
        priceArrayLabel.textColor = .systemRed
        priceArrayLabel.font = priceArrayLabel.font.withSize(30)
        view.addSubview(priceArrayLabel)
        
        productDescriptionLabel.frame = CGRect(x: 52, y: 625, width: 310, height: 160)
        productDescriptionLabel.textAlignment = .left
        productDescriptionLabel.text = "Описание"
        productDescriptionLabel.textColor = .systemRed
        productDescriptionLabel.font = productDescriptionLabel.font.withSize(25)
        productDescriptionLabel.numberOfLines = 0
        view.addSubview(productDescriptionLabel)
    }
    
    func createSegmentControl() {
        segmentControl = UISegmentedControl(items: menuSegmentControlArray)
        segmentControl.frame = CGRect(x: 7, y: 480, width: 400, height: 31)
        segmentControl.backgroundColor = .systemRed
        segmentControl.selectedSegmentTintColor = .systemPurple
        view.addSubview(segmentControl)
        segmentControl.addTarget(self, action: #selector(selectedValueAction), for: .valueChanged)
    }
    
    func createButton() {
        basketButton.frame = CGRect(x: 340, y: 50, width: 50, height: 50)
        basketButton.setImage(UIImage(systemName: "cart"), for: .normal)
        basketButton.imageView?.tintColor = .systemRed
        basketButton.addTarget(self, action: #selector(showBasketAction), for: .touchUpInside)
        view.addSubview(basketButton)
    }
    
    func allMetod() {
        createImage()
        createSegmentControl()
        createButton()
        createLabel()
    }
    
    @objc func showBasketAction(sender: UIButton) {
        let alertController = UIAlertController(title: "ОЙ! :(",
                                                message: "Корзина сейчас недоступна Приносим свои извинения",
                                                preferredStyle: .alert)
        let alertControllerAction = UIAlertAction(title: "Окей", style: .cancel)
        alertController.addAction(alertControllerAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func selectedValueAction(target: UISegmentedControl) {
        if target == segmentControl {
            let segmentIndex = target.selectedSegmentIndex
            imageView.image = imageArray[segmentIndex]
            priceArrayLabel.text = priceArray[segmentIndex]
            productDescriptionLabel.text = productDescriptionArray[segmentIndex]
        }
    }
}
