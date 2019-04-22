//
//  IntroTableViewController.swift
//  Theos Tutorials
//
//  Created by Aland Kawa on 7/24/16.
//  Copyright © 2016 Aland Kawa. All rights reserved.
//

import UIKit
import MessageUI

class IntroTableViewController: UITableViewController, MFMailComposeViewControllerDelegate {
    
    var detailViewController: IntroDetailViewController? = nil
    
    
    let videoTutorials = [
        "Billy Ellis (Older Ways)",
        "** Submit a Video **"
    ]
    
    let theBasics = [
        "Preface",
        "Start Here",
        "Getting Theos",
        "Setup Mobile Terminal",
    ]
    
    let prefaceDetail = "\nThis app is intended to help more jailbreakers enter the development scene and to help those who want to make apps to make them as easily as I possibly can help them. As I learn new components of the iOS SDK, I will update my app accordingly and add examples of the component in use, if possible. My contact info is ReverseEffect@live.com or xalandk@yahoo.com\nPlease do not spam me, I'm doing this at my own good will. Thank you for your cooperation!"
    
    let startHereDetail = "\nRecommended Devices:\niPhone 3GS to latest iPhone.\niOS Version: iOS 4 --> iOS 9.3.3\n\nFirst you have to install \"BigBoss Recommended Tools\" package in BigBoss's official and default repo in Cydia.\n\nThen you'll need iFile to navigate through your filesystem and to edit and add your code.\n\nAnother thing you'll need is an app called \"Mobile Terminal\".\n\n** FOR IOS 7+ DEVICES:\n\"NewTerm\" which is available in \"http://cydia.iphonecake.com\"'s repo\n\n** FOR OLDER DEVICES:\n“MobileTerminal” Package in BigBoss's repo in Cydia.\n\n\nNOTE: If you don't know what's Mobile Terminal or just Terminal, please navigate to FAQ's tab.\n\n\n\nAfter you have done the above steps then proceed to “Getting Theos” lesson! Hope you enjoy the app!\n\n"
    
    let gettingTheosDetail = "\nThis step is all about to transform your normal iPhone into a development platform iPhone by installing the OFFICIAL IPHONE SDK HEADERS to your iPhone! Yay! IDE on the iPhone…\n\nHope you read “Start Here” lesson. If not, then please do because it contains the tools necessary for this install. Make sure you also have at least 1GB of free space and connected to a stable wifi connection before install.\n\n***********\n\n** FOR NEWER THEOS AND IOS 8+ DEVICES:\nOpen Cydia and install “BigBoss Recommended Tools” from default Cydia’s BigBoss Repo as we told you in previous lesson (If you already installed, then don't do it).\nOpen Cydia and add this repo: https://coolstar.org/publicrepo/ then install 'Perl' package.\nAnd also 'iOS Toolchain' BY CoolStar too which is available in Cydia’s Default BigBoss Repository.\n\nThen open NewTerm and type: su\nThen type the password: alpine\n\nNow you should change the dictionary for installing Theos on default location /var/theos\nBy typing: cd /var\nNow you’r in /var\n\nNow in /var run this command for installing Theos in /var for newer iOS’s which is even iOS 9.3.3 supported too:\n\nenv GIT_SSL_NO_VERIFY=true git clone --recursive https://github.com/theos/theos.git\n\nYou'll see a bunch of things pop up on your screen. This is normal. Wait until the install is finished. My install took about 5 minutes depending on the speed of your wifi connection.\n\nNow lets download the sdk file.\nGo to /var/theos/sdks by typing: \ncd /var/theos/sdks\n\nNow your in /var/theos/sdks\nNow lets type the command for installing the sdk:\nFirst type: wget --no-check-certificate http://sdks.website/dl/iPhoneOS8.1.sdk.tbz2\nSeocnd type: tar xvf iPhoneOS8.1.sdk.tbz2\nThird type: rm -rf iPhoneOS8.1.sdk.tbz2\n\n***********\n\n** FOR OLDER THEOS AND OLDER DEVICES:\nNow open MobileTerminal app.\nFirst command you type: su\nThen type password: alpine, if you changed your password with passwd, then enter that one instead\n\nNow we install Theos Compiler by typing:\nFor Older iOS's: installtheos3\n\nYou'll see a bunch of things pop up on your screen. This is normal. Wait until the install is finished. My install took about 45 minutes depending on the speed of your wifi connection.\n\nAny prompts you may have where it asks you for a y/n answer, just answer with y. You'll know when your install is finished when the last line in your MobileTerminal says something like MyiPhone ~ var/mobile: or something like that. It varies from device to device.\n\nAt that point you have installed Theos and you may proceed to lesson 3. Congrats!\n\nNewer iOS By: @Trcvor_Schmitt\nOlder iOS By: Reverse Effects\n"
    
