//
//  UserViewModel.swift
//  DemoGoJek
//
//  Created by Coc Coc on 9/12/20.
//  Copyright © 2020 Coc Coc. All rights reserved.
//

import CoreLocation

class UserViewModel {
  private let user: User!
  var section: UserInfoSection = .personal

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
    return user.dob?.age != nil ? "\(user.dob?.age ?? 0)" : ""
  }

  var birthday: String {
    if let dateStr = user.dob?.date {
      let formatter = DateFormatter()
      formatter.locale = Locale(identifier: "en_US_POSIX")
      formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
      formatter.calendar = Calendar(identifier: .gregorian)
      if let date = formatter.date(from: dateStr) {
        formatter.dateFormat = "dd\nMMM"
        return formatter.string(from: date)
      }
    }
    return "Private"
  }

  var address: String {
    if let city = user.location?.city, let country = user.location?.country {
      return "\(city) - \(country)"
    } else if let country = user.location?.country {
      return country
    }
    return "Private"
  }

  var location: CLLocationCoordinate2D? {
    return CLLocationCoordinate2D(latitude: Double(user.location?.coordinates?.latitude ?? "") ?? 0.0,
                                  longitude: Double(user.location?.coordinates?.longitude ?? "") ?? 0.0)
  }

  var phone: String? {
    if let cell = user.cell {
      return cell
    }
    if let phone = user.phone {
      return phone
    }
    return nil
  }
}
