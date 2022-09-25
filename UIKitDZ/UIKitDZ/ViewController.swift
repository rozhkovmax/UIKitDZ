//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 22.09.2022.
//

import UIKit
/// Импорт библиотеки плеера
import AVFoundation
/// Начальный VC
class ViewController: UIViewController {
    
    @IBOutlet weak var songOneImage: UIImageView!
    @IBOutlet weak var songOneLable: UILabel!
    
    @IBOutlet weak var songTwoImage: UIImageView!
    @IBOutlet weak var songTwoLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
// Кнопка перехода на 2 View с передачей картинки, названия и аудиодорожки для 1 песни
    @IBAction func songOneButton(_ sender: Any) {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
                     guard let audioView = storybord.instantiateViewController(withIdentifier: "AudioView")
                             as? AudioViewController else { return }
        audioView.image = songOneImage.image
        audioView.nameSong = songOneLable.text ?? ""
        music(nameMusic: "ottenki", player: &audioView.player)
        self.present(audioView, animated: true)
    }
// Кнопка перехода на 2 View с передачей картинки, названия и аудиодорожки для 2 песни
    @IBAction func songTwoButton(_ sender: Any) {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
                     guard let audioView = storybord.instantiateViewController(withIdentifier: "AudioView")
                             as? AudioViewController else { return }
        audioView.image = songTwoImage.image
        audioView.nameSong = songTwoLable.text ?? ""
        music(nameMusic: "privychka", player: &audioView.player)
        self.present(audioView, animated: true)
    }
// Метод для выбора песни
    func music (nameMusic: String, player: inout AVAudioPlayer) {
        do {
            if let audio = Bundle.main.path(forResource: nameMusic, ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audio))
            }
        } catch {
            let alertController = UIAlertController(title: "Внимание!",
                                                    message: "Аудиодорожка не найдена",
                                                    preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }
    }
}
