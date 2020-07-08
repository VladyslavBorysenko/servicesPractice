import Foundation
import Firebase

class FirebaseUserRepository {
    private var auth = Auth.auth()
}

//MARK: - Extenstions
extension FirebaseUserRepository: IUserRepository  {
    var userName: String? {
        get {
            return self.auth.currentUser?.displayName
        }
        set {
            let changeRequest = self.auth.currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = newValue
            changeRequest?.commitChanges(completion: nil)
        }
    }
    
    var avatarUrl: URL? {
        get {
            return auth.currentUser?.photoURL
        }
        set {
            let changeRequest = self.auth.currentUser?.createProfileChangeRequest()
            changeRequest?.photoURL = newValue
            changeRequest?.commitChanges(completion: nil)
        }
    }
}
