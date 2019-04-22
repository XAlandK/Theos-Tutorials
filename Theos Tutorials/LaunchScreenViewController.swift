//
//  LaunchScreenViewController.swift
//  Theos Tutorials
//
//  Created by Aland Kawa on 7/29/16.
//  Copyright © 2016 Aland Kawa. All rights reserved.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    @IBOutlet weak var theosLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if UI_USER_INTERFACE_IDIOM() == .pad {
            theosLabel.font = UIFont(name: "Arial-Bold", size: 50)
        }
        
        if UI_USER_INTERFACE_IDIOM() == .phone {
            theosLabel.font = UIFont(name: "Arial-Bold", size: 25)
        }
    }
}
