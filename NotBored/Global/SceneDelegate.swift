import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)

        window.rootViewController = UINavigationController(rootViewController: CategoriesView())
        //window.rootViewController = UINavigationController(rootViewController: ActivityView())
        window.makeKeyAndVisible()
        self.window = window
        
    }
}
