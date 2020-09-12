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

// MARK: Dob convenience initializers and mutators

extension Dob {
  init(data: Data) throws {
    self = try newJSONDecoder().decode(Dob.self, from: data)
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
    date: String?? = nil,
    age: Int?? = nil
  ) -> Dob {
    return Dob(
      date: date ?? self.date,
      age: age ?? self.age
    )
  }

  func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }

  func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}
