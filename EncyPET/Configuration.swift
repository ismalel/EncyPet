//
//  Configuration.swift
//  EncyPET
//
//  Created by Ismael on 01/11/21.
//
import Foundation

class Configuration {

    static func value<T>(defaultValue: T, forKey key: String) -> T{

        let preferences = UserDefaults.standard
        return preferences.object(forKey: key) == nil ? defaultValue : preferences.object(forKey: key) as! T
    }

    static func value(value: Any, forKey key: String){

        UserDefaults.standard.set(value, forKey: key)
    }

}
