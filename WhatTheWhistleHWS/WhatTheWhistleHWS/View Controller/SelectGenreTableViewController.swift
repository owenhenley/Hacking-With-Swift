//
//  SelectGenreTableViewController.swift
//  WhatTheWhistleHWS
//
//  Created by Owen Henley on 8/7/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import UIKit

class SelectGenreTableViewController: UITableViewController {
	
	// MARK: - Properties
	static var genres = ["Unknown", "Blues", "Classical", "Electronic", "Jazz", "Metal", "Pop", "Reggae", "RnB", "Rock", "Soul"]
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		title = "Select Genre"
		navigationItem.backBarButtonItem = UIBarButtonItem(title: "Genre", style: .plain, target: nil, action: nil)
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SelectGenreTableViewController.genres.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		cell.textLabel?.text = SelectGenreTableViewController.genres[indexPath.row]
		cell.accessoryType = .disclosureIndicator
        return cell
    }

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if let cell = tableView.cellForRow(at: indexPath) {
			let genre = cell.textLabel?.text ?? SelectGenreTableViewController.genres[0]
			let vc = AddCommentsViewController()
			vc.genre = genre
			navigationController?.pushViewController(vc, animated: true)
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
