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
