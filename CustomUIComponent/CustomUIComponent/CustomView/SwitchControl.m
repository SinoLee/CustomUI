//
//  SwitchControl.m
//  CustomUIComponent
//
//  Created by Taeyoun Lee on 2020/03/11.
//  Copyright © 2020 SinoLab. All rights reserved.
//

#import "SwitchControl.h"
#import "SwitchThumbView.h"

@interface SwitchControl() {
    BOOL _isOn;
    CGFloat _padding;
    UIColor *_offTintColor;
    UIColor *_onTintColor;
    CGFloat _cornerRadius;          // privateCornerRadius
    //UIColor *_thumbTintColor;       //**
    CGFloat _thumbCornerRadius;     // privateThumbCornerRadius
    CGSize _thumbSize;
    //UIImage *_thumbImage;   //**
    //UIColor *_thumbShadowColor; //**
    //CGSize _thumbShadowOffset;  //**
    //CGFloat _thumbShaddowRadius; //**
    //CGFloat _thumbShaddowOppacity;   //**
    
    CGFloat _animationDuration;
    
    SwitchThumbView *_thumbView;
    UIImageView *_onImageView;
    UIImageView *_offImageView;
    
    UILabel *_labelOff;
    UILabel *_labelOn;
    BOOL _areLabelsShown;
//
    CGPoint _onPoint;
    CGPoint _offPoint;
    BOOL _isAnimating;
}
@property (strong, nonatomic) SwitchThumbView *thumbView;
@property (strong, nonatomic) UIImageView *onImageView;
@property (strong, nonatomic) UIImageView *offImageView;

@end

@implementation SwitchControl

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    _isOn = NO;
    _padding = 1.0;
    _offTintColor = [UIColor colorWithWhite:208/255.f alpha:1.f];
    _onTintColor = [UIColor colorWithRed:70/255.f green:158/255.f blue:179/255.f alpha:1.f];
    _cornerRadius = 0.5;
    //_thumbTintColor = nil; //**
//    self.thumbView.backgroundColor = [UIColor whiteColor];
    _thumbCornerRadius = 0.5;
    _thumbSize = CGSizeZero;
//    self.thumbView.thumbImageView.image = nil;
    //_thumbImage = nil;
//    self.thumbView.layer.shadowColor = [[UIColor blackColor] CGColor];
    //_thumbShadowColor = [UIColor whiteColor];   //**
//    self.thumbView.layer.shadowRadius = 1.5;
    //_thumbShadowOffset = CGSizeMake(0, 0);  //**
    //_thumbShaddowRadius = 1.5; //**
//    self.thumbView.layer.shadowOpacity = 0.4;
    //_thumbShaddowOppacity = 0.4;   //**
    _animationDuration = 0.5;
//    _labelOff = [[UILabel alloc] init];
//    _labelOn = [[UILabel alloc] init];
    _areLabelsShown = NO;
//    _onImageView = nil;
//    _offImageView = nil;
    _onPoint = CGPointZero;
    _offPoint = CGPointZero;
    _isAnimating = NO;
//    _thumbView = [[SwitchThumbView alloc] initWithFrame:CGRectZero];
}
- (CGPoint)onPoint {
    return _onPoint;
}
- (void)setOnPoint:(CGPoint)onPoint {
    _onPoint = onPoint;
}
- (CGPoint)offPoint {
    return _offPoint;
}
- (void)setOffPoint:(CGPoint)offPoint {
    _offPoint = offPoint;
}
- (BOOL)isAnimating {
    return _isAnimating;
}
- (void)setIsAnimating:(BOOL)isAnimating {
    _isAnimating = isAnimating;
}


