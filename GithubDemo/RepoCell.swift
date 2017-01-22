//
//  RepoCell.swift
//  GithubDemo
//
//  Created by Gina Ratto on 1/20/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class RepoCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var starsImageView: UIImageView!
    @IBOutlet weak var forksImageView: UIImageView!
  
    var repo: GithubRepo! {
        didSet {
            print("in didset")
            if let name = repo.name {
                nameLabel.text = name
            }
            if let owner = repo.ownerHandle {
                ownerLabel.text = owner
            }
            if let stars = repo.stars {
                starsLabel.text = "\(stars)"
            }
            if let fork = repo.forks {
                forksLabel.text = "\(fork)"
            }
            if let description = repo.repoDescription {
                descriptionLabel.text = description
            }
            if let thumbImageUrl = repo.ownerAvatarURL {
                avatarImageView.setImageWith(URL(string: thumbImageUrl)!)
            }
            forksImageView.image = #imageLiteral(resourceName: "fork")
            starsImageView.image = #imageLiteral(resourceName: "star")
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