    let setupMobileTerminalDetail = "\nIf you are reading this lesson then you should have read “Start Here” and “Getting Theos” lessons. If not then you'll be lost throughout this lesson.\n\n\n\n*** FOR NEWER THEOS AND IOS 8+ IOS DEVICES:\n1- Open NewTerm and type: su then your password: alpine\n2- In NewTerm type: export THEOS=/var/theos\n3- Again in NewTerm type: /var/theos/bin/nic.pl\n4- It loads a bunch of templates like: Tweaks, applications, bundles, notification center widgets and more!\n\nNOTE: Before creating any package, you should type your root's username: su and default password: alpine\nAnd of course after this type: export THEOS=/var/theos then load the NIC by typing: /var/theos/bin/nic.pl\n\n\n\n\n*** FOR OLDER THEOS AND IOS DEVICES:\nLet's open up MobileTerminal. In MobileTerminal, there is a shortcut menu if you press the blue arrow that rests above the keyboard. You can customize this menu for your development by pressing the little icon that looks like an i.\n\nTouch that icon. You'll have this little menu of Shortcut Menu, Gestures, and About. Tap the Shortcut Menu item. In the top right corner, there is a button that has a + symbol. If you haven't guessed, this button adds commands to the shortcut menu.\n\nWhere it says menu label and you have to enter text, type Theos NIC\nAfter you get that typed in, enter $THEOS/bin/nic.pl into the text field below it. Touch the Done button.\n\nYou can now start a new Theos application project from the Shortcut Menu with NIC. NIC has templates for you to create new projects for iPhone Applications, tweaks, bundles, notification center widgets and more!\n\nLet's add more to the Shortcut Menu in MobileTerminal shall we? In the menu label field, type /make package install/, without the slashes of course. I just grouped together so it sort of made a little sense. Also make sure you put make package install into the field below it."
    
    var yourFirstApp = [
        "Learning NIC",
        "Hello World",
        "Build and Test"
    ]
    
    let learningNICDetail = "\nNIC stands for New Instance Creator. NIC creates new projects for you to code from templates. These templates also provide the build environment. \n\nFOR OLDER DEVICES:\nOpen MobileTerminal and access your Shortcut Menu. Touch on where you put Theos NIC and you should be presented with a menu after pressing enter.\n\n** FOR IOS 7+ DEVICES:\nOpen NewTerm and type su then you’r password, then type: export THEOS=/var/theos then type: /var/theos/bin/nic.pl it presents bunch of templates like: Tweaks, applications, bundles…etc\n\nIt should say choose a template at the bottom line. Enter the number that is next to iphone/application and hit enter on your keyboard. Author/Maintainer Name is your name or username that you prefer to use. Package Identifier is a reverse host name of your package. For example, com.yournamehere.yourappnamehere\n\ncom.yournamehere.yourappnamehere: This is your package's identifier that Cydia refers to when installing, uninstalling, or upgrading. This identifier is also used by themers to theme your icon, default image, and sometimes their own GUI into their themes for your app.\n\nWhen you are done with NIC, it should say instantiating yourappnamehere/.. to var/mobile or something similar. This line varies from devices. Make sure you read in MobileTerminal/NewTerm where it says yourappnamehere. That's where your project's workspace is held. Got all that? If yes, then proceed to “Hello World”!\n"
    
