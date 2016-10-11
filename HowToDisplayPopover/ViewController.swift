//
//  ViewController.swift
//  HowToDisplayPopover
//
//  Created by Y.T. Hoshino on 2016/10/11.
//  Copyright © 2016年 Yuta Hoshino. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverControllerDelegate {

    var popover: UIPopoverController?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapUIPopoverController(_ sender: UIButton) {
        
        //Only for iPad
        if UIDevice.current.userInterfaceIdiom != .pad {
            print("UIPopoverController is only for iPad.")
            return
        }
        
        //Prepare the instance of ContentViewController which is the content of popover.
        let contentVC = ContentViewController()
        //set size
        contentVC.preferredContentSize = CGSize(width: 320, height: 280)
        //make popover controller
        popover = UIPopoverController(contentViewController: contentVC)
        //set delegate
        popover?.delegate = self
        //present popover
        popover?.present(from: sender.frame, in: view, permittedArrowDirections: .any, animated: true)
    }
    
    //UIPopoverControllerDelegate
    func popoverControllerDidDismissPopover(_ popoverController: UIPopoverController) {
        popover = nil
    }
    
}

