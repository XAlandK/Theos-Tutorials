//
//  LibraryTableViewController.swift
//  Theos Tutorials
//
//  Created by Aland Kawa on 7/25/16.
//  Copyright © 2016 Aland Kawa. All rights reserved.
//

import UIKit
import MessageUI

let cellFont = UIFont(name: "ArialRoundedMT-Light", size: 16)

class LibraryTableViewController: UITableViewController, MFMailComposeViewControllerDelegate {
    
    func splitViewController(_ svc: UISplitViewController, shouldHideViewController vc: LibraryTableViewController, inOrientation orientation: UIInterfaceOrientation) -> Bool {
        return false
    }
    
    var detailViewController: LibraryDetailViewController? = nil
    
    let developersLibrary = [
        "UILabel",
        "UIButton",
        "UIAlertView",
        "UIAlertController",
        "UIActionSheet",
        "UINavigationBar",
        "UINavigationController",
        "BottomNavBar",
        "UITableView",
        "UITableViewController",
        "UIViewController",
        "UIView (Randomness)",
        "UIToolBar",
        "UITabBarController",
        "UISegmentController",
        "UIWebView"
    ]
    
    let developersLibaryDetail = [
        "Label",
        "Button",
        "Alert Box",
        "Alert Box",
        "Action Sheet",
        "Navigation Bar",
        "Navigation Bar",
        "Bottom Navigation Bar",
        "Table View",
        "Table View",
        "View Controller",
        "View",
        "Tool Bar",
        "Tab Bar",
        "Segmented Controller",
        "Web View"
    ]
    
    let UILabelDetail = "\nWelcome to the UILabel tutorial! Even though this is nothing new, I just felt like it should've been added to the developer library a long time ago and I just now got to it. I've also heard some problems about code getting behind navigation bars lately, so I'll position this label assuming you have a bar. If you don't, the code will work regardless.\n\nOpen up your favorite project(or make a new one), and place this code in your view controller's loadView method:\n\nUILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(21, 45, self.view.frame.size.width - 42, 44)];\n\nNow I know this CGRectMake looks a little funny compared to the previous ones, but all I did was move the label 21 pixels to the right, 45 pixels down(navigation bars are 44 pixels), gave it the size of the frame but subtracted the indention from the front and deindented the back.\n\nNow we're going to set the text for the label:\n\nmyLabel.text = @\"Label an object!\";\n\nNow that we have the basics for our label, we can change a few things. I always like to remove the ugly background behind the label:\n\nmyLabel.backgroundColor = [UIColor clearColor];\n\nThat code may be self-explanatory, but all it's doing is making the background of the label clear. Now we can change the color of our label's text with the code:\n\nmyLabel.textColor = [UIColor yellowColor];\n\nWe can change the alignment of our label by setting the textAlignment of the label(you can use UITextAlignmentLeft, UITextAlignmentRight, and UITextAlignmentCenter):\n\nmyLabel.textAlignment = UITextAlignmentLeft;\n\nFinally, we are going to subclass the label into your app's view and release it from memory with the following code:\n\n[self.view addSubview:myLabel];\n[myLabel release];\n\nThe finished product of our label is :\n\nUILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(21, 45, self.view.frame.size.width - 42, 44)];\nmyLabel.text = @\"Label an object!\";\nmyLabel.backgroundColor = [UIColor clearColor];\nmyLabel.textColor = [UIColor yellowColor];\nmyLabel.textAlignment = UITextAlignmentLeft;\n[self.view addSubview:myLabel];\n[myLabel release];\n\nAnd that's how you do a UILabel! (...again). Until next time...Happy coding!\n"
    
    let UIButtonDetail = "\nPart 1: Code a Button\n\nWelcome to the UIButton tutorial! In this tutorial, you will learn about the UIButton class. Let's start by opening NewTerm/MobileTerminal and starting NIC from the shortcut menu. We will start another iphone/application and name it Button.\n\nIn NIC:\nName: Button\nIdentifier: com.yourname.button\nAuthor: Your Name\n\nNow open iFile and open your Button folder. Open your RootViewController.mm and make a line after #import \"RootViewController.h\" and put on the blank line:\n\n#import <UIKit/UIKit.h>\n\nNow, still in RootViewController.mm, add 2 blank lines before the closing bracket. Let's code on the 2nd blank line to keep it clean(ish). Start by adding the following code:\n\nUIButton *myButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];\n\nThis line declares a new UIButton and defines its style which is UIButtonTypeRoundedRect(the usual, plain, and somewhat ugly-when used in weird places- default-looking button). Ok! Now that we have a new awesome(...sarcasm) button declared, let's go ahead and set a new property for the button called myButton.frame. Can you guess what this one does? It sets the frame of myButton!!! Yay! Sooooo add the following line of code:\n\nmyButton.frame = CGRectMake(21, 80, 100, 35);\n\nThe value of 21 on that example is the button's position on the x axis. The value of 80 on the above example is the button's position on the y axis. The value of 100 is the button's physical width, and the value of 35 is the button's physical height. Let's add another line and use the following code on it:\n\n[myButton setTitle:@\"My Button\" forState:UIControlStateNormal];\n\nThis line is more configuration for the button, including setting its title and it's initial state(UIControlStateNormal). Again we'll add another line to our code(don't worry, we're getting close to the finish!):\n\n[myButton addTarget:self action:@selector(myButtonPressed) forControlEvents:UIControlEventTouchUpInside];\n\nThis code tells your button what method it should do(in this case, the method is myButtonPressed). And this code also tells your button how it should be controlled, UIControlEventTouchUpInside delays the action of the method until the user lifts his or her finger, it also allows the user to hold the button down and drag away from the button if they wish to cancel pushing the button. Finally, we subclass the button to self.view(show the button for the user) with the following code:\n\n[self.view addSubview:myButton];\n\nThe finished product of our UIButton(myButton):\n\nUIButton *myButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];\nmyButton.frame = CGRectMake(21, 80, 100, 35);\n[myButton setTitle:@\"My Button\" forState:UIControlStateNormal];\n[myButton addTarget:self action:@selector(myButtonPressed) forControlEvents:UIControlEventTouchUpInside];\n[self.view addSubview:myButton];\n\nIf you build and run this code and push myButton, your app will crash because the myButtonPressed method doesn't exist, yet.\n\nLet's create the myButtonPressed method now. After the closing bracket } of loadView, add 2 lines after it and write this code:\n\n- (void)myButtonPressed {\n\n}\n\nThis is the skeleton for the method myButtonPressed, but for now we'll leave it blank because the next lesson is about making your button do something(we will use an alert that says Button Pushed when the user pushes the button(myButton). Now build and run your code and you can push the button to your heart's content. Continue onto the next part...\n\nPart 2: Do Things!\n\nPart 2, a rather short tutorial where we make your buttons carry out methods! Welcome to lesson 2 of the UIButton tutorials. We are going to continue working on our previous project and make our UIButton(myButton) show an alert that shows we pressed myButton. Let's get started!\n\nIn the myButtonPressed method's brackets, let's create an UIAlertView subclass with the code:\n\nUIAlertView *buttonAlert = [[UIAlertView alloc] initWithTitle:@\"Button Pressed\" message:@\"myButton was pressed!!!\" delegate:self cancelButtonTitle:@\"Cancel\" otherButtonTitles:@\"OK\", nil];\n\n[buttonAlert setTag : 1000000];\n\n[buttonAlert show];\n\n[buttonAlert release];\n\nGuess what? It looks a lot alike from the alert from the UIAlertView tutorials! The only things that are different in this one is that I set a tag and assigned a cancel button. Tags are useful in that they separate alerts from one another when adding functions to them(although I highly doubt any programmer would have 999,999 UIAlertViews to have to use the tag 1000000, however it's not impossible). Back to the lesson, I'll add that lesson of adding tags to objects in Chapter 8 when I have time(what? I really will!), and the cancel button is useful in that they, well cancel. Build and run your code and it should show your custom alert for UIButton. That completes lesson 2 and chapter 5! Told you it was short! Onwards to Chapter 6!\n"
    
