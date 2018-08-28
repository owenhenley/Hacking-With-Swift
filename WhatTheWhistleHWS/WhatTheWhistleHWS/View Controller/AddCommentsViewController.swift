//
//  AddCommentsViewController.swift
//  WhatTheWhistleHWS
//
//  Created by Owen Henley on 8/7/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import UIKit

class AddCommentsViewController: UIViewController {
	
	// MARK: - Properties
	
	var genre: String!
	
	var comments: UITextView!
	let placeholder = "If you have any additional comments that might help identify your tune, enter them here."

    override func viewDidLoad() {
        super.viewDidLoad()
		
		title = "Comments"
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Submit", style: .plain, target: self, action: #selector(submitTapped))
		comments.text = placeholder
	}
	
	@objc func submitTapped() {
		let vc = SubmitViewController()
		vc.genre = genre
		
		if comments.text == placeholder {
			vc.comments = ""
		} else {
			vc.comments = comments.text
		}
		navigationController?.pushViewController(vc, animated: true)
	}
	
	func textViewDidBeginEditing(_ textView: UITextView) {
		if textView.text == placeholder {
			textView.text = ""
		}
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AddCommentsViewController: UITextViewDelegate {
	
	override func loadView() {
		super.loadView()
		
		comments = UITextView()
		comments.translatesAutoresizingMaskIntoConstraints = false
		comments.delegate = self
		comments.font = UIFont.preferredFont(forTextStyle: .body)
		view.addSubview(comments)
		
		comments.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		comments.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		comments.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
		comments.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
	}
}
