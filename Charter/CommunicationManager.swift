//
//  CommunicationManager.swift
//  Charter
//
//  Created by Alex Díaz on 6/15/17.
//  Copyright © 2017 Alex Díaz. All rights reserved.
//

import Foundation

class CommunicationManager {
    
    static let sharedInstance = CommunicationManager()
    
    func getPlaylist(urlStr:String!, completionHandler:@escaping (_ response:Data? , _ error:Error?) -> Void) -> Void {
        
        guard let url = URL(string: urlStr) else {
            print("Error while creating URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        //setup session
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: urlRequest) { (data:Data?, response:URLResponse?, error:Error?) in
            
            if error != nil {
                completionHandler(nil, error)
            }else {
                do {
                    _ = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:AnyObject]
                    
                    completionHandler(data!, nil)
                    
                } catch {
                    
                }
            }
        }
        task.resume()
    }

}
