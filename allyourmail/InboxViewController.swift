//
//  InboxViewController.swift
//  allyourmail
//
//  Created by Laura Skelton on 9/23/14.
//  Copyright (c) 2014 skelovenko. All rights reserved.
//

import Foundation
import UIKit

var InboxEntryCellIdentifier = "InboxItemCell"

class InboxViewController : UITableViewController, InboxViewInterface {
    var eventHandler : InboxModuleInterface?
    var dataProperty : InboxDisplayData?
    var strongTableView : UITableView?
    
    @IBOutlet var noContentView : UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        strongTableView = tableView
        configureView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        eventHandler?.updateView()
    }
    
    func configureView() {
        navigationItem.title = "Inbox"
        
    }
    
    func showNoContentMessage() {
        view = noContentView!
    }
    
    func showInboxDisplayData(data: InboxDisplayData) {
        view = strongTableView!
        
        dataProperty = data
        reloadEntries()
    }
    
    func reloadEntries() {
        tableView.reloadData()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        var numberOfSections = dataProperty?.sections.count
        
        if dataProperty?.sections.count == nil {
            numberOfSections = 0
        }
        
        return numberOfSections!
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let inboxSection = dataProperty?.sections[section]
        return inboxSection!.items.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let inboxSection = dataProperty?.sections[section]
        return inboxSection!.name
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let inboxSection = dataProperty?.sections[indexPath.section]
        let inboxItem = inboxSection!.items[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier(InboxEntryCellIdentifier, forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel!.text = inboxItem.from;
        cell.detailTextLabel!.text = inboxItem.subject;
        //cell.imageView!.image = UIImage(named: inboxSection!.imageName)
        cell.selectionStyle = UITableViewCellSelectionStyle.None;
        
        return cell
    }
}
