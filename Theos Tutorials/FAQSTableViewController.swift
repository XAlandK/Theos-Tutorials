//
//  FAQTableViewController.swift
//  Theos Tutorials
//
//  Created by Aland Kawa on 7/31/16.
//  Copyright © 2016 Aland Kawa. All rights reserved.
//

import UIKit

class FAQSTableViewController: UITableViewController {
    
    func splitViewController(_ svc: UISplitViewController, shouldHideViewController vc: LibraryTableViewController, inOrientation orientation: UIInterfaceOrientation) -> Bool {
        return false
    }
    
    var detailViewController: FAQSDetailViewController? = nil
    
    let hotFAQS = [
        "What's Theos",
        "What's NIC",
        "What's IDE",
        "What's SpringBoard",
        "Where can I download sdk files",
        "What's Preference Bundle"
    ]
    
    let theosErrors = [
        "/usr/bin/perl: bad interpreter: No such file or dictionary.",
        "theos/makefiles/common.mk:103: *** You did not specify a target, and the \"\" platform does not define a default target. Stop.",
        "Makefile:1: /makefiles/common.mk: No such file or dictionary"
    ]
    
    let cydiaFAQS = [
        "What's Cydia",
        "What's Cydia Repo",
        "What's Cydia Package",
        "What's Cydia Tweak",
        "What's Cydia Theme",
        "What's Cydia Apps"
    ]
    
    let terminalFAQS = [
        "What's Terminal",
        "What's cd used for",
        "What's cp used for",
        "More cooming soon..."
    ]
    
    let iOSDevelopersLibraryFAQS = [
        "What's UILabel",
        "What's UIButton",
        "What's UIImage",
        "What's UITextView",
        "What's UIAlertView",
        "What's UIAlertController",
        "What's UIActionSheet",
        "What's UIAlertAction",
        "What's UINavigationBar",
        "What's UINavigationController",
        "What's UITableViewController",
        "What's UITableView",
        "What's UITableViewCell",
        "What's UIView",
        "What's UIViewController",
        "What's UIToolBar",
        "What's UITabBarController",
        "What's UISegmentedController",
        "What's UIWebView"
    ]
    
    
    // MOST FAQS
    let whatsTheos = "\nTheos is a cross-platform suite of development tools for managing, developing, and deploying iOS software without the use of Xcode. It is an important tool for people building apps and extensions (tweaks) for jailbroken iOS; most extension developers use Theos.\n\nBy: http://iphonedevwiki.net\n"
    
    let whatsNIC = "\nNIC will prompt you for all the necessary information before creating a project with Theos.\n\nBy: http://iphonedevwiki.net\n"
    
    let whatsIDE = "\nAn integrated development environment (IDE) is a software application that provides comprehensive facilities to computer programmers for software development. An IDE normally consists of a source code editor, build automation tools and a debugger. Most modern IDEs have intelligent code completion. Some IDEs, such as NetBeans and Eclipse, contain a compiler, interpreter, or both; others, such as SharpDevelop and Lazarus, do not. The boundary between an integrated development environment and other parts of the broader software development environment is not well-defined. Sometimes a version control system, or various tools to simplify the construction of a Graphical User Interface (GUI), are integrated. Many modern IDEs also have a class browser, an object browser, and a class hierarchy diagram, for use in object-oriented software development.\n\nBy: https://en.wikipedia.org/\n"
    
    let whatsSpringBoard = "\nSpringBoard is the standard application that manages the iOS home screen. Other tasks include starting WindowServer, launching and bootstrapping applications and setting some of the device's settings on startup.\n\nBy: https://en.wikipedia.org/\n"
    
    
    let whereCanIDownloadSDKFile = "Where can I download sdk file?\nAnd locate it where after the file downloaded?\n\nAnswer: Copy this link and paste it in safari mobile web browser: http://www.mediafire.com/download/9yl451qykpne4jn/iPhoneOS.sdk.zip\nAnd open it with iFile or Filza File Manager then locate the SDK file to /var/theos/sdks, if you can't find the sdks folder, please create a folder in /var/theos called 'sdks' (Without Apostrophe)."
    
