//
//  RestAPIServiceTests.swift
//  DemoGoJekTests
//
//  Created by Coc Coc on 9/12/20.
//  Copyright © 2020 Coc Coc. All rights reserved.
//

@testable import DemoGoJek
import XCTest

class RestAPIServiceTests: XCTestCase {
  var restAPI: RestAPIServiceImpl!

  override func setUp() {
    super.setUp()

    restAPI = RestAPIServiceImpl()
    XCTAssertNotNil(restAPI)
  }

  override func tearDown() {
    super.tearDown()

    restAPI = nil
  }

  func testRequestAPI() {
    var data: UsersResponseModel?
    let expectation = XCTestExpectation(description: "Download data")
    restAPI.getNews { (model, _) in
      XCTAssertNotNil(model, "No data was downloaded.")
      data = model
      expectation.fulfill()
    }
    let result = XCTWaiter.wait(for: [expectation], timeout: 60)
    XCTAssertEqual(result, .completed)
    XCTAssertNotNil(data)
  }

  func testRequestFailed() {
    var data: UsersResponseModel?
    let expectation = XCTestExpectation(description: "Download data")
    restAPI.request(urlString: "") { (model, _) in
      data = model
      expectation.fulfill()
    }
    let result = XCTWaiter.wait(for: [expectation], timeout: 60)
    XCTAssertEqual(result, .completed)
    XCTAssertNil(data)
  }
}
