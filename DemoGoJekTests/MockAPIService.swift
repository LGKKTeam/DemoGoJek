//
//  MockAPIService.swift
//  DemoGoJekTests
//
//  Created by Coc Coc on 9/12/20.
//  Copyright © 2020 Coc Coc. All rights reserved.
//

@testable import DemoGoJek
import XCTest

class MockAPIService: RestAPIServiceProtocol {
  func getNews(completion: @escaping ((UsersResponseModel?, Error?) -> Void)) {
    let data = try? newJSONDecoder().decode(UsersResponseModel.self, from: mockContentData)
    completion(data, nil)
  }

  var mockContentData: Data {
    return getData(name: "FakeData") ?? Data()
  }

  func getData(name: String, withExtension: String = "json") -> Data? {
    let testBundle = Bundle(for: type(of: self))
    let url = testBundle.url(forResource: name, withExtension: withExtension)
    guard let data: Data = NSData(contentsOf: url!) as Data? else { return nil }
    return data
  }
}
