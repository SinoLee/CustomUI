//
//  SLTitleBar.swift
//  CustomUI
//
//  Created by Taeyoun Lee on 2020/03/23.
//  Copyright © 2020 SinoLab. All rights reserved.
//

import UIKit

//@IBDesignable
//class TitleBar: UIView {
//
//    @IBInspectable public var title: String? {
//        didSet {
//            titleLabel.text = title
//            setupUI()
//        }
//    }
//    @IBInspectable public var titleColor: UIColor = .black {
//        didSet {
//            titleLabel.textColor = titleColor
//            setupUI()
//        }
//    }
//    @IBInspectable public var underlineColor: UIColor = .gray {
//        didSet {
//            underlineView.backgroundColor = underlineColor
//            setupUI()
//        }
//    }
//
//    // MARK: Private properties
//    fileprivate var backButton = UIButton(type: .system)
//    //fileprivate var leftActionView: UIView?
//    //fileprivate var rightActionView: UIView?
//    fileprivate var titleLabel = UILabel(frame: .zero)
//    fileprivate var underlineView = UIView(frame: .zero)
//}
//

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
