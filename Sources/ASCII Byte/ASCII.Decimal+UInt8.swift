public import ASCII
internal import Byte
internal import Byte_Standard_Library_Integration

extension ASCII.Decimal {

    @_disfavoredOverload
    @inlinable
    public static func serialize<
        T: FixedWidthInteger & UnsignedInteger,
        Buffer: RangeReplaceableCollection
    >(
        _ value: T,
        into buffer: inout Buffer
    ) where Buffer.Element == UInt8 {
        var typed: [Byte] = []
        Self.serialize(value, into: &typed)
        buffer.append(contentsOf: typed.underlying)
    }

    @_disfavoredOverload
    @inlinable
    public static func serialize<
        T: FixedWidthInteger & SignedInteger,
        Buffer: RangeReplaceableCollection
    >(
        _ value: T,
        into buffer: inout Buffer
    ) where Buffer.Element == UInt8 {
        var typed: [Byte] = []
        Self.serialize(value, into: &typed)
        buffer.append(contentsOf: typed.underlying)
    }
}