    let UIAlertViewDetail = "\nPart 1: Code an Alert\n\nIf you wish to use the Hello project from previous tutorials then you may. I just thought it would be better to use a fresh project. Otherwise let's start a new project by opening up MobileTerminal and using the shortcut menu to access NIC. In NIC, select the iphone/application template.\n\nName: Alerts\nIdentifier:com.name.alerts\nMaintainer: ReverseEffect\n\nAccess your project workspace folder named alerts. Open up your RootViewController.mm and in the loadView is where we will code. In the loadView method, add 2 blank lines above the bottom bracket and declare and define a new UIAlertView and let's name it theAlert:\n\nUIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@\"Title of Alert\" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@\"OK\", nil];\n\nThis code declares/defines/init/alloc all in the same line of code. The UIAlertView class is a smart class on its own. Now we have to set up the alert where it'll show when we start up our app. So under your UIAlertView definition, add the following lines of code:\n\n[theAlert show];\n[theAlert release];\n\nNOTE: Make sure you include the brackets as well. The first line of code shows the alert itself, and the second line is for memory management. The release statement does the opposite of alloc in the definition, releasing the memory for other applications to use(or other parts of the current running application). The finalized code for a UIAlertView is:\n\nUIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@\"Title of Alert\" message:@\"Message of Alert\" delegate:self cancelButtonTitle:nil otherButtonTitles:@\"OK\", nil];\n[theAlert show];\n[theAlert release];\n\nHomework: Just so you can also see the navItems in action from the previous chapter, open up your Hello's RootViewController.mm and place your new UIAlertView in the rightButtonPressed and leftButtonPressed methods and customize your alerts accordingly(the title and messages). Please place them INSIDE the BRACKETS. If your Hello build is successful, then your alert should pop up upon touch of one of the navItems.\n\nPart 2: Text Field Alerts\n\nHello again to another lesson. In this lesson, we are going to use our UIAlertView from the previous lesson and subclass a text field into it.\n\nLet's start by opening our Alert View project from the previous lesson(again, if you want to use the Hello project, go ahead). Let's get into our RootViewController.h and below the declaration of navBar, add a new lineand place the following code:\n\nUITextField *textField;\n\nThis is the declaration of our text field that will be placed in our UIAlertView(theAlert). Now open RootViewController.mm in your project's workspace. Find your UIAlertView(theAlert). Let's remove everything in the quotes of the -message- property and inside the quotes just put a space. Now, above the part where it says [theAlert show];, make a new line and place this code:\n\ntextField = [[UITextField alloc] initWithFrame: CGRectMake(12, 45, 260, 30)];\n\nThis line of code allocates and initializes a UITextField(textField) directly after our UIAlertView(theAlert) is allocated and initialized. Let's put a line under that and set a few other options for the setup of our textfield with the following code:\n\n[textField setBackgroundColor:[UIColor clearColor]];\ntextField.borderStyle = UITextBorderStyleRoundedRect;\n\nLet me explain what's going on here. The first line makes sure the frame has a clear color so you don't have a giant black/white/pink/banana colored square covering up the frame. So the frame is clear-colored. The second line gives textField a nice, rounded border.\n\nNow add another 2 lines below that one and place the following code on that line:\n\n[theAlert addSubview:textField];\n[textField release];\n\nThe first one adds the initialized textField(UITextField) to theAlert(UIAlertView) as a subclass. The second line releases textField from memory, so you don't waste memory, it's just memory management if you don't understand release. Now, build your code and try it out, don't worry, I'll be here when you get back.\n\nNow, you may have noticed that you can type things into theAlert, but theAlert discards the entered text after closing theAlert.\n\nIn the next lesson, we will finish this lesson and replace the title of navBar with our entered text(keep this short, don't want any overlapping). Proceed to the next lesson to make your future UIAlertViews actually do something! Part 3 will do this for you...\n\nPart 3: Do Things!\n\nWelcome to the third installment in my UIAlertView tutorials. Using the same project from the previous lesson, we are going to change the title of the UINavigationBar(navBar, via navItem) with our UIAlertView(theAlert). Let's begin!\n\nFirst things first, we will need to edit our header file so we can access our the title of our navItem from another method. In RootViewController.h, under the declaration of UINavigationBar, let's add a new line and on that line place the following code:\n\nUINavigationItem *navItem;\n\nSeem familiar? We placed navItem's declaration here now. It is VERY IMPORTANT that navItem isn't redeclared, but we will change that in the RootViewController.mm when we are done with the header. Add a new line below the closing bracket and before the @end. On that line we are going to place a property that your app can reference to so you'll be able to access navItem's title from a different method. Place this code on the blank line we made:\n\n@property (nonatomic, retain) UINavigationItem *navItem;\n\nProperties also allow other classes to reference to RootViewController's navItem. Your header file should look something like this:\n\n@interface RootViewController: UIViewController {\nUINavigationBar *navBar;\nUITextField *textField;\nUINavigationItem *navItem;\n\n}\n\n@property (nonatomic, retain) UINavigationItem *navItem;\n\n@end\n\nHow does your's look? Good! Let's save and close our new header file and open up our RootViewController.mm file. Properties from the header must be synthesized in @implementation. In between our @implementation and our -(void)loadView method, add a blank line and put this code on that line:\n\n@synthesize navItem;\n\nExample of what it should look like:\n\n@implementation RootViewController\n\n@synthesize navItem;\n\n-(void)loadView\n\nNow navItem is easily referenced to by the app as needed. Now locate the part where we declared navItem in this file. Change UINavigationItem *navItem to just navItem(removed the UINavigationItem *). Now in the .mm UINavigationItem should just be a definition instead of both a declaration and definition. I know that sounds confusing, but don't be afraid to ask. Let's continue shall we? We are going to add another method that handles button presses on the UIAlertView. After the last bracket and before @end, add a new line in between them and place the following code there:\n\n- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {\nif(buttonIndex == 1) {\nnavItem.title = textField.text;\n}\n}\n\nNow I know this code looks hideous so I'll go over it piece by piece. - (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex is the method itself, this method tells your app what other methods to call based on which button(buttonIndex) is pressed. In this method also lies if(buttonIndex == 1). This means if the SECOND button on theAlert is pressed, then the action in the if statement will happen, which is navItem.title = textField.text. NOTE: buttonIndex starts at 0, which is the far left button on our alerts, so it goes along like this: 0(far left button), 1:(second button), 2:(third button), etc. Lastly, the code(navItem.title = textField.text;) will override navItem's title to the text placed in textField. Congratulations! You finished Chapter 4! Now, build and run your code and test your new app!\n"
    
    let UIAlertControllerDetail = "\nSoon...!\n"
    
    let UIActionSheetDetail = "\nWelcome back to another lesson young developer! Today, we are going to create an action sheet for our app. This is a very simple tutorial and very easy to follow. Open MobileTerminal and NIC and create a new project. Let's call it actionsheet ;).\n\nAfter you have filled in all of the fields, close MobileTerminal and open iFile. Navigate to the actionsheet folder that NIC created and open up RootViewController.h.\n\nMake a new line at the top and enter the following code:\n\n#import <UIKit/UIKit.h>\n\nNow after we do that, we need to add the protocol necessary for our action sheet to run:\n\n<UIActionSheetDelegate>\n\nSeems simple right? Now let's take a look at our finished RootViewController.h:\n\n#import <UIKit/UIKit.h>\n\n@interface RootViewController: UIViewController<UIActionSheetDelegate> {\n}\n@end\n\nAfter you are done checking your RootViewController.h, save and close it. Let's open up our RootViewController.mm file and take a look at the loadView method. Make a new line above the closing bracket and add the following code:\n\nUIActionSheet *myActionSheet = [[UIActionSheet alloc] initWithTitle:@\"Action Sheet Title\" delegate:self cancelButtonTitle:@\"Close\" destructiveButtonTitle:nil otherButtonTitles:@\"Button 1\", @\"Button 2\", @\"Button 3\", @\"Button 4\", nil];\n\nThis may look hard, but I'll explain it piece by piece. initWithTitle should be self explanatory, it's the action sheet's title. delegate:self sets the delegate(duh...lol) and the delegate it points to is where the method implementation is found. cancelButtonTitle is also self explanatory and it's just a button that shuts down the action sheet if you don't want to perform one of it's actions. The destructiveButtonTitle is the red button you find that usually calls a method that removes or deletes something, but can be used as a normal button. otherButtonTitles are just the plain, white buttons on the sheet. Now that that's over, let's move on.\n\nMake a new line under that code and place the following code:\n\n[myActionSheet showInView:self.view];\n[myActionSheet setTag: 1];\n[myActionSheet release];\n\nThis just activates the UIActionSheet(myActionSheet) with the tag of 1 so the method implementation it uses can refer to this particular sheet(in case you have more than 1 sheet). We have built our UIActionSheet, and now we have to add the method that UIActionSheets refer to when a button is pressed:\n\n- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex :(NSInteger)buttonIndex {\n\n}\n\nThis method is called whenever an UIActionSheet is dismissed from a view controller. Let's code in this method to check the tag for our action sheet:\n\n- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex :(NSInteger)buttonIndex {\nif(actionSheet.tag == 1){\n\n}}\n\nAnything coded in the if statement will refer to the action sheet we made earlier with the tag we also set to 1.\n\nWell there is our UIActionSheet. Happy coding until next time!\n"
    
