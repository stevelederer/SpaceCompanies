//
//  LSPTableViewCell.swift
//  SpaceCompanies
//
//  Created by Steve Lederer on 12/13/18.
//  Copyright © 2018 Steve Lederer. All rights reserved.
//

import UIKit

class LSPTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var acronymLabel: UILabel!
    @IBOutlet weak var websiteTextView: UITextView!
    @IBOutlet weak var wikipediaTextView: UITextView!
    
    var agency: Agency? {
        didSet {
            updateViews()
        }
    }
   
    func updateViews() {
        guard let agency = agency else { return }
        DispatchQueue.main.async {
            self.nameLabel.text = agency.name
            self.acronymLabel.text = agency.acronym
            let textView = "\(agency.website)\n\n\(agency.wikipedia)"
            self.websiteTextView.text = textView
            
        }
    }

}