    let whatsPreferenceBundle = ""
    
    
    
    
    
    // THEOS ERRORS
    let perlBadInterpreter = "\nError:\n/usr/bin/perl: bad interpreter: No such file or dictionary.\n\nHow can I fix this error?\nAnswer: The 'Perl' update from CoolStar seems to be giving an issue with a few users. Here is how to fix it: Copy 'Perl' file from /usr/local/bin to /usr/bin\n\nI can't copy the file from iFile or Filza File Manager! What should I do?\nAnswer: Open terminal or you can also do this with SSH, and type in Terminal: cp /usr/local/bin/perl /usr/bin\n\nNOTE: This copies the Perl file to /usr/bin.\n"
    
    let youDidNotSpecifyATarget = "\nError:\ntheos/makefiles/common.mk:103: *** You did not specify a target, and the \"\" platform does not define a default target. Stop.\n\nHow can I fix this error?\nAnswer: Before creating or building any package you must type 'export THEOS=/var/theos' without apostrophes!\n"
    
    let makeFileOneNoSuchFileOrDictionaryMakeFileSevenNoSuchFileOrDictionary = "\nError:\nMakefile:1: /makefiles/common.mk: No such file or dictionary\nMakefile:7: /application.mk: No such file or dictionary\nmake: *** No rule to make target '/application.mk'. Stop.\n\nHow can I fix this error?\nAnswer: Before creating or building any package you must type 'export THEOS=/var/theos' without apostrophes!\n"
    
    
    
    
    
    
    // CYDIA FAQS
    let whatsCydia = "\nThink of Cydia like the App Store. In the App Store, you find all the apps that Apple approves to be listed on the App Store. Cydia is pretty much the App Store for all apps, tweaks, settings and features that Apple doesn’t / wouldn’t allow on the App Store.\nMost of these aren’t harmful. It’s just that Apple (following its founder, Jobs) is a control-freak. Most of the time, it’s good but not when you want to change a few things like lockscreen, dock/springboard icons, status bar designs etc.\nOr better! Cydia is like Google! You can find almost all the wonderful tweaks and apps that you won’t find on the App Store, here. Yeah that should be it. Cydia is like Google for jailbreakers.\nCydia is a common term for the “Codling Moth” (worm in the apple). So you know why it’s Cydia, now!\n\nWho created Cydia?\nOf course, Jay Freeman. Or as he is better known in the JB world, Saurik.\n\n\nWhat can I so with Cydia?\nNow, when you ask that, all I can say is, Cydia is like the door to Narnia. It just opens up an amazing world of tweaks, apps, settings, features, icons and more that you just can’t get enough of.\n\nBy: http://www.igeeksblog.com\n"
    
    let whatsCydiaRepo = "\nCydia works like this: it accesses few repositories where packages are hosted. So, if you find a tweak that isn’t on Cydia Search, you most likely need to add the correct repo where the package/tweak is hosted. That’s one important reason why people visit this section of Cydia (Sources).\n\nBy: http://www.igeeksblog.com\n"
    
    let whatsCydiaPackage = "\n \n\nBy: http://www.igeeksblog.com\n"
    
    let whatsCydiaTweak = "\nHow about changing the carrier logo to something unique? Or changing the font? Or using custom icons? Or maybe you want to change the way the lockscreen looks and behaves?\n\nBy: http://www.igeeksblog.com\n"
    
    let whatsCydiaTheme = "\nOne of the simplest things that everyone wants to do is to be able to change the theme of their iPhones/iPads. Apple lets you change the wallpaper. That’s it. Searching in Cydia can lead you to stuff like Winterboard/Anemone themes: absolutely stunning collection of themes that can eat away all your time if you’re not careful!\n\nBy: http://www.igeeksblog.com\n"
    
