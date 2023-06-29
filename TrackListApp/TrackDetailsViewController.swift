//
//  TrackDetailsViewController.swift
//  TrackListApp
//
//  Created by Matvei Khlestov on 02.06.2022.
//

import UIKit

class TrackDetailsViewController: UIViewController {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    
    var track: Track!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coverImageView.image = UIImage(named: track.title)
        trackNameLabel.text = track.title
    }
}
