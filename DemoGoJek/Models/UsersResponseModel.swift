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

// MARK: UsersResponseModel convenience initializers and mutators

extension UsersResponseModel {
  init(data: Data) throws {
    self = try newJSONDecoder().decode(UsersResponseModel.self, from: data)
  }

  init(_ json: String, using encoding: String.Encoding = .utf8) throws {
    guard let data = json.data(using: encoding) else {
      throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
    }
    try self.init(data: data)
  }

  init(fromURL url: URL) throws {
    try self.init(data: try Data(contentsOf: url))
  }

  func with(
    results: [User]?? = nil
  ) -> UsersResponseModel {
    return UsersResponseModel(
      results: results ?? self.results
    )
  }

  func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }

  func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}
