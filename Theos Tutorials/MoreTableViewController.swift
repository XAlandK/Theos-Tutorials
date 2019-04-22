//
//  MoreTableViewController.swift
//  Theos Tutorials
//
//  Created by Aland Kawa on 7/26/16.
//  Copyright © 2016 Aland Kawa. All rights reserved.
//

import UIKit
import MessageUI

class MoreTableViewController: UITableViewController, MFMailComposeViewControllerDelegate {
    
    var modelString = NSString(string: UIDevice.current.model)
    var iosVersionString = NSString(string: UIDevice.current.systemVersion)
    
    let contact = [
        "Send Mail",
        "Aland Kawa",
        "Billy Ellis"
    ]
    
    let specialThanks = [
        "Billy Ellis",
        "Trevor Schmitt",
        "ipswCentral"
    ]
    
    let specialThanksDetail = [
        "@bellis1000",
        "@Trcvor_Schmitt",
        "@ipswCentral"
    ]
    
    let contactDetail = [
        "xalandk@icloud.com",
        "@Aland_Kawa",
        "@bellis1000"
    ]
    
    
    let usefulDeveloperResources = [
        "ModMyi",
        "BigBoss",
        "Stack Overflow",
        "CydiaSubstrate",
        "TheiPhoneWiki",
        "Apple's UIKit Framework References",
        "ipswCentral",
        "iOSGods",
        "iOS Blog"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 3
        case 2:
            return 9
        default:
            break
        }
        
        return section
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        if indexPath.section == 0 {
            cell.textLabel?.font = cellFont
            cell.detailTextLabel?.font = cellFont
            cell.textLabel?.text = contact[indexPath.row]
            cell.detailTextLabel?.text = contactDetail[indexPath.row]
            
            if indexPath.row == 0 {
                cell.imageView?.image = UIImage.init(named: "Message-25.png")
            }
            if indexPath.row == 1 {
                cell.imageView?.image = UIImage.init(named: "Twitter-35.png")
            }
            if indexPath.row == 2 {
                cell.imageView?.image = UIImage.init(named: "Twitter-35.png")
            }
        }
        
        if indexPath.section == 1{
            cell.textLabel?.font = cellFont
            cell.detailTextLabel?.text = specialThanksDetail[indexPath.row]
            cell.textLabel?.text = specialThanks[indexPath.row]
            
            if indexPath.row == 0 {
                cell.imageView?.image = UIImage.init(named: "Twitter-35.png")
            }
            if indexPath.row == 1 {
                cell.imageView?.image = UIImage.init(named: "Twitter-35.png")
            }
            if indexPath.row == 2 {
                cell.imageView?.image = UIImage.init(named: "Twitter-35.png")
            }
        }
        
        if indexPath.section == 2 {
            cell.textLabel?.font = cellFont
            cell.detailTextLabel?.text = ""
            cell.textLabel?.text = usefulDeveloperResources[indexPath.row]
        }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Contact"
        case 1:
            return "Special Thanks to"
        case 2:
            return "Useful Developer Resources"
        default:
            break
        }
        
        return "Unknwon"
    }
    
    
    func Email() {
        let subjectText = "Email (Theos Tutorials)"
        let messageBody = "Name/Username:\nDevice Type: \(modelString)\niOS: \(iosVersionString)\n\nBugs:\n\nSuggestions:"
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                Email()
            case 1:
                UIApplication.shared.openURL(URL(string: "twitter://user?screen_name=Aland_Kawa")!)
            case 2:
                UIApplication.shared.openURL(URL(string: "twitter://user?screen_name=bellis1000")!)
            default:
                break
            }
        }
        
        if indexPath.section == 1 {
            switch indexPath.row {
            case 0:
                UIApplication.shared.openURL(URL(string: "twitter://user?screen_name=bellis1000")!)
            case 1:
                UIApplication.shared.openURL(URL(string: "twitter://user?screen_name=Trcvor_Schmitt")!)
            case 2:
                UIApplication.shared.openURL(URL(string: "twitter://user?screen_name=ipswCentral")!)
            default:
                break
            }
        }
        
        if indexPath.section == 2 {
            switch indexPath.row {
            case 0:
                UIApplication.shared.openURL(URL(string:
                    "http://modmyi.com")!)
            case 1:
                UIApplication.shared.openURL(URL(string:
                    "http://thebigboss.org")!)
            case 2:
                UIApplication.shared.openURL(URL(string:
                    "http://stackoverflow.com")!)
            case 3:
                UIApplication.shared.openURL(URL(string:
                    "http://www.cydiasubstrate.com")!)
            case 4:
                UIApplication.shared.openURL(URL(string: "http://theiphonewiki.com")!)
            case 5:
                UIApplication.shared.openURL(URL(string: "https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIKit_Framework/index.html#//apple_ref/doc/uid/TP40006955")!)
            case 6:
                UIApplication.shared.openURL(URL(string: "https://ipswcentral.com")!)
            case 7:
                UIApplication.shared.openURL(URL(string: "https://iosgods.com")!)
            case 8:
                UIApplication.shared.openURL(URL(string: "http://www.ios-blog.co.uk")!)
            default:
                break
            }
        }
    }
}