    let helloWorldDetail = "\nNow that you know what NIC is and how to use it, it's time for us to actually try and code something.\n\nOpen MobileTerminal/NewTerm and let's open NIC again (For newer devices type your root's name and password then again type: export THEOS=/var/theos then type: /var/theos/bin/nic.pl). Use a iphone/application template. Project name will be Hello. Use your name for the author/maintainer. The identifier will be com.yourname.hello\nMine, for example, would be com.reverseeffect.hello\n\nNow close MobileTerminal/NewTerm and let's use iFile. You should be in /var/mobile. Remember that I said you need to look for the instantiating line in MobileTerminal/NewTerm? And that it tells us where our workspace is? Don't worry if you didn't do it this time. If you did what I said, then just look for the folder with the label of hello and open it up.\n\nNow you should see the project's files there. You should find:\n\nFOR OLDER IOS:\n(RootViewController.h, RootViewController.mm, HelloApplication.mm, and main.m)\n\nFOR NEWER DEVICES:\n (XXRootViewController.m, XXRootViewController.h, main.m).\n\n\nIn this tutorial, and in most applications you will develop with Theos, you will not have to mess with HelloController.mm and main.m. Those just set up your application before it's view actually launches. There are very few moments when you need to tweak this.\n\nOpen RootViewController.h/XXRootViewController.h. You should have something like as follows:\n\n@interface RootViewController: UIViewController {\n}\n@end\n\nIntimidated? I know it's just a few lines but it's not really that hard. Let's explain this from A to Z. The .h extension of RootViewController.h/XXRootViewController.h means this is a Header file. Ok! Now let's open it and we find the code I mentioned earlier. /@interface RootViewController: UIViewController/UITableViewController is the declaration for the main view. The @interface allows you to declare methods, or actions, your program can do. If you declare them in the @interface, then the declaration is shared throughout your entire app! Declarations are defined in the @implementation in the RootViewController.mm/XXRootViewController.mm file and we will define some things later.\n\n** FOR OLDER IOS DEVICES:\nBack to the header for RootViewController, In the brackets, add a blank line. On that blank line, edit your code to look like this:\n\n@interface RootViewController: UIViewController {\nUILabel *helloLabel;\n}\n@end\n\nWe added a UILabel to our app. Save and close the new header file. Open RootViewController.mm. Now things will get ugly. We declared a UILabel in the @interface of the header. We need to define it now in the @implementation of the RootViewController.mm. Open RootViewController.mm and you'll find some funny looking code. If you see where it says redColor, that value will change the color of the background of your app. You can change it to greenColor, blueColor, blackColor, even clearColor, etc.\n\nIt appears we got off track a little bit but everything you learned is mandatory to an extent. Now let's make our little app actually say Hello Dev!, Hello World!, Shut Up!, or whatever you want your app to say.\n\nGo above the last bracket and make 2 new lines. Copy and paste this code into your application just above the bottom bracket:\n\nhelloLabel = [[UILabel alloc] initWithFrame:CGRectMake(21, 0, self.view.frame.size.width, 44)];\nhelloLabel.text = @\"My Label\";\nhelloLabel.backgroundColor = [UIColor clearColor];\nhelloLabel.textColor = [UIColor blackColor];\nhelloLabel.textAlignment = UITextAlignmentLeft;\n[self.view addSubview:helloLabel];\n\nNow let me explain this code piece by piece. helloLabel is what we declared in the header file. It is now being defined. UILabel alloc means the code is being allocated into the memory as a UILabel for your app to use. CGRectMake is the position AND frame size of your label. The 4 values in parentheses are as follows. (x position, y position, height of frame, width of frame). helloLabel.text is the physical text of the label and what will show up in the app. .backgroundColor and .textColor are pretty self explanatory. Last we need to add some memory mangement code so our app doesn't leak memory(which can cause an app crash if too severe):\n\n[helloLabel release];\n\n** FOR NEWER THEOS AND IOS DEVICES:\nSoon...\n\nYou have just completed a Hello World application! Proceed to “Build and Test” lesson to finish this app...\n"
    
