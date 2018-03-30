//
//  FilterController.swift
//  MultiScreenInOne
//
//  Created by Ky Nguyen Coinhako on 3/30/18.
//  Copyright © 2018 kynguyen. All rights reserved.
//

import UIKit

class FilterController: knController {
    weak var history: HistoryController?
    let filterButton = UIButton()
    var isFilterOn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func setupView() {
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        filterButton.setTitleColor(.white, for: .normal)
        filterButton.addTarget(self, action: #selector(toggleFilter), for: .touchUpInside)
        
        view.addSubview(filterButton)
        filterButton.center(toView: view)
        filterButton.size(CGSize(width: 120, height: 60))

        setFilter(on: isFilterOn)
    }
    
    func setFilter(on: Bool) {
        if isFilterOn {
            filterButton.setTitle("Turn filter off", for: .normal)
            filterButton.backgroundColor = .blue
        }
        else {
            filterButton.setTitle("Turn filter on", for: .normal)
            filterButton.backgroundColor = .darkGray
        }
    }
    
    @objc func toggleFilter() {
        isFilterOn = !isFilterOn
        setFilter(on: isFilterOn)
        history?.isFilterOn = isFilterOn
        navigationController?.popViewController(animated: true)
    }
    
    
}
