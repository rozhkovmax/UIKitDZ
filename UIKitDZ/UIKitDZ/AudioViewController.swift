//
//  AudioViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 24.09.2022.
//

import UIKit
/// Импорт библиотеки плеера
import AVFoundation
/// Контроллер плеера
class AudioViewController: ViewController {

    @IBOutlet weak var songImage: UIImageView!
    @IBOutlet weak var songLable: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var slider: UISlider!
    
    var image = UIImage(systemName: "q")
    var nameSong = String()
    var player = AVAudioPlayer()
    var shouldPlay = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        changeParam()
    }
    
// Подгружаем картинку и название песни, меняем значение slider по текущему значению песни
    func changeParam() {
        songImage.image = image
        songLable.text = nameSong
        Timer.scheduledTimer(timeInterval: 0.1, target: self,
                             selector: #selector(updateSliderAction),
                             userInfo: nil, repeats: true)
    }
    
// Кнопка для возвращения на 1 View
    @IBAction func backActionButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
// Slider значения коротого равняются длительности песни
    @IBAction func audioActionSlider(_ sender: Any) {
        player.currentTime = TimeInterval(self.slider.value)
    }
    
// Кнопка воспроизведения и паузы
    @IBAction func playTouchActionButton(_ sender: Any) {
        shouldPlay = !shouldPlay
        guard shouldPlay else { return playMusic() }
        guard !shouldPlay else { return pauseMusic() }
    }
    
// Метод для воспроизведения и замены картинки
    func playMusic() {
        let pauseImage = UIImage(systemName: "pause.fill")
        playButton.setImage(pauseImage, for: .normal)
        player.play()
    }
    
// Метод для паузы и замены картинки
    func pauseMusic() {
        let playImage = UIImage(systemName: "play.fill")
        playButton.setImage(playImage, for: .normal)
        self.player.pause()
    }
    
// Метод для изменения значений slider
    @objc func updateSliderAction() {
        slider.value = Float(player.currentTime)
        slider.maximumValue = Float(player.duration)
    }
}
