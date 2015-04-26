//
//  PendingSongCell.swift
//  CrowdSound
//
//  Created by Jared Katzman on 3/30/15.
//  Copyright (c) 2015 cs439. All rights reserved.
//

import UIKit

class PendingSongCell: UITableViewCell {

    // PendingSongCell used in PendingTableViewController to manage Upvotes and Downvotes
    @IBOutlet weak var votesLabel: UILabel!
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var downvoteBttn: UIButton!
    @IBOutlet weak var upvoteBttn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
