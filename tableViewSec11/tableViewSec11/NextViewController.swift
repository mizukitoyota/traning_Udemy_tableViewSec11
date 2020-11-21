//
//  NextViewController.swift
//  tableViewSec11
//
//  Created by Training on 2020/11/20.
//  Copyright © 2020 training. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var todoLabel: UILabel!
    var todoString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoLabel.text = todoString
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //ナビゲーションバー消去
        navigationController?.isNavigationBarHidden = false
    }
    
}
