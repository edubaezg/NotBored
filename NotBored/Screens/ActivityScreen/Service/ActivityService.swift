import Foundation
import Alamofire

enum ActivityError: Error {
    case activityEmpty
}

class ActivityService {
    static let URL = Paths.basePath+"activity"
    
    static func getActivity(_ activityOptions: ActivityOptionsModel, completion: @escaping (Result<ActivityModel, ActivityError>) -> Void) {
        AF.request(URL, parameters: getParameters(activityOptions), encoding: URLEncoding.default).response { response in
            
            guard let activityData = response.data else {
                completion(.failure(.activityEmpty))
                return
            }
            
            do {
                let activityResponse = try JSONDecoder().decode(ActivityModel.self, from: activityData)
                completion(.success(activityResponse))
            } catch {
                completion(.failure(.activityEmpty))
            }
        }
    }
    
    static func getParameters(_ activityOptions: ActivityOptionsModel) -> [String: String] {
        let parameters: [String: String]
        let category = activityOptions.category
        let participants = activityOptions.participants
        
        switch category {
        case "random": parameters = ["participants": participants]
        default: parameters = ["type": category, "participants": participants]
        }
        
        return parameters
    }
}
