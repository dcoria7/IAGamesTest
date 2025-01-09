//
//  EditGameViewModelTest.swift
//  IAGamesTestTests
//
//  Created by DC on 09/01/25.
//

import XCTest
@testable import IAGamesTest

final class GameTest: XCTestCase {
	
	private var sut: InitViewModel!
	let dependency = DependencyContainer()
	
	override func setUp() {
		super.setUp()
		sut = InitViewModel(dependency: dependency)
	}
	
	override func tearDown() {
		sut = nil
		super.tearDown()
	}
	
	func testFetchData() async {
		
		let response = try? await sut.fetchData()
		XCTAssertNoThrow(response)
	}
	
	func testReponseData() async {
		let repository = dependency.gamesRepository()
		let response = try? await repository.testResponse()
		XCTAssertTrue(response?.count != 0)
	}

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
