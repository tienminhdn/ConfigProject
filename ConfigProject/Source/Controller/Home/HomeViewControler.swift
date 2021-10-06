import UIKit

final class HomeViewControler: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var label: UILabel!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        label.text = AppConfiguration.infoForKey(.baseURL)
        
    }

    // MARK: - Private functions
}
