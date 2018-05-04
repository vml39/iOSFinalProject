//
//  Profile.swift
//  iOSFinal
//
//  Created by Vivian Mengxue Li on 5/4/18.
//  Copyright © 2018 Vivian Mengxue Li. All rights reserved.
//

import Foundation

class Profile {
    
    var name: String
    var funFact: String
    
    // pull in data from api
    init(name:String, funFact: String) {
        self.name = name
        self.funFact = funFact
    }
    
}
