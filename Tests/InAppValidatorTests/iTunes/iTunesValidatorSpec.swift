import Foundation
import Quick
import Nimble
import InAppValidator

class iTunesValidatorSpec: QuickSpec {
    override func spec() {
        describe("Validator") {
            it("verify") {
                let validator = iTunesValidator(endpoint: .sandbox)

                expect(validator.verify()).to(beAKindOf(iTunesResponse.self))
            }
        }

        // describe("the test suite") {
        //     it("runs my `it` block") {
        //         expect(true).to(beTruthy())
        //     }

        //     context("when running another example") {
        //         it("should register errors") {
        //             expect(1).to(equal(2))
        //         }
        //     }

        //     describe("additional matchers") {
        //         it("should allow comparison") {
        //             expect(42).to(beGreaterThan(1))
        //         }

        //         it("should allow checking count") {
        //             expect([1, 2, 3]).to(haveCount(3))
        //         }
        //     }
        // }
    }
}