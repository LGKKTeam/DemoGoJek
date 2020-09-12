// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let picture = try Picture(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.pictureTask(with: url) { picture, response, error in
//     if let picture = picture {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Picture

struct Picture: Codable {
  var large, medium, thumbnail: String?
}

// MARK: Picture convenience initializers and mutators

extension Picture {
  init(data: Data) throws {
    self = try newJSONDecoder().decode(Picture.self, from: data)
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
    large: String?? = nil,
    medium: String?? = nil,
    thumbnail: String?? = nil
  ) -> Picture {
    return Picture(
      large: large ?? self.large,
      medium: medium ?? self.medium,
      thumbnail: thumbnail ?? self.thumbnail
    )
  }

  func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }

  func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}
