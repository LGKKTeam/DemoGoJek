// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let login = try Login(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.loginTask(with: url) { login, response, error in
//     if let login = login {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Login

struct Login: Codable {
  var uuid, username, password, salt: String?
  var md5, sha1, sha256: String?
}

// MARK: Login convenience initializers and mutators

extension Login {
  init(data: Data) throws {
    self = try newJSONDecoder().decode(Login.self, from: data)
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
    uuid: String?? = nil,
    username: String?? = nil,
    password: String?? = nil,
    salt: String?? = nil,
    md5: String?? = nil,
    sha1: String?? = nil,
    sha256: String?? = nil
  ) -> Login {
    return Login(
      uuid: uuid ?? self.uuid,
      username: username ?? self.username,
      password: password ?? self.password,
      salt: salt ?? self.salt,
      md5: md5 ?? self.md5,
      sha1: sha1 ?? self.sha1,
      sha256: sha256 ?? self.sha256
    )
  }

  func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }

  func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}
