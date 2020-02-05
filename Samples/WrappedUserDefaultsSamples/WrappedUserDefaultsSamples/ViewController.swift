//
//  ViewController.swift
//  WrappedUserDefaultsSamples
//
//  Created by tanabe.nobuyuki on 2020/02/05.
//  Copyright © 2020 tanabe.nobuyuki. All rights reserved.
//

import UIKit
import UserDefaultsWrapper

class ViewController: UIViewController {
    @WrappedUserDefaults(key: "mark-as-read", defaultValue: true, storage: .standard) var markAsRead: Bool

    override func viewDidLoad() {
        super.viewDidLoad()
        print(markAsRead)
        // Do any additional setup after loading the view.
        markAsRead = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(markAsRead)
    }


}