    let UINavigationBarDetail = "\nPart 1: Declare the Bar\n\nIt is time, young apprentice, for you to expand upon your knowledge of application development. Now we are going to add a nice looking navigation bar to our little app.\n\nUsing the hello world project from the Intro tab(don't worry if you deleted it, you can just open MobileTerminal and use NIC), let's open up our project's workspace and open RootViewController.h.\n\nIf you opened your hello world one, then it should look like the following:\n\n@interface RootViewController:\nUIViewController{\nUILabel *helloLabel;\n}\n@end\n\nWe're going to add another blank line below UILabel *helloLabel;, and on that line we're going to put UINavigationBar *navBar;.\n\nNow our header looks like:\n\n@interface RootViewController:\nUIViewController{\nUILabel *helloLabel;\nUINavigationBar *navBar;\n}\n@end\n\nNow our navigation bar, that we called navBar, has been declared in our header file. Proceed to part 2 to define and implement our navigation bar (navBar).\n\nPart 2: Define the Bar\n\nNow that we have the navigation bar declared. It is time to define it. Just like a modern English dictionary, you have the word declared and its definition right next to it. Well our header(.h) declares and .mm defines(usually). Now let's start by opening RootViewController.mm. At the bottom of the file is a closing bracket and @end. See it? Now above that closing bracket, we will put two blank lines. On the -second- blank line, we will code the following line:\n\nnavBar = [[UINavigationBar alloc] init];\n\nThis allocates our navBar into the memory as a UINavigationBar object and initializes from the memory. Now that navBar is in our device's memory, we need to actually build the bar. We start by building the bar's frame. Add a new line and put this code on that line:\n\nnavBar.frame = CGRectMake(0, 0, self.view.frame.size.width, 44);\n\nCGRectMake is what will position and shape your frame. I went into small detail with it in a previous lesson and if you go to chapter 8, there is a lesson on working with CGRectMake. self.view.frame.size.width looks complicated. But if you just think a little bit and look at it again, you should remember seeing self.view when adding subviews right? So you should know this value has something to do with self.view, frame.size.width is just the physical width of your screen, just like frame.size.height is the physical height. 44 is the usual height of a navigation bar, just like in settings, iFile, and even my app that you're reading from now!\n\nNow that we have our navigation bar frame, now would be a good time for a title of the bar. Add this code to your project:\n\nUINavigationItem *navItem = [[[UINavigationItem alloc] initWithTitle:@\"navBar title\"] autorelease];\n\nThis one is a little harder to explain actually. Note that you can replace anything in the quotes with whatever you want, navBar title for example. Ok so we have our navBar, and now we just declared and defined navItem. navItem(UINavigationItem) is a 3 slot object. In my app, can you see the 3 slots? The credits button, the title, and the info button? navItem handles those items.\n\nRight now, all we did was use the middle slot and put a title there(navBar title). Add 2 more lines and put this code in it:\n\nnavBar.barStyle = UIBarStyleBlackOpaque;\nnavBar.items = [NSArray arrayWithObject:navItem];\n\nThe first line defines the style of our navBar and the other line attaches the navItem to our navBar. The navBar itself is now finished! Finally, we add the navBar itself into self.view:\n\n[self.view addSubview:navBar];\n\nOur finished project:\n\nnavBar = [[UINavigationBar alloc] init];\nnavBar.frame = CGRectMake(0, 0, self.view.frame.size.width, 44);\nUINavigationItem *navItem = [[[UINavigationItem alloc]initWithTitle:@\"navBar title\"] autorelease];\nnavBar.barStyle = UIBarStyleDefault;\n\nnavBar.items = [NSArray arrayWithObject:navItem];\n[self.view addSubview:navBar];\n\nYay navigation buttons! Part 3!\n\nPart 3: Bar Buttons\n\nThis is actually a very simple tutorial if you've already done the navigation bar tutorial parts 1 and 2.\n\nThe beauty in Navigation Bar buttons is that they look beautiful. If you try to put a subview of a regular UIButton, then it looks just plain hideous. Correction, plain and hideous. Let's get started!\n\nWe're going to use the same project as in the previous lesson. With your UINavigationBar(navBar) and UINavigationItem(navItem) declared and defined, the work is half over(unless that's all you want from a Navigation Bar). Using navItem, we will fill the remaining 2 slots with buttons(one on each side of navBar). Add a blank line under where you defined the title after where it says autorelease]; and place the following code on that line:\n\nUIBarButtonItem *rightButton = [[[UIBarButtonItem alloc] initWithTitle:@\"Right\" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonPressed)] autorelease];\nnavItem.rightBarButtonItem = rightButton;\n\nThis code fills the slot to the right side of our navBar. You see where it says action:@selector? The variable in the parentheses is the name of the function that gets called when our button is pressed. You can see the bottom line of that code how it becomes a part of navItem which is part of the navBar.\n\nTo add the left button on the navBar, the code is very similar except you use -left- instead of -right-. Here is an example of both button slots filled on our navBar:\n\nUIBarButtonItem *leftButton = [[[UIBarButtonItem alloc] initWithTitle:@\"Left\" style:UIBarButtonItemStylePlain target:self action:@selector(leftButtonPressed)] autorelease];\nnavItem.leftBarButtonItem = leftButton;\n\nUIBarButtonItem *rightButton = [[[UIBarButtonItem alloc] initWithTitle:@\"Right\" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonPressed)] autorelease];\nnavItem.rightBarButtonItem = rightButton;\n\nSo now you have 2 buttons on your navBar, but in your code leftButtonPressed and rightButtonPressed do not exist yet. leftButtonPressed and rightButtonPressed are methods, so they are not in loadView. loadView is also a method. Now we build the leftButtonPressed method. AFTER the closing bracket, add 2 blank lines and add leftButtonPressed's skeleton as a void:\n\n-(void) leftButtonPressed{\n//Code here\n}\n\nYou've added a method! Now do the same for rightButtonPressed:\n\n-(void) rightButtonPressed{\n//Code here\n}\n@end\n\nAnd here's what your finished project should look like(in RootViewController.mm for the navBar only, not the methods):\n\nnavBar = [[UINavigationBar alloc] init];\nnavBar.frame = CGRectMake(0, 0, self.view.frame.size.width, 44);\nUINavigationItem *navItem = [[[UINavigationItem alloc] initWithTitle:@\"navBar title\"] autorelease];\nUIBarButtonItem *rightButton = [[[UIBarButtonItem alloc] initWithTitle:@\"Right\" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonPressed)] autorelease];\nnavItem.rightBarButtonItem = rightButton;\nUIBarButtonItem *leftButton= [[[UIBarButtonItem alloc] initWithTitle:@\"Left\" style:UIBarButtonItemStylePlain target:self action:@selector(leftButtonPressed)] autorelease];\nnavItem.leftBarButtonItem = leftButton;\nnavBar.barStyle = UIBarStyleDefault;\nnavBar.items = [NSArray arrayWithObject:navItem];\n[self.view addSubview:navBar];\n"
    
    let UINavigationControllerDetail = "\nSoon...!\n"
    
    let bottomNavBarDetail = "\nPart 1: Declare a Bar\n\nWelcome, fellow dev, to Chapter 6! This lesson will be quite simple actually if you've read the other navigation bar tutorial, because all the bottom navigation bar is just a navigation bar placed on the bottom. Let's begin!\n\nThis lesson is just about defining the bar so I won't say much as all the information you need is in the navigation bar tutorial. It's the same process when declaring.\n\nOpen RootViewController.h of your Hello project or the last project you used. We've declared in the past so this should be quite simple to you.\n\nIn the brackets, we will declare another UINavigationBar and we'll name it bottomBar(I know! It's a very clever name, haha). The declaration code is:\n\nUINavigationBar *bottomBar;\n\nWe won't make a property for it since we aren't accessing the bar in any other methods except for the bar's buttons. Now save and close your header file. Proceed to part 2!\n\nPart 2: Code It!\n\nWelcome to part 2! Now that we have bottomBar declared, let's open RootViewController.mm and define it. In the method loadView, after the code [self.view addSubview:navBar];, we're going to define bottomBar. Add a new line after the above mentioned code and add this code to your code:\n\n//define bottomBar\nbottomBar = [[UINavigationBar alloc] init];\n//frame of bottomBar\nbottomBar.frame = CGRectMake(0, self.view.frame.size.height - 43, self.view.frame.size.width, 44);\n//items on bottomBar\nUINavigationItem *bottomItem = [[[UINavigationItem alloc] initWithTitle:@\"bottomBar title\"] autorelease];\n//style of bottomBar\n//can use UIBarStyleDefault if you wish\nbottomBar.barStyle = UIBarStyleBlack;\n//attach bottomItem to bottomBar\nbottomBar.items = [NSArray arrayWithObject:bottomItem];\n//add bottomBar to view\n[self.view addSubview:bottomBar];\n\nYou should already know what all this does cause I know you read Chapter 3 ;) , but just in case, I added comments throughout the code so you can -remember- what the code does. Now let's look at the main reason of this tutorial. Locate within the provided code the CGRectMake arguments. (0, self.view.frame.size.height - 43, self.view.frame.size.width, 44). Notice that we put self.view.frame.size.height - 43 instead of 0 like the standard navBar we used in Chapter 3. That argument places the UINavigationBar on the bottom. The height of a UINavigationBar is 44 pixels. We used self.view.frame.size.height as a reference and subtracted 43 pixels from it to give bottomBar it's position on the y axis. NOTE: I subtracted 43 instead of 44 because when I subtracted 44, I had this unusual thin, white line under my bar. It was unsightly, so I used 43. Anyways, that's the end of lesson 1! Build and run your code and see what you like better, navBar on top, bottomBar on bottom, or both! See you at part 3 for tips!\n\nPart 3: Things to know\n\nAs with any Obj-C class, you can subclass UIImages, UILabels, UISegmentedControllers into either UINavigationBar.\n\nYou can have multiple UINavigationBar classes in one view. For example, one on top and two or three on bottom or cover the entire view in navigation bars if you want, but that won't be a very pleasant view for the user.\n\nThat's all the tips I have for now(because I explained everything else I knew in the actual lessons, it's disappointing :/ ). I may update this section as I learn about the UINavigationBar class. Happy Coding!\n"
    
    let UITableViewDetail = "\nWelcome to the UITableView tutorial: A chapter-in-a-lesson about the UITableView class. We need to do more than just declare and define an object. Let's start off by launching MobileTerminal and opening NIC and creating a new iphone/application project. After that is done, open your project's work folder and open RootViewController.h and on the line where it says 'UIViewController', add a space and place the following code:\n\n<UITableViewDelegate, UITableViewDataSource>\n\nOur table needs to be declared and eventually needs to be populated with some kind of contents. So in the brackets, add the following lines of code:\n\nUITableView *myTable;\nNSMutableArray *myTableData;\n\nAt this point, your header file should look something similar to this:\n\n@interface RootViewController: UIViewController <UITableViewDelegate, UITableViewDataSource> {\n\nUITableView *myTable;\nNSMutableArray *myTableData;\n\n}\n@end\n\nWe declared myTable as the UITableView which we will use later on, and we declared myTableData(which will be the contents of the table) as an array of objects. Now that we are done with the header file, we will save and close it and now enter our RootViewController.mm file.\nIn the loadView method, let's first work with the array to keep things in order. Add the following lines in your loadView:\n\nmyTableData = [[NSMutableArray alloc]init];\n[myTableData addObjectsFromArray:[NSArray arrayWithObjects: @\"Cell 1\", @\"Cell 2\", @\"Cell 3\", nil]];\n\nThis code will allocate and initialize myTableData into the memory and sets the objects Cell 1, Cell 2, and Cell 3 into the array to be used by myTable later on. Let's add a couple of blank lines after that and let's define the UITableView(myTable) with the following lines of code:\n\nmyTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 44, 320, 460 - 87) style:UITableViewStylePlain];\n[myTable setDataSource:self];\n[myTable setDelegate:self];\n[self.view addSubview:myTable];\n[myTable release];\n\nNow I know that if you've read my tutorials that you would probably know what most of this means, and that's what I'll assume here. However, there are a couple of things that I will go over, the CGRectMake and the style. If you have 2 UINavigationBars(1 on top and bottom) in your app, then this UITableView's CGRectMake is for you. But, if your app has one bar on top, then your CGRectMake would be (0, 44, 320, 460 - 43) to cover up that small space on the bottom. If your app has no bars, then your CGRectMake would be (0, 0, 320, 460), to cover up the whole screen. See? I did the math for you! How nice! Now about the style, you can do UITableViewStylePlain or UITableViewStyleGrouped(like in Settings/Preferences). I'd advise against changing this just so you can experiment to see which kind you like better, but if you wish to change it, you may.\nWe have our table declared and defined, but it's still not over. Unfortunately, the hard part has just begun :(\nLet's add a new method after loadView's ending bracket and place this code there:\n\n- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {\n  return 1;\n}\n\nThis code will tell your app how many sections are in our UITableView(s). Add 2 blank lines after the closing bracket and add another method:\n\n- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {\nswitch(section){\n     case 0: return [myTableData count]; break;\n     default: break;\n}\n     return -1;\n}\n\nThat method will link myTableData with myTable. It'll count how many objects are in myTableData and automatically adjust myTable to suit that. The -1 of return -1 is actually optional. It will purposely crash your app ONLY if for some reason something goes wrong with this method. You can change -1 to 0 if you don't want it to crash your app. There's still more -_-'\nYet another method we need to add is for the individual setup of each cell. Add the following method to your app:\n\n- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {\n\nUITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@\"Cell %i\",indexPath.section]];\n\n     if (cell == nil) {\n\n        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:[NSString stringWithFormat:@\"Cell %i\",indexPath.section]] autorelease];\n}\n\n      switch(indexPath.section){\n        case 0:{ cell.textLabel.text = [myTableData objectAtIndex: indexPath.row];} break;\n      default: break;\n}\n\ncell.selectionStyle = UITableViewCellSelectionStyleBlue;\n\nreturn cell;\n}\n\nPlease don't mess with this method too much except for cell.selectionStyle. You can change this value to UITableViewCellSelectionStyleGray and UITableViewCellSelectionStyleNone. All that does is change the highlight of the selected cell. Other than that, I'd not mess with any other part unless you're doing some kind of hardcore customization. Finally, the last method we're going to work with(add a couple more lines after your last method and add the following.):\n\n- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {\n\n      //give function here\n\n}\n\nI won't explain this one in this tutorial because this lesson is getting WAY too large. Maybe in a special lesson. But this method is what your cells will do upon selection. Hope you enjoyed my rather large and messy tutorial :/ Maybe I'll also clean this up a bit as well. Until next time, Happy Coding!\n"
    
