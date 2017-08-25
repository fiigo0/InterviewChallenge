//
//  Video.swift
//  Charter
//
//  Created by Alex Díaz on 6/15/17.
//  Copyright © 2017 Alex Díaz. All rights reserved.
//

import Foundation

class Video {    
    var title:String?
    var description:String?
    var imageUrlString:String?
    
    
    init(title:String, description:String?,imageURL:String? ) {
        self.title = title
        self.description = description ?? ""
        self.imageUrlString = imageURL ?? ""
    }
    
}
