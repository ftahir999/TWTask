//
//  TodoDetailsViewController.swift
//  TWTask
//
//  Created by Farhan Tahir on 12/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import UIKit
import Common

class PostsDetailsViewController: UIViewController, Instantiatable {
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postDetailsViewModel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: PostDetailsViewModel!
    var router: PostsRouter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayUserInfo()
        displayComments()
        displayPostDetails()
    }
    
    private func displayUserInfo() {
        viewModel.userViewModel.bind { [weak self] in
            
            self?.userEmailLabel.text = $0.email
        }
        viewModel.fetchUserInfo()
    }
    
    private func displayComments() {
        viewModel.comments.bind { [weak self] (_) in
            self?.tableView.reloadData()
        }
        viewModel.fetchPostComments()
    }
    
    private func displayPostDetails() {
        self.postTitleLabel.text = viewModel.postVM?.title
        self.postDetailsViewModel.text = viewModel.postVM?.detail
    }
   
}

extension PostsDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.comments.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as? CommentTableViewCell {
            let viewModel = self.viewModel.comments.value[indexPath.row]
            cell.bindViewModel(viewModel: viewModel)
            return cell
        }
        return UITableViewCell()
    }
    
}
