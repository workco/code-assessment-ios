import UIKit

@MainActor
final class AppCoordinator {
    public var navigationController: ShoppingCartNavigationController?

    public init(navigationController: ShoppingCartNavigationController = .init()) {
        self.navigationController = navigationController
        self.start()
    }

    private func start() {
        let viewController = ProductsViewController(rootView: ProductsView())
        let cartButton = UIBarButtonItem(
            image: UIImage(named: "Bag"),
            style: .plain,
            target: self,
            action: #selector(self.navigationToCart)
        )
        viewController.navigationItem.rightBarButtonItem = cartButton

        navigationController?.setViewControllers([viewController], animated: true)
    }

    @objc private func navigationToCart() {
        let viewController = CartViewController(rootView: CartView())
        navigationController?.pushViewController(viewController, animated: true)
    }
}
