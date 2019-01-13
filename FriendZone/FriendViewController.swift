//
//  FriendViewController.swift
//  FriendZone
//
//  Created by beshbashbosh on 13/01/2019.
//  Copyright © 2019 beshbashbosh. All rights reserved.
//

import UIKit

class FriendViewController: UITableViewController {

    weak var delegate: ViewController?
    var friend: Friend!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func nameChanged(_ sender: UITextField) {
    }
    
}
