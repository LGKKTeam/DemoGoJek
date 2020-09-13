//
//  TinderListViewModelTests.swift
//  DemoGoJekTests
//
//  Created by Coc Coc on 9/12/20.
//  Copyright © 2020 Coc Coc. All rights reserved.
//

@testable import DemoGoJek
import XCTest

class TinderListViewModelTests: XCTestCase {
  var mockAPIService: MockAPIService!
  var sut: TinderListViewModel!
  let fileName = "TestStoreData"

  override func setUp() {
    super.setUp()

    mockAPIService = MockAPIService()
    sut = TinderListViewModel(service: mockAPIService)
    sut.updateUIBlock = {
      // NOP
    }

    XCTAssertNotNil(mockAPIService)
    XCTAssertNotNil(sut)
  }

  override func tearDown() {
    super.tearDown()

    mockAPIService = nil
    sut = nil
  }

  func testListViewModel() {
    sut.start()
    XCTAssertNotNil(sut.users)
  }

  func testStoreData() {
    sut.start()
    Storage.store(sut.userResponse, to: .caches, as: fileName)
    XCTAssertTrue(Storage.fileExists(fileName, in: .caches))
    let model = Storage.retrieve(fileName, from: .caches, as: UsersResponseModel.self)
    XCTAssertNotNil(model)
    Storage.remove(fileName, from: .caches)
    XCTAssertFalse(Storage.fileExists(fileName, in: .caches))
    Storage.clear(.caches)
  }

  func testListViewModelLoadCached() {
    sut.loadFavUser()
    XCTAssertNotNil(sut.users)
  }

  func testUserDataValidate() {
    sut.start()

    /// Validate fields on User model
    let model = sut.users.first
    XCTAssertNotNil(model)

    XCTAssertNotNil(model?.name)
    XCTAssertNotNil(model?.dob)
    XCTAssertNotNil(model?.location)
    XCTAssertNotNil(model?.gender)
    XCTAssertNotNil(model?.email)
    XCTAssertNotNil(model?.registered)
    XCTAssertNotNil(model?.phone)
    XCTAssertNotNil(model?.cell)
    XCTAssertNotNil(model?.picture)
    XCTAssertNotNil(model?.nat)

    XCTAssertNotNil(model?.name?.first)
    XCTAssertNotNil(model?.name?.last)
    XCTAssertNotNil(model?.name?.title)

    XCTAssertNotNil(model?.dob?.age)
    XCTAssertNotNil(model?.dob?.date)

    XCTAssertNotNil(model?.location?.street)
    XCTAssertNotNil(model?.location?.city)
    XCTAssertNotNil(model?.location?.state)
    XCTAssertNotNil(model?.location?.country)
    XCTAssertNotNil(model?.location?.postcode)
    XCTAssertNotNil(model?.location?.coordinates?.latitude)
    XCTAssertNotNil(model?.location?.coordinates?.longitude)
    XCTAssertNotNil(model?.location?.timezone)

    XCTAssertNotNil(model?.picture?.large)
    XCTAssertNotNil(model?.picture?.medium)
    XCTAssertNotNil(model?.picture?.thumbnail)
  }
}
