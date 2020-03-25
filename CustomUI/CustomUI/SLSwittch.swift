//
//  SLSwittch.swift
//  CustomUI
//
//  Created by Taeyoun Lee on 2020/03/26.
//  Copyright © 2020 SinoLab. All rights reserved.
//

import UIKit

@IBDesignable public class SLSwittch: UIControl {
    
    // MARK: Public properties
    @IBInspectable public var isOn:Bool = true
    
    @IBInspectable public var padding: CGFloat = 1 {
        didSet {
            layoutSubviews()
        }
    }
    // UIColor(red: 144/255, green: 202/255, blue: 119/255, alpha: 1)
    @IBInspectable public var onTintColor: UIColor = .systemGreen {
        didSet {
            setupUI()
        }
    }
    
    @IBInspectable public var offTintColor: UIColor = .black {
        didSet {
            setupUI()
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat {
        
        get {
            return privateCornerRadius
        }
        set {
            if newValue > 0.5 || newValue < 0.0 {
                privateCornerRadius = 0.5
            } else {
                privateCornerRadius = newValue
            }
        }
    }
    
    // thumb properties
    @IBInspectable public var thumbTintColor: UIColor = .white {
        didSet {
            thumbView.backgroundColor = thumbTintColor
        }
    }
    
    @IBInspectable public var thumbCornerRadius: CGFloat {
        get {
            return privateThumbCornerRadius
        }
        set {
            if newValue > 0.5 || newValue < 0.0 {
                privateThumbCornerRadius = 0.5
            } else {
                privateThumbCornerRadius = newValue
            }
        }
    }
    
    @IBInspectable public var thumbSize: CGSize = .zero {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable public var thumbImage:UIImage? {
        didSet {
            guard let image = thumbImage else {
                return
            }
            thumbView.thumbImageView.image = image
        }
    }
    
    
    // dodati kasnije
    @IBInspectable public var thumbShadowColor: UIColor = .black {
        didSet {
            thumbView.layer.shadowColor = thumbShadowColor.cgColor
        }
    }
    
    @IBInspectable public var thumbShadowOffset: CGSize = CGSize(width: 0.75, height: 2) {
        didSet {
            thumbView.layer.shadowOffset = thumbShadowOffset
        }
    }
    
    @IBInspectable public var thumbShaddowRadius: CGFloat = 1.5 {
        didSet {
            thumbView.layer.shadowRadius = thumbShaddowRadius
        }
    }
    
    @IBInspectable public var thumbShaddowOppacity: Float = 0.4 {
        didSet {
            thumbView.layer.shadowOpacity = thumbShaddowOppacity
        }
    }
    
    public var animationDuration: Double = 0.5
    
    private var privateCornerRadius: CGFloat = 0.5 {
        didSet {
            layoutSubviews()
        }
    }
    
    private var privateThumbCornerRadius: CGFloat = 0.5 {
        didSet {
            layoutSubviews()
        }
    }
    
    public var offImage:UIImage? {
        didSet {
            offImageView.image = offImage
            layoutSubviews()
        }
    }
    
    public var onImage:UIImage? {
        didSet {
            onImageView.image = onImage
            layoutSubviews()
        }
    }
    
    // labels
    
    public var labelOff:UILabel = UILabel()
    public var labelOn:UILabel = UILabel()
    
    public var areLabelsShown: Bool = false {
        didSet {
            setupUI()
        }
    }
    
    // MARK: Private properties
    fileprivate var thumbView = SLThumbView(frame: CGRect.zero)
    fileprivate var onImageView = UIImageView(frame: CGRect.zero)
    fileprivate var offImageView = UIImageView(frame: CGRect.zero)
    
    fileprivate var onPoint = CGPoint.zero
    fileprivate var offPoint = CGPoint.zero
    fileprivate var isAnimating = false
    
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
}

// MARK: Private methods
extension SLSwittch {
    
    fileprivate func setupUI() {
        
        // clear self before configuration
        clear()
        
        clipsToBounds = false
        
        // configure thumb view
        thumbView.backgroundColor = thumbTintColor
        thumbView.isUserInteractionEnabled = false
        
        // dodati kasnije
        thumbView.layer.shadowColor = thumbShadowColor.cgColor
        thumbView.layer.shadowRadius = thumbShaddowRadius
        thumbView.layer.shadowOpacity = thumbShaddowOppacity
        thumbView.layer.shadowOffset = thumbShadowOffset
        
        backgroundColor = isOn ? onTintColor : offTintColor
        
        addSubview(thumbView)
        addSubview(onImageView)
        addSubview(offImageView)
        
        setupLabels()
    }
    
    private func clear() {
        for view in subviews {
            view.removeFromSuperview()
        }
    }
    
    override open func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.beginTracking(touch, with: event)
        
        animate()
        return true
    }
    
    func setOn(on:Bool, animated:Bool) {
        
        switch animated {
        case true:
            animate(on: on)
        case false:
            isOn = on
            setupViewsOnAction()
            completeAction()
        }
        
    }
    
    fileprivate func animate(on:Bool? = nil) {
        
        isOn = on ?? !isOn
        
        isAnimating = true
        
        UIView.animate(withDuration: animationDuration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [UIView.AnimationOptions.curveEaseOut, UIView.AnimationOptions.beginFromCurrentState, UIView.AnimationOptions.allowUserInteraction], animations: {
            self.setupViewsOnAction()
            
        }, completion: { _ in
            self.completeAction()
            
        })
    }
    
    private func setupViewsOnAction() {
        thumbView.frame.origin.x = isOn ? onPoint.x : offPoint.x
        backgroundColor = isOn ? onTintColor : offTintColor
        setOnOffImageFrame()
        
    }
    
    private func completeAction() {
        isAnimating = false
        sendActions(for: UIControl.Event.valueChanged)
        
    }
    
    
    
}

// Mark: Public methods
extension SLSwittch {
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        if !isAnimating {
            layer.cornerRadius = bounds.size.height * cornerRadius
            backgroundColor = isOn ? onTintColor : offTintColor
            
            // thumb managment
            // get thumb size, if none set, use one from bounds
            let _thumbSize = thumbSize != CGSize.zero ? thumbSize : CGSize(width: bounds.size.height - 2, height: bounds.height - 2)
            let yPostition = (bounds.size.height - _thumbSize.height) / 2
            
            onPoint = CGPoint(x: bounds.size.width - _thumbSize.width - padding, y: yPostition)
            offPoint = CGPoint(x: padding, y: yPostition)
            
            thumbView.frame = CGRect(origin: isOn ? onPoint : offPoint, size: _thumbSize)
            thumbView.layer.cornerRadius = _thumbSize.height * thumbCornerRadius
            
            
            //label frame
            if areLabelsShown {
                
                let labelWidth = bounds.width / 2 - padding * 2
                labelOn.frame = CGRect(x: 0, y: 0, width: labelWidth, height: frame.height)
                labelOff.frame = CGRect(x: frame.width - labelWidth, y: 0, width: labelWidth, height: frame.height)
                
            }
            
            // on/off images
            //set to preserve aspect ratio of image in thumbView
            
            guard onImage != nil && offImage != nil else {
                return
            }
            
            let frameSize = _thumbSize.width > _thumbSize.height ? _thumbSize.height * 0.7 : _thumbSize.width * 0.7
            
            let onOffImageSize = CGSize(width: frameSize, height: frameSize)
            
            
            onImageView.frame.size = onOffImageSize
            offImageView.frame.size = onOffImageSize
            
            onImageView.center = CGPoint(x: onPoint.x + thumbView.frame.size.width / 2, y: thumbView.center.y)
            offImageView.center = CGPoint(x: offPoint.x + thumbView.frame.size.width / 2, y: thumbView.center.y)
            
            
            onImageView.alpha = isOn ? 1.0 : 0.0
            offImageView.alpha = isOn ? 0.0 : 1.0
            
        }
    }
}


//Mark: Labels frame
extension SLSwittch {
    
