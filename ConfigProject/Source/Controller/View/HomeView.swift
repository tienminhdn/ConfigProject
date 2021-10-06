import UIKit

final class HomeView: BaseView {

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