    let UITableViewControllerDetail = "\nSoon...!\n"
    
    let UIViewControllerDetail = "\nPart 1: Create another view controller\n\nWelcome to the UIViewController class tutorials! In this tutorial, we will be creating additional view controllers for your app to use. Let's fire up MobileTerminal and launch Theos NIC. Make a new iphone/application and name it something like testview. Make a second iphone/application template that we will use the view controller from. The details of this template don't matter as we're going to delete the rest of that one anyways ;)\n\nOpen up the -SECOND- project you made and change the name of:\n\nRootViewController.h\nRootViewController.mm\n\nTo:\n\nSecondView.h\nSecondView.mm\n\nNow, open up SecondView.h and change the following code:\n\n@interface RootViewController: UIViewController {\n\n}\n@end\n\nTo:\n\n@interface SecondView: UIViewController {\n\n}\n@end\n\nSave and close SecondView.h and open up SecondView.mm. In SecondView.mm, let's change the following code:\n\n#import \"RootViewController.h”\n\nTo:\n\n#import \"SecondView.h”\n\nAnd change the following code:\n\n@implementation RootViewController\n\nTo:\n\n@implementation SecondView\n\nCongrats! You may now proceed to edit this UIViewController just like any other view, or you may proceed to the next lesson to finish implementing the view controller into your app.\n\nPart 2: Set up the view controller\n\nSave and close SecondView.mm. In iFile, cut both SecondView.h and SecondView.mm and paste them into the testview project folder. Open your Makefile, and on the line:\n\ntestview_FILES = main.m testviewApplication.mm \n\nEdit that line to look like:\n\ntestview_FILES = main.m testviewApplication.mm SecondView.mm\n\nThis will compile SecondView.mm into an object file (SecondView.o) and add it to the finalized testview binary (testview.app > testview). And guess what? That's how you set up a new class for your projects! Proceed to part 3!\n\nPart 3: Set it up in-app (Usage)\n\nSo you have a new UIViewController and UIView ready to be used whenever you want huh? Well now we will call our view controller to present our amazingness view! With the shiny code:\n\n//Bring SecondView to memory (RAM)\nSecondView *second= [[[SecondView alloc] init] autorelease];\n//Properties for second (SecondView)\nsecond.title = @\"UINavigationBar”;\n//Present second (SecondView) to user\n[self presentModalViewController:second animated:YES];\n\nNow that you have the ability to bring another view up front, a question you want to ask yourself is whether or not you want the user to be able to go back to the RootViewController. If not, then just skip this step. Using the action property of either UIButtons or UIBarButtonItems to UIAlertViews or UIActionSheets, you can call this whenever needed:\n\n[[self parentViewController] dismissModalViewControllerAnimated:YES];\n\nOPTIONAL: If, for some reason, the first doesn't work, I've been able to dismiss modal view controllers like so(technically they're the same code):\n\n[self.parentViewController dismissModalViewControllerAnimated:YES];\n\nNOTE: If you didn't animate your view in, then just change YES to NO, if desired.\n\nThat code will be called within a method in SecondView. For example, say you have a UIButton that calls a method called closeView:\n\n- (void)loadView {\n    //UIButton code here\n}\n\n- (void)closeView {\n[[self parentViewController] dismissModalViewControllerAnimated:YES];\n}\n\nThere you go! Now you know how to present and dismiss UIViewControllers! Happy coding!\n"
    
    let UIViewDetail = "\nI’m doing this lesson from my slow iPhone 3G... :P\n\nIn this lesson, we will make plain UIView appear after activating a method with a UIButton (as usual... :P )\n\nSo how about a little \"notification\" banner style view that displays a message that the user can dismiss manually? You up for it? Good! Let's make a new project in NIC called \"banner”.\n\nWhen done, close MobileTerminal and open up iFile. Navigate to the banner/ directory and open up RootViewController.h and globally declare a UIView named bannerView and a UIButton named bannerButton:\n\n@interface RootViewController : UIViewController {\nUIView *bannerView;\nUIButton *bannerButton;\n}\n@end\n\nSimple enough right? Now let's save and close RootViewController.h and open our RootViewController.mm file. Now let's define bannerView and our bannerButton button. (Sounds funny...) Now, in the loadView method, add our UIButton(you should already know how to do this, if not, look at the UIButton lesson):\n\n@implementation RootViewController\n\n-(void)loadView {\nbannerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];\nbannerButton.frame = CGRectMake(21, 80, 100, 35);\n[bannerButton setTitle:@\"A Button\" forState:UIControlStateNormal];\n[bannerButton addTarget:self action:@selector(createBanner) forControlEvents:UIControlEventTouchUpInside];\n[self.view addSubview:bannerButton];\n}\n@end\n\nThis code creates a button with the title of \"My Button\" and it calls the method, createBanner(which we will define now, I filled this with comments to make it easier to understand):\n\n- (void)createBanner {\n//Allocate bannerView UIView\nbannerView = [[[UIView alloc] initWithFrame:CGRectMake(21, 21, _width - 42, 70)] autorelease];\n//bannerView property - background color\nbannerView.backgroundColor = [UIColor blackColor];\n//Subclass bannerView (add to view)\n[self.view addSubview:bannerView];\n\n//Button to destroy bannerView\nUIButton *closeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];\n//closeButton property - frame\ncloseButton.frame = CGRectMake(_width - 77, 0, 35, 35);\n//closeButton property - title/controls\n[closeButton setTitle:@\"X\" forState:UIControlStateNormal];\n//closeButton property - bg color\n[closeButton setBackgroundColor:[UIColor whiteColor]];\n//method closeButton calls\n[closeButton addTarget:self action:@selector(destroyView) forControlEvents:UIControlEventTouchUpInside];\n//subclass closeButton to bannerView\n[bannerView addSubview: closeButton];\n\n//Textfield that holds title of view :)\nUITextView *titleTextField = [[UITextView alloc] initWithFrame: CGRectMake(0, 0, _width - 77, 35)];\n//Text of the title's text field\ntitleTextField.text = @\"Title”;\n//This field isn't user-editable\ntitleTextField.editable = NO;\n//subclass titleTextField to bannerView\n[bannerView addSubview: titleTextField];\n//Memory management - Recycle RAM!!!\n[titleTextField release];\n\n//Message text view - Read above for info\nUITextView *msgTextField = [[UITextView alloc] initWithFrame: CGRectMake(0, 36, _width - 77, 35)];\n[msgTextField setBackgroundColor:[UIColor blueColor]];\nmsgTextField.text = @\"Alert Message\";\nmsgTextField.editable = NO;\n[bannerView addSubview: msgTextField];\n[msgTextField release];\n}\n\nNow that we have our notification banner built, we have to have a way to destroy it when the user wants to get rid of the banner. Since we've already built a button on the banner, we don't have to worry about that anymore, but that button calls a method called destroyView which we should define now:\n\n- (void)destroyView {\n[bannerView removeFromSuperview];\n}\n\nSimple, Right? So, when the user pushes the button on the RootViewController, our banner notification gets activated with the createBanner method and bannerView becomes subclassed. bannerView has a UIButton subclass that calls the destroyView method to remove bannerView from the main view. Try for yourself! You can also resize the banner to become a full size window-like object where you can place multiple objects on it as well like UISwitches, UITableViews, UIButtons, etc. Well, Happy coding!\n"
    
