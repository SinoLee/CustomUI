//
//  TitleBar.swift
//  CustomUI
//
//  Created by Taeyoun Lee on 2020/03/26.
//  Copyright © 2020 SinoLab. All rights reserved.
//

import UIKit

@IBDesignable public class TitleBar: UIView {

    @IBInspectable public var title: String? {
        didSet {
            titleLabel.text = title
            setupUI()
        }
    }
    @IBInspectable public var titleColor: UIColor = .black {
        didSet {
            titleLabel.textColor = titleColor
            setupUI()
        }
    }
    @IBInspectable public var underlineColor: UIColor = .gray {
        didSet {
            underlineView.backgroundColor = underlineColor
            setupUI()
        }
    }

    // MARK: Private properties
    fileprivate var backButton = UIButton(type: .system)
    //fileprivate var leftActionView: UIView?
    //fileprivate var rightActionView: UIView?
    fileprivate var titleLabel = UILabel(frame: .zero)
    fileprivate var underlineView = UIView(frame: .zero)
}

// Mark: Public methods
extension TitleBar {
    
    override public class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        //(layer as! CAGradientLayer).colors = [titleColor.cgColor, underlineColor.cgColor]
        
        setNeedsUpdateConstraints()
        updateConstraintsIfNeeded()
    }
    public override func updateConstraints() {
        super.updateConstraints()
        
        updateTextLabelConstraints()
        updateUnderlineConstraints()
        updateBackButtonConstraints()
    }
}

// MARK: Private methods
extension TitleBar {
    
    fileprivate func setupUI() {
        
        // clear self before configuration
        clear()
        
        clipsToBounds = false
        
        underlineView.backgroundColor = underlineColor
        titleLabel.textColor = titleColor
        addSubview(underlineView)
        addSubview(titleLabel)
        
        backButton.setImage(UIImage(named: "backIcon"), for: .normal)
        backButton.addTarget(self, action: #selector(touchUpBack), for: .touchUpInside)
        addSubview(backButton)
    }
    private func clear() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
    private func updateBackButtonConstraints() {
//        backButton.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            backButton.width(24),
//            backButton.height(24),
//            backButton.alignLeading(8),
//            backButton.centerY()
//        ])
    }
    private func updateTextLabelConstraints() {
        titleLabel.frame = CGRect(x: 50, y: 8, width: 150, height: 40)
        
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            titleLabel.centerX(),
//            titleLabel.centerY(),
//            titleLabel.leading(backButton, space: 8)
//        ])
    }
    private func updateUnderlineConstraints() {
        /*
        let newframe = CGRect(x: 0, y: frame.height - 5, width: frame.width, height: 2)
        underlineView.frame = newframe
        */
//        underlineView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            underlineView.height(2),
//            underlineView.alignLeading(0),
//            underlineView.alignTrailing(0),
//            underlineView.alignBottom(5)
//        ])
    }
}

// MARK: Private action methods
extension TitleBar {
    @objc func touchUpBack() {
        guard let vc = actionTarget else { return }
        vc.dismissOrPop(animated: true)
    }
}
