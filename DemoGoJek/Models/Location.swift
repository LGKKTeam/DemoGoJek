// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let location = try Location(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.locationTask(with: url) { location, response, error in
//     if let location = location {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Location

struct Location: Codable {
  var street: Street?
  var city, state, country: String?
  var postcode: Postcode?
  var coordinates: Coordinates?
  var timezone: Timezone?
}

// MARK: Location convenience initializers and mutators

extension Location {
  init(data: Data) throws {
    self = try newJSONDecoder().decode(Location.self, from: data)
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
    street: Street?? = nil,
    city: String?? = nil,
    state: String?? = nil,
    country: String?? = nil,
    postcode: Postcode?? = nil,
    coordinates: Coordinates?? = nil,
    timezone: Timezone?? = nil
  ) -> Location {
    return Location(
      street: street ?? self.street,
      city: city ?? self.city,
      state: state ?? self.state,
      country: country ?? self.country,
      postcode: postcode ?? self.postcode,
      coordinates: coordinates ?? self.coordinates,
      timezone: timezone ?? self.timezone
    )
  }

  func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }

  func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}
