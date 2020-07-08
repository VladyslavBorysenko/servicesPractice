

import Foundation
import AppusViper

protocol SideMenuRouterProtocol: class {
    func dissmissController()
    func mapsControllerEvoke()
    func usersControllerEvoke()
    func messagesControllerEvoke()
    func exploreControllerEvoke()
    func myProfileControllerEvoke()
}

final class SideMenuRouter: ViperRouter {
    weak var viewController: UIViewController!
    weak var presenter: SideMenuPresenterProtocol!
}
//MARK: - Extensions
extension SideMenuRouter: SideMenuRouterProtocol {

    func dissmissController() {
        self.viewController.dismiss(animated: true, completion: nil)
    }
    
    func mapsControllerEvoke(){
        self.viewController.navigationController?.pushViewController(Map().view, animated: true)
    }
    
    func usersControllerEvoke(){
        self.viewController.navigationController?.pushViewController(Users().view, animated: true)
    }
    
    func messagesControllerEvoke(){
        self.viewController.navigationController?.pushViewController(Messages().view, animated: true)
    }
    
    func exploreControllerEvoke(){
        self.viewController.navigationController?.pushViewController(Explore().view, animated: true)
    }
    func myProfileControllerEvoke() {
        self.viewController.navigationController?.pushViewController(MyProfile().view, animated: true)
    }
}
