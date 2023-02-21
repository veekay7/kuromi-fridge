import Foundation
import UIKit


struct Item: Codable {
    let barcode: Int64
    let name: String
    let expire_date: String
    let location: String
    let image: URL
    let amount: Int
}
