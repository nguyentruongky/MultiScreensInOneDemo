//
//  knController.swift
//  Ogenii
//
//  Created by Ky Nguyen on 3/17/17.
//  Copyright © 2017 Ky Nguyen. All rights reserved.
//

import UIKit

class knController : UIViewController {

    var didLoadData = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    func setupView() { }
    
    func fetchData() { }
    
    deinit {
        print("Deinit \(NSStringFromClass(type(of: self)))")
    }
}
