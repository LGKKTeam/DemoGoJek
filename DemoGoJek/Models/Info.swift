// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let info = try Info(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.infoTask(with: url) { info, response, error in
//     if let info = info {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Info

struct Info: Codable {
  var seed: String?
  var results, page: Int?
  var version: String?
}

// MARK: Info convenience initializers and mutators

extension Info {
  init(data: Data) throws {
    self = try newJSONDecoder().decode(Info.self, from: data)
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
    seed: String?? = nil,
    results: Int?? = nil,
    page: Int?? = nil,
    version: String?? = nil
  ) -> Info {
    return Info(
      seed: seed ?? self.seed,
      results: results ?? self.results,
      page: page ?? self.page,
      version: version ?? self.version
    )
  }

  func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }

  func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}
