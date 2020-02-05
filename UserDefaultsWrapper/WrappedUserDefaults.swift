//
//  WrappedUserDefaults.swift
//  UserDefaultsWrapper
//
//  Created by tanabe.nobuyuki on 2020/02/05.
//  Copyright © 2020 tanabe.nobuyuki. All rights reserved.
//

import Foundation
@propertyWrapper public struct WrappedUserDefaults<Value> {
    public let key: String
    public let defaultValue: Value
    public var storage: UserDefaults = .standard
    
    public init(key: String, defaultValue: Value,storage: UserDefaults = .standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.storage = storage
    }

    public var wrappedValue: Value {
        get {
            let value = storage.value(forKey: key) as? Value
            return value ?? defaultValue
        }
        set {
            storage.setValue(newValue, forKey: key)
        }
    }
}

extension WrappedUserDefaults where Value: ExpressibleByNilLiteral {
    public init(key: String, storage: UserDefaults = .standard) {
        self.init(key: key, defaultValue: nil, storage: storage)
    }
}

private protocol AnyOptional {
    var isNil: Bool { get }
}

extension Optional: AnyOptional {
    var isNil: Bool { self == nil }
    
}

//@propertyWrapper struct UserDefaultsBacked<Value> {
//    ...
//
//    var wrappedValue: Value {
//        get { ... }
//        set {
//            if let optional = newValue as? AnyOptional, optional.isNil {
//                storage.removeObject(forKey: key)
//            } else {
//                storage.setValue(newValue, forKey: key)
//            }
//        }
//    }
//}



