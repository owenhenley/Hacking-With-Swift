//
//  Whistle.swift
//  WhatTheWhistleHWS
//
//  Created by Owen Henley on 8/9/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import UIKit
import CloudKit

class Whistle: NSObject {

	var recordID: CKRecord.ID!
	var genre: String!
	var comments: String!
	var audio: URL!
}
