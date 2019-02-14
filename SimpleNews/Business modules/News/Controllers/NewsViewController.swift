//
//  ViewController.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 14/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    private lazy var newsController = Factory.getNewsController(delegate: self)
    private lazy var newsService = NewsService(delegate: self, networkClient: Factory.networkClient)
    
    @IBOutlet var tableView: NewsTableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            newsController.registerCells(in: tableView)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        newsService.getNews(theme: nil)
    }

}

extension NewsViewController: NewsServiceDelegate {
    
    func onSuccess(_ news: News) {
        newsController.update(news)
        tableView.reloadData()
    }
    
    func onError(_ message: String) {
        //...
    }
    
}

extension NewsViewController: NewsCollectionControllerDelegate {
    
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsController.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return newsController.cell(in: tableView, for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return newsController.height(forRow: indexPath)
    }
    
}