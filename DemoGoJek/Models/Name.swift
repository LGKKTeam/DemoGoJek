// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let name = try Name(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.nameTask(with: url) { name, response, error in
//     if let name = name {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Name

struct Name: Codable {
  var title: Title?
  var first, last: String?
}

// MARK: Name convenience initializers and mutators

extension Name {
  init(data: Data) throws {
    self = try newJSONDecoder().decode(Name.self, from: data)
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
    title: Title?? = nil,
    first: String?? = nil,
    last: String?? = nil
  ) -> Name {
    return Name(
      title: title ?? self.title,
      first: first ?? self.first,
      last: last ?? self.last
    )
  }

  func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }

  func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}