//@property (nonatomic) IBInspectable BOOL isOn;
- (BOOL)isOn {
    return _isOn;
}
- (void)setIsOn:(BOOL)isOn {
    _isOn = isOn;
}
//@property (nonatomic) IBInspectable CGFloat padding;
- (CGFloat)padding {
    return _padding;
}
- (void)setPadding:(CGFloat)padding {
    _padding = padding;
    [self layoutSubviews];
}
//@property (strong, nonatomic) IBInspectable UIColor *offTintColor;
- (UIColor *)offTintColor {
    return _offTintColor;
}
- (void)setOffTintColor:(UIColor *)offTintColor {
    _offTintColor = offTintColor;
    [self setupUI];
}
//@property (strong, nonatomic) IBInspectable UIColor *onTintColor;
- (UIColor *)onTintColor {
    return _onTintColor;
}
- (void)setOnTintColor:(UIColor *)onTintColor {
    _onTintColor = onTintColor;
    [self setupUI];
}
//@property (nonatomic) IBInspectable CGFloat cornerRadius;
- (CGFloat)cornerRadius {
    return _cornerRadius;
}
- (void)setCornerRadius:(CGFloat)cornerRadius {
    if (cornerRadius > 0.5 || cornerRadius < 0.0) {
        _cornerRadius = 0.5;
    }
    else {
        _cornerRadius = cornerRadius;
    }
    [self layoutSubviews];
}

// thumb properties
//@property (strong, nonatomic) IBInspectable UIColor *thumbTintColor;
- (UIColor *)thumbTintColor {
    return self.thumbView.backgroundColor;
}
- (void)setThumbTintColor:(UIColor *)thumbTintColor {
    self.thumbView.backgroundColor = self.thumbTintColor;
}
//@property (nonatomic) IBInspectable CGFloat thumbCornerRadius;
- (CGFloat)thumbCornerRadius {
    return _thumbCornerRadius;
}
- (void)setThumbCornerRadius:(CGFloat)thumbCornerRadius {
    if (thumbCornerRadius > 0.5 || thumbCornerRadius < 0.0) {
        _thumbCornerRadius = 0.5;
    }
    else {
        _thumbCornerRadius = thumbCornerRadius;
    }
    [self layoutSubviews];
}
//@property (nonatomic) IBInspectable CGSize thumbSize;
- (CGSize)thumbSize {
    return _thumbSize;
}
- (void)setThumbSize:(CGSize)thumbSize {
    _thumbSize = thumbSize;
    [self layoutSubviews];
}

//@property (strong, nonatomic) IBInspectable UIImage *thumbImage;
- (UIImage *)thumbImage {
    return self.thumbView.thumbImageView.image; //_thumbImage;
}
- (void)setThumbImage:(UIImage *)thumbImage {
    if (!thumbImage) {
        return;
    }
    [self.thumbView.thumbImageView setImage:thumbImage];
}

// dodati kasnije
//@property (strong, nonatomic) IBInspectable UIColor *thumbShadowColor;
- (UIColor *)thumbShadowColor {
    return [UIColor colorWithCGColor:self.thumbView.layer.shadowColor];
}
- (void)setThumbShadowColor:(UIColor *)thumbShadowColor {
    self.thumbView.layer.shadowColor = [thumbShadowColor CGColor];
}

//@property (nonatomic) IBInspectable CGSize thumbShadowOffset;
- (CGSize)thumbShadowOffset {
    return self.thumbView.layer.shadowOffset;
}
- (void)setThumbShadowOffset:(CGSize)thumbShadowOffset {
    self.thumbView.layer.shadowOffset = thumbShadowOffset;
}
//@property (nonatomic) IBInspectable CGFloat thumbShaddowRadius;
- (CGFloat)thumbShaddowRadius {
    return self.thumbView.layer.shadowRadius;
}
- (void)setThumbShaddowRadius:(CGFloat)thumbShaddowRadius {
    self.thumbView.layer.shadowRadius = thumbShaddowRadius;
}
//@property (nonatomic) IBInspectable CGFloat thumbShaddowOppacity;
- (CGFloat)thumbShaddowOppacity {
    return self.thumbView.layer.shadowOpacity;
}
- (void)setThumbShaddowOppacity:(CGFloat)thumbShaddowOppacity {
    self.thumbView.layer.shadowOpacity = thumbShaddowOppacity;
}
//
//@property (nonatomic) CGFloat animationDuration;
- (CGFloat)animationDuration {
    return _animationDuration;
}
- (void)setAnimationDuration:(CGFloat)animationDuration {
    _animationDuration = animationDuration;
}

