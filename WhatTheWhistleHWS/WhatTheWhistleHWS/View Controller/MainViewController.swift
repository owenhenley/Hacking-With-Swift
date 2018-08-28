//
//  MainViewController.swift
//  WhatTheWhistleHWS
//
//  Created by Owen Henley on 8/7/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import UIKit
import CloudKit

class MainViewController: UITableViewController {
	
	// MARK: - Properties

	var whistles: [Whistle] = []
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		
		if let indexPath = tableView.indexPathForSelectedRow {
			tableView.deselectRow(at: indexPath, animated: true)
		}
		
		if MainViewController.isDirty {
			loadWhistles()
		}
		
		loadWhistles()
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		
		title = "What's that Whistle?"
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWhistle))
		navigationItem.backBarButtonItem = UIBarButtonItem(title: "Home", style: .plain, target: nil, action: nil)
    }
	
	@objc func loadWhistles() {
		let vc = RecordWhistleViewController()
		navigationController?.pushViewController(vc, animated: true)
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


