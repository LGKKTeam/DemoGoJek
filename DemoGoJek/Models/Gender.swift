import Foundation

enum Gender: String, Codable {
  case female
  case male
  case unknown

  public init(from decoder: Decoder) throws {
    self = try Gender(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
  }
}
