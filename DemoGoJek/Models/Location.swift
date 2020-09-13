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