// thumb properties
- (SwitchThumbView *)thumbView {
    if (!_thumbView) {
        _thumbView = [[SwitchThumbView alloc] initWithFrame:CGRectZero];
    }
    return _thumbView;
}
//@property (strong, nonatomic) UIImage *onImage;
- (UIImage *)onImage {
    return self.onImageView.image;
}
- (void)setOnImage:(UIImage *)onImage {
    [self.onImageView setImage:onImage];
}
- (UIImageView *)onImageView {
    if (!_onImageView) {
        _onImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    return _onImageView;
}
//@property (strong, nonatomic) UIImage *offImage;
- (UIImage *)offImage {
    return self.offImageView.image;
}
- (void)setOffImage:(UIImage *)offImage {
    [self.offImageView setImage:offImage];
}
- (UIImageView *)offImageView {
    if (!_offImageView) {
        _offImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    return _offImageView;
}

// labels
//@property (strong, nonatomic) UILabel *labelOff;
- (UILabel *)labelOff {
    if (!_labelOff) {
        _labelOff = [[UILabel alloc] init];
    }
    return _labelOff;
}
- (void)setLabelOff:(UILabel *)labelOff {
    _labelOff = labelOff;
}
//@property (strong, nonatomic) UILabel *labelOn;
- (UILabel *)labelOn {
    if (!_labelOn) {
        _labelOn = [[UILabel alloc] init];
    }
    return _labelOn;
}
//@property (nonatomic) BOOL areLabelsShown;
- (BOOL)areLabelsShown {
    return _areLabelsShown;
}
- (void)setAreLabelsShown:(BOOL)areLabelsShown {
    _areLabelsShown = areLabelsShown;
    [self setupUI];
}

#if 0
//    private var privateCornerRadius: CGFloat = 0.5 {
//    // thumb properties
//    private var privateThumbCornerRadius: CGFloat = 0.5 {
//    // MARK: Private properties
//    fileprivate var thumbView = CustomThumbView(frame: CGRect.zero)
//    fileprivate var onImageView = UIImageView(frame: CGRect.zero)
//    fileprivate var offImageView = UIImageView(frame: CGRect.zero)
//
//    fileprivate var onPoint = CGPoint.zero
//    fileprivate var offPoint = CGPoint.zero
//    fileprivate var isAnimating = false


//    @IBInspectable public var isOn:Bool = true
//    public var animationDuration: Double = 0.5
//    @IBInspectable  public var padding: CGFloat = 1 {
//        didSet {
//            self.layoutSubviews()
//        }
//    }
//    @IBInspectable  public var onTintColor: UIColor = UIColor(red: 144/255, green: 202/255, blue: 119/255, alpha: 1) {
//        didSet {
//            self.setupUI()
//        }
//    }
//    @IBInspectable public var offTintColor: UIColor = UIColor.black {
//        didSet {
//            self.setupUI()
//        }
//    }
//    @IBInspectable public var cornerRadius: CGFloat {
//        get {
//            return self.privateCornerRadius
//        }
//        set {
//            if newValue > 0.5 || newValue < 0.0 {
//                privateCornerRadius = 0.5
//            } else {
//                privateCornerRadius = newValue
//            }
//        }
//    }
//    private var privateCornerRadius: CGFloat = 0.5 {
//        didSet {
//            self.layoutSubviews()
//        }
//    }
//    // thumb properties
//    @IBInspectable public var thumbTintColor: UIColor = UIColor.white {
//        didSet {
//            self.thumbView.backgroundColor = self.thumbTintColor
//        }
//    }
//    @IBInspectable public var thumbCornerRadius: CGFloat {
//        get {
//            return self.privateThumbCornerRadius
//        }
//        set {
//            if newValue > 0.5 || newValue < 0.0 {
//                privateThumbCornerRadius = 0.5
//            } else {
//                privateThumbCornerRadius = newValue
//            }
//        }
//    }
//    private var privateThumbCornerRadius: CGFloat = 0.5 {
//        didSet {
//            self.layoutSubviews()
//        }
//    }
//    @IBInspectable public var thumbSize: CGSize = CGSize.zero {
//        didSet {
//            self.layoutSubviews()
//        }
//    }
//
//    @IBInspectable public var thumbImage:UIImage? = nil {
//        didSet {
//            guard let image = thumbImage else {
//                return
//            }
//            thumbView.thumbImageView.image = image
//        }
//    }
//
//    public var onImage:UIImage? {
//        didSet {
//            self.onImageView.image = onImage
//            self.layoutSubviews()
//        }
//    }
//
//    public var offImage:UIImage? {
//        didSet {
//            self.offImageView.image = offImage
//            self.layoutSubviews()
//        }
//    }
//
//
//    // dodati kasnije
//    @IBInspectable public var thumbShadowColor: UIColor = UIColor.black {
//        didSet {
//            self.thumbView.layer.shadowColor = self.thumbShadowColor.cgColor
//        }
//    }
//
//    @IBInspectable public var thumbShadowOffset: CGSize = CGSize(width: 0.75, height: 2) {
//        didSet {
//            self.thumbView.layer.shadowOffset = self.thumbShadowOffset
//        }
//    }
//
//    @IBInspectable public var thumbShaddowRadius: CGFloat = 1.5 {
//        didSet {
//            self.thumbView.layer.shadowRadius = self.thumbShaddowRadius
//        }
//    }
//
//    @IBInspectable public var thumbShaddowOppacity: Float = 0.4 {
//        didSet {
//            self.thumbView.layer.shadowOpacity = self.thumbShaddowOppacity
//        }
//    }
//
//    // labels
//
//    public var labelOff:UILabel = UILabel()
//    public var labelOn:UILabel = UILabel()
//
//    public var areLabelsShown: Bool = false {
//        didSet {
//            self.setupUI()
//        }
//    }
//
//    // MARK: Private properties
//    fileprivate var thumbView = CustomThumbView(frame: CGRect.zero)
//    fileprivate var onImageView = UIImageView(frame: CGRect.zero)
//    fileprivate var offImageView = UIImageView(frame: CGRect.zero)
//
//    fileprivate var onPoint = CGPoint.zero
//    fileprivate var offPoint = CGPoint.zero
//    fileprivate var isAnimating = false
//
//
//    required public init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//
//        self.setupUI()
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        self.setupUI()
//    }
- (void)setupUI {
    
}
//    fileprivate func setupUI() {
//
//        // clear self before configuration
//        self.clear()
//
//        self.clipsToBounds = false
//
//        // configure thumb view
//        self.thumbView.backgroundColor = self.thumbTintColor
//        self.thumbView.isUserInteractionEnabled = false
//
//        // dodati kasnije
//        self.thumbView.layer.shadowColor = self.thumbShadowColor.cgColor
//        self.thumbView.layer.shadowRadius = self.thumbShaddowRadius
//        self.thumbView.layer.shadowOpacity = self.thumbShaddowOppacity
//        self.thumbView.layer.shadowOffset = self.thumbShadowOffset
//
//        self.backgroundColor = self.isOn ? self.onTintColor : self.offTintColor
//
//        self.addSubview(self.thumbView)
//        self.addSubview(self.onImageView)
//        self.addSubview(self.offImageView)
//
//        self.setupLabels()
//
//    }
//
//
- (void)clear {
    
}
//    private func clear() {
//        for view in self.subviews {
//            view.removeFromSuperview()
//        }
//    }
//
- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    return YES;
}
//    override open func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
//        super.beginTracking(touch, with: event)
//
//        self.animate()
//        return true
//    }
//
- (void)setOn:(BOOL)on animated:(BOOL)animated {
    
}
//    func setOn(on:Bool, animated:Bool) {
//
//        switch animated {
//        case true:
//            self.animate(on: on)
//        case false:
//            self.isOn = on
//            self.setupViewsOnAction()
//            self.completeAction()
//        }
//
//    }
//
- (void)animate {
    
}
- (void)animate:(BOOL)on {
    
}
//    fileprivate func animate(on:Bool? = nil) {
//
//        self.isOn = on ?? !self.isOn
//
//        self.isAnimating = true
//
//        UIView.animate(withDuration: self.animationDuration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [UIView.AnimationOptions.curveEaseOut, UIView.AnimationOptions.beginFromCurrentState, UIView.AnimationOptions.allowUserInteraction], animations: {
//            self.setupViewsOnAction()
//
//        }, completion: { _ in
//            self.completeAction()
//
//        })
//    }
//
- (void)setupViewsOnAction {
    
}
//    private func setupViewsOnAction() {
//        self.thumbView.frame.origin.x = self.isOn ? self.onPoint.x : self.offPoint.x
//        self.backgroundColor = self.isOn ? self.onTintColor : self.offTintColor
//        self.setOnOffImageFrame()
//
//    }
//
- (void)completeAction {
    
}
//    private func completeAction() {
//        self.isAnimating = false
//        self.sendActions(for: UIControl.Event.valueChanged)
//
//    }
//
- (void)layoutSubviews {
    [super layoutSubviews];
}
//    public override func layoutSubviews() {
//        super.layoutSubviews()
//
//        if !self.isAnimating {
//            self.layer.cornerRadius = self.bounds.size.height * self.cornerRadius
//            self.backgroundColor = self.isOn ? self.onTintColor : self.offTintColor
//
//            // thumb managment
//            // get thumb size, if none set, use one from bounds
//            let thumbSize = self.thumbSize != CGSize.zero ? self.thumbSize : CGSize(width: self.bounds.size.height - 2, height: self.bounds.height - 2)
//            let yPostition = (self.bounds.size.height - thumbSize.height) / 2
//
//            self.onPoint = CGPoint(x: self.bounds.size.width - thumbSize.width - self.padding, y: yPostition)
//            self.offPoint = CGPoint(x: self.padding, y: yPostition)
//
//            self.thumbView.frame = CGRect(origin: self.isOn ? self.onPoint : self.offPoint, size: thumbSize)
//            self.thumbView.layer.cornerRadius = thumbSize.height * self.thumbCornerRadius
//
//
//            //label frame
//            if self.areLabelsShown {
//
//                let labelWidth = self.bounds.width / 2 - self.padding * 2
//                self.labelOn.frame = CGRect(x: 0, y: 0, width: labelWidth, height: self.frame.height)
//                self.labelOff.frame = CGRect(x: self.frame.width - labelWidth, y: 0, width: labelWidth, height: self.frame.height)
//
//            }
//
//            // on/off images
//            //set to preserve aspect ratio of image in thumbView
//
//            guard onImage != nil && offImage != nil else {
//                return
//            }
//
//            let frameSize = thumbSize.width > thumbSize.height ? thumbSize.height * 0.7 : thumbSize.width * 0.7
//
//            let onOffImageSize = CGSize(width: frameSize, height: frameSize)
//
//
//            self.onImageView.frame.size = onOffImageSize
//            self.offImageView.frame.size = onOffImageSize
//
//            self.onImageView.center = CGPoint(x: self.onPoint.x + self.thumbView.frame.size.width / 2, y: self.thumbView.center.y)
//            self.offImageView.center = CGPoint(x: self.offPoint.x + self.thumbView.frame.size.width / 2, y: self.thumbView.center.y)
//
//
//            self.onImageView.alpha = self.isOn ? 1.0 : 0.0
//            self.offImageView.alpha = self.isOn ? 0.0 : 1.0
//
//        }
//    }
//}
//
- (void)setupLabels {
    
}
//    fileprivate func setupLabels() {
//        guard self.areLabelsShown else {
//            self.labelOff.alpha = 0
//            self.labelOn.alpha = 0
//            return
//
//        }
//
//        self.labelOff.alpha = 1
//        self.labelOn.alpha = 1
//
//        let labelWidth = self.bounds.width / 2 - self.padding * 2
//        self.labelOn.frame = CGRect(x: 0, y: 0, width: labelWidth, height: self.frame.height)
//        self.labelOff.frame = CGRect(x: self.frame.width - labelWidth, y: 0, width: labelWidth, height: self.frame.height)
//        self.labelOn.font = UIFont.boldSystemFont(ofSize: 12)
//        self.labelOff.font = UIFont.boldSystemFont(ofSize: 12)
//        self.labelOn.textColor = UIColor.white
//        self.labelOff.textColor = UIColor.white
//
//        self.labelOff.sizeToFit()
//        self.labelOff.text = "Off"
//        self.labelOn.text = "On"
//        self.labelOff.textAlignment = .center
//        self.labelOn.textAlignment = .center
//
//        self.insertSubview(self.labelOff, belowSubview: self.thumbView)
//        self.insertSubview(self.labelOn, belowSubview: self.thumbView)
//
//    }
//
- (void)setOnOffImageFrame {
    
}
//    fileprivate func setOnOffImageFrame() {
//        guard onImage != nil && offImage != nil else {
//            return
//        }
//
//        self.onImageView.center.x = self.isOn ? self.onPoint.x + self.thumbView.frame.size.width / 2 : self.frame.width
//        self.offImageView.center.x = !self.isOn ? self.offPoint.x + self.thumbView.frame.size.width / 2 : 0
//        self.onImageView.alpha = self.isOn ? 1.0 : 0.0
//        self.offImageView.alpha = self.isOn ? 0.0 : 1.0
//
//    }
#else
- (void)setupUI {
    [self clear];
    [self setClipsToBounds:NO];
    [self.thumbView setBackgroundColor:self.thumbTintColor];
    [self.thumbView setUserInteractionEnabled:NO];
    
    [self.thumbView.layer setShadowColor:self.thumbShadowColor.CGColor];
    [self.thumbView.layer setShadowRadius:self.thumbShaddowRadius];
    [self.thumbView.layer setShadowOpacity:self.thumbShaddowOppacity];
    [self.thumbView.layer setShadowOffset:self.thumbShadowOffset];
    
    [self setBackgroundColor:(self.isOn ? self.onTintColor : self.offTintColor)];
    [self addSubview:self.thumbView];
    [self addSubview:self.onImageView];
    [self addSubview:self.offImageView];
    
    [self setupLabels];
}
- (void)clear {
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}
- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    [super beginTrackingWithTouch:touch withEvent:event];
    [self animate];
    return true;
}
- (void)setOn:(BOOL)on animated:(BOOL)animated {
    if (animated) {
        [self animateOn:on];
    }
    else {
        self.isOn = on;
        [self setupViewsOnAction];
        [self completeAction];
    }
}
- (void)animate {
    [self animateOn:!self.isOn];
}
- (void)animateOn:(BOOL)on {
    [self setIsOn:on];
    [self setIsAnimating:YES];
    [UIView animateWithDuration:self.animationDuration delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.5 options:(UIViewAnimationOptionCurveEaseOut|UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionAllowUserInteraction) animations:^{
        [self setupViewsOnAction];
    } completion:^(BOOL finished) {
        [self completeAction];
    }];
}
- (void)setupViewsOnAction {
    CGRect frame = self.thumbView.frame;
    frame.origin.x = self.isOn ? self.onPoint.x : self.offPoint.x;
    [self.thumbView setFrame:frame];
    [self setBackgroundColor:(self.isOn ? self.onTintColor : self.offTintColor)];
    [self setOnOffImageFrame];
}
- (void)completeAction {
    [self setIsAnimating:NO];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}
