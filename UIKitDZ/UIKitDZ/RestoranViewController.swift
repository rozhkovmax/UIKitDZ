//
//  RestoranViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 05.10.2022.
//

import UIKit
/// Контроллер выбора зала в ресторане
final class RestoranViewController: UIViewController {
    
    // MARK: - Constants
    private enum Constants {
        static let hallDescriptionTextWhite = "Отлично подходит для торжественных мероприятий"
        static let hallDescriptionTextBlue = "Праздник, веселье и еще раз веселье!"
        static let hallDescriptionTextBlack = "Для любителей необычной атмосферы"
        static let hallDescriptionImageWhite = UIImage(named: "1")
        static let hallDescriptionImageBlue = UIImage(named: "2")
        static let hallDescriptionImageBlack = UIImage(named: "3")
        
    }
    
    // MARK: - IBOutlet
    @IBOutlet weak var hallImageView: UIImageView!
    @IBOutlet weak var hallDescriptionLabel: UILabel!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - IBAction
    @IBAction func choiceSegmentController(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            hallImageView.image = Constants.hallDescriptionImageWhite
            hallDescriptionLabel.text = Constants.hallDescriptionTextWhite
        case 1:
            hallImageView.image = Constants.hallDescriptionImageBlue
            hallDescriptionLabel.text = Constants.hallDescriptionTextBlue
        case 2:
            hallImageView.image = Constants.hallDescriptionImageBlack
            hallDescriptionLabel.text = Constants.hallDescriptionTextBlack
        default:
            break
        }
    }
    @IBAction func goBackButtonAction(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBAction func shareButtonAction(_ sender: Any) {
        let activityViewController = UIActivityViewController(activityItems: ["Порекомендуйте нас друзьям!"],
                                                              applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    
}
