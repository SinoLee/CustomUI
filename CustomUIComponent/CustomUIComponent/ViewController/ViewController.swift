//
//  ViewController.swift
//  CustomUIComponent
//
//  Created by Taeyoun Lee on 2020/03/07.
//  Copyright © 2020 SinoLab. All rights reserved.
//

import UIKit
import CustomUI

class ViewController: UIViewController {
        
    var tb: TitleBar?
    
    var customSwitch: CustomSwitch = {
        // https://github.com/factoryhr/CustomUISwitch
        let customSwitch = CustomSwitch()
        customSwitch.translatesAutoresizingMaskIntoConstraints = false
        customSwitch.onTintColor = UIColor(red: 70/255, green: 158/255, blue: 179/255, alpha: 1.0)
        customSwitch.offTintColor = UIColor(white: 208/255, alpha: 1.0)
        return customSwitch
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let sw = SLSwittch()
        sw.frame = CGRect(x: 100, y: 100, width: 40, height: 26)
        view.addSubview(sw)
//        self.titleBar.setTitle("Title ...1234567890123456789012345678901234567")
//        let v = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
//        v.backgroundColor = .black
//        self.titleBar.actionView = v
    }


}

