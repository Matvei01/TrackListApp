//
//  TrackListViewController.swift
//  TrackListApp
//
//  Created by Matvei Khlestov on 07.09.2023.
//

import UIKit

class TrackListViewController: UITableViewController {
    
    // MARK: - Private Properties
    private var trackList = Track.getTrackList()
    
    private let cellID = "trackID"
    
    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

// MARK: - Private Methods
extension TrackListViewController {
    private func configure() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.rowHeight = 80
        
        setupNavBar()
    }
    
    private func setupNavBar() {
        title = "Track List"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.leftBarButtonItem = editButtonItem
    }
}

// MARK: - Table view data source
extension TrackListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        trackList.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        var content = cell.defaultContentConfiguration()
        let track = trackList[indexPath.row]
        
        content.text = track.song
        content.secondaryText = track.artist
        content.image = UIImage(named: track.title)
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        
        cell.contentConfiguration = content
        
        return cell
    }
}

// MARK: - Table view delegate
extension TrackListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let trackDetailsVC = TrackDetailsViewController()
        let track = trackList[indexPath.row]
        trackDetailsVC.track = track
        
        navigationController?.pushViewController(trackDetailsVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView,
                            editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    override func tableView(_ tableView: UITableView,
                            shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    override func tableView(_ tableView: UITableView,
                            moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let currentTrack = trackList.remove(at: sourceIndexPath.row)
        trackList.insert(currentTrack, at: destinationIndexPath.row)
    }
}


