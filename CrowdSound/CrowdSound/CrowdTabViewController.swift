//
//  CrowdTabViewController.swift
//  CrowdSound
//
//  Created by Terin Patel-Wilson on 3/6/15.
//  Copyright (c) 2015 cs439. All rights reserved.
//

import UIKit

class CrowdTabViewController: UITabBarController {
        
    var myCrowd : Crowd?
    var player : SPTAudioStreamingController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // TODO: change default screen if host
        self.navigationItem.title = myCrowd?.name
        var settingsBtn : UIBarButtonItem = UIBarButtonItem(title: "Settings", style: UIBarButtonItemStyle.Plain, target: self, action: "settingsBtnClicked:")
        self.navigationItem.rightBarButtonItem = settingsBtn
        self.selectedIndex = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    
    func settingsBtnClicked(sender:UIBarButtonItem!) {
        NSLog("clicked the settings btn!")
        self.performSegueWithIdentifier("GoToSettingsPage", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "GoToSettingsPage" {
            var secondScene = segue.destinationViewController as SettingsTableViewController
            secondScene.myCrowd = myCrowd!
        }
    }
    
    override func willMoveToParentViewController(parent: UIViewController?) {
        let auth = SPTAuth.defaultInstance()
        
        // Checks if there is a player to stop when leaving crowd
        if player != nil {
            self.player?.stop({ (error:NSError!) -> Void in
                NSLog("Stopped player")
            })
        }
    }
    
    /*

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
