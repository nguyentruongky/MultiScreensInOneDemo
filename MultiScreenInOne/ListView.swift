//
//  ListView.swift
//  MultiScreenInOne
//
//  Created by Ky Nguyen Coinhako on 3/30/18.
//  Copyright © 2018 kynguyen. All rights reserved.
//

import UIKit

class ListView: knView {
    let maxItemCount = 20
    
    let fakeData = Datasource()
    var currentPage = 0
    var canLoadMore = true 
    var datasource = [String]() { didSet { tableView.reloadData() }}
    
    lazy var tableView: UITableView = { [weak self] in
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.separatorStyle = .none
        tb.showsVerticalScrollIndicator = false
        tb.dataSource = self
        tb.delegate = self
        tb.register(knTableCell.self, forCellReuseIdentifier: "knTableCell")
        return tb
        }()
    
    override func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(views: tableView)
        tableView.fill(toView: self)
        backgroundColor = .white
    }
    
    func fetchMore() { }
    func fetchData() { }
    
    func checkLoadMoreAvailable(currentCount: Int) {
        canLoadMore = currentCount == maxItemCount
        currentPage += currentCount == maxItemCount ? 1 : 0
    }
}


extension ListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == datasource.count - 1 {
            fetchMore()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "knTableCell", for: indexPath) as! knTableCell
        cell.textLabel?.text = datasource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { return 66 }
}

