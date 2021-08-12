//
//  Config.swift
//  app
//
//  Created by Oskar on 09/08/2021.
//

import Foundation

struct Config {
    func value(for key: String) -> String {
        return Bundle.main.object(forInfoDictionaryKey: key)  as! String
    }
}


