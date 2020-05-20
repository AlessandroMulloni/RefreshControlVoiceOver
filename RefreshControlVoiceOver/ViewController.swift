//
//  ViewController.swift
//  RefreshControlVoiceOver
//
//  Created by Alessandro Mulloni on 20.05.20.
//  Copyright © 2020 Alessandro Mulloni. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBAction func clickA() {
        print("A!")
    }

    @IBAction func clickB() {
        print("B!")
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView?.refreshControl = UIRefreshControl()
        tableView?.refreshControl?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    @objc func refreshData() {
        print("Refresh!")
        tableView?.refreshControl?.endRefreshing()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("CELL!")
    }
}
