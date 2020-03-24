//
//  SLTitleBar.swift
//  CustomUI
//
//  Created by Taeyoun Lee on 2020/03/23.
//  Copyright © 2020 SinoLab. All rights reserved.
//

import UIKit

open class SLTitleBar: UIView {
    
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
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .black
        return label
    }()
    
    public var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    public init(title: String) {
        super.init(frame: CGRect())
        initialize()
    }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
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
            actionView.constraintWidth(36.0),
            actionView.constraintHeight(36.0),
            actionView.constraintCenterX(self),
            actionView.constraintCenterY(self)
        ])
    }
    private func updateLayoutBackButton() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.constraintWidth(24.0),
            backButton.constraintHeight(24.0),
            backButton.constraintCenterX(actionView),
            backButton.constraintCenterY(actionView)
        ])
    }
    private func updateLayoutTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        let centerY = titleLabel.constraintCenterY(self)
        let lead = titleLabel.constraintLead(actionView, space: 4.0)
        let trail = titleLabel.constraintTrail(self, space: 24)
        NSLayoutConstraint.activate([
            centerY,
            lead,
            trail
        ])
    }
    private func updateLayoutUnderline() {
        
    }
    public func updateActionView(_ view: UIView, size: CGSize? = nil) {
        for subview in actionView.subviews {
            subview.removeFromSuperview()
        }
        actionView.addSubview(view)
        let viewSize = size ?? view.frame.size
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.constraintWidth(viewSize.width),
            view.constraintHeight(viewSize.height),
            view.constraintCenterX(actionView),
            view.constraintCenterY(actionView)
        ])
    }
    
    @objc func touchUpBack() {
        print("# Back button")
    }
}