    let whatsCydiaApp = "\nThere are tons of Cydia apps that drastically change the way your iPhone/iPad works. For instance, biteSMS changes the way you text, reply, forward or manage them. In fact, if you use biteSMS, you’ll begin to see the limitations of the stock Messages app. May be you’ll even end up shelling out the $7.99 needed to remove ads in biteSMS (like thousands of users who have fallen in love with the app).\n\nBy: http://www.igeeksblog.com\n"
    
    
    
    // Terminal FAQS
    let whatsTerminal = "\nA computer terminal is an electronic or electromechanical hardware device that is used for entering data into, and displaying data from, a computer or a computing system. Early terminals were inexpensive devices but very slow compared to punched cards or paper tape for input, but as the technology improved and video displays were introduced, terminals pushed these older forms of interaction from the industry. A related development was timesharing systems, which evolved in parallel and made up for any inefficiencies of the user's typing ability with the ability to support multiple users on the same machine, each at their own terminal.\n\nThe function of a terminal is confined to display and input of data; a device with significant local programmable data processing capability may be called a \"smart terminal\" or fat client. A terminal that depends on the host computer for its processing power is called a \"dumb terminal\" or thin client. A personal computer can run terminal emulator software that replicates the function of a terminal, sometimes allowing concurrent use of local programs and access to a distant terminal host system.\n\nBy: https://en.wikipedia.org/\n"
    
    let whatsCDTerminal = "\nIn terminal and command prompt, cd means change directory (or go to a different folder) and the second word you type next to it is hello (our workspace's folder's name in this example.)\n\nBy: Reverese Effect\n"
    
    let whatsCPTerminal = "\ncp in Terminal used to copy any file you want, for example create a text file named 'Test.txt' (Without Apostrophe) in /var/mobile and you want to copy it to /var/mobile/Documents using Terminal, you have to type:\ncp /var/mobile/Test.txt /var/mobile/Documnetsn\nThen return and go to you'r file manager (iFile, Filza File Manager) and check if the file copied\n\nBy: Aland Kawa\n"
    
    
    let moreCommingSoon = ""
    
    
    // LIBRARY FAQS
    let whatsUILabel = "\nThe UILabel class implements a read-only text view. You can use this class to draw one or multiple lines of static text, such as those you might use to identify other parts of your user interface. The base UILabel class provides support for both simple and complex styling of the label text. You can also control over aspects of appearance, such as whether the label uses a shadow or draws with a highlight. If needed, you can customize the appearance of your text further by subclassing.\n\nBy: Apple Inc.\n"
    
    let whatsUIButton = "\nA UIButton object is a view that executes your custom code in response to user interactions. When you tap a button, or select a button that has focus, the button performs any actions attached to it. You communicate the purpose of a button using a text label, an image, or both. The appearance of buttons is configurable, so you can tint buttons or format titles to match the design of your app. You can add buttons to your interface programmatically or using Interface Builder.\n\nBy: Apple Inc.\n"
    
    let whatsUIImage = "\nA UIImage object manages image data in your app. You use image objects to represent image data of all kinds, and the UIImage class is capable of managing data for all image formats supported by the underlying platform. Image objects are immutable, so you always create them from existing image data, such as an image file on disk or programmatically created image data. An image object may contain a single image or a sequence of images you intend to use in an animation.\n\nBy: Apple Inc.\n"
    
    let whatsUITextView = "\nThe UITextView class implements the behavior for a scrollable, multiline text region. The class supports the display of text using custom style information and also supports text editing. You typically use a text view to display multiple lines of text, such as when displaying the body of a large text document.\n\nBy: Apple Inc.\n"
    
    let whatsUIAlertView = "\nUIAlertView is deprecated in iOS 8. (Note that UIAlertViewDelegate is also deprecated.) To create and manage alerts in iOS 8 and later, instead use UIAlertController with a preferredStyle of UIAlertControllerStyleAlert.\n\nBy: Apple Inc.\n"
    
    let whatsUIAlertController = "\nA UIAlertController object displays an alert message to the user. This class replaces the UIActionSheet and UIAlertView classes for displaying alerts. After configuring the alert controller with the actions and style you want, present it using the presentViewController:animated:completion: method.\n\nBy: Apple Inc.\n"
    
