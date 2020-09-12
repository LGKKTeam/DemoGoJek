//
//  CustomView.swift
//  TinderSwipeView_Example
//
//  Created by Nick on 29/05/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class CustomView: UIView {
  @IBOutlet private var contentView: UIView!
  @IBOutlet private var nameLabel: UILabel!
  @IBOutlet private var ageLabel: UILabel!
  @IBOutlet private var profileImageView: UIImageView!
  @IBOutlet private var profileContainerView: UIView!

  var userViewModel: UserViewModel! {
    didSet {
      self.nameLabel.text = userViewModel.userName
      self.ageLabel.text = userViewModel.age
      if let url = URL(string: userViewModel.profileURLString) {
        self.profileImageView.load(url: url)
      }
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }

  func commonInit() {
    Bundle.main.loadNibNamed(CustomView.className, owner: self, options: nil)
    contentView.fixInView(self)
    contentView.layer.borderWidth = 1
    contentView.layer.borderColor = UIColor.gray.cgColor

    profileContainerView.backgroundColor = UIColor.white
    profileContainerView.layer.cornerRadius = profileContainerView.frame.size.height / 2
    profileContainerView.layer.borderColor = UIColor.gray.cgColor
    profileContainerView.layer.borderWidth = 1
    profileContainerView.clipsToBounds = true

    profileImageView.contentMode = .scaleAspectFill
    profileImageView.layer.cornerRadius = profileImageView.frame.size.height / 2
    profileImageView.clipsToBounds = true
  }
}
