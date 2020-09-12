// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let street = try Street(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.streetTask(with: url) { street, response, error in
//     if let street = street {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Street

struct Street: Codable {
  var number: Int?
  var name: String?
}

// MARK: Street convenience initializers and mutators

extension Street {
  init(data: Data) throws {
    self = try newJSONDecoder().decode(Street.self, from: data)
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
    number: Int?? = nil,
    name: String?? = nil
  ) -> Street {
    return Street(
      number: number ?? self.number,
      name: name ?? self.name
    )
  }

  func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }

  func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}
