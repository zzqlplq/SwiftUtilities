//
//  UserDefaultsWrapper.swift
//  SwiftUtilities
//
//  Created by 郑志强 on 2021/6/1.
//

import Foundation

protocol UserDefaultsWrappable { }

extension String: UserDefaultsWrappable {}
extension Int: UserDefaultsWrappable {}
extension Double: UserDefaultsWrappable {}
extension Float: UserDefaultsWrappable {}
extension Bool: UserDefaultsWrappable {}
extension Date: UserDefaultsWrappable {}
extension Data: UserDefaultsWrappable {}
extension Array: UserDefaultsWrappable where Element: UserDefaultsWrappable {}
extension Set: UserDefaultsWrappable where Element: UserDefaultsWrappable {}
extension Dictionary: UserDefaultsWrappable where Key == String, Value: UserDefaultsWrappable {}


@propertyWrapper
struct UserDefaultsWrapped<T: UserDefaultsWrappable> {
    
    private let key: String
    private let defaultValue: T
    private let storage: UserDefaults = .standard
    
    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            return storage.object(forKey: key) as? T ?? defaultValue
        }
        set {
            storage.setValue(newValue, forKey: key)
        }
    }
}


@propertyWrapper
struct UserDefaultsOptionalWrapped<T> {
    private let key: String
    private let storage: UserDefaults = .standard
    
    init(key: String) {
        self.key = key
    }
    
    var wrappedValue: T? {
        get {
            return storage.object(forKey: key) as? T
        }
        set {
            if let newValue = newValue {
                storage.setValue(newValue, forKey: key)
            } else {
                storage.removeObject(forKey: key)
            }
        }
    }
}
