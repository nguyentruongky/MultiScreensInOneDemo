//
//  PendingView.swift
//  MultiScreenInOne
//
//  Created by Ky Nguyen Coinhako on 3/30/18.
//  Copyright © 2018 kynguyen. All rights reserved.
//

import UIKit
class PendingView: ListView {
    
    override func fetchData() {
        let newData = fakeData.getPendingList(page: 0)
        checkLoadMoreAvailable(currentCount: newData.count)
        datasource = newData
    }
    
    override func fetchMore() {
        guard canLoadMore else { return }
        let newData = fakeData.getPendingList(page: currentPage)
        checkLoadMoreAvailable(currentCount: newData.count)
        datasource += newData
    }
}
