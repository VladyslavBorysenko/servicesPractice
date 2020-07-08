import Foundation
import AppusViper


protocol SideMenuInteractorProtocol: class {
    var userName: String? { get set }
    var avatarUrl: URL? { get set }
    func logOut()
}

final class SideMenuInteractor: ViperInteractor {
    var logOutService = LogoutService()
    weak var presenter: SideMenuPresenterProtocol!
    var userRepository: IUserRepository!
}
//MARK: - Extensions
extension SideMenuInteractor: SideMenuInteractorProtocol {
    func logOut() {
        logOutService.logout()
    }
    
    var userName: String? {
        get {
            return self.userRepository.userName
        }
        set {
            self.userRepository.userName = newValue
        }
    }
    
    var avatarUrl: URL? {
        get {
            return self.userRepository.avatarUrl
        }
        set {
            self.userRepository.avatarUrl = newValue
        }
    }
}

