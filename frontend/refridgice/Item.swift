import Foundation

struct Item: Codable {
    let name: String
    let amount: Int
    let id: Int
    let expire_date: Date
    let location: String
    let barcode: Int
    let image: URL
}
