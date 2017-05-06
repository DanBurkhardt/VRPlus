//
//  YouTubeData.swift
//  VRPlus
//
//  Created by Daniel Burkhardt on 4/15/17.
//  Copyright © 2017 Giganom LLC. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public class YouTubeData{
    
    var url: String
    //public var playlist: Array<JSON>
    var jsonData: JSON = [:]
    
    public init(url: String){
        self.url = url
        
        print("URL provided: \(self.url)")
        
        func parseURL(){
            // parse the URL here
        }
    }
    
    func processWithPlaylist( completion: (_ complete: Bool) -> Void){
        // Entrypoint for processing the data
    }
    
    func getData( completion: @escaping (_ complete: Bool) -> Void){
        // Use to retrieve the data
        Alamofire.request(self.url).responseJSON { response in
            
            // Debugging
            //print(response.request)  // original URL request
            print(response.response?.statusCode) // HTTP URL response
            //print(response.data)     // server data
            //print(response.result)   // result of response serialization
            
            if let statusCode = response.response?.statusCode{
                if Int(statusCode) == 200{
                    if let serverData = response.data {
                        self.jsonData = JSON(data: serverData)
                        //print(self.jsonData)
                        completion(true)
                    }else{
                        completion(false)
                    }
                }// End check status code number
                    // TODO: Build actions for other status codes
            }// End checking for status code
                // TODO: quit gracefully if no data returns
        }// End request
    }// End function
    
    func verifyContent(){
        // Use to verify that all items are VR content
        // Come back to this
    }
    
    func addToPlaylist(){
        // Function to add verified items to the playlist
    }
    
}
