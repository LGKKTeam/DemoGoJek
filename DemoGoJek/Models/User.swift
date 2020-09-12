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
  var login: Login?
  var dob, registered: Dob?
  var phone, cell: String?
  var id: ID?
  var picture: Picture?
  var nat: String?
}

// MARK: Result convenience initializers and mutators

extension User {
  init(data: Data) throws {
    self = try newJSONDecoder().decode(User.self, from: data)
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
    gender: Gender?? = nil,
    name: Name?? = nil,
    location: Location?? = nil,
    email: String?? = nil,
    login: Login?? = nil,
    dob: Dob?? = nil,
    registered: Dob?? = nil,
    phone: String?? = nil,
    cell: String?? = nil,
    id: ID?? = nil,
    picture: Picture?? = nil,
    nat: String?? = nil
  ) -> User {
    return User(
      gender: gender ?? self.gender,
      name: name ?? self.name,
      location: location ?? self.location,
      email: email ?? self.email,
      login: login ?? self.login,
      dob: dob ?? self.dob,
      registered: registered ?? self.registered,
      phone: phone ?? self.phone,
      cell: cell ?? self.cell,
      id: id ?? self.id,
      picture: picture ?? self.picture,
      nat: nat ?? self.nat
    )
  }

  func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }

  func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}
