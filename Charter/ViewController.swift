//
//  ViewController.swift
//  Charter
//
//  Created by Alex Díaz on 6/15/17.
//  Copyright © 2017 Alex Díaz. All rights reserved.
//

import UIKit

let kVideoCellIdentifier = "videoCell"


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!

    var dataSource:[Video]! = []
    var commManager:CommunicationManager! = nil
        
    func testData() {
        var i = 0
        for _ in 0...10 {
            let video = Video(title: "\(i) Alex", description: "Descripcion \(i)", imageURL: nil)
            
            dataSource.append(video);
            i += 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commManager = CommunicationManager.sharedInstance
        
        commManager.getPlaylist(urlStr: kEndPoint) { (data:Data?, error:Error?) in
            if error != nil {
            
            } else {
                self.dataSource = PlalistFactory.shared.getVideosWithJsonArray(jsonData: data!)
                self.tableView.reloadData()
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:VideoCellVC!
        
        cell = tableView.dequeueReusableCell(withIdentifier: kVideoCellIdentifier, for: indexPath) as! VideoCellVC
        
        let video = dataSource[indexPath.row]
        cell.title.text = video.title ?? ""
        cell.descriptionLbl.text = video.description ?? ""
        cell.imageView?.imageFromServerURL(urlString: video.imageUrlString ?? "")
        return cell
    }

}

