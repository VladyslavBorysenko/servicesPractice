
import Foundation
import AppusViper
import Kingfisher

protocol SideMenuViewProtocol: class {
    var userName: String? { get set }
    var userAvatar: URL? { get set }
}

class SideMenuViewController: UIViewController, ViperView, LogoutAlert {
    
    weak var presenter: (SideMenuPresenterProtocol & IViewLifeCycle)!
    
    //MARK: - IBOutles
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userAvatarImageView: UIImageView!
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad?()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.presenter.viewWillAppear?()
    }
    //MARK: - IBActions
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        presenter.logoutButtonPressed()
    }
    @IBAction func exploreButtonPressed(_ sender: UIButton) {
        presenter.exploreButtonPressed()
    }
    @IBAction func messagesButtonPressed(_ sender: UIButton) {
        presenter.messagesButtonPressed()
    }
    @IBAction func usersButtonPressed(_ sender: UIButton) {
        presenter.usersButtonPressed()
    }
    @IBAction func postsButtonPreessed(_ sender: UIButton) {
        presenter.mapButtonPressed()
    }
    @IBAction func editProfileButtonPressed(_ sender: UIButton) {
        presenter.editProfileButtonPressed()
    }
    
    
    
}
//MARK: - Extensions
extension SideMenuViewController: SideMenuViewProtocol {
    var userName: String? {
        get {
            return self.userNameLabel.text
        }
        set {
            self.userNameLabel.text = newValue
        }
    }
    
    var userAvatar: URL? {
        get {
            return nil
        }
        set {
            self.userAvatarImageView.kf.setImage(with: newValue)
        }
    }
}
