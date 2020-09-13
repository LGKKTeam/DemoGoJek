// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let result = try Result(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.resultTask(with: url) { result, response, error in
//     if let result = result {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Result

struct User: Codable {
  var gender: Gender?
  var name: Name?
  var location: Location?
  var email: String?
  var dob, registered: Dob?
  var phone, cell: String?
  var idUser: IDUser?
  var picture: Picture?
  var nat: String?

  enum CodingKeys: String, CodingKey {
    case gender
    case name
    case location
    case email
    case dob, registered
    case phone, cell
    case idUser = "id"
    case picture
    case nat
  }
}

extension User: Equatable {
  static func == (lhs: User, rhs: User) -> Bool {
    if let userId1 = lhs.idUser?.value, let userId2 = rhs.idUser?.value {
      return userId1 == userId2
    }
    return false
  }
}
