import Foundation
import AppusViper

protocol SideMenuPresenterProtocol: class {
    func logoutAction()
    func mapButtonPressed()
    func usersButtonPressed()
    func messagesButtonPressed()
    func exploreButtonPressed()
    func editProfileButtonPressed()
    func authFlowEvoke()
    func logoutButtonPressed()
}

final class SideMenuPresenter: ViperPresenter {
    weak var view: (SideMenuViewProtocol & LogoutAlert)!
    weak var interactor: SideMenuInteractorProtocol!
    weak var router: SideMenuRouterProtocol!
}
//MARK: - Extensions
extension SideMenuPresenter: IViewLifeCycle {
    func viewDidLoad() {
        self.view.userName = self.interactor.userName
        self.view.userAvatar = self.interactor.avatarUrl
        
    }
    func viewWillAppear() {
        self.view.userName =  self.interactor.userName
        self.view.userAvatar = self.interactor.avatarUrl
    }
}

extension SideMenuPresenter: SideMenuPresenterProtocol {
    func logoutButtonPressed() {
        view.displayAlert(alertTitle: "Log out?", alertMessage: "Note that you can seamlessly use this account on all your devices at once", completionHandler: { _ in
            self.logoutAction()
            self.authFlowEvoke()
        })
    }
    
    // For reauth
    internal func authFlowEvoke() {
        let appDelegate: AppDelegate? = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.startAppFlow()
    }
    
    func mapButtonPressed() {
        router.mapsControllerEvoke()
    }
    
    func usersButtonPressed() {
        router.usersControllerEvoke()
    }
    
    func messagesButtonPressed() {
        router.messagesControllerEvoke()
    }
    
    func exploreButtonPressed() {
        router.exploreControllerEvoke()
    }
    
    internal func logoutAction() {
        router.dissmissController()
        interactor.logOut()
    }
    
    func editProfileButtonPressed(){
        router.myProfileControllerEvoke()
    }
    
}