    let UIToolBarDetail = "\nThis is actually a rather simple tutorial. Welcome to another tutorial from Theos Tutorials! Today we're going to learn how to make a UIToolbar and put buttons on it! We're also going to learn how to use (id) sender. Let's start!\n\nOpen up the awesome MobileTerminal and fire up that NIC. Create a new project application and call it \"toolbar\". Fill in the rest of the details. Once that's done, close MobileTerminal and open up iFile. Go to your toolbar directory and open up your RootViewController.mm file(this class is so simple, we don't need to edit the header unless you want to). In the loadView method, let's create a new UIToolbar:\n\nUIToolbar *toolbar = [[UIToolbar alloc] init];\ntoolbar.frame = CGRectMake(0, self.view.frame.size.height - 44, self.view.frame.size.width, 44);\n\nThe settings of this CGRectMake will place your toolbar on the bottom of the view. Now let's add it to the view and call some memory management code so we don't waste memory:\n\n[self.view addSubview:toolbar];\n[toolbar release];\n\nNow that we have our toolbar, what good is it if it doesn't contain any buttons? So let's add some bar buttons:\n\n//button 1\nUIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithTitle:@\"Item1\" style:UIBarButtonItemStyleBordered target:self action:@selector(sharedAction:)];\n[item1 setTag:0];\n\nUIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@\"Item2\" style:UIBarButtonItemStyleBordered target:self action:@selector(sharedAction:)];\n[item2 setTag:1];\n\nUIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithTitle:@\"Item3\" style:UIBarButtonItemStyleBordered target:self action:@selector(sharedAction:)];\n[item3 setTag:2];\n\nUIBarButtonItem *item4 = [[UIBarButtonItem alloc] initWithTitle:@\"Item4\" style:UIBarButtonItemStyleBordered target:self action:@selector(sharedAction:)];\n[item4 setTag:3];\n\nUIBarButtonItem *item5 = [[UIBarButtonItem alloc] initWithTitle:@\"Item5\" style:UIBarButtonItemStyleBordered target:self action:@selector(sharedAction:)];\n[item5 setTag:4];\n\nUIBarButtonItem *item6 = [[UIBarButtonItem alloc] initWithTitle:@\"Item6\" style:UIBarButtonItemStyleBordered target:self action:@selector(sharedAction:)];\n[item6 setTag:5];\n\nNow let's stop for a minute and talk about something here. Look at the method these buttons call. Notice something? That's correct! They all have the same method! Wow! But wait, how do we make different buttons do different things if they all call the same method? Great question! We will use (id) sender on the method and tags that are assigned to each button. But keep that in mind for later, first we have to finish setting up the buttons:\n\n//add the buttons to the toolbar\nNSArray *buttons = [NSArray arrayWithObjects: item1, item2, item3, item4, item5, item6, nil];\n[toolbar setItems: buttons animated:NO];\n\n//memory management for buttons - don't waste!\n[item1 release];\n[item2 release];\n[item3 release];\n[item4 release];\n[item5 release];\n[item6 release];\n\nNow that you have all of that stuff in your loadView, let's make that awesome method that handles all the toolbar buttons:\n\n- (void)sharedAction:(id)sender {\n\n\n}\n\nIn this method, we'll use a switch case statement to determine which button was pressed and call the correct action based on the tag.\n\n- (void)sharedAction:(id)sender {\n  switch([sender tag]){\n    case 0: { } break;\n    case 1: { } break;\n    case 2: { } break;\n    case 3: { } break;\n    case 4: { } break;\n    case 5: { } break;\n    default: break;\n}\n\nNOTE: Leave \"default: break\" alone. Now, remember how I told you that I'll start trying to let your creativity flow? Well here it is again(and I'm also tired as I'm up too late at this point writing this). I'll let you decide what to put in the brackets { }.\n\nFor example \"case 0\" is the button item1 because item1 has the tag of 0. So:\n\ncase 0: {\n    //code for item1 is called here\n} \nbreak;\n\nAnd there you have it! UIToolbar and (id) sender explained. Goodnight and Happy Coding!\n"
    
    let UITabBarControllerDetail = "\nSoon...!\n"
    
    let UISegmentedControllDetail = "\nSoon...!\n"
    
    let UIWebViewDetail = "\nNow it's time to make our app display some webpages with a UIWebView. Let alone it be your website or any other website for that matter. Now let's get started. The rules for a UIWebView are simple. Just declare and define. Then give it a website to go to. Start by either making a new project with NIC or using an existing project you have and open up your project's RootViewController.mm file. In the loadView method, let's add the following code:\n\nUIWebView *webView = [[[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)] autorelease];\n\nThis declares your new UIWebView with the name of webView and with the current values in CGRectMake, it makes webView fullscreen. An excerpt from lesson 5 regarding CGRectMake's relationship to Navigation Bars:\n\nIf you have 2 UINavigationBars(1 on top and bottom) in your app, then this UITableView's CGRectMake is for you. But, if your app has one bar on top, then your CGRectMake would be (0, 44, 320, 460 - 43) to cover up that small space on the bottom. If your app has no bars, then your CGRectMake would be (0, 0, 320, 460), to cover up the whole screen.\n\nThat paragraph tells you the values that should be in your CGRectMake if you have 1 or more Navigation Bars in your View Controller. Now back to coding. Add the following line below your current code:\n\nwebView.scalesPageToFit = YES;\n\nThis tells webView to resize the pages to it's own size. Add another line and place the following code on it:\n\n[self.view addSubview:webView];\n\nNow that our webView is setup, it's time to make it actually do something, like load a webpage(oh my goodness, I never thought of that(...sarcasm. Ha. Ha. Ha.)). Now let's get webView to load oh so precious Google:\n\n[webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@\"http://www.google.com\"]]];\n\nAnd voila! We have a very, very, very basic web browser! Hope you enjoyed this tutorial!\n"
    
    
    
    let specialLessons = [
        "Shell Commands",
        "Adding Tags",
        "Customize UITableView",
        "Line Breaks",
        "Alert + WebView",
        "Alert + Table",
        "OneTime Alert",
        "In-App Mail",
        "Open URL's (Safari)"
    ]
    
    
    
    let shellCommandsDetail = "\nShell commands in iOS are the commands you execute in MobileTerminal. Examples of simple commands you can execute in MobileTerminal are ls and su. Su should be familiar to you as it allows you to login to your system with the password alpine. ls is different. Ls(L is supposed to be lower cased) shows the contents of the current directory you are in. You may try this in MobileTerminal if you wish(su, alpine first!!!).\n\nNow, let me explain something else. Obj-C is a scripting language off of the standard C language, so you can use standard C commands in an Obj-C project. Same rule applies for Obj-C++. We will be using a C++ function to carry out these MobileTerminal commands from our app. Prepare to use the following code in your project:\n\nsystem(\"killall -9 SpringBoard”);\n\nThis code will respring your device if executed. Now, create a new iphone/application project using NIC and call it iRespring, or something like that. In your RootViewController.mm, let's make a new UIButton with the code:\n\nUIButton *respringButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];\nrespringButton.frame = CGRectMake(21, 80, 100, 35);\n[respringButton setTitle:@\"iRespring\" forState:UIControlStateNormal];\n[self.view addSubview:respringButton];\n[respringButton addTarget:self action:@selector(respringButtonPressed)\nforControlEvents:UIControlEventTouchUpInside];\n[self.view addSubview:respringButton];\n\nThis code is nothing new(if you need this explained, please refer to my UIButton tutorials). We made a new UIButton and named it respringButton, and the method it'll call upon touch is respringButtonPressed. Make a new method under the ending bracket for loadView and call it, you guessed it, respringButtonPressed. For example:\n\n- (void)loadView {\n//loadView's code\n}\n\n- (void)respringButtonPressed {\n//add respring code\nsystem(\"killall -9 SpringBoard”);\n}\n@end\n\nYou're going to have to think about this one real quick, please don't remove your code in loadView and replace it with my comment. The point was to show where respringButtonPressed goes. Hope you enjoyed this tutorial!\n"
    
    let addingTagsDetail = "\nWhen you have multiple objects that are if the same type(UIAlertViews, UIActionSheets, UITableViews), and you want to add functionality to one object and not the other, then you'll need to use tags. Say you have 2 UIAlertViews(for simplicity, we'll name them myAlert1 and myAlert2) and you want to make one alert view do something and just have the other just to present the user with a message and do nothing. So the code we will have for those alerts are:\n\nUIAlertView *myAlert1 = [[UIAlertView alloc] initWithTitle:@\"myAlert1 title\" message:@\"Power Management\" delegate:self cancelButtonTitle:@\"Cancel\" otherButtonTitles:@\"Respring\", @\"Reboot\", nil];\n\n[myAlert1 show];\n\n[myAlert1 release];\n\nUIAlertView *myAlert2 = [[UIAlertView alloc] initWithTitle:@\"Alert 2\" message:@\"Message for you!\" delegate:self cancelButtonTitle:@\"Cancel\" otherButtonTitles:@\"OK\", nil];\n\n[myAlert2 show];\n\n[myAlert2 release];\n\nMake 2 UIButtons and put one alert in only one of the button's methods so we will be able to test each alert. Now let's work with myAlert1. Just to sort of keep things in order, we're going to place the following code before [myAlert1 show]:\n\n[myAlert1 setTag:1];\n\nIf you haven't guessed what this does, this code sets the tag of 1 to myAlert1. Now, myAlert1 is a -unique- UIAlertView through this tag. Let's do the same for myAlert2 above it's [myAlert2 show]; code:\n\n[myAlert2 setTag:2];\n\nJust like myAlert1, this code sets the tag of 2 to myAlert2 and makes it unique just in case you decide to add additional alerts.\n\nNow we will use the system() commands from Lesson 1 of this Chapter to make myAlert1 reboot or respring your iDevice.\nUsing the method that gives function to UIAlertViews from Chapter 4 is where we will assign these system() commands:\n\n- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {\nif (alertView.tag == 1){\nif (buttonIndex == 1){\nsystem(\"respring”);\n}\nelse if (buttonIndex == 2){\nsystem(\"reboot”);\n}\n}\n\nalertView.tagreferences the alert it's tagged to, so alertView.tag == 1 references myAlert1. buttonIndex is nothing new if you've read the previous tutorials. buttonIndex starts counting at 0(far left button). Since that's the case, buttonIndex == 1 is the second button on our UIAlertView. So alertView.tag == 1 and buttonIndex == 1 is the second button on myAlert1, which is our respring button. We left out alertView.tag == 2 because that view is supposed to just show the message it contained and not carry any functions. Hope you enjoyed this tutorial! Happy coding!\n"
    
