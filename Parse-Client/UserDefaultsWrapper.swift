//
//  UserDefaultsWrapper.swift
//  Parse-Client
//
//  Created by Haider Khan on 10/27/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import Foundation

class UserDefaultsWrapper {
    
    class func getObject(key: String) -> AnyObject? {
        return UserDefaults.standard.object(forKey: key) as AnyObject?
    }
    
    class func getInt(key: String) -> Int {
        return UserDefaults.standard.integer(forKey: key)
    }
    
    class func getBool(key: String) -> Bool {
        return UserDefaults.standard.bool(forKey: key)
    }
    
    class func getFloat(key: String) -> Float {
        return UserDefaults.standard.float(forKey: key)
    }
    
    class func getString(key: String) -> String? {
        return UserDefaults.standard.string(forKey: key)
    }
    
    class func getData(key: String) -> NSData? {
        return UserDefaults.standard.data(forKey: key) as NSData?
    }
    
    class func getArray(key: String) -> NSArray? {
        return UserDefaults.standard.array(forKey: key) as NSArray?
    }
    
    class func getDictionary(key: String) -> NSDictionary? {
        return UserDefaults.standard.dictionary(forKey: key) as NSDictionary?
    }
    
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Get value with default value
    //-------------------------------------------------------------------------------------------
    
    class func getObject(key: String, defaultValue: AnyObject) -> AnyObject? {
        if getObject(key: key) == nil {
            return defaultValue
        }
        return getObject(key: key)
    }
    
    class func getInt(key: String, defaultValue: Int) -> Int {
        if getObject(key: key) == nil {
            return defaultValue
        }
        return getInt(key: key)
    }
    
    class func getBool(key: String, defaultValue: Bool) -> Bool {
        if getObject(key: key) == nil {
            return defaultValue
        }
        return getBool(key: key)
    }
    
    class func getFloat(key: String, defaultValue: Float) -> Float {
        if getObject(key: key) == nil {
            return defaultValue
        }
        return getFloat(key: key)
    }
    
    class func getString(key: String, defaultValue: String) -> String? {
        if getObject(key: key) == nil {
            return defaultValue
        }
        return getString(key: key)
    }
    
    class func getData(key: String, defaultValue: NSData) -> NSData? {
        if getObject(key: key) == nil {
            return defaultValue
        }
        return getData(key: key)
    }
    
    class func getArray(key: String, defaultValue: NSArray) -> NSArray? {
        if getObject(key: key) == nil {
            return defaultValue
        }
        return getArray(key: key)
    }
    
    class func getDictionary(key: String, defaultValue: NSDictionary) -> NSDictionary? {
        if getObject(key: key) == nil {
            return defaultValue
        }
        return getDictionary(key: key)
    }
    
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Set value
    //-------------------------------------------------------------------------------------------
    
    class func setObject(key: String, value: AnyObject?) {
        if value == nil {
            UserDefaults.standard.removeObject(forKey: key)
        } else {
            UserDefaults.standard.set(value, forKey: key)
        }
        UserDefaults.standard.synchronize()
    }
    
    class func setInt(key: String, value: Int) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    class func setBool(key: String, value: Bool) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    class func setFloat(key: String, value: Float) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    class func setString(key: String, value: NSString?) {
        if (value == nil) {
            UserDefaults.standard.removeObject(forKey: key)
        } else {
            UserDefaults.standard.set(value, forKey: key)
        }
        UserDefaults.standard.synchronize()
    }
    
    class func setData(key: String, value: NSData) {
        setObject(key: key, value: value)
    }
    
    class func setArray(key: String, value: NSArray) {
        setObject(key: key, value: value)
    }
    
    
    class func setDictionary(key: String, value: NSDictionary) {
        setObject(key: key, value: value)
    }
    
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Synchronize
    //-------------------------------------------------------------------------------------------
    
    class func Sync() {
        UserDefaults.standard.synchronize()
    }
    
}