    let whatsUIActionSheet = "\nUIActionSheet is deprecated in iOS 8. (Note that UIActionSheetDelegate is also deprecated.) To create and manage action sheets in iOS 8 and later, instead use UIAlertController with a preferredStyle of UIAlertControllerStyleActionSheet.\n\nBy: Apple Inc.\n"
    
    let whatsUIAlertAction = "\nA UIAlertAction object represents an action that can be taken when tapping a button in an alert. You use this class to configure information about a single action, including the title to display in the button, any styling information, and a handler to execute when the user taps the button. After creating an alert action object, add it to a UIAlertController object before displaying the corresponding alert to the user.\n\nBy: Apple Inc.\n"
    
    let whatsUINavigationBar = "\nThe UINavigationBar class provides a control for navigating hierarchical content. It’s a bar, typically displayed at the top of the screen, containing buttons for navigating within a hierarchy of screens. The primary properties are a left (back) button, a center title, and an optional right button. You can use a navigation bar as a standalone object or in conjunction with a navigation controller object.\n\nBy: Apple Inc.\n"
    
    let whatsUINavigationController = "\nThe UINavigationController class implements a specialized view controller that manages the navigation of hierarchical content. This navigation interface makes it possible to present your data efficiently and makes it easier for the user to navigate that content. You generally use this class as-is but you may also subclass to customize the class behavior.\n\nBy: Apple Inc.\n"
    
    let whatsUITableViewController = "\nThe UITableViewController class creates a controller object that manages a table view. It implements the following behavior:\n\nIf a nib file is specified via the initWithNibName:bundle: method (which is declared by the superclass UIViewController), UITableViewController loads the table view archived in the nib file. Otherwise, it creates an unconfigured UITableView object with the correct dimensions and autoresize mask. You can access this view through the tableView property.\n\nIf a nib file containing the table view is loaded, the data source and delegate become those objects defined in the nib file (if any). If no nib file is specified or if the nib file defines no data source or delegate, UITableViewController sets the data source and the delegate of the table view to self.\n\nWhen the table view is about to appear the first time it’s loaded, the table-view controller reloads the table view’s data. It also clears its selection (with or without animation, depending on the request) every time the table view is displayed. The UITableViewController class implements this in the superclass method viewWillAppear:. You can disable this behavior by changing the value in the clearsSelectionOnViewWillAppear property.\n\nWhen the table view has appeared, the controller flashes the table view’s scroll indicators. The UITableViewController class implements this in the superclass method viewDidAppear:.\n\nIt implements the superclass method setEditing:animated: so that if a user taps an Edit|Done button in the navigation bar, the controller toggles the edit mode of the table.\n\nYou create a custom subclass of UITableViewController for each table view that you want to manage. When you initialize the controller in initWithStyle:, you must specify the style of the table view (plain or grouped) that the controller is to manage. Because the initially created table view is without table dimensions (that is, number of sections and number of rows per section) or content, the table view’s data source and delegate—that is, the UITableViewController object itself—must provide the table dimensions, the cell content, and any desired configurations (as usual). You may override loadView or any other superclass method, but if you do be sure to invoke the superclass implementation of the method, usually as the first method call.\n\nBy: Apple Inc. \n"
    