    let customizeUITableViewDetail = "\nIn this lesson, we're going to customize a few things about the UITableView cells. Note that this isn't an extreme customization tutorial as I myself haven't practiced those types of high-level customizations(I have no creative ability in digital art :'( ). If you have a UITableView in your app or created one with my app, then we will customize by adding code to the - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath method.\n\nInside of that method(if you don't have it, then add it, although you should have it.) add the following code:\n\ntableView.separatorColor = [UIColor blueColor];\n\nThis code changes the color of the border and the separator between the cells. And that's practically it. Now, let's move on to the pinstriped background of the UITableView.\nBy default, the UITableViewStyleGrouped style comes with the pinstripe background like you see in Settings/Preferences. You can remove this background by adding the following code to the same method we just worked with:\n\ncell.backgroundColor = [UIColor clearColor];\n\nAs I learn more about the UITableView class, then I will add to this lesson. Hope you enjoyed! Until next time!\n"
    
    let lineBreaksDetail = "\nThis is more of a lesson than a tutorial. In this lesson, we're going to discuss the usefulness of a line break when displaying text. When you use a property that displays text like the message property of an UIAlertView or the text property of a UITextField, you use line breaks to tell your app to move to the next line. It's like pushing the enter/return button on a keyboard without actually pushing it. It's very simple to use. It's just a backslash and the letter n:\n\n \\n \n\nUsing that example, here weeeeeee goooooooo.\n\n@“Hi there,\nI made a new line!”\n\nIf you were to view that in app, it would look like this:\n\nHi there,\nI made a new line!\n\nI know!!! It's so amazing!!!(...more sarcasm) But I thought you should know this, so I made it into a lesson. More knowledge for you. Don't complain! Happy coding!\n"
    
    let alertPlusWebViewDetail = "\nIn this lesson, we are going to subclass a UIWebView with a UIAlertView. In other words, place a website onto an an alert(like you see with the user-made site). Let's get started. You do not need a new project for this lesson, but if your project is too messy, then making a new one would probably be a good idea. In your project's workspace, open your RootViewController.mm file. In the loadView method, let's declare, alloc, and init a new UIAlertView:\n\nUIAlertView *webAlert = [[UIAlertView alloc]\n\nCustomize it:\n\ninitWithTitle:@\"Name of Website\" message:@\"\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\" delegate:self cancelButtonTitle:@\"Cancel\" otherButtonTitles:@\"OK\", nil];\n\nLet's declare and define our UIWebView here:\n\nUIWebView *webView = [[[UIWebView alloc] initWithFrame:CGRectMake(10, 40, 264, 254)] autorelease];\nwebView.scalesPageToFit = YES;\n\nNOTE: PLEASE MAKE SURE YOU ACTUALLY PUT 12 LINE BREAKS IN THE MESSAGE PROPERTY! IF YOU DON'T KNOW HOW THEN PLEASE REFER TO THE LINE BREAK LESSON! Now that we have our UIAlertView(webAlert) and our UIWebView(webView) declared and defined, let's add them together with the following line of code:\n\n[webAlert addSubview:webView];\n\nLet's make our little webView load Google :P\n\n[webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@\"http://www.google.com”]]];\n\nFinally, let's show the alert to the user and then release it from memory when the user is done:\n\n[webAlert show];\n[webAlert release];\n\nAnd there you have it! An epic fusion of an UIAlertView and UIWebView! Hope you enjoyed this tutorial! Happy Coding!\n"
    
    let alertPlusTableDetail = "\nHello Dev! Welcome to another tutorial of Theos Tutorials! Today, we're going deeper in the world of subclassing. This is more of something you would do just for the heck of it. We're going to integrate an UITableView into an UIAlertView. Let's start!\n\nLaunch MobileTerminal, and then launch NIC. Create a new application called \"alerttable\". Fill in the other parameters and then close MobileTerminal. Launch iFile and navigate to the alerttable folder. We need to declare a few things, so let's open RootViewController.h.\n\nNow that we have our header file opened, let's add the UITableView's protocols:\n\n@interface RootViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {\n\n}\n\n\nNow, let's declare our arrays and the table view:\n\n@interface RootViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {\nNSMutableArray *tableData;\nNSMutableArray *tableData2;\nUITableView *myTable;\n}\n\nYour header file should look something similar to that. Now save and close your header, and open up your RootViewController.mm file.\n\nLet's start with our arrays in our loadView method:\n\n- (void)loadView {\n//self.view definitions here\n\ntableData = [[NSMutableArray alloc]init];\n[tableData addObjectsFromArray:[NSArray arrayWithObjects: @\"Cell 1-1\", @\"Cell 1-2\", @\"Cell 1-3\", nil]];\n\ntableData2 = [[NSMutableArray alloc]init];\n[tableData2 addObjectsFromArray:[NSArray arrayWithObjects: @\"Cell 2-1\", @\"Cell 2-2\", @\"Cell 2-3\", nil]];\n}\n\nWe're going to have 2 sections in out table, so we have 2 mutable arrays. Now let's create the table view. You have to remember that the alert view has a fixed frame, so you have to set up your table view within the frame of the alert. Add this code to your loadView method after the arrays(you should already know what it does by the time you reach this tutorial):\n\nmyTable = [[UITableView alloc] initWithFrame:CGRectMake(6, 45, 272, 250) style:UITableViewStyleGrouped];\nmyTable.backgroundColor = [UIColor clearColor];\n[myTable setDataSource:self];\n[myTable setDelegate:self];\n\nIn the table, we set the backgroundColor to clearColor to add to the effect. If you don't, then you'll have the pinstripe background overlaid on your alert, which looks ugly. The moment you've been waiting for, the creation of the alert:\n\nUIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@\"Table Subclass\" message:@\"\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\" delegate:self cancelButtonTitle:nil otherButtonTitles:@\"OK\", nil];\n[theAlert addSubview:myTable];\n[theAlert show];\n[theAlert release];\n[myTable release];\n\nAgain, you should already know what this is if you read my previous tutorials. We create an alert and fill it with line breaks to make the alert bigger.\n\nAnd again, add the standard methods to finish setting up the table views(read the UITableView tutorial for more on these methods):\n\n- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {\n//Create 2 sections\nreturn 2;\n}\n\n- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {\nswitch(section){\ncase 0: return [tableData count]; break;\ncase 1: return [tableData2 count]; break;\ndefault: break;\n}\nreturn -1;\n}\n\n- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{\n\nUITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@\"Cell %i\",indexPath.section]];\n\nif (cell == nil) {\n\ncell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:[NSString stringWithFormat:@\"Cell %i\",indexPath.section]] autorelease];\n\n}\n\n\nswitch(indexPath.section){\ncase 0:{ cell.textLabel.text = [tableData objectAtIndex: indexPath.row];\ncell.textLabel.textColor = [UIColor whiteColor];\n} \nbreak;\ncase 1:{ \ncell.textLabel.text = [tableData2 objectAtIndex: indexPath.row];\ncell.textLabel.textColor = [UIColor whiteColor];\n} \nbreak;\ndefault: break;\n}\n\n//give cell no background for effect\n\ncell.backgroundColor = [UIColor clearColor];\n\n//don't highlight selection of cells\n\ncell.selectionStyle = UITableViewCellSelectionStyleNone;\n\nreturn cell;\n}\n\nRemember to not add those methods -inside- of loadView. Place these methods -after- loadView and before @end. If all went well, then you should have one pretty cool looking table alert. Happy coding!\n"
    
    let oneTimeAlertDetail = "\nSoon...!\n"
    
    let inAppMailDetail = "\nPart 1: The necessary protocol\n\nMy tutorials will start to get more advanced as I now assume that you have read earlier parts of my tutorials, or you are possibly skipping to this one because you already have a basic understanding of Obj-C. Either way, I'll try to keep it as simple as possible. On with the tutorial!\n\nHave you ever noticed that some apps have in-app e-mail for getting app support? Well I've decided to include that into this version of Theos Tutorials and I'll share how to do this with you now.\n\nLet's open up MobileTerminal and fire up NIC. In NIC, make a new iphone/application project and call it mailapp.\n\nOnce you fill in all the details, close MobileTerminal and open up iFile. Locate the mailapp directory in var/mobile. Now, let's start by adding a few things to RootViewController.h. We're going to add the MFMailComposeViewControllerDelegate protocol which will enable us to use the in-app mail system:\n\n@interface mailapp: UIViewController <MFMailComposeViewControllerDelegate>\n\nWhen you are done editing, close RootViewController.h, and open up your RootViewController.mm file.\n\nPart 2: Implement In-App Mail!\n\nIn your loadView method, create a UIButton that will call a method called sendMail.\n\n- (void)sendMail {\n\n}\n\nNow, we will start to fill in sendMail with the proper code to activate the mail controller. In the method sendMail:\n\nMFMailComposeViewController *compose = [[MFMailComposeViewController alloc] init];\n\nThe above code will declare the in-app mail controller. Add a new line below it and place the following code:\n\ncompose.mailComposeDelegate = self;\n\nThis code simply activates the protocol from RootViewController.h(if there's a better way to explain this line, please drop me an e-mail.)\n\nThe following if statement will set up the email(I'll use comments to explain the code and make it copy/paste friendly):\n\nif ([MFMailComposeViewController canSendMail]){\n//NSArray that holds recipient list\nNSArray *toRecipients = [NSArray arrayWithObjects:@\"ReverseEffect@live.com\", nil];\n//Actually set the recipients\n[compose setToRecipients:toRecipients];//Change the subject of the e-mail\n[compose setSubject:@\"Theos Tutorials\"];\n//Anything you want to be in the message body\n[compose setMessageBody:@\"Name/Username:\nDevice Type:\nBugs:\nSuggestions:\n\" isHTML:NO];\n//Show the custom mail controller\n[self presentModalViewController:compose animated: YES];\n}\n[compose release];\n\nPut that code into the sendMail method and your mail controller will appear upon touch of your UIButton! However, if you do try it, then some may notice that the controller won't disappear upon sending or canceling a message. So, we need to add another method to handle this:\n\n- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {\n[self dismissModalViewControllerAnimated:YES];\n}\n\nAnd that concludes how to add native in-app mail control to your applications! Until next time! Happy coding!\n"
    
