//
//  AppDelegate.swift
//  WebWrap
//
//  Created by Max Fechner on 02.04.16.
//  Copyright © 2016 max.pub. All rights reserved.
//

import Cocoa
import WebKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var web: WebView!
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // hide title
        self.window.titleVisibility = NSWindowTitleVisibility.Hidden;
        self.window.titlebarAppearsTransparent = true;
        self.window.styleMask |= NSFullSizeContentViewWindowMask;
        
        // hide buttons
        self.window!.standardWindowButton(NSWindowButton.CloseButton)!.hidden = true
        self.window!.standardWindowButton(NSWindowButton.MiniaturizeButton)!.hidden = true
        self.window!.standardWindowButton(NSWindowButton.ZoomButton)!.hidden = true
        
        // load html
        let home = NSBundle.mainBundle().resourcePath!;
        let url = NSURL(fileURLWithPath: home+"/web/index.html")
        let request = NSURLRequest(URL: url)
        self.web.mainFrame.loadRequest(request)
        
        // connect javascript-bridge
        self.web.windowScriptObject.setValue(JsHost(), forKey: "macOS")
    }

    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

}





// Create class which we later hook into the javascript side of the world
class JsHost : NSObject {
    
    func moveTo(x: Int, y: Int) {
//        print("moveTo");
//        print(x,y);
//        print(NSApplication.sharedApplication().mainWindow?.frame.origin)
        NSApplication.sharedApplication().mainWindow?.setFrameOrigin(NSPoint(x:x,y:y))
    }
    func moveBy(x: Int, y: Int) {
//        print("moveBy");
//        print(x,y);
        let base = NSApplication.sharedApplication().mainWindow?.frame.origin
//        print(base!.x,base!.y)
        NSApplication.sharedApplication().mainWindow?.setFrameOrigin(NSPoint(x:Int(base!.x)+x, y:Int(base!.y)-y))
    }
    
    func log(msg: String) {
        print("JavaScript: " + msg)
    }
    
    func hostName() -> String {
        return "MacOS X WebKit"
    }
    
    func hide() {
        NSApplication.sharedApplication().hide(self)
    }
    
    
    deinit {
        print("JsHost destroy.")
    }
    
    // Create alias in javascript env so that one can call bridge.getColor(...)
    // instead of bridge.getColorWith_green_blue_alpha_(...)
    override class func webScriptNameForSelector(aSelector: Selector) -> String!  {
            switch aSelector {
            case #selector(JsHost.moveTo(_:y:)):
                return "moveTo"
                
            case #selector(JsHost.moveBy(_:y:)):
                return "moveBy"
                
            case #selector(JsHost.log(_:)):
                return "log"
                
            case #selector(JsHost.hide):
                return "hide"
                
            case #selector(JsHost.hostName):
                return "hostName"
                
            default:
                return nil
            }
    }
    
    // Only allow the two defined functions to be called from JavaScript
    // Same applies to variable access, all blocked by default
    override class func isSelectorExcludedFromWebScript(aSelector: Selector) -> Bool {
            switch aSelector {
            default:
                return false
            }
    }
}































//override class func isSelectorExcludedFromWebScript(aSelector: Selector) -> Bool {
//    switch aSelector {
//    default:
//        return false
//    }
//}







//        self.web.windowScriptObject.setValue(self, forKey: "macOS")



//        super.viewDidLoad()
//        print(NSBundle.mainBundle().resourcePath!+"/web")



//        let urlpath = NSBundle.mainBundle().pathForResource("index", ofType: "html");
//        let url = NSURL(fileURLWithPath:urlpath);
//        let url = NSURL(string: "http://www.spiegel.de")







//    - (void)windowDidLoad{
//    [[webView windowScriptObject] setValue:self forKey:@"objcConnector"];
//    ....
//    }

//    func isSelectorExcludedFromWebScript (sel: Selector) -> Bool {
//        return false;
////        if (aSelector == @selector(elementClicked:)) return NO;
////        return YES;
//    }
//    func webScriptNameForSelector:(SEL)sel
//    {
//    if(sel == @selector(logJavaScriptString:))
//    return @"log";
//    return nil;
//    }

//    func closeIt () -> Bool {
//        print("yeah yeah");
//        return true;
//    //object is the id of the element
//    }


//        self.window.titlebarAppearsTransparent = true
//        self.window.setContentBorderThickness(0.0, forEdge:0.0)
//        self.window.setStyleMa
//        self.window!.level = Int(CGWindowLevelForKey(Int32(kCGDraggingWindowLevelKey)))
//        self.window!.collectionBehavior = NSWindowCollectionBehavior.Stationary | NSWindowCollectionBehavior.FullScreenAuxiliary | NSWindowCollectionBehavior.CanJoinAllSpaces | NSWindowCollectionBehavior.IgnoresCycle

//        print(NSBundle.mainBundle().resourceURL)


//        var url = NSURL(fileURLWithPath:urlpath!);
//        let req = NSURLRequest (URL: url!)
//        self.web.mainFrame.loadRequest(req)

//        web.shouldCloseWithWindow = true
//
////        let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("index", ofType:"html", subdirectory: "web")!)
////        let url = NSURL(fileURLWithPath: "index")
////                let url = NSURL(string: "http://spiegel.de")
//                let url = NSURL(string: "file://web/index.html")
//        let req = NSURLRequest (URL: url!)
//        self.web.mainFrame.loadRequest(req)
//
//        // Insert code here to initialize your application

//    func applicationDidFinishLaunching(aNotification: NSNotification?)
//    {
//        self.window.title = "My App Title"
//
//        var try6 = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("index", ofType:"html")!)
//
//        var request = NSURLRequest(URL: try6!);
//
//        self.web.frameLoadDelegate = self;
//        self.web.mainFrame.loadRequest(request);


//        @IBOutlet var webView: UIWebView!


//    }

//    func loadAddressURL(){
//        let requesturl = NSURL(string: urlpath!)
//        let request = NSURLRequest(URL: requesturl)
//        web.loadRequest(request)
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        loadAddressURL() //func above
//
//        // Do any additional setup after loading the view, typically from a nib.
//    }


