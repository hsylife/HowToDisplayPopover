//
//  ViewController.swift
//  HowToDisplayPopover
//
//  Created by Y.T. Hoshino on 2016/10/11.
//  Copyright © 2016年 Yuta Hoshino. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverControllerDelegate, UIPopoverPresentationControllerDelegate {

    var popover: UIPopoverController?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Only for iPad
    //UIPopoverController is for iOS 3.2-9.0. Deperecated in iOS 9.
    //Need release of popover
    @IBAction func tapUIPopoverController(_ sender: UIButton) {
        
        //Only for iPad
        if UIDevice.current.userInterfaceIdiom != .pad {
            print("UIPopoverController is only for iPad.")
            return
        }
        
        //Prepare the instance of ContentViewController which is the content of popover.
        let contentVC = ContentViewController()
        //set size
        contentVC.preferredContentSize = CGSize(width: 300, height: 300)
        //make popover controller
        popover = UIPopoverController(contentViewController: contentVC)
        //set delegate
        popover?.delegate = self
        //present
        popover?.present(from: sender.frame, in: view, permittedArrowDirections: .any, animated: true)
    }
    
    //UIPopoverControllerDelegate for UIPopoverController
    func popoverControllerDidDismissPopover(_ popoverController: UIPopoverController) {
        //release
        popover = nil
    }
    
    
    // Only for iOS8+
    // Both for iPad and iPhone
    @IBAction func tapModalPresentationStyle(_ sender: UIButton) {
        //Prepare the instance of ContentViewController which is the content of popover.
        let contentVC = ContentViewController()
        //define use of popover
        contentVC.modalPresentationStyle = .popover
        //set size
        contentVC.preferredContentSize = CGSize(width: 300, height: 300)
        //set origin
        contentVC.popoverPresentationController?.sourceView = view
        contentVC.popoverPresentationController?.sourceRect = sender.frame
        //set arrow direction
        contentVC.popoverPresentationController?.permittedArrowDirections = .any
        //set delegate
        contentVC.popoverPresentationController?.delegate = self
        //present
        present(contentVC, animated: true, completion: nil)
    }

    //UIPopoverPresentationControllerDelegate
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
    }
    
    /// Popover appears on iPhone
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}

