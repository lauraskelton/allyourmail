//
//  InboxWireframe.swift
//  allyourmail
//
//  Created by Laura Skelton on 9/23/14.
//  Copyright (c) 2014 skelovenko. All rights reserved.
//

import Foundation
import UIKit

let InboxViewControllerIdentifier = "InboxViewController"

class InboxWireframe : NSObject {
    var inboxPresenter : InboxPresenter?
    var rootWireframe : RootWireframe?
    var inboxViewController : InboxViewController?
    
    func presentInboxInterfaceFromWindow(window: UIWindow) {
        let viewController = inboxViewControllerFromStoryboard()
        viewController.eventHandler = inboxPresenter
        inboxViewController = viewController
        inboxPresenter!.userInterface = viewController
        rootWireframe?.showRootViewController(viewController, inWindow: window)
    }
    
    func inboxViewControllerFromStoryboard() -> InboxViewController {
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewControllerWithIdentifier(InboxViewControllerIdentifier) as InboxViewController
        return viewController
    }
    
    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        return storyboard
    }
    
}
