//
//  PlaylistFactory.swift
//  Charter
//
//  Created by Alex Díaz on 6/15/17.
//  Copyright © 2017 Alex Díaz. All rights reserved.
//

import Foundation

class PlalistFactory {
    
    static let shared = PlalistFactory()
    
    func getVideosWithJsonArray(jsonData:Data) -> [Video] {
        
        var videosData:[Video] = []
        
        do {
            let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String:Any]
            
            var dict = json!
            
            let videosArray = dict["items"] as! [[String : Any]]
            
            for video in videosArray{
                let snippet = video["snippet"] as? [String : Any] ?? [:]
                
                let title = snippet["title"] as? String ?? ""
                let description = snippet["description"] as? String ?? ""
                let thumbnails = snippet["thumbnails"] as? [String : Any] ?? [:]
                let defaultThumbnail = thumbnails["default"] as? [String:Any] ?? [:]
                let image = defaultThumbnail["url"] as? String ?? ""
                print("Title \(title)")
                
                let video = Video(title: title, description: description, imageURL: image)
                
                videosData.append(video)
                
            }
        } catch {
            
        }

        
        return videosData
    }
    
}
