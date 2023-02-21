import Foundation

struct Item: Codable {
    let id: Int
    let barcode: Int64
    let name: String
    let expire_date: String
    let location: String
    let image: URL
    let amount: Int
}
