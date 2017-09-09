import Foundation

public protocol ReceiptProtocol {
    //associatedtype PurchaseItem;

    var code: Int { get }
    var receipt: String { get }
    var purchases: [PurchaseItemProtocol] { get }
}