- (void)setupLabels {
    if (!self.areLabelsShown) {
        [self.labelOff setAlpha:0.0];
        [self.labelOn setAlpha:0.0];
        return;
    }
    [self.labelOff setAlpha:1.0];
    [self.labelOn setAlpha:1.0];
    CGFloat labelWidth = self.bounds.size.width / 2 - self.padding * 2;
    [self.labelOn setFrame:CGRectMake(0, 0, labelWidth, self.frame.size.height)];
    [self.labelOff setFrame:CGRectMake(self.frame.size.width - labelWidth, 0, labelWidth, self.frame.size.height)];
    [self.labelOn setFont:[UIFont boldSystemFontOfSize:12]];
    [self.labelOff setFont:[UIFont boldSystemFontOfSize:12]];
    [self.labelOn setTextColor:[UIColor whiteColor]];
    [self.labelOff setTextColor:[UIColor whiteColor]];
    
    [self.labelOff sizeToFit];
    [self.labelOff setText:@"Off"];
    [self.labelOn setText:@"On"];
    [self.labelOff setTextAlignment:NSTextAlignmentCenter];
    [self.labelOn setTextAlignment:NSTextAlignmentCenter];
    
    [self insertSubview:self.labelOff belowSubview:self.thumbView];
    [self insertSubview:self.labelOn belowSubview:self.thumbView];
}
- (void)setOnOffImageFrame {
    if (self.onImage == nil || self.offImage == nil) {
        return;
    }
    CGPoint onImageViewCenter = self.onImageView.center;
    onImageViewCenter.x = self.isOn ? (self.onPoint.x + self.thumbView.frame.size.width / 2) : self.frame.size.width;
    [self.onImageView setCenter:onImageViewCenter];
    CGPoint offImageViewCenter = self.offImageView.center;
    offImageViewCenter.x = !self.isOn ? (self.offPoint.x + self.thumbView.frame.size.width / 2) : 0;
    [self.offImageView setCenter:offImageViewCenter];
    [self.onImageView setAlpha:(self.isOn ? 1.0 : 0.0)];
    [self.offImageView setAlpha:(self.isOn ? 0.0 : 1.0)];
}

#endif
@end
