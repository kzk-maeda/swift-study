//
//  ArticleListViewControllerTests.swift
//  Swift5QiitaClientTests
//
//  Created by Kazuki Maeda on 2019/12/09.
//  Copyright © 2019 Kazuki Maeda. All rights reserved.
//

import XCTest
import SafariServices
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
        let article = Article(title: "Title", url: "http://test")
        let client = FakeArticleListAPIClient(fakeResponse: [article])
        vc = ArticleListViewController(client: client)
        
        setUp()
        XCTAssertEqual(vc.titleLabel.text, "Title")
    }
    
    func test_title2IsDisplayed() {
        let article = Article(title: "Title2", url: "http://test")
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
        testItems.append(Article(title: "Title1", url: "http://test"))
        testItems.append(Article(title: "Title2", url: "http://test"))
        vc.items = testItems
        
        let rowCount = vc.tableView(vc.tableView, numberOfRowsInSection: 1)
        XCTAssertEqual(rowCount, testItems.count)
    }
    
    func test_TapAndDisplayDetailView() {
        let article = Article(title: "Title", url: "http;//test")
        let client = FakeArticleListAPIClient(fakeResponse: [article])
        let vc = ArticleListViewController(client: client)
        
        setUp()
        
        vc.tableView(vc.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue(vc.presentedViewController is SFSafariViewController)
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
