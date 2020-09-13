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
