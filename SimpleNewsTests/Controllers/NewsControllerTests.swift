//
//  NewsCollectionControllerTests.swift
//  SimpleNewsTests
//
//  Created by Dmitry Polyakov on 20/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

import XCTest
@testable import SimpleNews

class NewsControllerTests: XCTestCase {
    
    private enum ExpectationType: String {
        case testDidSelectRow
        
        var description: String {
            return "Error in \(self.rawValue) case"
        }
    }
    
    private let tableView = UITableView()
    private var expectations: [ExpectationType: XCTestExpectation] = [:]
    private lazy var controller: NewsControllerProtocol = ControllersFactory.getNewsController(delegate: self)
    private let articles = [
        Article.get(title: "t1", description: "d1", publishedAt: "2010-12-22T10:10:10+00:00"),
        Article.get(title: "t2", description: "d2", publishedAt: "2019-02-18T16:14:42+00:00"),
        Article.get(title: "t3", description: "d3", publishedAt: "2033-02-18T20:20:00+00:00")]
    
    private var testingArticleIndex: Int {
        return articles.count - 1
    }
    
    override func setUp() {
        let news = News(totalResults: articles.count, articles: articles)
        controller.update(news)
        controller.registerCells(in: tableView)
    }

    func testDidSelectRow() {
        let expectationType = ExpectationType.testDidSelectRow
        expectations[expectationType] = XCTestExpectation(description: expectationType.rawValue)
        controller.didSelectRow(at: IndexPath(item: testingArticleIndex, section: 0), in: tableView)
        wait(for: [expectations[expectationType]!], timeout: 2)
    }

    func testPreparingCells() {
        for (index, article) in articles.enumerated() {
            let cell = controller.cell(in: tableView, for: IndexPath(item: index, section: 0)) as! ArticleCell
            XCTAssertEqual(cell.titleLabel.text, article.title, "Cell \(index) did't prepare")
        }
    }
    
    func testCellHeight() {
        let heightFromController = controller.height(forRow: IndexPath(item: testingArticleIndex, section: 0))
        let articleCellViewModel = ArticleCellViewModel(article: articles[testingArticleIndex])
        XCTAssertEqual(heightFromController, articleCellViewModel?.height, "Cell height is wrong")
    }
    
    func testCelleHeight() {
        XCTAssertEqual(controller.numberOfRows(in: 0), articles.count, "Number of rows in controller did't equal to articles array count")
    }

}

extension NewsControllerTests: NewsCollectionControllerDelegate {
    func pushArticleVC(for model: ArticleInputModel) {
        let expectationType = ExpectationType.testDidSelectRow
        XCTAssertEqual(articles[testingArticleIndex], model.article, expectationType.description)
        expectations[expectationType]?.fulfill()
    }
}

fileprivate extension Article {
    static func get(title: String, description: String, publishedAt: String) -> Article {
        let encoder = JSONEncoder()
        let mockArticle = MockArticle(title: title, description: description, publishedAt: publishedAt, author: nil, url: "", urlToImage: "", content: nil)
        let articleData = try! encoder.encode(mockArticle)
        let decoder = JSONDecoder()
        return try! decoder.decode(Article.self, from: articleData)
    }
}

struct MockArticle: Encodable {
    var title: String
    var description: String
    var publishedAt: String
    
    var author: String?
    var url: String
    var urlToImage: String
    var content: String?
}

extension Article: Equatable {
    public static func == (lhs: Article, rhs: Article) -> Bool {
        return lhs.sourceUrl == rhs.sourceUrl
    }
    
}
