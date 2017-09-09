import Foundation

public protocol ValidatorProtocol {
    // associatedtype Endpoint;

    // init(endpoint:Endpoint);

    func verify(complete: @escaping (ResponseProtocol) -> Void)
}
