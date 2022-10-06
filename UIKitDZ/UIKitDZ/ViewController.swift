//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 22.09.2022.
//

import UIKit
/// Контроллер секундомера
final class StopwatchViewController: UIViewController {
    
    // MARK: - Constants
    private enum Constants {
        static let pause = "Пауза"
        static let start = "Старт"
        static let timeString = "00:00.00"
    }
    
    // MARK: - IBOutlet
    @IBOutlet private weak var stopwatchLabel: UILabel!
    @IBOutlet private weak var stopButton: UIButton!
    @IBOutlet private weak var startPauseButton: UIButton!
    
    // MARK: - Private Propertys
    private var timer = Timer()
    private var minutesTime = 0
    private var secondsTime = 0
    private var millisecondsTime = 0
    private var isStartStopwatch = true
    private var stopwatchString = ""
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    @IBAction private func startPauseButtonAction(_ sender: Any) {
        if isStartStopwatch == true {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self,
                                         selector: #selector(updateStopwatch), userInfo: nil, repeats: true)
            isStartStopwatch = false
            startPauseButton.setTitle(Constants.pause, for: .normal)
        } else {
            timer.invalidate()
            isStartStopwatch = true
            startPauseButton.setTitle(Constants.start, for: .normal)
        }
    }
    
    @IBAction private func stopButtonAction(_ sender: Any) {
        millisecondsTime = 0
        secondsTime = 0
        minutesTime = 0
        stopwatchLabel.text = Constants.timeString
    }
    
    // MARK: - Private objc Methods
    @objc private func updateStopwatch() {
        millisecondsTime += 1
        if millisecondsTime == 100 {
            secondsTime += 1
            millisecondsTime = 0
        }
        if secondsTime == 60 {
            minutesTime += 1
            secondsTime = 0
        }
        let fractionsString = millisecondsTime > 9 ? "\(millisecondsTime)" : "0\(millisecondsTime)"
        let secondsString = secondsTime > 9 ? "\(secondsTime)" : "0\(secondsTime)"
        let minutesString = minutesTime > 9 ? "\(minutesTime)" : "0\(minutesTime)"
        stopwatchString = "\(minutesString):\(secondsString).\(fractionsString)"
        stopwatchLabel.text = stopwatchString
    }
}