    let buildAndTestDetail = "\nNow it's time to build our application with the Theos compiler. But, before we compile, I want to shift your focus over to the file named Makefile. The Makefile is a set of instructions for the compiler to build your application. See where it says APPLICATION_NAME? Add a blank line in between APPLICATION_NAME and Hello_FILES. On this blank line, put the following:\n\nHello_FRAMEWORKS = Foundation CoreGraphics UIKit\n\nJust like you see it. Same cases and separated only with spaces. These are mandatory and common frameworks your app will run with. Save and close Makefile. NOTE: SAVE YOUR CODE ON A REGULAR BASIS. Haha, randomness... Now open MobileTerminal/NewTerm with your device and type in the command: su\nthen type: alpine\n\nNOTE: If MobileTerminal/NewTerm says incorrect password, then you've changed your password or entered it incorrectly.\n\nNow type in: cd hello\n\nIn terminal and command prompt, cd means change directory (or go to a different folder) and the second word you type next to it is hello (our workspace's folder's name in this example.)\n\nTo get you up to speed, this is what we typed so far in MobileTerminal/NewTerm:\n\nsu\nalpine\ncd hello\n\nNow we've accessed our workspace via MobileTerminal/NewTerm and we want to build our project right? So remember that handy old Shortcut menu? Select on make package install (For newer devices type: make package install). This command builds your app, packages it into a DEB file(will get into detail with this in another lesson.), and it installs your app to your iPhone! When finished installing, we need to respring. This rule applies to Theos-made iphone/application templates only! You may notice that Cydia sometimes restarts springboard, or resprings? Well we need to respring, only once though. And that's after the first installation of any app we make in Theos. So the last thing we type in MobileTerminal/NewTerm is the command: killall SpringBoard\n\nCaps are important in MobileTerminal/NewTerm. Remember that if you make another iphone/application project, then you'll have to run it again! After that command, we are done with Hello World. Congrats. After your device is done respringing, you may proceed to the next chapter or test your newly oh-so-amazing-awesomeness first iPhone app!\n\nNOTES: You can run make package install any time to make changes to your app, and you don't need to run killall SpringBoard anymore when developing this particular app.\n"
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        splitViewController?.preferredDisplayMode = .allVisible
        splitViewController!.maximumPrimaryColumnWidth = 300
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? IntroDetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 4
        case 2:
            return 3
        default:
            break
        }
        
        return section
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        switch indexPath.section {
        case 0:
            cell.textLabel?.font = cellFont
            cell.textLabel?.text = videoTutorials[indexPath.row]
            
            if indexPath.row == 0{
                cell.imageView?.image = UIImage.init(named: "YouTube Play-25.png")
            }
            if indexPath.row == 1 {
                cell.imageView?.image = UIImage.init(named: "Video Editing-25")
            }
        case 1:
            cell.textLabel?.font = cellFont
            cell.textLabel?.text = theBasics[indexPath.row]
            cell.imageView?.image = UIImage.init(named: "")
        case 2:
            cell.textLabel?.font = cellFont
            cell.textLabel?.text = yourFirstApp[indexPath.row]
            cell.imageView?.image = UIImage.init(named: "")
        default:
            break
        }
        return cell
    }
 
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Video Tutorials by"
        case 1:
            return "The Basics"
        case 2:
            return "Your First App"
        default:
            break
        }
        
        return ""
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let billyEllisVideoTutorial: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vcBillyEllisVideoTutorial = billyEllisVideoTutorial.instantiateViewController(withIdentifier: "billyEllisVideoTutorial") as! billyEllisVideoTutorialViewController
        
        if indexPath.section == 0 {
            self.navigationController?.popToRootViewController(animated: true)
            switch indexPath.row {
            case 0:
                self.navigationController?.present(vcBillyEllisVideoTutorial, animated: true, completion: nil)
            case 1:
                submitVideo()
            default:
                break
            }
        }
    }
 
    func submitVideo() {
        let subjectText = "Submit Video Tutorial (Theos Tutorials)"
        let messageBody = "The video tutorial that you'r trying to send, must be uploaded in YouTube.\n\nVideo Link: "
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
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            if (segue.identifier == "showIntroDetail") {
                var detail: IntroDetailViewController
                let indexPath: IndexPath = tableView.indexPathForSelectedRow!
                
                if let navigationController = segue.destination as? UINavigationController {
                    
                    detail = navigationController.topViewController as! IntroDetailViewController
                    
                    if indexPath.section == 1 {
                        switch indexPath.row {
                        case 0:
                            detail.textDetailString = prefaceDetail as NSString
                            detail.titleText = "Preface"
                        case 1:
                            detail.textDetailString = startHereDetail as NSString
                            detail.titleText = "Start Here"
                        case 2:
                            detail.textDetailString = gettingTheosDetail as NSString
                            detail.titleText = "Getting Theos"
                        case 3:
                            detail.textDetailString = setupMobileTerminalDetail as NSString
                            detail.titleText = "Setup Mobile Terminal"
                        default:
                            break
                        }
                    }
                    
                    if indexPath.section == 2 {
                        detail.titleText = yourFirstApp[indexPath.row] as NSString
                        switch indexPath.row {
                        case 0:
                            detail.textDetailString = learningNICDetail as NSString
                        case 1:
                            detail.textDetailString = helloWorldDetail as NSString
                        case 2:
                            detail.textDetailString = buildAndTestDetail as NSString
                        default:
                            break
                        }
                    }
                    
                } else {
                    detail = segue.destination as! IntroDetailViewController
                    
                    if indexPath.section == 1 {
                        switch indexPath.row {
                        case 0:
                            detail.textDetailString = prefaceDetail as NSString
                            detail.titleText = "Preface"
                        case 1:
                            detail.textDetailString = startHereDetail as NSString
                            detail.titleText = "Start Here"
                        case 2:
                            detail.textDetailString = gettingTheosDetail as NSString
                            detail.titleText = "Getting Theos"
                        case 3:
                            detail.textDetailString = setupMobileTerminalDetail as NSString
                            detail.titleText = "Setup Mobile Terminal"
                        default:
                            break
                        }
                    }
                    
                    if indexPath.section == 2 {
                        detail.titleText = yourFirstApp[indexPath.row] as NSString
                        switch indexPath.row {
                        case 0:
                            detail.textDetailString = learningNICDetail as NSString
                        case 1:
                            detail.textDetailString = helloWorldDetail as NSString
                        case 2:
                            detail.textDetailString = buildAndTestDetail as NSString
                        default:
                            break
                        }
                    }
                }
        }
    }
}
