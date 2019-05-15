//
//  CommentTableViewCell.swift
//  TWTaskSingle
//
//  Created by Farhan Tahir on 15/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    var viewModel: CommentViewModel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!

    func bindViewModel(viewModel: CommentViewModel) {
        self.viewModel = viewModel
        updateUI()
    }
    
    func updateUI() {
        nameLabel.text = viewModel.name
        emailLabel.text = viewModel.email
        commentLabel.text = viewModel.comment
    }

}