    let openURLsSafari = "\nWelcome to Chapter 7!  In this chapter/lesson all-in-one kind of thing, I'm going to teach you how to open a URL in Safari that you, the dev will choose for the user when they tap on a button.\n\nThe code to open a specific URL in Safari from your app is:\n\n[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@\"http://developer.apple.com/library/ios/DOCUMENTATION/UIKit/Reference/UIButton_Class/UIButton/UIButton.html\"]];\n\nThis is an example of opening Safari to Apple's UIButton Class Reference webpage.  Pretty neat, huh?!  No declaration needed, no allocations or releases, just a simple developer-defined code.  Implement this into one of your button press methods, or your buttonIndex method if launching from an alert.  That's about it for that.  Fastest chapter so far!\n\nI'll go ahead and talk to you about Chapter 8.  It was designed at first to prepare  your app for launch at the Cydia store.  As I add lessons to my app, they will also be added to chapter 8 as well.\n\nFrom me to you, dev to dev (or dev to future dev), I want you to come up with a great idea for a useful application for the jailbreak community.  Cydia is full of themes that most jailbreakers are actually sick of.  Waaaaay to many Winterboard themes.  Don't get me wrong, but I think some themes are pretty epic, but us developers need to be the next big thing and GIVE people a reson to jailbreak their iDevices.  We need to become another advantage to jailbreaking.  If you've stuck with me throughout the entire app and are going to develop apps on the Cydia store, then I thank you as it is my goal to help Cydia get more jailbreak apps.  Cydia is in NEED of developers.  I can't wait to see your ideas on Cydia!  I hope you enjoyed my Theos Tutorials/Developer's Reference!  Happy Coding!\n\n-ReverseEffect\n"
    
    
    
    let otherNotes = [
        "SpringBoard Icon",
        "Default.png",
        "App Background",
        "Submit App"
    ]
    
    let springBoardIconDetail = "\nWelcome! The first three lessons in this section are all about the presentation of your app. In this lesson, we are just going to talk about the small icon that represents your app. If this looks good, it'll give a good first impression to the user before they even use your app!\n\nRecommended tools for this job are IconMaker(free from Cydia) and ArtStudio from the AppStore(I don't think it's free, but it's like a miniature Photoshop in an iPhone app. Very nice.) Only get ArtStudio if you want to draw your own icon. Otherwise, do a Google Images search relevant to the app you are making(DO NOT GET COPYRIGHT CONTENT WITHOUT THE AUTHOR'S PERMISSION!). Save the image you want to your Camera Roll. Close your browser. Make sure it has a resolution of about 150x150, 160x160, 180x180. Just somewhere in that range. If the resolution of your source image is too low, then you'll end up with a low-quality icon. If the resolution is too high, then your icon will be distorted. Optional: Use ArtStudio to tweak your icon the way you want it.\n\nLet's open IconMaker and change a few settings. Turn the switch off for Save to Photo Library(it's pointless to send your icon back to the photo library so you can just go hunt it down, rename it, etc.). Optional: Apply Overlay and Apply Shadow switches stay on for me, but that's because I like them, if you don't like them, then just turn them off(that was a run-on sentence, but I'm no English teacher.) Turn the switch on for Open In iFile. Next, click the button for Additional Settings. The first two switches are optional, but the Three Files switch is mandatory for your app, so turn that one on. If you have your image, then your ready to make your icon.\n\nTap on the icon in the top right corner that has a camera in it and choose your image from the Camera Roll. After you do that, the Generate Icon button will appear. Push that button. iFile should open up and pull up a prompt. Just tap on Cancel. Now, move all three icons to your app workspace's Resources folder.\n\nRebuild your app. If your icon doesn't update in SpringBoard, then you'll need to respring to see the changes. If you want premade sample icons, then they'll be in my SkyDrive documents. Just click on the SkyDrive button at the bottom of my app to access them. In the next lesson, we'll learn about Default.png, which is the image your app first pulls up before your app actually loads. Remember, first impressions DO count!\n"
    
    let defaultPNGDetail = "\nWe're going to continue on with focusing on the presentation and view of your app. In this lesson, we're going to work with the Default.png file. In iOS, there are 2 different Default images. First is the Default.png which is for older, non-retina display iDevices. This image has a resolution of 320x460. And then there's the Default@2x.png which is for iPhone/iPod touch 4 and up. Default@2x.png resolution is 640x920.\n\niOS is a smart OS. So it knows which image to use automatically, but you still have to put both Default and Default@2x in your apps because if someone downloads your app and you supply just a Default@2x and they have an iPhone 3G, it'll look huge on their screen. So, make sure you supply both so their device can respectively choose between Default and Default@2x.\n\nNow, go create your Default and Default@2x images using Paint or even ArtStudio if you went and got it. Make sure you set the correct resolutions with the correct names as well.\n\nNOTE: If you used a computer to create your Default images, then iFunBox is a good desktop application to access your iPhone's filesystem. Place your amazing Default images in your project's Resources folder. Rebuild and run your application. Your app should now show off your amazingness Default image while starting up!\n"
    
    let appBackgroundDetail = "\nWelcome. In this lesson, we are going to focus on coding in our RootViewController.mm one more time to set a background image for your application. If you took a look at the previous lesson, then you'll probably notice the rules are the same. In this example, my background image is going to be named Background.png and Background@2x.png. The dimensions for Background's images are the same for Default's images. In other words(in terms of resolution), Background = Default, Background@2x = Default@2x. NOTE: You can modify the code I'm about to give you to make the background of your app the Default.png(and Default@2x.png) image. Here's what we've got figured out so far:\n\nBackground = 320x460\nBackground@2x = 640x920\nDefault = 320x460\nDefault@2x = 640x920\n\nNow that we have that established, you can now go to create your Background.png or find one(I'll have a sample one up on SkyDrive, if interested).\n\nLet's go on! Now that you have your Background and Background@2x files, place them in your workspace's Resources folder. Now open up your RootViewController.mm, and look at the first few lines of the loadView method and find the self.view.backgroundColor = [UIColor redColor]; line of code. Replace that code with the following code:\n\nself.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@\"Background”]];\n\nThis tells your code to look for your Background.png and Background@2x.png and choose according to the type of display your iPhone/iPod Touch has(another smart piece of code!). Now build and run your code and you should see you have your Background.png(or Background@2x) image set to your app. NOTES: make sure you DO NOT specify extensions like the .png or put the @2x in the code. Just leave it like it says. Now that you have your app ready for the Cydia store, head to lesson 4!\n"
    
    let submitAppDetail = "\nOk, here is the final step our programming journey! There are 2 great default Cydia repositories that will host your app. If it is a paid app, then good luck getting it accepted. I will be releasing my application on ModMyi's default repo. BigBoss is the owner of the other default repo. If you're familiar with the jailbreak scene then you'll understand what I mean by default repos. These sources appear in Cydia by default. So you need to find your personal preference of which repo you want your app hosted. You cannot host on BOTH default sources at the same time. ModMyi won't allow it unfortunately. I like ModMyi better when it comes to selection of apps. BigBoss has a lot of professional apps, but is cluttered, in my opinion, due to excessive amounts of themes. Register for the website before you submit so you'll be able to manage your package through your account. Make sure you have screenshots and your DEB file(the last .deb package in your project workspace). Just fill in the Cydia package submission form to have you app checked and you'll receive a PM to to your account when your package goes live(or if it doesn't).\n"
    
    
    let tweaks = [
        "Basic Tweak",
        "Preference Bundle"
    ]
    
    let BasicTweak = "\nWelcome to the tweak tutorial of Theos Tutorials. I actually didn't like the idea of putting a tweak tutorial into Theos Tutorial for the reasons that I personally do not find an enjoyment in writing tweaks and that there are many other tutorials regarding tweaks with Theos and Logos.\n\nNow, let's go over the concept of what a tweak actually is. NOTE:Logos IS supported by MobileSubstrate!!!  A tweak is a MobileSubstrate addon that allows you to -slightly- change a part of iOS to your liking. In this tutorial, we're going to override the function of the power button which is on the top of your iDevice and inject our own custom code. So, let's get started.\n\nFirst you need to download private and public frameworks of iOS and put them all in /var/theos/include by going to this link:\nhttp://apple.com\n\nNow let's code and compile!Open WhiteTerminal/MobileTerminal and launch NIC. Select the iphone/tweak template. We will call it PowerInject as the project name. Package ID will be com.yourname.powerinject. Enter your name. Then, MobileSubstrate filter will be com.apple.springboard.\n\nNow let's close MobileTerminal and open iFile. Go into the powerinject project folder and open Tweak.xm.\n\nDelete everything in it!!!\n\nNow, you should have a blank Tweak.xm file. Let's type on the first line with the following code to include SpringBoard's header:\n\n#import <SpringBoard/SpringBoard.h>\n\nAdd a couple of blank lines and on the second line, add the following:\n\n%hook SBPowerDownController\n\nThis tells Logos/Theos to make your application hook to the SBPowerDownController class inside of SpringBoard(access the power down controller). Now let's access the orderFront method(which brings the power down controller into view) by adding the method to our tweak:\n\n- (void)orderFront {\n\n}\n\nWith this method now in our tweak, we can proceed to override it and insert our own code into it. We're just going to show a simple alert in our tweak telling the user what we're doing here. So, let's edit the orderFront method to show this alert instead of showing the power down controller:\n\n- (void)orderFront {\n\nUIAlertView *powerInjectAlert = [[UIAlertView alloc] initWithTitle:@\"PowerInject\" message:@\"The developer can insert custom code here against your will!\" delegate:self cancelButtonTitle:nil otherButtonTitles:@\"Awww :\'(\", nil];\n[powerInjectAlert show];\n[powerInjectAlert release];\n\n}\n\nNow, let's close our hook by adding %end after the closing bracket and let's take a look at our finished product:\n\n#import <SpringBoard/SpringBoard.h>\n\n%hook SBPowerDownController\n\n- (void)orderFront {\n\nUIAlertView *powerInjectAlert = [[UIAlertView alloc] initWithTitle:@\"PowerInject\" message:@\"The developer can insert custom code here against your will!\" delegate:self cancelButtonTitle:nil otherButtonTitles:@\"Awww :'(\", nil];\n[powerInjectAlert show];\n[powerInjectAlert release];\n\n}\n%end\n\nAnd there we have it! :D Hope you enjoyed! Happy coding!\n"
    
    
    // FILE PATH AWELNAWI NASADE
    let filePathPartTwoPreferenceTweak: String = Bundle.main.path(forResource: "PreferenceBundle", ofType: "txt")!
    var PreferenceBundleDetail: NSString = ""
    
    
    let tweakVideos = [
        "Billy Ellis (iOS 8 - Preference Bundle)",
        "** Submit a Video **"
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        splitViewController?.preferredDisplayMode = .allVisible
        splitViewController!.maximumPrimaryColumnWidth = 300
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? LibraryDetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 16
        case 1:
            return 9
        case 2:
            return 4
        case 3:
            return 2
        case 4:
            return 2
        default:
            break
        }
        
