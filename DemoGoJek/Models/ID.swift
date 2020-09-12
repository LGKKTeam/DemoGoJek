// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let iD = try ID(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.iDTask(with: url) { iD, response, error in
//     if let iD = iD {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - ID

struct ID: Codable {
  var name: String?
  var value: String?
}

// MARK: ID convenience initializers and mutators

extension ID {
  init(data: Data) throws {
    self = try newJSONDecoder().decode(ID.self, from: data)
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
    name: String?? = nil,
    value: String?? = nil
  ) -> ID {
    return ID(
      name: name ?? self.name,
      value: value ?? self.value
    )
  }

  func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }

  func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}
