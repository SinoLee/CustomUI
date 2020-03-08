//
//  ViewController.swift
//  CustomUIComponent
//
//  Created by Taeyoun Lee on 2020/03/07.
//  Copyright © 2020 SinoLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleBar: TitleBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.titleBar.setTitle("Title ...1234567890123456789012345678901234567")
        let v = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        v.backgroundColor = .black
        self.titleBar.actionView = v
    }


}