        return section
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.font = cellFont
        cell.detailTextLabel?.font = cellFont
        
        // Configure the cell...
        if indexPath.section == 0 {
            cell.imageView?.image = UIImage(named: "")
            cell.textLabel?.text = developersLibrary[indexPath.row]
            cell.detailTextLabel?.text = developersLibaryDetail[indexPath.row]
        }
        
        if indexPath.section == 1 {
            cell.imageView?.image = UIImage(named: "")
            cell.textLabel?.text = specialLessons[indexPath.row]
            cell.detailTextLabel?.text = ""
        }
        
        if indexPath.section == 2 {
            cell.imageView?.image = UIImage(named: "")
            cell.textLabel?.text = otherNotes[indexPath.row]
            cell.detailTextLabel?.text = ""
        }
        
        if indexPath.section == 3 {
            cell.imageView?.image = UIImage(named: "Tweak")
            if indexPath.row == 1 {
                do {
                    let stringContentPartTwoPreferenceTweak: String = try String(contentsOfFile: filePathPartTwoPreferenceTweak, encoding: String.Encoding.utf8)
                    PreferenceBundleDetail = "\(stringContentPartTwoPreferenceTweak)" as NSString
                } catch _ {
                    /* Error */
                }
            }
            cell.textLabel?.text = tweaks[indexPath.row]
            cell.detailTextLabel?.text = ""
        }
        
        if indexPath.section == 4 {
            switch indexPath.row {
            case 0:
                cell.imageView?.image = UIImage(named: "YouTube Play-25")
            case 1:
                cell.imageView?.image = UIImage(named: "Video Editing-25")
            default:
                break
            }
            
            cell.textLabel?.text = tweakVideos[indexPath.row]
            cell.detailTextLabel?.text = ""
        }
        
        return cell
    }
 
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Developer's Library"
        case 1:
            return "Special Lessons"
        case 2:
            return "Other Notes"
        case 3:
            return "Tweak Tutorials"
        case 4:
            return "Tweak Video Tutorials"
        default:
            break
        }
        
        return "Unknown"
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let billyEllisPreferenceTutorial: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vcBillyEllisPreferenceTutorial = billyEllisPreferenceTutorial.instantiateViewController(withIdentifier: "billyEllisVideoPreferenceBundleViewController") as! BillyEllisVideoPreferenceBundleViewController
        
        if indexPath.section == 4 {
            switch indexPath.row {
            case 0:
                self.navigationController?.popToRootViewController(animated: true)
                self.navigationController?.present(vcBillyEllisPreferenceTutorial, animated: true, completion: nil)
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
        if (segue.identifier == "showLibraryDetail") {
            var detail: LibraryDetailViewController
            let indexPath: IndexPath = tableView.indexPathForSelectedRow!
            
            if let navigationController = segue.destination as? UINavigationController {
                
                detail = navigationController.topViewController as! LibraryDetailViewController
                
                if indexPath.section == 0 {
                    detail.titleText = developersLibrary[indexPath.row] as NSString
                    switch indexPath.row {
                    case 0:
                        detail.textDetailString = UILabelDetail as NSString
                    case 1:
                        detail.textDetailString = UIButtonDetail as NSString
                    case 2:
                        detail.textDetailString = UIAlertViewDetail as NSString
                    case 3:
                        detail.textDetailString = UIAlertControllerDetail as NSString
                    case 4:
                        detail.textDetailString = UIActionSheetDetail as NSString
                    case 5:
                        detail.textDetailString = UINavigationBarDetail as NSString
                    case 6:
                        detail.textDetailString = UINavigationControllerDetail as NSString
                    case 7:
                        detail.textDetailString = bottomNavBarDetail as NSString
                    case 8:
                        detail.textDetailString = UITableViewDetail as NSString
                    case 9:
                        detail.textDetailString = UITableViewControllerDetail as NSString
                    case 10:
                        detail.textDetailString = UIViewControllerDetail as NSString
                    case 11:
                        detail.textDetailString = UIViewDetail as NSString
                    case 12:
                        detail.textDetailString = UIToolBarDetail as NSString
                    case 13:
                        detail.textDetailString = UITabBarControllerDetail as NSString
                    case 14:
                        detail.textDetailString = UISegmentedControllDetail as NSString
                    case 15:
                        detail.textDetailString = UIWebViewDetail as NSString
                    default:
                        break
                    }
                }
                
                if indexPath.section == 1 {
                    detail.titleText = specialLessons[indexPath.row] as NSString
                    switch indexPath.row {
                    case 0:
                        detail.textDetailString = shellCommandsDetail as NSString
                    case 1:
                        detail.textDetailString = addingTagsDetail as NSString
                    case 2:
                        detail.textDetailString = customizeUITableViewDetail as NSString
                    case 3:
                        detail.textDetailString = lineBreaksDetail as NSString
                    case 4:
                        detail.textDetailString = alertPlusWebViewDetail as NSString
                    case 5:
                        detail.textDetailString = alertPlusTableDetail as NSString
                    case 6:
                        detail.textDetailString = oneTimeAlertDetail as NSString
                    case 7:
                        detail.textDetailString = inAppMailDetail as NSString
                    case 8:
                        detail.textDetailString = openURLsSafari as NSString
                    default:
                        break
                    }
                }
                
                if indexPath.section == 2 {
                    switch indexPath.row {
                    case 0:
                        detail.textDetailString = springBoardIconDetail as NSString
                        detail.titleText = "App Icon"
                    case 1:
                        detail.textDetailString = defaultPNGDetail as NSString
                        detail.titleText = "Default.png"
                    case 2:
                        detail.textDetailString = appBackgroundDetail as NSString
                        detail.titleText = "App Background"
                    case 3:
                        detail.textDetailString = submitAppDetail as NSString
                        detail.titleText = "Submit App"
                    default:
                        break
                    }
                }
                
                if indexPath.section == 3 {
                    switch indexPath.row {
                    case 0:
                        detail.textDetailString = BasicTweak as NSString
                        detail.titleText = "Basic Tweak"
                    case 1:
                        detail.textDetailString = PreferenceBundleDetail
                        detail.titleText = "Preference Bundle"
                    default:
                        break
                    }
                }
                
            } else {
                detail = segue.destination as! LibraryDetailViewController
                
                if indexPath.section == 0 {
                    detail.titleText = developersLibrary[indexPath.row] as NSString
                    switch indexPath.row {
                    case 0:
                        detail.textDetailString = UILabelDetail as NSString
                    case 1:
                        detail.textDetailString = UIButtonDetail as NSString
                    case 2:
                        detail.textDetailString = UIAlertViewDetail as NSString
                    case 3:
                        detail.textDetailString = UIAlertControllerDetail as NSString
                    case 4:
                        detail.textDetailString = UIActionSheetDetail as NSString
                    case 5:
                        detail.textDetailString = UINavigationBarDetail as NSString
                    case 6:
                        detail.textDetailString = UINavigationControllerDetail as NSString
                    case 7:
                        detail.textDetailString = bottomNavBarDetail as NSString
                    case 8:
                        detail.textDetailString = UITableViewDetail as NSString
                    case 9:
                        detail.textDetailString = UITableViewControllerDetail as NSString
                    case 10:
                        detail.textDetailString = UIViewControllerDetail as NSString
                    case 11:
                        detail.textDetailString = UIViewDetail as NSString
                    case 12:
                        detail.textDetailString = UIToolBarDetail as NSString
                    case 13:
                        detail.textDetailString = UITabBarControllerDetail as NSString
                    case 14:
                        detail.textDetailString = UISegmentedControllDetail as NSString
                    case 15:
                        detail.textDetailString = UIWebViewDetail as NSString
                    default:
                        break
                    }
                }
                
                if indexPath.section == 1 {
                    detail.titleText = specialLessons[indexPath.row] as NSString
                    switch indexPath.row {
                    case 0:
                        detail.textDetailString = shellCommandsDetail as NSString
                    case 1:
                        detail.textDetailString = addingTagsDetail as NSString
                    case 2:
                        detail.textDetailString = customizeUITableViewDetail as NSString
                    case 3:
                        detail.textDetailString = lineBreaksDetail as NSString
                    case 4:
                        detail.textDetailString = alertPlusWebViewDetail as NSString
                    case 5:
                        detail.textDetailString = alertPlusTableDetail as NSString
                    case 6:
                        detail.textDetailString = oneTimeAlertDetail as NSString
                    case 7:
                        detail.textDetailString = inAppMailDetail as NSString
                    case 8:
                        detail.textDetailString = openURLsSafari as NSString
                    default:
                        break
                    }
                }
                
                if indexPath.section == 2 {
                    switch indexPath.row {
                    case 0:
                        detail.textDetailString = springBoardIconDetail as NSString
                        detail.titleText = "App Icon"
                    case 1:
                        detail.textDetailString = defaultPNGDetail as NSString
                        detail.titleText = "Default.png"
                    case 2:
                        detail.textDetailString = appBackgroundDetail as NSString
                        detail.titleText = "App Background"
                    case 3:
                        detail.textDetailString = submitAppDetail as NSString
                        detail.titleText = "Submit App"
                    default:
                        break
                    }
                }
                
                if indexPath.section == 3 {
                    switch indexPath.row {
                    case 0:
                        detail.textDetailString = BasicTweak as NSString
                        detail.titleText = "Basic Tweak"
                    case 1:
                        detail.textDetailString = PreferenceBundleDetail
                        detail.titleText = "Preference Bundle"
                    default:
                        break
                    }
                }
            }
        }
    }
}



