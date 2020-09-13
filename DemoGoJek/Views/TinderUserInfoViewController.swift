//
//  TinderUserInfoViewController.swift
//  DemoGoJek
//
//  Created by Coc Coc on 9/13/20.
//  Copyright © 2020 Coc Coc. All rights reserved.
//

import UIKit

protocol TinderUserInfoViewProtocol {
  var userViewModel: UserViewModel! { get set }
}

class TinderUserInfoViewController: UIViewController, TinderUserInfoViewProtocol {
  @IBOutlet private var nameLabel: UILabel!
  @IBOutlet private var ageLabel: UILabel!

  var userViewModel: UserViewModel!

  override func viewDidLoad() {
    super.viewDidLoad()

    self.nameLabel.text = userViewModel.userName
    self.ageLabel.text = userViewModel.age
  }
}
