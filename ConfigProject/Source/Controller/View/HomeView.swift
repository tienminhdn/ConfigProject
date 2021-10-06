import UIKit

protocol HomeViewDelegate: AnyObject {
    func vc(_ vc: HomeView, needsPerform action: HomeView.Action)
}

final class HomeView: BaseView {

    // MARK: - IBOutlets
    @IBOutlet private weak var tapButton: UIButton!
    
    weak var delegate: HomeViewDelegate?
    var viewModel: HomeViewVM = HomeViewVM() {
        didSet {
            updateView()
        }
    }

    // MARK: - IBActions
    @IBAction func tapButtonTouchUpInside(_ sender: UIButton) {
        delegate?.vc(self, needsPerform: .tabButton)
    }
    
    // MARK: - Private functions
    private func updateView() {
        //
    }
}

extension HomeView {
    enum Action {
        case tabButton
    }
}
