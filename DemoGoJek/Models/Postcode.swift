import Foundation

enum Postcode: Codable {
  case integer(Int)
  case string(String)

  init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    if let xVal = try? container.decode(Int.self) {
      self = .integer(xVal)
      return
    }
    if let xVal = try? container.decode(String.self) {
      self = .string(xVal)
      return
    }
    throw DecodingError.typeMismatch(Postcode.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                          debugDescription: "Wrong type for Postcode"))
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    switch self {
    case .integer(let xVal):
      try container.encode(xVal)
    case .string(let xVal):
      try container.encode(xVal)
    }
  }
}
