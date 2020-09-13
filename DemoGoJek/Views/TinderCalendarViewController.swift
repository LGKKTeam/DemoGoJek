//
//  TinderCalendarViewController.swift
//  DemoGoJek
//
//  Created by Coc Coc on 9/13/20.
//  Copyright © 2020 Coc Coc. All rights reserved.
//

import UIKit

class TinderCalendarViewController: UIViewController, TinderUserInfoViewProtocol {
  @IBOutlet private weak var birthdayLabel: UILabel!

  var userViewModel: UserViewModel!

  override func viewDidLoad() {
    super.viewDidLoad()
    birthdayLabel.text = userViewModel.birthday
  }
}
