// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let dob = try Dob(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.dobTask(with: url) { dob, response, error in
//     if let dob = dob {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Dob

struct Dob: Codable {
  var date: String?
  var age: Int?
}
