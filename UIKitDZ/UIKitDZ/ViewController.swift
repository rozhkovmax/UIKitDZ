//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 22.09.2022.
//

import UIKit
/// Импорт библиотеки плеера
import AVFoundation
/// Контроллер начального экрана
class ViewController: UIViewController {
    
    @IBOutlet weak var songOneImage: UIImageView!
    @IBOutlet weak var songOneLable: UILabel!
    
    @IBOutlet weak var songTwoImage: UIImageView!
    @IBOutlet weak var songTwoLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
// Кнопка перехода на 2 View с передачей картинки, названия и аудиодорожки для 1 песни
    @IBAction func songOneActionButton(_ sender: Any) {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        guard let audioView = storybord.instantiateViewController(withIdentifier: "AudioView")
                as? AudioViewController else { return }
        audioView.image = songOneImage.image
        audioView.nameSong = songOneLable.text ?? ""
        musicChoice(nameMusic: "ottenki", player: &audioView.player)
        present(audioView, animated: true)
    }
    
// Кнопка перехода на 2 View с передачей картинки, названия и аудиодорожки для 2 песни
    @IBAction func songTwoActionButton(_ sender: Any) {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        guard let audioView = storybord.instantiateViewController(withIdentifier: "AudioView")
                as? AudioViewController else { return }
        audioView.image = songTwoImage.image
        audioView.nameSong = songTwoLable.text ?? ""
        musicChoice(nameMusic: "privychka", player: &audioView.player)
        present(audioView, animated: true)
    }
    
// Метод для выбора песни
    func musicChoice (nameMusic: String, player: inout AVAudioPlayer) {
        do {
            if let audio = Bundle.main.path(forResource: nameMusic, ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audio))
            }
        } catch {
            let alertControllerMusicChoice = UIAlertController(title: "Внимание!",
                                                    message: "Аудиодорожка не найдена",
                                                    preferredStyle: .alert)
            let actionAlertControllerMusicChoice = UIAlertAction(title: "Ok", style: .default)
            alertControllerMusicChoice.addAction(actionAlertControllerMusicChoice)
            present(alertControllerMusicChoice, animated: true, completion: nil)
        }
    }
}
