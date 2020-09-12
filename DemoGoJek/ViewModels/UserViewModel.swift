//
//  UserViewModel.swift
//  DemoGoJek
//
//  Created by Coc Coc on 9/12/20.
//  Copyright © 2020 Coc Coc. All rights reserved.
//

import UIKit

class UserViewModel {
  private let user: User!

  init(user: User!) {
    self.user = user
  }

  var userName: String {
    if let firstName = user.name?.first, let lastName = user.name?.last {
      return "\(firstName) \(lastName)"
    } else if let firstName = user.name?.first {
      return firstName
    } else {
      return user.name?.last ?? "Noname"
    }
  }

  var profileURLString: String {
    return user.picture?.large ?? user.picture?.medium ?? user.picture?.thumbnail ?? ""
  }

  var age: String {
    return user.dob?.age != nil ? "\(user.dob?.age ?? 0) years old" : ""
  }
}
