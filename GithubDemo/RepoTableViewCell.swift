//
//  RepoTableViewCell.swift
//  GithubDemo
//
//  Created by Sylvia Mach on 2/16/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit
import AFNetworking

class RepoTableViewCell: UITableViewCell {

    @IBOutlet weak var repoImageView: UIImageView!
    @IBOutlet weak var forkImageView: UIImageView!
    @IBOutlet weak var starImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var forkLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var repo: GithubRepo? {
        didSet {
            nameLabel.text = repo?.name
            ownerLabel.text = repo?.ownerHandle
            starImageView.image = UIImage(named: "star")
            forkImageView.image = UIImage(named: "fork")
            starLabel.text = String(format: "%d", (repo?.stars)!)
            forkLabel.text = String(format: "%d", (repo?.forks)!)
            descriptionLabel.text = repo?.repoDescription
            repoImageView.setImageWith(URL(string: (repo?.ownerAvatarURL!)!)!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