    let whatsUITableView = "\nAn instance of UITableView (or simply, a table view) is a means for displaying and editing hierarchical lists of information.\n\nA table view displays a list of items in a single column. UITableView is a subclass of UIScrollView, which allows users to scroll through the table, although UITableView allows vertical scrolling only. The cells comprising the individual items of the table are UITableViewCell objects; UITableView uses these objects to draw the visible rows of the table. Cells have content—titles and images—and can have, near the right edge, accessory views. Standard accessory views are disclosure indicators or detail disclosure buttons; the former leads to the next level in a data hierarchy and the latter leads to a detailed view of a selected item. Accessory views can also be framework controls, such as switches and sliders, or can be custom views. Table views can enter an editing mode where users can insert, delete, and reorder rows of the table.\n\nA table view is made up of zero or more sections, each with its own rows. Sections are identified by their index number within the table view, and rows are identified by their index number within a section. Any section can optionally be preceded by a section header, and optionally be followed by a section footer.\n\nTable views can have one of two styles, UITableViewStylePlain and UITableViewStyleGrouped. When you create a UITableView instance you must specify a table style, and this style cannot be changed. In the plain style, section headers and footers float above the content if the part of a complete section is visible. A table view can have an index that appears as a bar on the right hand side of the table (for example, \"A\" through \"Z\"). You can touch a particular label to jump to the target section. The grouped style of table view provides a default background color and a default background view for all cells. The background view provides a visual grouping for all cells in a particular section. For example, one group could be a person's name and title, another group for phone numbers that the person uses, and another group for email accounts and so on. See the Settings application for examples of grouped tables. Table views in the grouped style cannot have an index.\n\nBy: Apple Inc.\n"
    
    let whatsUITableViewCell = "\nThe UITableViewCell class defines the attributes and behavior of the cells that appear in UITableView objects. This class includes properties and methods for setting and managing cell content and background (including text, images, and custom views), managing the cell selection and highlight state, managing accessory views, and initiating the editing of the cell contents.\n\nWhen creating cells, you can customize them yourself or use one of several predefined styles. The predefined cell styles are the simplest option. With the predefined styles, the cell provides label and image subviews whose positions and styling are fixed. All you have to do is provide the text and image content to go into those fixed views. To use a cell with a predefined style, initialize it using the initWithStyle:reuseIdentifier: method or configure the cell with that style in Xcode. To set the text and images of the cell, use the textLabel, detailTextLabel, and imageView properties.\n\nIf you want to go beyond the predefined styles, you can add subviews to the contentView property of the cell. When adding subviews, you are responsible for positioning those views and setting their content yourself.\n\nWhether you use a predefined or custom cell, you can change the cell’s background using the backgroundView property or by changing the inherited backgroundColor property. In iOS 7, cells have a white background by default; in earlier versions of iOS, cells inherit the background color of the enclosing table view. If you want to change the background color of a cell, do so in the tableView:willDisplayCell:forRowAtIndexPath: method of your table view delegate.\n\nBy: Apple Inc.\n"
    
    let whatsUIView = "\nThe UIView class defines a rectangular area on the screen and the interfaces for managing the content in that area. At runtime, a view object handles the rendering of any content in its area and also handles any interactions with that content. The UIView class itself provides basic behavior for filling its rectangular area with a background color. More sophisticated content can be presented by subclassing UIView and implementing the necessary drawing and event-handling code yourself. The UIKit framework also includes a set of standard subclasses that range from simple buttons to complex tables and can be used as-is. For example, a UILabel object draws a text string and a UIImageView object draws an image.\n\nBy: Apple Inc.\n"
    
    let whatsUIViewController = "\nThe UIViewController class provides the infrastructure for managing the views of your iOS apps. A view controller manages a set of views that make up a portion of your app’s user interface. It is responsible for loading and disposing of those views, for managing interactions with those views, and for coordinating responses with any appropriate data objects. View controllers also coordinate their efforts with other controller objects—including other view controllers—and help manage your app’s overall interface.\n\nYou rarely create instances of the UIViewController class directly. Instead, you create instances of UIViewController subclasses and use those objects to provide the specific behaviors and visual appearances that you need.\n\nBy: Apple Inc.\n"
    
    let whatsUIToolBar = "\nA toolbar is a control that displays one or more buttons, called toolbar items. A toolbar momentarily highlights or does not change the appearance of an item when tapped.\n\nTo create toolbar items, use the UIBarButtonItem class. To add toolbar items to a toolbar, use the setItems:animated: method.\n\nToolbar images that represent normal and highlighted states of an item derive from the image you set using the inherited image property from the UIBarItem class. In iOS 7.0, the image is colored with the toolbar’s tintColor.\n\nIf you need radio button style controls, use the UITabBar class instead of UIToolbar.\n\nBy: Apple Inc.\n"
    
