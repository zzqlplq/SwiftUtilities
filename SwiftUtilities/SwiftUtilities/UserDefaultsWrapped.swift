//
//  UserDefaultsWrapper.swift
//  SwiftUtilities
//
//  Created by 郑志强 on 2021/6/1.
//

import Foundation

@propertyWrapper
struct UserDefaultsWrapped<T> {
    
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
