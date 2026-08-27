public import ASCII
internal import Byte

extension ASCII {

    @inlinable
    public static func convert<S: StringProtocol>(_ string: S, to case: ASCII.Case) -> S {

        let convertedCodes = convert(string.utf8.map { Self.Code(unchecked: Byte($0)) }, to: `case`)
        return S(decoding: convertedCodes.map(\.underlying), as: UTF8.self)
    }
}
