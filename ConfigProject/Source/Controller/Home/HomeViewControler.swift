import UIKit

final class HomeViewControler: UIViewController {

    // MARK: - IBOutlets

    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        print(AppConfiguration.infoForKey(.baseURL))
        
    }

    // MARK: - Private functions
}
