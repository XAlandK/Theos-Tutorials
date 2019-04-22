//
//  LibrarySplitViewController.swift
//  Theos Tutorials
//
//  Created by Aland Kawa on 7/25/16.
//  Copyright © 2016 Aland Kawa. All rights reserved.
//

import UIKit

class LibrarySplitViewController: UISplitViewController, UISplitViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.preferredDisplayMode = .allVisible
    }
    
    func splitViewController (_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        // Return YES to prevent UIKit from applying its default behavior
        return true
    }
}
