// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let coordinates = try Coordinates(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.coordinatesTask(with: url) { coordinates, response, error in
//     if let coordinates = coordinates {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Coordinates

struct Coordinates: Codable {
  var latitude, longitude: String?
}

// MARK: Coordinates convenience initializers and mutators

extension Coordinates {
  init(data: Data) throws {
    self = try newJSONDecoder().decode(Coordinates.self, from: data)
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
    latitude: String?? = nil,
    longitude: String?? = nil
  ) -> Coordinates {
    return Coordinates(
      latitude: latitude ?? self.latitude,
      longitude: longitude ?? self.longitude
    )
  }

  func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }

  func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}
