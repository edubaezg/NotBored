import Foundation

class ActivityViewModel {
    func getActivity(_ activityOptions: ActivityOptionsModel, completion: @escaping (Result<ActivityModel, ActivityError>) -> Void) {
        ActivityService.getActivity(activityOptions) { result in
            switch result {
            case .success(let activityResponse):
                completion(.success(activityResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
