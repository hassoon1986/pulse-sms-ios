//
//  CellIdentifier.swift
//  Pulse
//
//  Created by Luke Klinker on 1/5/18.
//  Copyright © 2018 Luke Klinker. All rights reserved.
//

import Foundation
import UIKit

class CellIdentifier {
    
    static func registerCells(tableView: UITableView) {
        tableView.register(UINib(nibName: "SentMessageTableViewCell", bundle: nil), forCellReuseIdentifier: "SentMessageTableViewCell")
        tableView.register(UINib(nibName: "SentImageTableViewCell", bundle: nil), forCellReuseIdentifier: "SentImageTableViewCell")
        tableView.register(UINib(nibName: "ReceivedMessageTableViewCell", bundle: nil), forCellReuseIdentifier: "ReceivedMessageTableViewCell")
        tableView.register(UINib(nibName: "ReceivedImageTableViewCell", bundle: nil), forCellReuseIdentifier: "ReceivedImageTableViewCell")
        tableView.register(UINib(nibName: "InfoTableViewCell", bundle: nil), forCellReuseIdentifier: "InfoTableViewCell")
        tableView.register(UINib(nibName: "MediaTableViewCell", bundle: nil), forCellReuseIdentifier: "MediaTableViewCell")
    }
    
    static func get(message: Message) -> String {
        if (message.messageType == MessageType.MEDIA) {
            return "MediaTableViewCell"
        } else if (message.messageType == MessageType.INFO) {
            return "InfoTableViewCell"
        } else if (message.messageType == MessageType.RECEIVED) {
            if (message.mimeType.contains("image/")) {
                return "ReceivedImageTableViewCell"
            } else {
                return "ReceivedMessageTableViewCell"
            }
        } else {
            if (message.mimeType.contains("image/")) {
                return "SentImageTableViewCell"
            } else {
                return "SentMessageTableViewCell"
            }
        }
    }
}
