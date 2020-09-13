// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let usersResponseModel = try UsersResponseModel(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.usersResponseModelTask(with: url) { usersResponseModel, response, error in
//     if let usersResponseModel = usersResponseModel {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - UsersResponseModel

struct UsersResponseModel: Codable {
  var results: [User]?
}
