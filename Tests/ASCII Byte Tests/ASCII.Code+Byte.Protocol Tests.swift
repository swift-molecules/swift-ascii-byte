import ASCII
import ASCII_Byte
import Byte_Protocol
import Byte
import Testing

@Suite("ASCII.Code × Byte.Protocol")
struct ASCII_Code_Byte_Protocol_Tests {

    @Test("Checked conversion round-trips an ASCII byte")
    func checkedConversion() throws {
        let byte = Byte(0x41)
        let code = try ASCII.Code(byte)

        #expect(code == ASCII.Code.A)
        #expect(code.byte == byte)
    }

    @Test("Checked conversion rejects a non-ASCII byte")
    func checkedConversionFailure() {
        let byte = Byte(0x80)

        #expect(throws: ASCII.Code.Error.notASCII(byte: byte)) {
            _ = try ASCII.Code(byte)
        }
    }

    @Test("Unchecked conversion preserves the byte")
    func uncheckedConversion() {
        let code = ASCII.Code(unchecked: Byte(0xFF))

        #expect(code.byte == Byte(0xFF))
    }

    @Test("Byte-backed literal and bounds follow the ASCII range")
    func literalAndBounds() {
        let literal: ASCII.Code = 0x41

        #expect(literal == ASCII.Code.A)
        #expect(ASCII.Code.zero == ASCII.Code.nul)
        #expect(ASCII.Code.max == ASCII.Code.del)
    }

    @Test("Byte-backed ordering and bitwise operations remain available")
    func orderingAndBitwiseOperations() {
        #expect(ASCII.Code.A < ASCII.Code.a)
        #expect((ASCII.Code.del & ASCII.Code.space) == ASCII.Code.space)
        #expect((ASCII.Code.A | ASCII.Code.space) == ASCII.Code.a)
        #expect((ASCII.Code.a ^ ASCII.Code.space) == ASCII.Code.A)
    }
}