    let whatsUITabBarController = "\nThe UITabBarController class implements a specialized view controller that manages a radio-style selection interface. This tab bar interface displays tabs at the bottom of the window for selecting between the different modes and for displaying the views for that mode. This class is generally used as-is but may be subclassed in iOS 6 and later.\n\nEach tab of a tab bar controller interface is associated with a custom view controller. When the user selects a specific tab, the tab bar controller displays the root view of the corresponding view controller, replacing any previous views. (User taps always display the root view of the tab, regardless of which tab was previously selected. This is true even if the tab was already selected.) Because selecting a tab replaces the contents of the interface, the type of interface managed in each tab need not be similar in any way. In fact, tab bar interfaces are commonly used either to present different types of information or to present the same information using a completely different style of interface. Figure 1 shows the tab bar interface presented by the Clock application, each tab of which presents a type of time based information.\n\nBy: Apple Inc.\n"
    
    let whatsSegmentedController = "\nSoon..."
    
    let whatsUIWebView = "\nYou can use the UIWebView class to embed web content in your app. To do so, create a UIWebView object, attach it to a window, and send it a request to load web content. You can also use this class to move back and forward in the history of webpages, and you can even set some web content properties programmatically.\n\nUse the loadHTMLString:baseURL: method to begin loading local HTML files or the loadRequest: method to begin loading web content. Use the stopLoading method to stop loading, and the loading property to find out if a web view is in the process of loading.\n\nIf you allow the user to move back and forward through the webpage history, then you can use the goBack and goForward methods as actions for buttons. Use the canGoBack and canGoForward properties to disable the buttons when the user can’t move in a direction.\n\nBy default, a web view automatically converts telephone numbers that appear in web content to Phone links. When a Phone link is tapped, the Phone app launches and dials the number. To turn off this default behavior, set the dataDetectorTypes property with a UIDataDetectorTypes bitfield that does not contain the UIDataDetectorTypePhoneNumber flag.\n\nYou can also use the scalesPageToFit property to programmatically set the scale of web content the first time it is displayed in a web view. Thereafter, the user can change the scale using gestures.\n\nSet the delegate property to an object conforming to the UIWebViewDelegate protocol if you want to track the loading of web content.\n\nBy: Apple Inc.\n"
    
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Hot FAQ'S"
        case 1:
            return "Theos Errors"
        case 2:
            return "Cydia FAQ'S"
        case 3:
            return "Terminal FAQ'S"
        case 4:
            return "iOS Developer's Library FAQ'S"
        default:
            break
        }
        
        return "Unknwon"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        splitViewController?.preferredDisplayMode = .allVisible
        splitViewController!.maximumPrimaryColumnWidth = 300
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? FAQSDetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 6
        case 1:
            return 3
        case 2:
            return 6
        case 3:
            return 4
        case 4:
            return 19
        default:
            break
        }
        
        return section
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.font = cellFont
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = hotFAQS[indexPath.row]
        case 1:
            cell.textLabel?.text = theosErrors[indexPath.row]
        case 2:
            cell.textLabel?.text = cydiaFAQS[indexPath.row]
        case 3:
            cell.textLabel?.text = terminalFAQS[indexPath.row]
            if indexPath.row == 3 {
                cell.selectionStyle = .none
            }
        case 4:
            cell.textLabel?.text = iOSDevelopersLibraryFAQS[indexPath.row]
        default:
            break
        }
        
        return cell
    }
 

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showFAQDetail") {
            var detail: FAQSDetailViewController
            let indexPath: IndexPath = tableView.indexPathForSelectedRow!
            
            if let navigationController = segue.destination as? UINavigationController {
                
                detail = navigationController.topViewController as! FAQSDetailViewController
                
                if indexPath.section == 0 {
                    detail.titleText = hotFAQS[indexPath.row] as NSString
                    switch indexPath.row {
                    case 0:
                        detail.textDetailString = whatsTheos as NSString
                    case 1:
                        detail.textDetailString = whatsNIC as NSString
                    case 2:
                        detail.textDetailString = whatsIDE as NSString
                    case 3:
                        detail.textDetailString = whatsSpringBoard as NSString
                    case 4:
                        detail.textDetailString = whereCanIDownloadSDKFile as NSString
                    case 5:
                        detail.textDetailString = whatsPreferenceBundle as NSString
                    default:
                        break
                    }
                }
                
                if indexPath.section == 1 {
                    detail.titleText = theosErrors[indexPath.row] as NSString
                    switch indexPath.row {
                    case 0:
                        detail.textDetailString = perlBadInterpreter as NSString
                    case 1:
                        detail.textDetailString = youDidNotSpecifyATarget as NSString
                    case 2:
                        detail.textDetailString = makeFileOneNoSuchFileOrDictionaryMakeFileSevenNoSuchFileOrDictionary as NSString
                    default:
                        break
                    }
                }
                
                if indexPath.section == 2 {
                    detail.titleText = cydiaFAQS[indexPath.row] as NSString
                    switch indexPath.row {
                    case 0:
                        detail.textDetailString = whatsCydia as NSString
                    case 1:
                        detail.textDetailString = whatsCydiaRepo as NSString
                    case 2:
                        detail.textDetailString = whatsCydiaPackage as NSString
                    case 3:
                        detail.textDetailString = whatsCydiaTweak as NSString
                    case 4:
                        detail.textDetailString = whatsCydiaTheme as NSString
                    case 5:
                        detail.textDetailString = whatsCydiaApp as NSString
                    default:
                        break
                    }
                }
                
                if indexPath.section == 3 {
                    detail.titleText = terminalFAQS[indexPath.row] as NSString
                    switch indexPath.row {
                    case 0:
                        detail.textDetailString = whatsTerminal as NSString
                    case 1:
                        detail.textDetailString = whatsCDTerminal as NSString
                    case 2:
                        detail.textDetailString = whatsCPTerminal as NSString
                    case 3:
                        detail.textDetailString = ""
                        detail.titleText = ""
                    default:
                        break
                    }
                }
                
                if indexPath.section == 4 {
                    detail.titleText = iOSDevelopersLibraryFAQS[indexPath.row] as NSString
                    switch indexPath.row {
                    case 0:
                        detail.textDetailString = whatsUILabel as NSString
                    case 1:
                        detail.textDetailString = whatsUIButton as NSString
                    case 2:
                        detail.textDetailString = whatsUIImage as NSString
                    case 3:
                        detail.textDetailString = whatsUITextView as NSString
                    case 4:
                        detail.textDetailString = whatsUIAlertView as NSString
                    case 5:
                        detail.textDetailString = whatsUIAlertController as NSString
                    case 6:
                        detail.textDetailString = whatsUIActionSheet as NSString
                    case 7:
                        detail.textDetailString = whatsUIAlertAction as NSString
                    case 8:
                        detail.textDetailString = whatsUINavigationBar as NSString
                    case 9:
                        detail.textDetailString = whatsUINavigationController as NSString
                    case 10:
                        detail.textDetailString = whatsUITableViewController as NSString
                    case 11:
                        detail.textDetailString = whatsUITableView as NSString
                    case 12:
                        detail.textDetailString = whatsUITableViewCell as NSString
                    case 13:
                        detail.textDetailString = whatsUIView as NSString
                    case 14:
                        detail.textDetailString = whatsUIViewController as NSString
                    case 15:
                        detail.textDetailString = whatsUIToolBar as NSString
                    case 16:
                        detail.textDetailString = whatsUITabBarController as NSString
                    case 17:
                        detail.textDetailString = whatsSegmentedController as NSString
                    case 18:
                        detail.textDetailString = whatsUIWebView as NSString
                    default:
                        break
                    }
                }
                
            } else {
                detail = segue.destination as! FAQSDetailViewController
                
                if indexPath.section == 0 {
                    detail.titleText = hotFAQS[indexPath.row] as NSString
                    switch indexPath.row {
                    case 0:
                        detail.textDetailString = whatsTheos as NSString
                    case 1:
                        detail.textDetailString = whatsNIC as NSString
                    case 2:
                        detail.textDetailString = whatsIDE as NSString
                    case 3:
                        detail.textDetailString = whatsSpringBoard as NSString
                    case 4:
                        detail.textDetailString = whereCanIDownloadSDKFile as NSString
                    case 5:
                        detail.textDetailString = whatsPreferenceBundle as NSString
                    default:
                        break
                    }
                }
                
                if indexPath.section == 1 {
                    detail.titleText = theosErrors[indexPath.row] as NSString
                    switch indexPath.row {
                    case 0:
                        detail.textDetailString = perlBadInterpreter as NSString
                    case 1:
                        detail.textDetailString = youDidNotSpecifyATarget as NSString
                    case 2:
                        detail.textDetailString = makeFileOneNoSuchFileOrDictionaryMakeFileSevenNoSuchFileOrDictionary as NSString
                    default:
                        break
                    }
                }
                
                if indexPath.section == 2 {
                    detail.titleText = cydiaFAQS[indexPath.row] as NSString
                    switch indexPath.row {
                    case 0:
                        detail.textDetailString = whatsCydia as NSString
                    case 1:
                        detail.textDetailString = whatsCydiaRepo as NSString
                    case 2:
                        detail.textDetailString = whatsCydiaPackage as NSString
                    case 3:
                        detail.textDetailString = whatsCydiaTweak as NSString
                    case 4:
                        detail.textDetailString = whatsCydiaTheme as NSString
                    case 5:
                        detail.textDetailString = whatsCydiaApp as NSString
                    default:
                        break
                    }
                }
                
                if indexPath.section == 3 {
                    detail.titleText = terminalFAQS[indexPath.row] as NSString
                    switch indexPath.row {
                    case 0:
                        detail.textDetailString = whatsTerminal as NSString
                    case 1:
                        detail.textDetailString = whatsCDTerminal as NSString
                    case 2:
                        detail.textDetailString = whatsCPTerminal as NSString
                    case 3:
                        detail.textDetailString = ""
                        detail.titleText = ""
                    default:
                        break
                    }
                }
                
                if indexPath.section == 4 {
                    detail.titleText = iOSDevelopersLibraryFAQS[indexPath.row] as NSString
                    switch indexPath.row {
                    case 0:
                        detail.textDetailString = whatsUILabel as NSString
                    case 1:
                        detail.textDetailString = whatsUIButton as NSString
                    case 2:
                        detail.textDetailString = whatsUIImage as NSString
                    case 3:
                        detail.textDetailString = whatsUITextView as NSString
                    case 4:
                        detail.textDetailString = whatsUIAlertView as NSString
                    case 5:
                        detail.textDetailString = whatsUIAlertController as NSString
                    case 6:
                        detail.textDetailString = whatsUIActionSheet as NSString
                    case 7:
                        detail.textDetailString = whatsUIAlertAction as NSString
                    case 8:
                        detail.textDetailString = whatsUINavigationBar as NSString
                    case 9:
                        detail.textDetailString = whatsUINavigationController as NSString
                    case 10:
                        detail.textDetailString = whatsUITableViewController as NSString
                    case 11:
                        detail.textDetailString = whatsUITableView as NSString
                    case 12:
                        detail.textDetailString = whatsUITableViewCell as NSString
                    case 13:
                        detail.textDetailString = whatsUIView as NSString
                    case 14:
                        detail.textDetailString = whatsUIViewController as NSString
                    case 15:
                        detail.textDetailString = whatsUIToolBar as NSString
                    case 16:
                        detail.textDetailString = whatsUITabBarController as NSString
                    case 17:
                        detail.textDetailString = whatsSegmentedController as NSString
                    case 18:
                        detail.textDetailString = whatsUIWebView as NSString
                    default:
                        break
                    }
                }
            }
        }
    }
}


