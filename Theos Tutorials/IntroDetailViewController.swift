//
//  IntroDetailViewController.swift
//  Theos Tutorials
//
//  Created by Aland Kawa on 7/24/16.
//  Copyright © 2016 Aland Kawa. All rights reserved.
//

import UIKit
import MessageUI

let mistakeIntroTitleString = "There is a mistake!"
let mistakeIntroMessageString = "You found a mistake?\nPlease hurry and contact us!"

let mistakeIntroTitle = NSAttributedString(string: mistakeIntroTitleString, attributes: [NSAttributedString.Key.font : ArialRoundedMTBoldFont!, NSAttributedString.Key.foregroundColor : blackColor])
let mistakeIntroMessage = NSAttributedString(string: mistakeIntroMessageString, attributes: [NSAttributedString.Key.font : ArialRoundedMTLightFont!, NSAttributedString.Key.foregroundColor : blackColor])

class IntroDetailViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var mistakeBarButton: UIBarButtonItem!
    
    var textDetailString: NSString = ""
    var titleText: NSString = ""
    var modelString = NSString(string: UIDevice.current.model)
    var iosVersionString = NSString(string: UIDevice.current.systemVersion)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "\(titleText)"
        
        textView.text = textDetailString as String
        textView.layoutManager.allowsNonContiguousLayout = false
        self.textView.scrollRangeToVisible(NSRange(location:0, length:0))
        textView.scrollRangeToVisible(self.textView.selectedRange)
        textView.scrollsToTop = true
        
        if splitViewController?.responds(to: #selector(getter: UISplitViewController.displayModeButtonItem)) == true {
            navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
            navigationItem.leftItemsSupplementBackButton = true
        }
        
        if UI_USER_INTERFACE_IDIOM() == .pad {
            textView.font = UIFont(name: (textView.font?.fontName)!, size: 20)
        }
        
        if UI_USER_INTERFACE_IDIOM() == .phone {
            textView.font = UIFont(name: (textView.font?.fontName)!, size: 14)
        }
        
        if textView.text == "" {
            stepper.isEnabled = false
            stepper.alpha = 0.5
            mistakeBarButton.isEnabled = false
        }
    }
    
    
    @IBAction func UIStepperValueChanging(_ sender: UIStepper) {
        
        textView.isEditable = true
        textView.isSelectable = true
        
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
        textView.isSelectable = false
    }
    
    func alandKawaTwitter() {
        UIApplication.shared.openURL(URL(string: "twitter://user?screen_name=Aland_Kawa")!)
    }
    func billyEllisTwitter() {
        UIApplication.shared.openURL(URL(string: "twitter://user?screen_name=")!)
    }
    
    
    func mistakeEmail() {
        let subjectText = "Report Bug in Intro View (Theos Tutorials)"
        let messageBody = "Name/Username:\nLesson Name:\nDevice Type: \(modelString)\niOS: \(iosVersionString)\n\nBugs:"
        let xalandkRecipient = ["xalandk@icloud.com"]
        
        let mc: MFMailComposeViewController = MFMailComposeViewController()
        mc.mailComposeDelegate = self
        mc.setSubject(subjectText)
        mc.setMessageBody(messageBody, isHTML: false)
        mc.setToRecipients(xalandkRecipient)
        
        self.present(mc, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result.rawValue {
        case MFMailComposeResult.cancelled.rawValue:
            print("Mail cancelled")
        case MFMailComposeResult.saved.rawValue:
            print("Mail saved")
        case MFMailComposeResult.sent.rawValue:
            print("Mail sent")
        case MFMailComposeResult.failed.rawValue:
            print("Mail sent failure: \(error!.localizedDescription)")
        default:
            break
        }
        controller.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func mistakeBarButtonTapped(_ sender: UIBarButtonItem) {
        
        let mistakeAlert = UIAlertController(title: mistakeIntroTitleString, message: mistakeIntroMessageString, preferredStyle: .alert)
        
        mistakeAlert.setValue(mistakeIntroTitle, forKey: "attributedTitle")
        mistakeAlert.setValue(mistakeIntroMessage, forKey: "attributedMessage")
        
        let emailAction = UIAlertAction(title: "Report Bug (Email)", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.mistakeEmail()
        })
        
        let alandKawaTwitter = UIAlertAction(title: "Aland Kawa (Twitter)", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.alandKawaTwitter()
        })
        
        let billyEllisTwitter = UIAlertAction(title: "Billy Ellis (Twitter)", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.billyEllisTwitter()
        })
        
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        mistakeAlert.addAction(emailAction)
        mistakeAlert.addAction(alandKawaTwitter)
        mistakeAlert.addAction(billyEllisTwitter)
        mistakeAlert.addAction(okButton)
        
        self.present(mistakeAlert, animated: true, completion: nil)
    }
}


