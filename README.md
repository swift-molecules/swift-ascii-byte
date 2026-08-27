# swift-ascii-byte

Narrow integration between the ASCII and Byte domains.

The `ASCII Byte` product makes `ASCII.Code` a `Byte.Protocol`, provides checked
and unchecked conversion between `Byte` and `ASCII.Code`, and serializes fixed
width integers as decimal ASCII bytes.

```swift
import ASCII_Byte

let code = try ASCII.Code(Byte(0x41))
let byte = code.byte

var decimal: [Byte] = []
ASCII.Decimal.serialize(UInt16(42), into: &decimal)
```

The ASCII atom remains the owner of ASCII validation, code values, and named
constants. The Byte atom remains the owner of byte representation and protocol
semantics. Standard-library-only String and `UInt8` conveniences are intentionally
not part of this cross-domain package.
