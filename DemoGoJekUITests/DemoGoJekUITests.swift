//
//  DemoGoJekUITests.swift
//  DemoGoJekUITests
//
//  Created by Coc Coc on 9/12/20.
//  Copyright © 2020 Coc Coc. All rights reserved.
//

@testable import DemoGoJek
import XCTest

// swiftlint:disable line_length
class DemoGoJekUITests: XCTestCase {
  override func setUpWithError() throws {
    continueAfterFailure = false
  }

  override func tearDownWithError() throws {}

  func testExample() throws {
    let app = XCUIApplication()
    app.launch()
    let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0)
    element.buttons["ic user"].tap()
    element.buttons["ic calendar"].tap()
    element.buttons["ic location"].tap()
    element.buttons["ic lock"].tap()

    let element1 = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element
    element1.swipeRight()
    element1.swipeRight()
    element1.swipeLeft()
    element1.swipeLeft()
    element1.swipeRight()
    element1.swipeLeft()
    app.buttons["ic heart"].tap()
    app.buttons["ic refresh"].tap()
  }

  func testLaunchPerformance() throws {
    if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
      // This measures how long it takes to launch your application.
      measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
        XCUIApplication().launch()
      }
    }
  }
}
