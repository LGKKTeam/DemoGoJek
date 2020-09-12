//
//  ViewController.swift
//  DemoGoJek
//
//  Created by Coc Coc on 9/12/20.
//  Copyright © 2020 Coc Coc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    let anotherVC = UIViewController()
    self.present(anotherVC, animated: true) {
      DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
        self.dismiss(animated: true, completion: nil)
      }
    }
  }
}
