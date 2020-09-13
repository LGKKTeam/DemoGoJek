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

struct IDUser: Codable {
  var name: String?
  var value: String?
}
