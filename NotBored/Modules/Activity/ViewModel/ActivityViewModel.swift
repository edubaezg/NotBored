import Foundation

class ActivityViewModel {
    func getActivity(completion: @escaping (Result<ActivityModel, ActivityError>) -> Void) {
        ActivityService.getActivity { result in
            switch result {
            case .success(let activityResponse):
                completion(.success(activityResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
