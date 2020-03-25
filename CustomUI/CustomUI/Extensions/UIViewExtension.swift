//
//  UIViewExtension.swift
//  CustomUI
//
//  Created by Taeyoun Lee on 2020/03/25.
//  Copyright © 2020 SinoLab. All rights reserved.
//

import UIKit

@objc public extension UIView {
    
    var actionTarget: UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.actionTarget
        } else {
            return nil
        }
    }

    // MARK: NSLayoutConstraint
    func width(_ width: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: width)
    }
    func height(_ height: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: height)
    }
    func centerX() -> NSLayoutConstraint {
        guard let superview = self.superview else { fatalError() }
        return NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: superview, attribute: .centerX, multiplier: 1.0, constant: 0.0)
    }
    func centerY() -> NSLayoutConstraint {
        guard let superview = self.superview else { fatalError() }
        return NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: superview, attribute: .centerY, multiplier: 1.0, constant: 0.0)
    }
    func alignLeading(_ space: CGFloat = 0.0) -> NSLayoutConstraint {
        guard let superview = self.superview else { fatalError() }
        return NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: superview, attribute: .leading, multiplier: 1.0, constant: space)
    }
    func leading(_ from: UIView, space: CGFloat = 0.0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: from, attribute: .trailing, multiplier: 1.0, constant: space)
    }
    func alignTrailing(_ space: CGFloat = 0.0) -> NSLayoutConstraint {
        guard let superview = self.superview else { fatalError() }
        return NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: superview, attribute: .trailing, multiplier: 1.0, constant: space)
    }
    func trailing(_ from: UIView, space: CGFloat = 0.0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: from, attribute: .leading, multiplier: 1.0, constant: space)
    }
    func alignTop(_ space: CGFloat = 0.0) -> NSLayoutConstraint {
        guard let superview = self.superview else { fatalError() }
        return NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1.0, constant: space)
    }
    func top(_ from: UIView, space: CGFloat = 0.0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: from, attribute: .bottom, multiplier: 1.0, constant: space)
    }
    func alignBottom(_ space: CGFloat = 0.0) -> NSLayoutConstraint {
        guard let superview = self.superview else { fatalError() }
        return NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: superview, attribute: .bottom, multiplier: 1.0, constant: space)
    }
    func bottom(_ from: UIView, space: CGFloat = 0.0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: from, attribute: .top, multiplier: 1.0, constant: space)
    }
//
//
//    public func constraintLead(_ superview: UIView, space: CGFloat) -> NSLayoutConstraint {
//        return NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: superview, attribute: .leading, multiplier: 1.0, constant: 0.0)
//    }
//    public func constraintTrail(_ superview: UIView, space: CGFloat) -> NSLayoutConstraint {
//        return NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: superview, attribute: .trailing, multiplier: 1.0, constant: 0.0)
//    }
//    public func constraintTop(_ superview: UIView, space: CGFloat) -> NSLayoutConstraint {
//        return NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1.0, constant: 0.0)
//    }
//    public func constraintBottom(_ superview: UIView, space: CGFloat) -> NSLayoutConstraint {
//        return NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: superview, attribute: .bottom, multiplier: 1.0, constant: 0.0)
//    }
}
