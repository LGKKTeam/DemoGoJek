//
//  GradientView.swift
//  testingTinderSwipe
//
//  Created by Nick on 19/10/18.
//  Copyright © 2018 Nick. All rights reserved.
//

import UIKit

@IBDesignable class GradientView: UIView {
  private var gradientLayer: CAGradientLayer!

  @IBInspectable var topColor: UIColor = .red {
    didSet {
      setNeedsLayout()
    }
  }

  @IBInspectable var bottomColor: UIColor = .yellow {
    didSet {
      setNeedsLayout()
    }
  }

  @IBInspectable var shadowColor: UIColor = .clear {
    didSet {
      setNeedsLayout()
    }
  }

  @IBInspectable var shadowX: CGFloat = 0 {
    didSet {
      setNeedsLayout()
    }
  }

  @IBInspectable var shadowY: CGFloat = -3 {
    didSet {
      setNeedsLayout()
    }
  }

  @IBInspectable var shadowBlur: CGFloat = 3 {
    didSet {
      setNeedsLayout()
    }
  }

  @IBInspectable var startPointX: CGFloat = 0 {
    didSet {
      setNeedsLayout()
    }
  }

  @IBInspectable var startPointY: CGFloat = 0.5 {
    didSet {
      setNeedsLayout()
    }
  }

  @IBInspectable var endPointX: CGFloat = 1 {
    didSet {
      setNeedsLayout()
    }
  }

  @IBInspectable var endPointY: CGFloat = 0.5 {
    didSet {
      setNeedsLayout()
    }
  }

  @IBInspectable var cornerRadius: CGFloat = 0 {
    didSet {
      setNeedsLayout()
    }
  }

  override class var layerClass: AnyClass {
    return CAGradientLayer.self
  }

  override func layoutSubviews() {
    self.gradientLayer = self.layer as? CAGradientLayer
    self.gradientLayer.colors = [self.topColor.cgColor, self.bottomColor.cgColor]
    self.gradientLayer.startPoint = CGPoint(x: self.startPointX, y: self.startPointY)
    self.gradientLayer.endPoint = CGPoint(x: self.endPointX, y: self.endPointY)
    self.layer.cornerRadius = self.cornerRadius
    self.layer.shadowColor = self.shadowColor.cgColor
    self.layer.shadowOffset = CGSize(width: self.shadowX, height: self.shadowY)
    self.layer.shadowRadius = self.shadowBlur
    self.layer.shadowOpacity = 1
  }

  func animate(duration: TimeInterval, newTopColor: UIColor, newBottomColor: UIColor) {
    let fromColors = self.gradientLayer?.colors
    let toColors: [AnyObject] = [newTopColor.cgColor, newBottomColor.cgColor]
    self.gradientLayer?.colors = toColors
    let animation = CABasicAnimation(keyPath: "colors")
    animation.fromValue = fromColors
    animation.toValue = toColors
    animation.duration = duration
    animation.isRemovedOnCompletion = true
    animation.fillMode = .forwards
    animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
    self.gradientLayer?.add(animation, forKey: "animateGradient")
  }
}
