public import ASCII
public import Byte

extension ASCII.Code {

    /// An error produced when constructing an ASCII code from a byte.
    public enum Error: Swift.Error, Equatable, Sendable {

        /// The byte lies outside the seven-bit ASCII range.
        case notASCII(byte: Byte)
    }
}
