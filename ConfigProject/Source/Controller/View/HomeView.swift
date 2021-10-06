import UIKit

final class HomeView: UIView {

    // MARK: - IBOutlets

    var viewModel: HomeViewVM = HomeViewVM() {
        didSet {
            updateView()
        }
    }

    // MARK: - Private functions
    private func updateView() {
        //
    }
}