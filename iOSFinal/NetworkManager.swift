//
//  NetworkManager.swift
//  iOSFinal
//
//  Created by Vivian Mengxue Li on 5/4/18.
//  Copyright © 2018 Vivian Mengxue Li. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
    
    /// Endpoint URL string
    //1private static let endpoint = "https://mindylou.github.io/classes.json"
    
    /**
     Gets classes from the endpoint.
     - parameter completion: The completion function to be called once the class JSONs
     are parsed into Class objects.
     
     What does @escaping mean?
     @escaping means that you can jump out of the function and call the function passed in.
     This function is called before the function returns, or it "escapes" from the function.
     */
    //2static func getClasses(completion: @escaping ([Profile]) -> Void) {
        // Here, we make a GET request from the endpoint. This means that we are
        // requesting data. A POST request submits data to the endpoint to be processed.
        // We validate it so that the response code is 200 (OK), so we know we didn't receive
        // a 404 (not found)/request error.
        //3Alamofire.request(endpoint, method: .get)
            //4.validate().responseJSON { response in
                // Depending on what response JSON we get here,
                // we can appropriately handle it.
                //5switch response.result {
                //6case let .success(data):
                   //7 let classJSONDictionary = JSON(data)["data"].dictionaryValue
                    //8if let classJSONArray = classJSONDictionary["classes"]?.arrayValue {
                        //9var classArray = [Profile]()
                        //10for classJSON in classJSONArray {
                            //11classArray.append(Profile(json: classJSON))
                        //12}
                        
                        // Call the function we passed in to do whatever we want
                        // to the classArray (eg. show it on screen)
                        //13completion(classArray)
                    //14}
                //15case .failure(let error):
                    //16print(error.localizedDescription)
                //17}
        //18}
    //19}
}

