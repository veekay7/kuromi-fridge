//
//  FridgeViewController.swift
//  refridgice
//
//  Created by VTK on 9/2/23.
//

import UIKit

class FridgeViewController: UIViewController
{
    @IBOutlet weak var lblSort: UILabel!
    @IBOutlet weak var btnAddItem: UIButton!
    @IBOutlet weak var lblGreeting: UILabel!
    @IBOutlet weak var btnSortItems: UIButton!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Check the time of day and render to the lblGreeting label.
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        if (hour >= 0) && (hour < 12)
        {
            lblGreeting.text = "Good Morning"
        }
        else if (hour >= 12) && (hour < 17)
        {
            lblGreeting.text = "Good Afternoon"
        }
        else if (hour >= 17) && (hour <= 23)
        {
            lblGreeting.text = "Good Evening"
        }
        
        // Setup the sort items button
        let Cb_btnSortItems_MenuClosed = {
            (action: UIAction) in self.update(number: action.title)
        }
        btnSortItems.menu = UIMenu(children: [
                        UIAction(title: "All", state:.on, handler: Cb_btnSortItems_MenuClosed),
                        UIAction(title: "Refridgerator", handler: Cb_btnSortItems_MenuClosed),
                        UIAction(title: "Freezer", handler: Cb_btnSortItems_MenuClosed),
                        UIAction(title: "Alphabetical Order", handler: Cb_btnSortItems_MenuClosed),
                        UIAction(title: "By Expiry", handler: Cb_btnSortItems_MenuClosed),
        ])
        btnSortItems.showsMenuAsPrimaryAction = true
        btnSortItems.changesSelectionAsPrimaryAction = true
    }
    
    
    func update(number:String)
    {
        lblSort.text = number
        if number == "All"
        {
        }
        else if number == "Refridgerator"
        {
        }
        else if number == "Freezer"
        {
        }
        else if number == "Alphabetical Order"
        {
        }
        else if number == "By Expiry"
        {
        }
    }
}
