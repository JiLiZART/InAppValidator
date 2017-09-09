import Foundation

public struct iTunesResponse: ResponseProtocol {
    public enum Status: Int {
        case OK = 0
        // The App Store could not read the JSON object you provided.
        case APPSTORE_CANNOT_READ = 21000
        // The data in the receipt-data property was malformed or missing.
        case DATA_MALFORMED = 21002
        // The receipt could not be authenticated.
        case RECEIPT_NOT_AUTHENTICATED = 21003
        // The shared secret you provided does not match the shared secret on file for your account.
        // Only returned for iOS 6 style transaction receipts for auto-renewable subscriptions.
        case SHARED_SECRET_NOT_MATCH = 21004
        // The receipt server is not currently available.
        case RECEIPT_SERVER_UNAVAILABLE = 21005
        // This receipt is valid but the subscription has expired. When this status code is returned to your server, the receipt data is also decoded and returned as part of the response.
        // Only returned for iOS 6 style transaction receipts for auto-renewable subscriptions.
        case RECEIPT_VALID_BUT_SUB_EXPIRED = 21006
        // This receipt is from the test environment, but it was sent to the production environment for verification. Send it to the test environment instead.
        // special case for app review handling - forward any request that is intended for the Sandbox but was sent to Production, this is what the app review team does
        case SANDBOX_RECEIPT_SENT_TO_PRODUCTION = 21007
        // This receipt is from the production environment, but it was sent to the test environment for verification. Send it to the production environment instead.
        case PRODUCTION_RECEIPT_SENT_TO_SANDBOX = 21008
    }

    internal var json: [String: Any]? = nil

    public var receipt: ReceiptProtocol? {
        guard let receipt = try? iTunesReceipt(json: self.json) else {
            return nil
        }

        return receipt
    }

    public var isValid: Bool {
        guard let code = self.receipt?.code else {
            return false
        }

        guard let status = iTunesResponse.Status(rawValue: code) else {
            return false
        }

        switch (status) {
            case .OK:
                 return true
            default:
                return false
        }
    }

    init(json: [String: Any]?) {
        self.json = json
    }
}
