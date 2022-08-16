import UIKit

class ShoppingCartNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationBar.tintColor = UIColor(named: "NavBarTintColor")

        self.navigationBar.backIndicatorImage = UIImage(named: "BackButton")
        self.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "BackButton")
        self.navigationBar.topItem?.backButtonDisplayMode = .minimal

        self.navigationBar.titleTextAttributes = [
            .font : UIFont(name: "Raleway-Bold", size: 20)!
        ]
    }
}
