import Foundation

enum iTunesSerializationError: Error {
    case missing(String)
	case invalid(String, Any)

    case emptyJSON
}