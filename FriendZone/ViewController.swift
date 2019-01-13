//
//  ViewController.swift
//  FriendZone
//
//  Created by beshbashbosh on 13/01/2019.
//  Copyright © 2019 beshbashbosh. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var friends = [Friend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func tableView(_ tableView: UITableView,
                         numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView,
                         cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let friend = friends[indexPath.row]
        cell.textLabel?.text = friend.name
        cell.detailTextLabel?.text = friend.timeZone.identifier
        
        return cell
    }
}

