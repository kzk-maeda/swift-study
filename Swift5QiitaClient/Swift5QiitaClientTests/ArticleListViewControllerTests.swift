//
//  ArticleListViewControllerTests.swift
//  Swift5QiitaClientTests
//
//  Created by Kazuki Maeda on 2019/12/09.
//  Copyright © 2019 Kazuki Maeda. All rights reserved.
//

import XCTest
@testable import Swift5QiitaClient

class ArticleListViewControllerTests: XCTestCase {
    
    var vc = ArticleListViewController()
    var tableView = UITableView()
    var window = UIWindow()

    override func setUp() {
        window.rootViewController = vc
        window.makeKeyAndVisible()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_Title1IsDisplayed() {
        let article = Article(title: "Title")
        let client = FakeArticleListAPIClient(fakeResponse: [article])
        vc = ArticleListViewController(client: client)
        
        setUp()
        XCTAssertEqual(vc.titleLabel.text, "Title")
    }
    
    func test_title2IsDisplayed() {
        let article = Article(title: "Title2")
        let client = FakeArticleListAPIClient(fakeResponse: [article])
        vc = ArticleListViewController(client: client)
        
        setUp()
        XCTAssertEqual(vc.titleLabel.text, "Title2")
    }
    
    func test_TableViewIsDisplayed() {
        XCTAssertNotNil(vc.tableView)
        XCTAssertTrue(vc.view.subviews.contains(vc.tableView))
    }
    
    func test_TableViewSectionNumIsOne() {
        let sectionCount = vc.numberOfSections(in: vc.tableView)
        XCTAssertEqual(sectionCount, 1)
    }
    
    func test_TableViewRowNumIsGivenNum() {
        var testItems = [Article]()
        testItems.append(Article(title: "Title1"))
        testItems.append(Article(title: "Title2"))
        vc.items = testItems
        
        let rowCount = vc.tableView(vc.tableView, numberOfRowsInSection: 1)
        XCTAssertEqual(rowCount, testItems.count)
    }

}

class FakeArticleListAPIClient: ArticleListAPIClientProtocol {
    let fakeResponse: [Article]
    
    init(fakeResponse: [Article]) {
        self.fakeResponse = fakeResponse
    }
    
    func fetch(completion: @escaping (([Article]?) -> Void)) {
        completion(fakeResponse)
    }
    
    
}
