//
//  PostTableViewCell.swift
//  TWTaskSingle
//
//  Created by Farhan Tahir on 14/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    var viewModel: PostViewModel?
    
    func bindViewModel(viewModel: PostViewModel) {
        self.viewModel = viewModel
        updateUI()
    }
    
    private func updateUI() {
        titleLabel.text = viewModel?.title
        detailLabel.text = viewModel?.detail
    }

    

}
