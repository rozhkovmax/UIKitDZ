//
//  ContactList.swift
//  UIKitDZ
//
//  Created by Maxim on 25.09.2022.
//

import UIKit
/// ContactListViewController
class ContactListViewController: UIViewController {
    
    let personOneImage = UIImage(named: "personOne")
    let personOneName = UILabel()
    let personOneInfo = UILabel()
    let personOneDay = UILabel()
    
    let personTwoImage = UIImage(named: "personTwo")
    let personTwoName = UILabel()
    let personTwoInfo = UILabel()
    let personTwoDay = UILabel()
    
    let personThreeImage = UIImage(named: "personThree")
    let personThreeName = UILabel()
    let personThreeInfo = UILabel()
    let personThreeDay = UILabel()
    
    var personOneImageView = UIImageView()
    var personTwoImageView = UIImageView()
    var personThreeImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Birthday"
        
        creationPersonOne()
        creationPersonTwo()
        creationPersonThree()
        
        addBarButton()
    }
    
// Cоздание макета для персоны 1
    func creationPersonOne() {
        personOneImageView.frame = CGRect(x: 39, y: 150, width: 140, height: 140)
        personOneImageView.contentMode = .scaleAspectFill
        personOneImageView.layer.cornerRadius = 70
        personOneImageView.clipsToBounds = true
        personOneImageView.image = personOneImage
        view.addSubview(personOneImageView)
        
        personOneName.frame = CGRect(x: 187, y: 150, width: 90, height: 40)
        personOneName.textAlignment = .left
        personOneName.text = "Максим"
        personOneName.adjustsFontSizeToFitWidth = true
        personOneName.font = personOneName.font.withSize(30)
        view.addSubview(personOneName)
        
        personOneInfo.frame = CGRect(x: 187, y: 199, width: 196, height: 42)
        personOneInfo.textAlignment = .left
        personOneInfo.text = "27 сентября, во вторник исполнится 30 лет"
        personOneInfo.adjustsFontSizeToFitWidth = true
        personOneInfo.numberOfLines = 2
        personOneInfo.textColor = UIColor.systemGray
        personOneInfo.font = personOneInfo.font.withSize(15)
        view.addSubview(personOneInfo)
        
        personOneDay.frame = CGRect(x: 327, y: 150, width: 67, height: 40)
        personOneDay.textAlignment = .right
        personOneDay.text = "2 дня"
        personOneDay.adjustsFontSizeToFitWidth = true
        personOneDay.textColor = UIColor.systemGray
        personOneDay.font = personOneDay.font.withSize(15)
        view.addSubview(personOneDay)
    }
    
// Cоздание макета для персоны 2
    func creationPersonTwo() {
        personTwoImageView.frame = CGRect(x: 39, y: 298, width: 140, height: 140)
        personTwoImageView.contentMode = .scaleAspectFill
        personTwoImageView.layer.cornerRadius = 70
        personTwoImageView.clipsToBounds = true
        personTwoImageView.image = personTwoImage
        view.addSubview(personTwoImageView)
        
        personTwoName.frame = CGRect(x: 187, y: 298, width: 90, height: 40)
        personTwoName.textAlignment = .left
        personTwoName.text = "Анна"
        personTwoName.adjustsFontSizeToFitWidth = true
        personTwoName.font = personTwoName.font.withSize(30)
        view.addSubview(personTwoName)
        
        personTwoInfo.frame = CGRect(x: 187, y: 347, width: 196, height: 42)
        personTwoInfo.textAlignment = .left
        personTwoInfo.text = "23 октября, в воскресенье исполнится 25 лет"
        personTwoInfo.adjustsFontSizeToFitWidth = true
        personTwoInfo.numberOfLines = 2
        personTwoInfo.textColor = UIColor.systemGray
        personTwoInfo.font = personTwoInfo.font.withSize(15)
        view.addSubview(personTwoInfo)
        
        personTwoDay.frame = CGRect(x: 327, y: 298, width: 67, height: 40)
        personTwoDay.textAlignment = .right
        personTwoDay.text = "27 дней"
        personTwoDay.adjustsFontSizeToFitWidth = true
        personTwoDay.textColor = UIColor.systemGray
        personTwoDay.font = personTwoDay.font.withSize(15)
        view.addSubview(personTwoDay)
    }
    
// Cоздание макета для персоны 3
    func creationPersonThree() {
        personThreeImageView.frame = CGRect(x: 39, y: 446, width: 140, height: 140)
        personThreeImageView.contentMode = .scaleAspectFill
        personThreeImageView.layer.cornerRadius = 70
        personThreeImageView.clipsToBounds = true
        personThreeImageView.image = personThreeImage
        view.addSubview(personThreeImageView)
        
        personThreeName.frame = CGRect(x: 187, y: 446, width: 90, height: 40)
        personThreeName.textAlignment = .left
        personThreeName.text = "Петя"
        personThreeName.adjustsFontSizeToFitWidth = true
        personThreeName.font = personThreeName.font.withSize(30)
        view.addSubview(personThreeName)
        
        personThreeInfo.frame = CGRect(x: 187, y: 495, width: 196, height: 42)
        personThreeInfo.textAlignment = .left
        personThreeInfo.text = "16 ноября, в среду исполнится 28 лет"
        personThreeInfo.adjustsFontSizeToFitWidth = true
        personThreeInfo.numberOfLines = 2
        personThreeInfo.textColor = UIColor.systemGray
        personThreeInfo.font = personThreeInfo.font.withSize(15)
        view.addSubview(personThreeInfo)
        
        personThreeDay.frame = CGRect(x: 327, y: 446, width: 67, height: 40)
        personThreeDay.textAlignment = .right
        personThreeDay.text = "51 день"
        personThreeDay.adjustsFontSizeToFitWidth = true
        personThreeDay.textColor = UIColor.systemGray
        personThreeDay.font = personThreeDay.font.withSize(15)
        view.addSubview(personThreeDay)
    }
    
// Создания кнопки добавть(+)
    func addBarButton() {
        let barButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
            navigationItem.rightBarButtonItem = barButton
    }
    
// Метод для перехода на 3 экран
    @objc func addItem() {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
            guard let addContact = storybord.instantiateViewController(withIdentifier: "addContactViewController")
                    as? AddContactViewController else { return }
            self.present(addContact, animated: true)
    }
}
