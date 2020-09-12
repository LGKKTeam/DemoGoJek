// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let timezone = try Timezone(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.timezoneTask(with: url) { timezone, response, error in
//     if let timezone = timezone {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Timezone

struct Timezone: Codable {
  var offset, timezoneDescription: String?

  enum CodingKeys: String, CodingKey {
    case offset
    case timezoneDescription = "description"
  }
}

// MARK: Timezone convenience initializers and mutators

extension Timezone {
  init(data: Data) throws {
    self = try newJSONDecoder().decode(Timezone.self, from: data)
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
    offset: String?? = nil,
    timezoneDescription: String?? = nil
  ) -> Timezone {
    return Timezone(
      offset: offset ?? self.offset,
      timezoneDescription: timezoneDescription ?? self.timezoneDescription
    )
  }

  func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }

  func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}
