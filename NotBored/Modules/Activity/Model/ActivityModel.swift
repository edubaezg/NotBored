import Foundation

struct ActivityModel: Codable {
    var activity: String = ""
    var type: String = ""
    var participants: Int = 0
    var price: Double = 0.0
    
    init() {}
}
