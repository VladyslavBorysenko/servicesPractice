import Foundation

protocol IUserRepository: class {
    var userName: String? { get set }
    var avatarUrl: URL? { get set }
}
