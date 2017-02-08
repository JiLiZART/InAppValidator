//
// Created by Nikolay Kostyurin on 07/02/2017.
//

import Foundation

protocol ValidatorProtocol {

    var client: ClientProtocol {get}
    var sharedSecret: String {get set}
    var endpoint: String {get set}
    var receiptData: String {get set}

    func verify() -> ResponseProtocol
}
