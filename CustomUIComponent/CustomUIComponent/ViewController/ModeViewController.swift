//
//  ModeViewController.swift
//  CustomUIComponent
//
//  Created by Taeyoun Lee on 2020/03/07.
//  Copyright © 2020 SinoLab. All rights reserved.
//

import UIKit

class ModeViewController: UIViewController {

    var customSwitch: CustomSwitch = {
        let customSwitch = CustomSwitch()
        customSwitch.translatesAutoresizingMaskIntoConstraints = false
        customSwitch.onTintColor = UIColor(red: 70/255, green: 158/255, blue: 179/255, alpha: 1.0)
        customSwitch.offTintColor = UIColor(white: 208/255, alpha: 1.0)
        return customSwitch
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    private func setupUI() {
        //self.view.addSubview(customSwitch)
        self.view.addSubview(customSwitch)
        setupConstraints()
    }
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            customSwitch.topAnchor.constraint(equalTo: self.view.centerYAnchor),
            customSwitch.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            customSwitch.widthAnchor.constraint(equalToConstant: 41),
            customSwitch.heightAnchor.constraint(equalToConstant: 24)])
    }
}
