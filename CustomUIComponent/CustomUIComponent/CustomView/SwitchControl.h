//
//  SwitchControl.h
//  CustomUIComponent
//
//  Created by Taeyoun Lee on 2020/03/11.
//  Copyright © 2020 SinoLab. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SwitchControl : UIControl

@property (nonatomic) IBInspectable BOOL isOn;
@property (nonatomic) IBInspectable CGFloat padding;
@property (strong, nonatomic) IBInspectable UIColor *offTintColor;
@property (strong, nonatomic) IBInspectable UIColor *onTintColor;
@property (nonatomic) IBInspectable CGFloat cornerRadius;
    // thumb properties
@property (strong, nonatomic) IBInspectable UIColor *thumbTintColor;
@property (nonatomic) IBInspectable CGFloat thumbCornerRadius;
@property (nonatomic) IBInspectable CGSize thumbSize;
@property (strong, nonatomic) IBInspectable UIImage *thumbImage;
    // dodati kasnije
@property (strong, nonatomic) IBInspectable UIColor *thumbShadowColor;
@property (nonatomic) IBInspectable CGSize thumbShadowOffset;
@property (nonatomic) IBInspectable CGFloat thumbShaddowRadius;
@property (nonatomic) IBInspectable CGFloat thumbShaddowOppacity;

@property (nonatomic) CGFloat animationDuration;
    // thumb properties
@property (weak, nonatomic) UIImage *onImage;
@property (weak, nonatomic) UIImage *offImage;
    // labels
@property (strong, nonatomic) UILabel *labelOff;
@property (strong, nonatomic) UILabel *labelOn;
@property (nonatomic) BOOL areLabelsShown;


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



//
//
//    required public init?(coder aDecoder: NSCoder) {
//    override init(frame: CGRect) {
//    fileprivate func setupUI() {
//    private func clear() {
//    override open func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
//    func setOn(on:Bool, animated:Bool) {
//    fileprivate func animate(on:Bool? = nil) {
//    private func setupViewsOnAction() {
//    private func completeAction() {
//    public override func layoutSubviews() {
//    fileprivate func setupLabels() {
//    fileprivate func setOnOffImageFrame() {

@end

NS_ASSUME_NONNULL_END
