import Foundation

public protocol ClientProtocol {
    func send(string: String, complete: @escaping (Data?, Error?) -> Void)
}
