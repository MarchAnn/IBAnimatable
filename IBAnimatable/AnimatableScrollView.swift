//
//  Created by Tom Baranes on 28/06/16.
//  Copyright © 2015 IBAnimatable. All rights reserved.
//


import UIKit

@IBDesignable open class AnimatableScrollView: UIScrollView, CornerDesignable, FillDesignable, BorderDesignable, RotationDesignable, ShadowDesignable, BlurDesignable, TintDesignable, GradientDesignable, MaskDesignable, Animatable {
  
  // MARK: - CornerDesignable
  @IBInspectable open var cornerRadius: CGFloat = CGFloat.nan {
    didSet {
      configureCornerRadius()
    }
  }
  
  // MARK: - FillDesignable
  @IBInspectable open var fillColor: UIColor? {
    didSet {
      configureFillColor()
    }
  }
  
  @IBInspectable open var predefinedColor: String? {
    didSet {
      configureFillColor()
    }
  }
  
  @IBInspectable open var opacity: CGFloat = CGFloat.nan {
    didSet {
      configureOpacity()
    }
  }
  
  // MARK: - BorderDesignable
  @IBInspectable open var borderColor: UIColor? {
    didSet {
      configureBorder()
    }
  }
  
  @IBInspectable open var borderWidth: CGFloat = CGFloat.nan {
    didSet {
      configureBorder()
    }
  }
  
  open var borderSides: BorderSides  = .AllSides {
    didSet {
      configureBorder()
    }
  }
  
  @IBInspectable var _borderSides: String? {
    didSet {
      borderSides = BorderSides(rawValue: _borderSides)
    }
  }  
  // MARK: - RotationDesignable
  @IBInspectable open var rotate: CGFloat = CGFloat.nan {
    didSet {
      configureRotate()
    }
  }
  
  // MARK: - ShadowDesignable
  @IBInspectable open var shadowColor: UIColor? {
    didSet {
      configureShadowColor()
    }
  }
  
  @IBInspectable open var shadowRadius: CGFloat = CGFloat.nan {
    didSet {
      configureShadowRadius()
    }
  }
  
  @IBInspectable open var shadowOpacity: CGFloat = CGFloat.nan {
    didSet {
      configureShadowOpacity()
    }
  }
  
  @IBInspectable open var shadowOffset: CGPoint = CGPoint(x: CGFloat.nan, y: CGFloat.nan) {
    didSet {
      configureShadowOffset()
    }
  }
  // MARK: - BlurDesignable
  open var blurEffectStyle: UIBlurEffectStyle? {
    didSet {
      configureBlurEffectStyle()
    }
  }
  @IBInspectable var _blurEffectStyle: String? {
    didSet {
      blurEffectStyle = UIBlurEffectStyle(string: _blurEffectStyle)
    }
  }
  
  open var vibrancyEffectStyle: UIBlurEffectStyle? {
    didSet {
      configureBlurEffectStyle()
    }
  }
  @IBInspectable var _vibrancyEffectStyle: String? {
    didSet {
      vibrancyEffectStyle = UIBlurEffectStyle(string: _vibrancyEffectStyle)
    }
  }
  
  @IBInspectable open var blurOpacity: CGFloat = CGFloat.nan {
    didSet {
      configureBlurEffectStyle()
    }
  }
  
  // MARK: - TintDesignable
  @IBInspectable open var tintOpacity: CGFloat = CGFloat.nan
  @IBInspectable open var shadeOpacity: CGFloat = CGFloat.nan
  @IBInspectable open var toneColor: UIColor?
  @IBInspectable open var toneOpacity: CGFloat = CGFloat.nan
  
  // MARK: - GradientDesignable
  @IBInspectable open var startColor: UIColor?
  @IBInspectable open var endColor: UIColor?
  open var predefinedGradient: GradientType?
  @IBInspectable var _predefinedGradient: String? {
    didSet {
      predefinedGradient = GradientType(string: _predefinedGradient)
    }
  }
  open var startPoint: GradientStartPoint = .top
  @IBInspectable var _startPoint: String? {
    didSet {
      startPoint = GradientStartPoint(string: _startPoint, default: .top)
    }
  }
  
  // MARK: - MaskDesignable
  open var maskType: MaskType = .none {
    didSet {
      configureMask()
      configureBorder()
    }
  }
  
  /// The mask type used in Interface Builder. **Should not** use this property in code.
  @IBInspectable var _maskType: String? {
    didSet {
      maskType = MaskType(string: _maskType)
    }
  }
  
  // MARK: - Animatable
  open var animationType: AnimationType = .none
  @IBInspectable var _animationType: String? {
    didSet {
      animationType = AnimationType(string: _animationType)
    }
  }
  @IBInspectable open var autoRun: Bool = true
  @IBInspectable open var duration: Double = Double.nan
  @IBInspectable open var delay: Double = Double.nan
  @IBInspectable open var damping: CGFloat = CGFloat.nan
  @IBInspectable open var velocity: CGFloat = CGFloat.nan
  @IBInspectable open var force: CGFloat = CGFloat.nan
  
  // MARK: - Lifecycle
  open override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    configureInspectableProperties()
  }
  
  open override func awakeFromNib() {
    super.awakeFromNib()
    configureInspectableProperties()
  }
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    configureAfterLayoutSubviews()
    autoRunAnimation()
  }
  
  // MARK: - Private
  fileprivate func configureInspectableProperties() {
    configureAnimatableProperties()
    configureTintedColor()
  }
  
  fileprivate func configureAfterLayoutSubviews() {
    configureMask()
    configureBorder()
    configureGradient()
  }
}