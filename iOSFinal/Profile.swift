//
//  Profile.swift
//  iOSFinal
//
//  Created by Vivian Mengxue Li on 5/4/18.
//  Copyright © 2018 Vivian Mengxue Li. All rights reserved.
//

import Foundation
import SwiftyJSON

class Profile: NSObject {
    
    var name: String
    var major: String
    var funFact: String
    var noiseTolerance: String
    var cleanliness: String
    var sleeping: String
    var waking: String
    
    init(name:String, major: String, funFact: String, noiseTolerance: String, cleanliness: String, sleeping: String, waking: String) {
        self.name = name
        self.major = major
        self.funFact = funFact
        self.noiseTolerance = noiseTolerance
        self.cleanliness = cleanliness
        self.sleeping = sleeping
        self.waking = waking
    }
    
    // pull in data from api
    init(from json: JSON) {
        self.name = json["name"].stringValue
        self.major = json["major"].stringValue
        self.funFact = json["funFact"].stringValue
        self.noiseTolerance = json["noiseTolerance"].stringValue
        self.cleanliness = json["cleanliness"].stringValue
        self.sleeping = json["sleeping"].stringValue
        self.waking = json["waking"].stringValue
    }
}
