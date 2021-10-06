import UIKit

final class HomeViewControler: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var homeView: HomeView!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        navigationController?.isNavigationBarHidden = true
        print(AppConfiguration.infoForKey(.baseURL) ?? "minh")
        homeView.delegate = self
    }

    // MARK: - Private functions
}

extension HomeViewControler: HomeViewDelegate {
    func vc(_ vc: HomeView, needsPerform action: HomeView.Action) {
        print("tab button")
    }
}
