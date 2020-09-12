//
//  ViewController.swift
//  DemoGoJek
//
//  Created by Coc Coc on 9/12/20.
//  Copyright © 2020 Coc Coc. All rights reserved.
//

import UIKit

class TinderViewController: UIViewController {
  @IBOutlet private var containerCaroselView: UIView!

  private var service: RestAPIServiceImpl!
  private var viewModel: TinderListViewModel!
  private var swipeView: TinderSwipeView<User>!

  override func viewDidLoad() {
    super.viewDidLoad()

    service = RestAPIServiceImpl()
    viewModel = TinderListViewModel(service: service)
    viewModel.updateUIBlock = { [weak self] in
      guard let strongSelf = self else { return }
      DispatchQueue.main.async {
        strongSelf.reloadUI()
      }
    }

    setupUI()
    setupCaroselUI()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    viewModel.start()
  }

  func setupUI() {
    view.backgroundColor = UIColor.lightGray
    containerCaroselView.backgroundColor = UIColor.clear
  }

  func setupCaroselUI() {
    /// Dynamically create view for each tinder card
    let contentView: (Int, CGRect, User) -> (UIView) = { (_: Int, frame: CGRect, userModel: User) -> (UIView) in
      let customView = CustomView(frame: frame)
      customView.userViewModel = UserViewModel(user: userModel)
      return customView
    }

    swipeView = TinderSwipeView<User>(frame: containerCaroselView.bounds, contentView: contentView)
    containerCaroselView.addSubview(swipeView)
    swipeView.fixInView(containerCaroselView)
  }

  func reloadUI() {
    swipeView.showTinderCards(with: viewModel.users ?? [], isDummyShow: false)
  }
}
