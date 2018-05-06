////
////  NetworkManager.swift
////  iOSFinal
////
////  Created by Vivian Mengxue Li on 5/4/18.
////  Copyright © 2018 Vivian Mengxue Li. All rights reserved.
////
//
//import Foundation
//import Alamofire
//import SwiftyJSON
//
//class NetworkManager {
//
//    private static let endpoint = "http://fillerendpoint"
//
//    static func getProfiles(withQuery query:String, _ completion: @escaping ([Profile]) -> Void) {
//
//        let parameters: Parameters = [
//            "name": query
//            // add more params
//        ]
//
//        Alamofire.request(endpoint, parameters: parameters).validate().responseJSON { (response)
//            in
//
//                switch response.result {
//
//               case .success(let json):
//                    let json = JSON(json)
//                    var profiles: [Profile] = []
//
//                    for profileJSON in json["results"].arrayValue {
//                        profiles.append(Profile(from: profileJSON)
//                    }
//
//                    completion(profiles)
//                case .failure(let error):
//                    print("Error:", error)
//                    completion([])
//                }
//        }
//    }
//}
//
