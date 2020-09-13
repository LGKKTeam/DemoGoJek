//
//  ViewController.swift
//  DemoGoJek
//
//  Created by Coc Coc on 9/12/20.
//  Copyright © 2020 Coc Coc. All rights reserved.
//

import UIKit

class TinderViewController: UIViewController {
  @IBOutlet private var indicatorView: UIActivityIndicatorView!
  @IBOutlet private var titleLabel: UILabel!
  @IBOutlet private var containerCaroselView: UIView!

  private var service: RestAPIServiceImpl!
  private var viewModel: TinderListViewModel!
  private var swipeView: TinderSwipeView<User>!

  override func viewDidLoad() {
    super.viewDidLoad()

    service = RestAPIServiceImpl()
    viewModel = TinderListViewModel(service: service)
    viewModel.updateUIBlock = { [unowned self] in
      DispatchQueue.main.async {
        self.reloadUI()
      }
    }

    setupUI()
    viewModel.start()
  }

  func setupUI() {
    view.backgroundColor = UIColor.lightGray
    containerCaroselView.backgroundColor = UIColor.clear
    indicatorView.hidesWhenStopped = true
    indicatorView.startAnimating()
    setupCaroselUI()
  }

  func setupCaroselUI() {
    /// Dynamically create view for each tinder card
    let contentView: (Int, CGRect, User) -> (UIView) = {
      [unowned self] (_: Int, frame: CGRect, userModel: User) -> (UIView) in
      let customView = CustomView(frame: frame)
      customView.parentVC = self
      customView.userViewModel = UserViewModel(user: userModel)
      return customView
    }

    swipeView = TinderSwipeView<User>(frame: containerCaroselView.bounds, contentView: contentView)
    swipeView.delegate = self
    containerCaroselView.addSubview(swipeView)
    swipeView.fixInView(containerCaroselView)
  }

  func reloadUI() {
    indicatorView.stopAnimating()
    swipeView.showTinderCards(with: viewModel.users, isDummyShow: false)
  }

  @IBAction func buttonReloadTapped(_ sender: UIButton) {
    indicatorView.startAnimating()
    UIView.animate(withDuration: 0.5) {
      self.titleLabel.text = ""
    }
    viewModel.getUsers()
  }

  @IBAction func buttonHeartTapped(_ sender: UIButton) {
    indicatorView.startAnimating()
    UIView.animate(withDuration: 0.5) {
      self.titleLabel.text = "Selected list"
    }
    viewModel.loadFavUser()
  }
}

extension TinderViewController: TinderSwipeViewDelegate {
  func dummyAnimationDone() {
    // NOP
  }

  func currentCardStatus(card: Any, distance: CGFloat) {
    // NOP
  }

  func fallbackCard(model: Any) {
    // NOP
  }

  func didSelectCard(model: Any) {
    // NOP
  }

  func cardGoesLeft(model: Any) {
    if let model = model as? User {
      viewModel.didDeSelect(model)
    }
  }

  func cardGoesRight(model: Any) {
    if let model = model as? User {
      viewModel.didSelect(model)
    }
  }

  func undoCardsDone(model: Any) {
    // NOP
  }

  func endOfCardsReached() {
    debugPrint("endOfCardsReached")
  }
}
