
import Foundation
import AppusViper

class SideMenu: Module<SideMenuViewController, SideMenuPresenter, SideMenuInteractor, SideMenuRouter> {
    override init() {
        super.init()
        self.interactor.userRepository = FirebaseUserRepository()
    }
}
