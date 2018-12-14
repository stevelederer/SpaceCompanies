//
//  LSPTableViewController.swift
//  SpaceCompanies
//
//  Created by Steve Lederer on 12/13/18.
//  Copyright © 2018 Steve Lederer. All rights reserved.
//

import UIKit

class LSPTableViewController: UITableViewController {

    var agencies: [Agency] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LSPController.getLaunchServiceProviders { (agencies) in
            guard let fetchedAgencies = agencies else { return }
            self.agencies = fetchedAgencies
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return agencies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LSPCell", for: indexPath) as! LSPTableViewCell
        let agency = agencies[indexPath.row]
        cell.agency = agency
        return cell
    }
}
