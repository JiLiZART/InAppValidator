import Foundation

public protocol ResponseProtocol {
    var isValid: Bool { get }
    var receipt: ReceiptProtocol? { get }
}
