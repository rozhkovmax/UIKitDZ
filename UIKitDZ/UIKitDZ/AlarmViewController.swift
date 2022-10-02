//
//  AlarmViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 02.10.2022.
//

import UIKit
/// Контроллер будильника
class AlarmViewController: UIViewController {

    @IBOutlet weak var alarmOneSwitch: UISwitch!
    @IBOutlet weak var alarmTwoSwitch: UISwitch!
    @IBOutlet weak var alarmThreeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorSwitch()
    }
    
    func colorSwitch() {
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
