@testable import MessagePack
import XCTest

class NilTests: XCTestCase {
    let packed: Data = [0xc0]

    func testLiteralConversion() {
        let implicitValue: MessagePackValue = nil
        XCTAssertEqual(implicitValue, MessagePackValue.Nil)
    }

    func testPack() {
        XCTAssertEqual(pack(.Nil), packed)
    }

    func testUnpack() {
        do {
            let unpacked = try unpack(packed)
            XCTAssertEqual(unpacked, MessagePackValue.Nil)
        } catch let error {
            XCTFail("Caught error: \(error)")
        }
    }
}