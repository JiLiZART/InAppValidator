import Foundation

open class iTunesValidator: ValidatorProtocol {    
    // public typealias Endpoint = iTunesEndpointType;

    public enum iTunesEndpointType:String {
        case sandbox = "https://sandbox.itunes.apple.com/verifyReceipt"
        case production = "https://buy.itunes.apple.com/verifyReceipt"
    }

    var endpoint: String
    var sharedSecret: String?
    var receiptData: String?
    var client: ClientProtocol

    public convenience init(receiptData: String, endpoint:iTunesEndpointType = .production) {
        self.init(receiptData: receiptData, client: JSONRequest(), endpoint: endpoint)
    }

    public init(receiptData: String, client: ClientProtocol, endpoint:iTunesEndpointType = .production) {
        self.endpoint = endpoint.rawValue;
        self.receiptData = receiptData
        self.client = JSONRequest()
    }

    public func verify(complete: @escaping (ResponseProtocol) -> Void) {
        let response = iTunesResponse(json: [
            "status": 21000
        ] as [String: Any]?)

        complete(response);
    }
}
