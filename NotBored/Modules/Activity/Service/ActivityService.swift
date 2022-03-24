import Foundation
import Alamofire

enum ActivityError: Error {
    case activityEmpty
}

class ActivityService {
    static let URL = Paths.basePath+"activity"
    
    static func getActivity(completion: @escaping (Result<ActivityModel, ActivityError>) -> Void) {
        AF.request(URL, method: .get, parameters: getParameters(), encoding: URLEncoding.default).response { response in
            
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
    
    static func getParameters() -> [String: String]? {
        //return ["type": "education", "participants": "2"]
        return nil
    }
}
