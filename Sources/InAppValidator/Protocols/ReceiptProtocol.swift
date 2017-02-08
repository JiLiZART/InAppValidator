//
// Created by Nikolay Kostyurin on 07/02/2017.
//

import Foundation

protocol ReceiptProtocol {
    var code: Int {get set}
    var receipt: String {get set}
    var purchases: [PurchaseItemProtocol] {get set}
}
