//
//  Swift5UnitTestTutorialTests.swift
//  Swift5UnitTestTutorialTests
//
//  Created by Kazuki Maeda on 2019/12/09.
//  Copyright © 2019 Kazuki Maeda. All rights reserved.
//

import XCTest
@testable import Swift5UnitTestTutorial

class Swift5UnitTestTutorialTests: XCTestCase {

    let test = Test()
    
    override func setUp() {
        // let test = Test()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // Tutorial
    func test_XCAssertEqual_Sussess() {
        XCTAssertEqual(5, 5)
    }
    
    func test_XCAssertEqual_Fail() {
        XCTAssertEqual(5, 4)
    }
    
    func test_XCAssertThrows_Success() {
//        let test = Test()
        XCTAssertThrowsError(try self.test.log(text: ""))
    }
    
    func test_XCAssertThrows_Fail() {
//        let test = Test()
        XCTAssertThrowsError(try self.test.log(text: "aaa"))
    }
    
    func test_XCAssertNoThrow_Success() {
//        let test = Test()
        XCTAssertNoThrow(try self.test.log(text: "aaa"))
    }
    
    func test_XCAssertNoThrow_Fail() {
//        let test = Test()
        XCTAssertNoThrow(try self.test.log(text: ""))
    }

}
