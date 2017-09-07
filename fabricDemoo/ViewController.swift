//
//  ViewController.swift
//  fabricDemoo
//
//  Created by Yash Rathod on 06/09/17.
//  Copyright © 2017 Disha Technology. All rights reserved.
//

import UIKit
import Crashlytics
import Optimizely
import Mapbox
import ZendeskSDK

internal var messageKey =
    OptimizelyVariableKey.optimizelyKey(withKey: "message", defaultNSString: "Hello World!")

internal var reportTimeBlocksKey =
    OptimizelyCodeBlocksKey("reportTimeBlocks", blockNames: ["alert", "button"])

class ViewController: UIViewController,MGLMapViewDelegate {
    
   // var map:MGLMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
      /*  map = MGLMapView(frame: view.bounds)
        map.setCenter(CLLocationCoordinate2D(latitude: 40.712791, longitude: -73.997848),
                      zoomLevel: 12,
                      animated: false)
        view.addSubview(map)*/

        let button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 20, y: 50, width: 100, height: 30)
        button.setTitle("Crash", for: [])
        button.addTarget(self, action: #selector(self.crashButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(button)
        
        let messageButton = UIButton(type: .system)
        messageButton.setTitle("Show Message", for: [])
        messageButton.addTarget(self, action: #selector(self.showMessage(_:)), for: .touchUpInside)
        messageButton.frame = CGRect(x: 25, y: 60, width: 200, height: 50)
        view.addSubview(messageButton)
        
        let messageButtonn = UIButton(type: .system)
        messageButtonn.setTitle("Report Time", for: [])
        messageButtonn.addTarget(self, action: #selector(self.reportTime(_:)), for: .touchUpInside)
        messageButtonn.frame = CGRect(x: 90, y: 60, width: 300, height: 50)
        view.addSubview(messageButtonn)
        
      /*  let buttoon = UIButton(type: .system)
        buttoon.setTitle("Open Help Center", for: [])
        buttoon.sizeToFit()
        buttoon.center = view.center
        buttoon.addTarget(self, action: #selector(showHelpCenter), for: [.touchUpInside])
        view.addSubview(buttoon)*/
        
      /*  let buttton = UIButton(type: .system)
        buttton.setTitle("Create A Request", for: [])
        buttton.sizeToFit()
        buttton.center = view.center
        buttton.addTarget(self, action: #selector(showRequestForm), for: [.touchUpInside])
        view.addSubview(buttton)*/
        
        let buttton = UIButton(type: .system)
        buttton.setTitle("Show Open Requests", for: [])
        buttton.sizeToFit()
        buttton.center = view.center
        buttton.addTarget(self, action: #selector(showOpenRequests), for: [.touchUpInside])
        view.addSubview(buttton)





        
    }
    func showOpenRequests() {
        // Apply a light theme to the requests UI
        // Style Navbar
        let navbarAttributes = [NSForegroundColorAttributeName: UIColor.white]
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().barTintColor = UIColor(red: 50.0/255.0, green: 50.0/255.0, blue: 61.0/255.0, alpha: 1.0)
        UINavigationBar.appearance().titleTextAttributes = navbarAttributes
        // Style Support SDK
        let theme = ZDKTheme.base()
        theme.primaryTextColor = UIColor(red: 34.0/255.0, green: 34.0/255.0, blue: 48.0/255.0, alpha: 1.0)
        theme.secondaryTextColor = UIColor(red: 47.0/255.0, green: 46.0/255.0, blue: 63.0/255.0, alpha: 1.0)
        theme.primaryBackgroundColor = UIColor(red: 248.0/255.0, green: 248.0/255.0, blue: 249.0/255.0, alpha: 1.0)
        theme.secondaryBackgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        theme.emptyBackgroundColor = UIColor(red: 248.0/255.0, green: 248.0/255.0, blue: 249.0/255.0, alpha: 1.0)
        theme.metaTextColor = UIColor(red: 139.0/255.0, green: 139.0/255.0, blue: 150.0/255.0, alpha: 1.0)
        theme.separatorColor = UIColor(red: 237.0/255.0, green: 237.0/255.0, blue: 241.0/255.0, alpha: 1.0)
        theme.inputFieldTextColor = UIColor(red: 47.0/255.0, green: 46.0/255.0, blue: 63.0/255.0, alpha: 1.0)
        theme.inputFieldBackgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        theme.apply()

        ZDKRequests.presentRequestList(with: self)
    }

    
    func showRequestForm() {
        // Apply a light theme to the requests UI
        // Style Navbar
        let navbarAttributes = [NSForegroundColorAttributeName: UIColor.white]
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().barTintColor = UIColor(red: 50.0/255.0, green: 50.0/255.0, blue: 61.0/255.0, alpha: 1.0)
        UINavigationBar.appearance().titleTextAttributes = navbarAttributes
        // Style Support SDK
        let theme = ZDKTheme.base()
        theme.primaryTextColor = UIColor(red: 34.0/255.0, green: 34.0/255.0, blue: 48.0/255.0, alpha: 1.0)
        theme.secondaryTextColor = UIColor(red: 47.0/255.0, green: 46.0/255.0, blue: 63.0/255.0, alpha: 1.0)
        theme.primaryBackgroundColor = UIColor(red: 248.0/255.0, green: 248.0/255.0, blue: 249.0/255.0, alpha: 1.0)
        theme.secondaryBackgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        theme.emptyBackgroundColor = UIColor(red: 248.0/255.0, green: 248.0/255.0, blue: 249.0/255.0, alpha: 1.0)
        theme.metaTextColor = UIColor(red: 139.0/255.0, green: 139.0/255.0, blue: 150.0/255.0, alpha: 1.0)
        theme.separatorColor = UIColor(red: 237.0/255.0, green: 237.0/255.0, blue: 241.0/255.0, alpha: 1.0)
        theme.inputFieldTextColor = UIColor(red: 47.0/255.0, green: 46.0/255.0, blue: 63.0/255.0, alpha: 1.0)
        theme.inputFieldBackgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        theme.apply()

        // Add additional data to the request before opening the UI
        ZDKRequests.configure { (account, requestCreationConfig) in
            if let config = requestCreationConfig {
                config.subject = "App Ticket"
                config.tags = ["question", "ios"]
                config.additionalRequestInfo = "\n\nSome sample extra content."
            }
        }
        
        // Open the create request screen
        ZDKRequests.presentRequestCreation(with: self)
    }

    func showHelpCenter() {
        
        // Apply a light theme to the Help Center
        // Style Navbar
        let navbarAttributes = [NSForegroundColorAttributeName: UIColor.white]
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().barTintColor = UIColor(red: 50.0/255.0, green: 50.0/255.0, blue: 61.0/255.0, alpha: 1.0)
        UINavigationBar.appearance().titleTextAttributes = navbarAttributes
        
        // Style Support SDK
        let theme = ZDKTheme.base()
        theme.primaryTextColor = UIColor(red: 34.0/255.0, green: 34.0/255.0, blue: 48.0/255.0, alpha: 1.0)
        theme.secondaryTextColor = UIColor(red: 47.0/255.0, green: 46.0/255.0, blue: 63.0/255.0, alpha: 1.0)
        theme.primaryBackgroundColor = UIColor(red: 248.0/255.0, green: 248.0/255.0, blue: 249.0/255.0, alpha: 1.0)
        theme.secondaryBackgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        theme.emptyBackgroundColor = UIColor(red: 248.0/255.0, green: 248.0/255.0, blue: 249.0/255.0, alpha: 1.0)
        theme.metaTextColor = UIColor(red: 139.0/255.0, green: 139.0/255.0, blue: 150.0/255.0, alpha: 1.0)
        theme.separatorColor = UIColor(red: 237.0/255.0, green: 237.0/255.0, blue: 241.0/255.0, alpha: 1.0)
        theme.inputFieldTextColor = UIColor(red: 47.0/255.0, green: 46.0/255.0, blue: 63.0/255.0, alpha: 1.0)
        theme.inputFieldBackgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        theme.apply()
        ZDKHelpCenter.presentOverview(self, with: ZDKHelpCenterOverviewContentModel.defaultContent())

    }

  /*  override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let marker = MGLPointAnnotation()
        marker.coordinate = map.centerCoordinate
        marker.title = "My Marker"
        marker.subtitle = "It's pretty great"
        map.addAnnotation(marker)
        map.selectAnnotation(marker, animated: true)
    }*/
    
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        return true
    }

    @IBAction func reportTime(_ sender: AnyObject) {
        let message = NSString(format: "It is %@", Date() as CVarArg) as String;
        Optimizely.codeBlocks(with: reportTimeBlocksKey,
                              blockOne: {
                                let alert = UIAlertController(title: "Live Variable",
                                                              message: message,
                                                              preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "OK",
                                                              style: .default,
                                                              handler: { (action) -> Void in }))
                                self.present(alert, animated: true) {}
        },
                              blockTwo: {
                                sender.setTitle(message, for: [])
        },
                              defaultBlock: {
                                print(message)
        })
    }

    @IBAction func showMessage(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Live Variable",
                                      message: Optimizely.string(for: messageKey),
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: nil))
        present(alert, animated: true) {}
    }

    
    @IBAction func crashButtonTapped(_ sender: AnyObject) {
        fatalError()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

