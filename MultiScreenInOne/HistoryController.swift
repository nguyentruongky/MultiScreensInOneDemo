//
//  ViewController.swift
//  MultiScreenInOne
//
//  Created by Ky Nguyen Coinhako on 3/30/18.
//  Copyright © 2018 kynguyen. All rights reserved.
//

import UIKit

enum ListType {
    case pending, completed, filter
}

class HistoryController: knController {
    let filterButton = UIButton()
    let pendingView = PendingView()
    let completedView = CompletedView()
    let filterView = FilterView()
    var currentList: ListView?
    var listType = ListType.pending {
        didSet { showList(listType) } }
    
    var isFilterOn = false { didSet {
        if isFilterOn {
            listType = .filter
            filterView.fetchData()
        }
        else {
            listType = .pending
        }
        }}
    
    lazy var statusSegment: UISegmentedControl = { [weak self] in
        let view = UISegmentedControl(items: ["Pending", "Completed"])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = UIColor.blue.withAlphaComponent(0.7)
        view.addTarget(self, action: #selector(handleSelectStatus), for: UIControlEvents.valueChanged)
        view.setTitleTextAttributes([NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 15),
                                     NSAttributedStringKey.foregroundColor: UIColor.blue.withAlphaComponent(0.7)],
                                    for: .normal)
        view.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.white], for: .selected)
        view.selectedSegmentIndex = 0
        return view
        }()

    func showList(_ listType: ListType) {
        switch listType {
        case .pending:
            if pendingView.datasource.count == 0 {
                pendingView.fetchData()
            }
            statusSegment.selectedSegmentIndex = 0
            view.addSubview(pendingView)
            pendingView.fill(toView: view, space: UIEdgeInsets(top: 16 * 2 + 44 + 84, left: 0, bottom: 0, right: 0))
            currentList?.removeFromParentView()
            currentList = pendingView
            
        case .completed:
            if completedView.datasource.count == 0 {
                completedView.fetchData()
            }
            statusSegment.selectedSegmentIndex = 1
            view.addSubview(completedView)
            completedView.fill(toView: view, space: UIEdgeInsets(top: 16 * 2 + 44 + 84, left: 0, bottom: 0, right: 0))
            currentList?.removeFromParentView()
            currentList = completedView
            
        case .filter:
            view.addSubview(filterView)
            filterView.fill(toView: view, space: UIEdgeInsets(top: 66, left: 0, bottom: 0, right: 0))
            currentList?.removeFromParentView()
            currentList = filterView
        }
    }
    
    @objc func handleSelectStatus() {
        if statusSegment.selectedSegmentIndex == 0 {
            listType = .pending
        }
        else {
            listType = .completed
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        handleSelectStatus()
    }
    
    override func setupView() {
        filterButton.setImage(UIImage(named: "filter")!, for: .normal)
        filterButton.addTarget(self, action: #selector(handleShowFilter), for: .touchUpInside)
        let filterBarButton = UIBarButtonItem(customView: filterButton)
        navigationItem.rightBarButtonItems = [filterBarButton]
        
        let segmentView = UIView()
        segmentView.translatesAutoresizingMaskIntoConstraints = false
        segmentView.addSubviews(views: statusSegment)
        statusSegment.fill(toView: segmentView, space: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
        segmentView.height(16 * 2 + 44)
        
        view.addSubviews(views: segmentView)
        segmentView.horizontal(toView: view)
        segmentView.top(toView: view, space: 84)
    }
    
    @objc func handleShowFilter() {
        let controller = FilterController()
        controller.history = self
        controller.isFilterOn = isFilterOn
        navigationController?.pushViewController(controller, animated: true)
    }
}

