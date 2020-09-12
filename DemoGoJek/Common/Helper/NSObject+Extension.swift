//
//  NSObject+Extension.swift
//  DemoGoJek
//
//  Created by Coc Coc on 9/12/20.
//  Copyright © 2020 Coc Coc. All rights reserved.
//

import Foundation

extension NSObject {
  class var className: String {
    return String(describing: self)
  }
}
