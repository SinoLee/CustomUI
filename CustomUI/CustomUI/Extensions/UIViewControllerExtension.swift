//
//  UIViewControllerExtension.swift
//  CustomUI
//
//  Created by Taeyoun Lee on 2020/03/25.
//  Copyright © 2020 SinoLab. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func dismissOrPop(animated flag: Bool, completion: (() -> Void)? = nil) {
        if let navigationController = self.navigationController {
            if navigationController.popViewController(animated: flag) != nil {
                completion?()
            }
            else {
                navigationController.dismiss(animated: flag, completion: completion)
            }
        }
        else {
            dismiss(animated: flag, completion: completion)
        }
    }
}
