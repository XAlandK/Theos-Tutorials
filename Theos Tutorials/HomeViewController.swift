//
//  HomeViewController.swift
//  Theos Tutorials
//
//  Created by Aland Kawa on 7/24/16.
//  Copyright © 2016 Aland Kawa. All rights reserved.
//

import UIKit

let aboutTitleString = "About"
let aboutMessageString = "App Version: 1.4\nDeveloper: Reverse Effects\nUpdated to 2016: Aland Kawa\nApp Icon by: Billy Ellis\nAll Icons are copyrighted to \nhttp://icons8.com\n\nTheos is property and copyright of DHowett.\nAll Rights Reserved.\n\nXAlandK 2016 - Reverse Effects 2010+ \n© Copyright, All Rights Reserved."

let ArialRoundedMTLightFont = UIFont(name: "ArialRoundedMT-Light", size: 13.5)
let ArialRoundedMTBoldFont = UIFont(name: "Arial Rounded MT Bold", size: 17)


let TitleString = NSAttributedString(string: aboutTitleString, attributes: [NSAttributedString.Key.font : ArialRoundedMTBoldFont!, NSAttributedString.Key.foregroundColor : blackColor])
let MessageString = NSAttributedString(string: aboutMessageString, attributes: [NSAttributedString.Key.font : ArialRoundedMTLightFont!, NSAttributedString.Key.foregroundColor : blackColor])

class HomeViewController: UIViewController {

    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UI_USER_INTERFACE_IDIOM() == .pad {
            textView.font = UIFont(name: (textView.font?.fontName)!, size: 20)
        }
        
        if UI_USER_INTERFACE_IDIOM() == .phone {
            textView.font = UIFont(name: (textView.font?.fontName)!, size: 14)
        }
        
        self.title = "Home"
        textView.text = "\n** WELCOME **\n\nTo get started using Theos Tutorials, please open the Intro tab for instructions on installing Theos (by DHowett)\n\nOnce you have Theos installed (Which the tutorials are available in Intro tab), you may proceed to use the Hello World tutorial or go straight to the developer library in the Library tab.\n\nThe \"Intro\" tab involves introducing and installing Theos, as well as, developing the Hello World application.\nThe \"Library\" tab holds tutorials on different UI elements that can be used to extend functionality to your apps.\nThe \"FAQ's\" tab holds allot of frequently asked questions with answers.\nThe \"More\" tab holds all the other, including contact and some websites that will be useful for you. \n\nIf you need contact information, please refer to the \"More\" tab.\n\nEnjoy!\n"
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isSelectable = true
    }
    
    @IBAction func UIStepperValueChanging(_ sender: UIStepper) {
        
        textView.isEditable = true
        
        if UI_USER_INTERFACE_IDIOM() == .phone {
            stepper.minimumValue = 14.0
            stepper.stepValue = 1
            stepper.maximumValue = 50.0
            
            self.textView.font = UIFont(name: (textView.font?.fontName)! ,size: CGFloat(sender.value))
        }
        
        if UI_USER_INTERFACE_IDIOM() == .pad {
            stepper.minimumValue = 20.0
            stepper.stepValue = 1
            stepper.maximumValue = 50.0
            
            self.textView.font = UIFont(name: (textView.font?.fontName)! ,size: CGFloat(sender.value))
        }
        
        textView.isEditable = false
    }
    
    @IBAction func aboutBarButton(_ sender: UIBarButtonItem) {
        let aboutAlert = UIAlertController(title: aboutTitleString, message: aboutMessageString, preferredStyle: .alert)
        
        aboutAlert.setValue(TitleString, forKey: "attributedTitle")
        aboutAlert.setValue(MessageString, forKey: "attributedMessage")
        
        let alandKawa = UIAlertAction(title: "Aland Kawa", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            UIApplication.shared.openURL(URL(string: "twitter://user?screen_name=Aland_Kawa")!)
        })
        
        let billyEllis = UIAlertAction(title: "Billy Ellis", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            UIApplication.shared.openURL(URL(string: "twitter://user?screen_name=bellis1000")!)
        })
        
        let dismissAction = UIAlertAction(title: "Close", style: .destructive, handler: nil)
        
        aboutAlert.addAction(alandKawa)
        aboutAlert.addAction(billyEllis)
        aboutAlert.addAction(dismissAction)
        
        self.present(aboutAlert, animated: true, completion: nil)
    }
    
    @IBAction func shareBarButton(_ sender: UIBarButtonItem) {
        
        
        let app = "Theos Tutorials: Learn and make native iOS Apps without Mac! Check it out! by @Aland_Kawa"
        
        if let repoLink = URL(string: "http://repo.hackyouriphone.org/theostutorials.html") {
            let objectsToShare = [app, repoLink] as [Any]
            
            let vc = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
            //check ipad
            if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad)
            {
                //ios > 8.0
                if (vc.responds(to: #selector(getter: UIViewController.popoverPresentationController)) ) {
                    vc.popoverPresentationController?.sourceView = super.view
                }
            }
            self.present(vc, animated: true, completion: nil)
        }
    }
}


