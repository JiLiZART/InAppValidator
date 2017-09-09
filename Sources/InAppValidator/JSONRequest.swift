import Foundation

public enum JSONRequestError: Error {
    case invalidRequestString
    case emptyResponseData
}

public class JSONRequest: ClientProtocol {
    private let session: URLSession

    public init(session: URLSession = URLSession(configuration: URLSessionConfiguration.default)) {
        self.session = session
    }

    public func send(request: URLRequest, complete: @escaping (Data?, Error?) -> Void) {
        session.dataTask(with: request) { (data, _, error) in
            if let error = error {
                complete(nil, error)
                return
            }
            guard let data = data else {
                complete(nil, JSONRequestError.emptyResponseData)
                return
            }
            complete(data, nil)
        }.resume()
    }

    public func send(url: URL, complete: @escaping (Data?, Error?) -> Void) {
        send(request: URLRequest(url: url), complete: complete)
    }

    public func send(string: String, complete: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: string) else {
            complete(nil, JSONRequestError.invalidRequestString)
            return
        }

        send(url: url, complete: complete)
    }
}