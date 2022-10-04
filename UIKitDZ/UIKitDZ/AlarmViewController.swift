//
//  AlarmViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 02.10.2022.
//

import UIKit
/// Контроллер будильника
final class AlarmViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var alarmOneSwitch: UISwitch!
    @IBOutlet private weak var alarmTwoSwitch: UISwitch!
    @IBOutlet private weak var alarmThreeSwitch: UISwitch!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        colorSwitch()
    }
    
    // MARK: - Private Methods
    private func colorSwitch() {
        alarmOneSwitch.layer.cornerRadius = alarmOneSwitch.frame.height / 2
        alarmOneSwitch.backgroundColor = UIColor.darkGray
        alarmOneSwitch.clipsToBounds = true
        
        alarmTwoSwitch.layer.cornerRadius = alarmTwoSwitch.frame.height / 2
        alarmTwoSwitch.backgroundColor = UIColor.darkGray
        alarmTwoSwitch.clipsToBounds = true
        
        alarmThreeSwitch.layer.cornerRadius = alarmThreeSwitch.frame.height / 2
        alarmThreeSwitch.backgroundColor = UIColor.darkGray
        alarmThreeSwitch.clipsToBounds = true
    }

}
