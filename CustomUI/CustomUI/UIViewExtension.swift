//
//  UIViewExtension.swift
//  CustomUI
//
//  Created by Taeyoun Lee on 2020/03/25.
//  Copyright © 2020 SinoLab. All rights reserved.
//

import UIKit

extension UIView {
    
    // MARK: NSLayoutConstraint
    public func constraintWidth(_ width: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: width)
    }
    public func constraintHeight(_ height: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: height)
    }
    public func constraintCenterX(_ superview: UIView) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: superview, attribute: .centerX, multiplier: 1.0, constant: 0.0)
    }
    public func constraintCenterY(_ superview: UIView) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: superview, attribute: .centerY, multiplier: 1.0, constant: 0.0)
    }
    //
    public func alignLeading(_ space: CGFloat? = nil) -> NSLayoutConstraint {
        guard let superview = self.superview else { fatalError() }
        return NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: superview, attribute: .leading, multiplier: 1.0, constant: space ?? 0.0)
    }
    public func leading(_ from: UIView, space: CGFloat? = nil) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: from, attribute: .trailing, multiplier: 1.0, constant: space ?? 0.0)
    }
    public func alignTrailing(_ space: CGFloat? = nil) -> NSLayoutConstraint {
        guard let superview = self.superview else { fatalError() }
        return NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: superview, attribute: .trailing, multiplier: 1.0, constant: space ?? 0.0)
    }
    public func trailing(_ from: UIView, space: CGFloat? = nil) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: from, attribute: .leading, multiplier: 1.0, constant: space ?? 0.0)
    }

    
    public func constraintLead(_ superview: UIView, space: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: superview, attribute: .leading, multiplier: 1.0, constant: 0.0)
    }
    public func constraintTrail(_ superview: UIView, space: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: superview, attribute: .trailing, multiplier: 1.0, constant: 0.0)
    }
    public func constraintTop(_ superview: UIView, space: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1.0, constant: 0.0)
    }
    public func constraintBottom(_ superview: UIView, space: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: superview, attribute: .bottom, multiplier: 1.0, constant: 0.0)
    }
}
