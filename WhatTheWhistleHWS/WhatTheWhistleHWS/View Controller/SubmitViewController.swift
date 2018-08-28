//
//  SubmitViewController.swift
//  WhatTheWhistleHWS
//
//  Created by Owen Henley on 8/7/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import UIKit
import CloudKit

class SubmitViewController: UIViewController {
	
	// MARK: - Properties

	var genre: String!
	var comments: String!
	
	var stackView: UIStackView!
	var status: UILabel!
	var spinner: UIActivityIndicatorView!
	
	static var isDirty = true

    override func viewDidLoad() {
        super.viewDidLoad()
		title = "You're all set!"
		navigationItem.hidesBackButton = true
    }
	
	override func loadView() {
		super.loadView()
		
		view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
		
		stackView = UIStackView()
		stackView.spacing = 10
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.distribution = UIStackView.Distribution.fillEqually
		stackView.alignment = .center
		stackView.axis = .vertical
		view.addSubview(stackView)
		
		status = UILabel()
		status.translatesAutoresizingMaskIntoConstraints = false
		status.text = "submitting..."
		status.textColor = UIColor.white
		status.font = UIFont.preferredFont(forTextStyle: .title1)
		status.numberOfLines = 0
		status.textAlignment = .center
		
		spinner = UIActivityIndicatorView(style: .whiteLarge)
		spinner.translatesAutoresizingMaskIntoConstraints = false
		spinner.hidesWhenStopped = true
		spinner.startAnimating()
		
		stackView.addArrangedSubview(status)
		stackView.addArrangedSubview(spinner)
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(true)
		
		doSubmission()
	}
	
	func doSubmission() {
		let whistleRecord = CKRecord(recordType: "Whistles")
		whistleRecord["genre"] = genre as CKRecordValue
		whistleRecord["comments"] = comments as CKRecordValue
		
		let audioURL = RecordWhistleViewController.getWhistleURL()
		let whistleAsset = CKAsset(fileURL: audioURL)
		whistleRecord["audio"] = whistleAsset
		
		CKContainer.default().publicCloudDatabase.save(whistleRecord) { [unowned self] record, error in
			DispatchQueue.main.async {
				if let error = error {
					self.status.text = "Error: \(error.localizedDescription)"
					self.spinner.stopAnimating()
				} else {
					self.view.backgroundColor = UIColor(red: 0, green: 0.6, blue: 0, alpha: 1)
					self.status.text = "Done!"
					self.spinner.stopAnimating()
					
					SubmitViewController.isDirty = true
				}
				
				self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneTapped))
			}
		}
	}
	
	@objc func doneTapped() {
		_ = navigationController?.popViewController(animated: true)
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
