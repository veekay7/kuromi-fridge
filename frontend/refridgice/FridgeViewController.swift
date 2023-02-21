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
        
//        let url: URL = URL(string: "https://kuromi.amota.net/api/items")!
//        let task: URLSessionTask = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print("error", error)
//            }
//
//            do {
//                let decoded = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [Any]
//                let items = decoded.map { (item) -> [String: Any] in return item as! [String: Any]}
//                print(items)
//            } catch {
//                print(error)
//            }
//        }
//
//        task.resume()
        print(searchItem(query: "1"))
    }
    
    func searchItem(query: String) -> Item {

            let url = URL(string: "https://kuromi.amota.net/api/items/" + query)!
            print(url)
            var request = URLRequest(url: url)
            var rowData = Data()
            let semaphore = DispatchSemaphore(value: 0)
            let decoder: JSONDecoder = JSONDecoder()
            request.httpMethod = "GET"

            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else { return }
                rowData = data
                semaphore.signal()
            }
            task.resume()
            _ = semaphore.wait(timeout: DispatchTime.distantFuture)

            do {
                let item: Item = try decoder.decode(Item.self, from: rowData)
                return item
            } catch let e {
                print("JSON Decode Error :\(e)")
                fatalError()
            }
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
