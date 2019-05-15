//
//  TodoDetailsViewController.swift
//  TWTask
//
//  Created by Farhan Tahir on 12/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import UIKit

class PostsDetailsViewController: UIViewController {
    let viewModel = PostDetailsViewModel()
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postDetailsViewModel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var post: PostViewModel! {
        didSet {
            viewModel.post = self.post
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setPostInfo()
        setUserInfo()
        setComments()
    }
    
    func setUserInfo() {
        viewModel.userViewModel?.bind { [weak self] in
            
            self?.userEmailLabel.text = self?.viewModel.userViewModel?.value.email
        }
        viewModel.fetchUserInfo()
    }
    
    func setComments() {
        viewModel.comments.bind { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.fetchPostComments()
        
    }
    
    func setPostInfo() {
        self.postTitleLabel.text = post.title
        self.postDetailsViewModel.text = post.detail
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
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
