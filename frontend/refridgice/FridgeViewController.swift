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
        
        print(searchItems(barcode: ""))
        print(searchItems(barcode: "12345"))
        print(searchItemById(id: "1"))
    }
    
    func searchItems(barcode: String) -> [Item] {
        let url = URL(string: "https://kuromi.amota.net/api/items/?barcode=" + barcode)!
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
            let items: [Item] = try decoder.decode([Item].self, from: rowData)
            return items
        } catch let e {
            print("JSON Decode Error :\(e)")
            fatalError()
        }
    }
    
    func searchItemById(id: String) -> Item {
        let url = URL(string: "https://kuromi.amota.net/api/items/" + id)!
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
    
    func AddItem(item: Item) {
        let url = URL(string: "https://kuromi.amota.net/api/items/")!
        var request = URLRequest(url: url)
        let encoder: JSONEncoder = JSONEncoder()
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let item = try! encoder.encode(item)
 
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: item, options: [])
        }catch{
            print(error.localizedDescription)
        }

        // use NSURLSessionDataTask
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {data, response, error in
            if (error == nil) {
                let result = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)!
                print(result)
            } else {
                print(error as Any)
            }
        })
        task.resume()
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
