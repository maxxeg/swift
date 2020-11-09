//
//  ViewController.swift
//  SomeLights
//
//  Created by РТ Лабс on 09.11.2020.
//  Copyright © 2020 РТ Лабс. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    /// Убираем статус бар
    override var prefersStatusBarHidden: Bool {
        false
    }
    
    /// Признак включения фонарика
    var isOn = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    /// Реагируем на нажатие кнопки
    @IBAction func buttonPressed() {
        changeValue()
        interactWithLight()
    }
    
    /// Меняем значение признака
    func changeValue() {
        isOn = !isOn
    }

    /// Взаимодействуем с фонариком устройства
    func interactWithLight() {
        if let device = AVCaptureDevice.default(for: .video), device.hasTorch {
            do {
                try device.lockForConfiguration()
                device.torchMode = isOn ? .on : .off
                device.unlockForConfiguration()
            } catch {
                print(error.localizedDescription)
            }
        } else {
            changeBackground()
        }
    }
    
    /// Меняем фон экрана в зависимости от признака 'isOn'
    func changeBackground() {
        view.backgroundColor = isOn ? .white : .black
    }
}

