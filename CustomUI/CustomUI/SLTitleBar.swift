//
//  SLTitleBar.swift
//  CustomUI
//
//  Created by Taeyoun Lee on 2020/03/23.
//  Copyright © 2020 SinoLab. All rights reserved.
//

import UIKit

@IBDesignable public class SLTitleBar: UIView {
    
    @IBInspectable public var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    @IBInspectable public var titleColor: UIColor = .black {
        didSet {
            
        }
    }
//    @IBInspectable var borderColor: UIColor? {
//        get {
//            return UIColor(cgColor: layer.borderColor!)
//        }
//        set {
//            layer.borderColor = newValue?.cgColor
//        }
//    }
//    @IBInspectable var borderWidth: CGFloat {
//        get {
//            return layer.borderWidth
//        }
//        set {
//            layer.borderWidth = newValue
//        }
//    }
    
    private lazy var actionView: UIView = {
        let view = UIView()
        view.addSubview(self.backButton)
        return view
    }()
    private lazy var underline: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backIcon"), for: .normal)
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .black
        return label
    }()
    
    public init(title: String) {
        super.init(frame: CGRect())
        initializeLayer()
        initializeLabel()
        initializeActionView()
    }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLayer()
        initializeLabel()
        initializeActionView()
    }
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        initializeLayer()
        initializeLabel()
        initializeActionView()
    }
    
    // Shadow Layer
    // https://stackoverflow.com/questions/4754392/uiview-with-rounded-corners-and-drop-shadow/43295741
    private var shadowLayer: CAShapeLayer!
    private var fillColor: UIColor = .white
    
    public override func layoutSubviews() {
        super.layoutSubviews()

        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
          
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 0.0).cgPath
            shadowLayer.fillColor = fillColor.cgColor

            shadowLayer.shadowColor = UIColor.black.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 0.0, height: 1.0)
            shadowLayer.shadowOpacity = 0.2
            shadowLayer.shadowRadius = 3

            layer.insertSublayer(shadowLayer, at: 0)
        }
    }
}

extension SLTitleBar {
    
    private func initializeLayer() {
        layer.backgroundColor = UIColor.clear.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 4.0
    }
    
    private func initializeLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: titleLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 1.0),
            NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 1.0),
        ])
    }
    private func initializeActionView() {
        addSubview(actionView)
        actionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            actionView.width(36.0),
            actionView.height(36.0),
            actionView.centerX(),
            actionView.centerY()
        ])
    }
    
    private func initialize() {
        backButton.addTarget(self, action: #selector(touchUpBack), for: .touchUpInside)
        addSubview(actionView)
        addSubview(titleLabel)
        addSubview(underline)
        
        updateLayoutActionView()
        updateLayoutBackButton()
        updateLayoutTitleLabel()
        updateLayoutUnderline()
    }
    //private func updateLayout
    private func updateLayoutActionView() {
        actionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            actionView.width(36.0),
            actionView.height(36.0),
            actionView.centerX(),
            actionView.centerY()
        ])
    }
    private func updateLayoutBackButton() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.width(24.0),
            backButton.height(24.0),
            backButton.centerX(),
            backButton.centerY()
        ])
    }
    private func updateLayoutTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        let centerY = titleLabel.centerY()
        let lead = titleLabel.leading(actionView, space: 4.0)
        let trail = titleLabel.alignTrailing(24.0)
        NSLayoutConstraint.activate([
            centerY,
            lead,
            trail
        ])
    }
    private func updateLayoutUnderline() {
        underline.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            underline.height(2.0),
            underline.alignLeading(8.0),
            underline.alignTrailing(8.0),
            underline.alignBottom(2.0)
        ])
    }
    public func updateActionView(_ view: UIView, size: CGSize? = nil) {
        for subview in actionView.subviews {
            subview.removeFromSuperview()
        }
        actionView.addSubview(view)
        let viewSize = size ?? view.frame.size
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.width(viewSize.width),
            view.height(viewSize.height),
            view.centerX(),
            view.centerY()
        ])
    }
    
    @objc func touchUpBack() {
        print("# Back button")
        guard let vc = actionTarget else { return }
        vc.dismissOrPop(animated: true)
    }
}
