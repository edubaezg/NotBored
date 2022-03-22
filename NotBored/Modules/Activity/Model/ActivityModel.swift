import Foundation

struct ActivityModel: Codable {
    let activity: String
    let type: String
    let participants: Int
    let price: Double
}
