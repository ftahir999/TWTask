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
    let activityIndicator = UIActivityIndicatorView(style: .gray)
    
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
            guard let self = self else { return }
            self.userEmailLabel.text = $0.email
        }
        viewModel.fetchUserInfo()
    }
    
    private func displayComments() {
        viewModel.comments.bind { [weak self] (_) in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
        viewModel.isLoadingComments.bind { [weak self] in
            guard let self = self else { return }
            $0 ? self.displayActivityIndicator() : self.hideActivityIndicator()
        }
        viewModel.fetchPostComments()
    }
    
    private func displayPostDetails() {
        self.postTitleLabel.text = viewModel.postVM?.title
        self.postDetailsViewModel.text = viewModel.postVM?.detail
    }
    
    private func displayActivityIndicator() {
        view.addSubview(activityIndicator)
        activityIndicator.frame = view.bounds
        activityIndicator.startAnimating()
    }
    
    private func hideActivityIndicator() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
   
}

extension PostsDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.comments.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CommentTableViewCell.self), for: indexPath) as? CommentTableViewCell {
            let viewModel = self.viewModel.comments.value[indexPath.row]
            cell.bindViewModel(viewModel: viewModel)
            return cell
        }
        return UITableViewCell()
    }
    
}
