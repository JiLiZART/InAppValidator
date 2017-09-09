import Foundation

public struct iTunesReceipt: ReceiptProtocol {
    public var code: Int
    public var receipt: String
    public var purchases: [PurchaseItemProtocol]
}

extension iTunesReceipt {
	init?(json: [String: Any]?) throws {
        guard let jsonData = json else {
            throw iTunesSerializationError.emptyJSON
        }

		guard let code = jsonData["status"] as? Int else {
            throw iTunesSerializationError.missing("status");
        }

        guard let receipt = jsonData["receipt"] as? String  else {
            throw iTunesSerializationError.missing("receipt");
        }

        guard let purchases = jsonData["purchases"] as? [iTunesPurchaseItem] else {
            throw iTunesSerializationError.missing("purchases");
        }

		self.code = code;
        self.receipt = receipt;
        self.purchases = purchases;
	}
}
