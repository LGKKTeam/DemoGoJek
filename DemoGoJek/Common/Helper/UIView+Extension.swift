//
//  UIView+Extension.swift
//  DemoGoJek
//
//  Created by Coc Coc on 9/12/20.
//  Copyright © 2020 Coc Coc. All rights reserved.
//

import UIKit

extension UIView {
  func fixInView(_ container: UIView!) {
    translatesAutoresizingMaskIntoConstraints = false
    frame = container.bounds
    container.addSubview(self)
    NSLayoutConstraint(item: self,
                       attribute: .leading,
                       relatedBy: .equal,
                       toItem: container,
                       attribute: .leading,
                       multiplier: 1.0,
                       constant: 0).isActive = true
    NSLayoutConstraint(item: self,
                       attribute: .trailing,
                       relatedBy: .equal,
                       toItem: container,
                       attribute: .trailing,
                       multiplier: 1.0,
                       constant: 0).isActive = true
    NSLayoutConstraint(item: self,
                       attribute: .top,
                       relatedBy: .equal,
                       toItem: container,
                       attribute: .top,
                       multiplier: 1.0,
                       constant: 0).isActive = true
    NSLayoutConstraint(item: self,
                       attribute: .bottom,
                       relatedBy: .equal,
                       toItem: container,
                       attribute: .bottom,
                       multiplier: 1.0,
                       constant: 0).isActive = true
  }
}
