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