    fileprivate func setupLabels() {
        guard areLabelsShown else {
            labelOff.alpha = 0
            labelOn.alpha = 0
            return
            
        }
        
        labelOff.alpha = 1
        labelOn.alpha = 1
        
        let labelWidth = bounds.width / 2 - padding * 2
        labelOn.frame = CGRect(x: 0, y: 0, width: labelWidth, height: frame.height)
        labelOff.frame = CGRect(x: frame.width - labelWidth, y: 0, width: labelWidth, height: frame.height)
        labelOn.font = UIFont.boldSystemFont(ofSize: 12)
        labelOff.font = UIFont.boldSystemFont(ofSize: 12)
        labelOn.textColor = UIColor.white
        labelOff.textColor = UIColor.white
        
        labelOff.sizeToFit()
        labelOff.text = "Off"
        labelOn.text = "On"
        labelOff.textAlignment = .center
        labelOn.textAlignment = .center
        
        insertSubview(labelOff, belowSubview: thumbView)
        insertSubview(labelOn, belowSubview: thumbView)
        
    }
    
}

//Mark: Animating on/off images
extension SLSwittch {
    
    fileprivate func setOnOffImageFrame() {
        guard onImage != nil && offImage != nil else {
            return
        }
        
        onImageView.center.x = isOn ? onPoint.x + thumbView.frame.size.width / 2 : frame.width
        offImageView.center.x = !isOn ? offPoint.x + thumbView.frame.size.width / 2 : 0
        onImageView.alpha = isOn ? 1.0 : 0.0
        offImageView.alpha = isOn ? 0.0 : 1.0
    }
}

