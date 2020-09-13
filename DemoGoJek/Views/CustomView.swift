//
//  CustomView.swift
//  TinderSwipeView_Example
//
//  Created by Nick on 29/05/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

enum UserInfoSection: Int {
  case personal = 0
  case calendar
  case location
  case phone
  case lock
}

class CustomView: UIView {
  @IBOutlet private var contentView: UIView!
  @IBOutlet private var profileImageView: UIImageView!
  @IBOutlet private var profileContainerView: UIView!
  @IBOutlet private var controlView: UIView!
  @IBOutlet private var buttons: [UIButton]!
  @IBOutlet private var contentContainerView: UIView!
  weak var parentVC: UIViewController?

  var userViewModel: UserViewModel! {
    didSet {
      if let url = URL(string: userViewModel.profileURLString) {
        self.profileImageView.load(url: url)
      }
      handlerDisplayUserInfo(at: userViewModel.section)
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

    for (index, btn) in buttons.enumerated() {
      btn.tag = index
      btn.tintColor = UIColor.darkGray
    }
  }

  @IBAction func buttonTapped(_ sender: UIButton) {
    if let infoSection = UserInfoSection(rawValue: sender.tag) {
      switch infoSection {
      case .personal, .calendar, .location:
        handlerDisplayUserInfo(at: infoSection)
      case .lock:
        debugPrint("Lock?")
      case .phone:
        handleCallPhoneNumber(userViewModel.phone)
      }
    }
  }

  func handleCallPhoneNumber(_ phone: String?) {
    if let phone = phone {
      if let url = URL(string: "tel://\(phone)"), UIApplication.shared.canOpenURL(url) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
      } else {
        debugPrint("Cannot make a phone call")
      }
    }
  }

  func handlerDisplayUserInfo(at section: UserInfoSection) {
    let viewController = infoViewController(at: section)
    if var viewController = viewController as? TinderUserInfoViewProtocol {
      viewController.userViewModel = userViewModel
    }
    if let viewController = viewController {
      contentContainerView.subviews.first?.removeFromSuperview()
      parentVC?.addChild(viewController)
      contentContainerView.addSubview(viewController.view)
      viewController.view.fixInView(contentContainerView)
      viewController.didMove(toParent: parentVC)
    }
  }

  func infoViewController(at section: UserInfoSection) -> UIViewController? {
    switch section {
    case .personal:
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let viewController = storyboard.instantiateViewController(
        withIdentifier: TinderUserInfoViewController.className)
      return viewController
    case .calendar:
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let viewController = storyboard.instantiateViewController(
        withIdentifier: TinderCalendarViewController.className)
      return viewController
    case .location:
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let viewController = storyboard.instantiateViewController(withIdentifier: TinderMapViewController.className)
      return viewController
    default:
      return nil
    }
  }
}
