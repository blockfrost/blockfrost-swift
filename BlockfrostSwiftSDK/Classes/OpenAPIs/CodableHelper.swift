//
// CodableHelper.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class CodableHelper {
    private static var customDateFormatter: DateFormatter?
    private static var defaultDateFormatter: DateFormatter = OpenISO8601DateFormatter()

    private static var customJSONDecoder: JSONDecoder?
    private static var defaultJSONDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(CodableHelper.dateFormatter)
        return decoder
    }()

    private static var customJSONEncoder: JSONEncoder?
    private static var defaultJSONEncoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted(CodableHelper.dateFormatter)
        encoder.outputFormatting = .prettyPrinted
        return encoder
    }()

    public static var dateFormatter: DateFormatter {
        get { return customDateFormatter ?? defaultDateFormatter }
        set { customDateFormatter = newValue }
    }
    public static var jsonDecoder: JSONDecoder {
        get { return customJSONDecoder ?? defaultJSONDecoder }
        set { customJSONDecoder = newValue }
    }
    public static var jsonEncoder: JSONEncoder {
        get { return customJSONEncoder ?? defaultJSONEncoder }
        set { customJSONEncoder = newValue }
    }

    open class func decode<T>(_ type: T.Type, from data: Data) -> Swift.Result<T, Error> where T: Decodable {
        return Swift.Result { try jsonDecoder.decode(type, from: data) }
    }

    open class func encode<T>(_ value: T) -> Swift.Result<Data, Error> where T: Encodable {
        return Swift.Result { try jsonEncoder.encode(value) }
    }

    public static func codableHashEqual(_ a : [String : AnyCodable], _ b : [String : AnyCodable]) -> Bool {
        a.hashValue == b.hashValue
    }

    public static func codableHashEqual(_ a : [AnyCodable], _ b : [AnyCodable]) -> Bool {
        a.hashValue == b.hashValue
    }

    public static func codableJsonEqual(_ a : [String : AnyCodable], _ b : [String : AnyCodable]) -> Bool {
        if a.keys != b.keys { return false }
        let aenc = (try? CodableHelper.encode(a).get())
        let benc = (try? CodableHelper.encode(b).get())
        return aenc == benc
    }

    public static func codableDeepEqual(_ a : [String: AnyCodable], _ b : [String: AnyCodable]) -> Bool {
        if a.count != b.count { return false }
        return eqAny(a, b)
    }

    public static func eqAny(_ lhs: Any?, _ rhs: Any?) -> Bool {
        if lhs == nil && rhs == nil { return true }
        if (lhs == nil) != (rhs == nil) { return false }

        var lhsOut = lhs
        var rhsOut = rhs
        while(true) {
            if let x = lhsOut as? AnyCodable {
                lhsOut = x.value
            } else { break }
        }

        while(true) {
            if let x = rhsOut as? AnyCodable {
                rhsOut = x.value
            } else { break }
        }

        switch (lhsOut, rhsOut) {
        case is (Void, Void):
            return true
        case let (lhs as AnyCodable, rhs as AnyCodable):
            return eqAny(lhs.value, rhs.value)
        case let (lhs as Bool, rhs as Bool):
            return lhs == rhs
        case let (lhs as Int, rhs as Int):
            return lhs == rhs
        case let (lhs as Int8, rhs as Int8):
            return lhs == rhs
        case let (lhs as Int16, rhs as Int16):
            return lhs == rhs
        case let (lhs as Int32, rhs as Int32):
            return lhs == rhs
        case let (lhs as Int64, rhs as Int64):
            return lhs == rhs
        case let (lhs as UInt, rhs as UInt):
            return lhs == rhs
        case let (lhs as UInt8, rhs as UInt8):
            return lhs == rhs
        case let (lhs as UInt16, rhs as UInt16):
            return lhs == rhs
        case let (lhs as UInt32, rhs as UInt32):
            return lhs == rhs
        case let (lhs as UInt64, rhs as UInt64):
            return lhs == rhs
        case let (lhs as Float, rhs as Float):
            return lhs == rhs
        case let (lhs as Double, rhs as Double):
            return lhs == rhs
        case let (lhs as String, rhs as String):
            return lhs == rhs
        case let (d1 as [Any?], d2 as [Any?]):
            return d1.count == d2.count
                    && d1.enumerated().map { off, el in eqAny(el, d2[off]) }.reduce(true) { $0 && $1 }
        case let (d1 as [String: Any?], d2 as [String: Any?]):
            return d1.count == d2.count && d1.keys == d2.keys
                    && d1.map { off, el in eqAny(el, d2[off]!) }.reduce(true) { $0 && $1 }
        default:
            return false
        }
    }
}
