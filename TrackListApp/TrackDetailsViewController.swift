//
//  TrackViewController.swift
//  TrackListApp
//
//  Created by Matvei Khlestov on 08.09.2023.
//

import UIKit

class TrackDetailsViewController: UIViewController {
    
    // MARK: - Public Properties
    var track: Track!
    
    // MARK: - UI Elements
    private lazy var trackInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 16
        
        return stackView
    }()
    
    private lazy var imageCover: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "\(track.title)")
        
        return imageView
    }()
    
    private lazy var trackTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "\(track.title)"
        label.font = .systemFont(ofSize: 17)
        label.numberOfLines = 0
        
        return label
    }()
    
    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

// MARK: - Private Methods
extension TrackDetailsViewController {
    private func configure() {
        view.backgroundColor = .white
        
        setupSubviews()
        
        setupNavBar()
        
        setConstraints()
    }
    
    private func setupSubviews() {
        view.addSubview(trackInfoStackView)
        
        setupSubviewsForStackView(imageCover, trackTitleLabel)
    }
    
    private func setupSubviewsForStackView(_ subviews: UIView... ) {
        for subview in subviews {
            trackInfoStackView.addArrangedSubview(subview)
        }
    }
    
    private func setupNavBar() {
        navigationItem.largeTitleDisplayMode = .never
    }
}

// MARK: - Constraints
extension TrackDetailsViewController {
    private func setConstraints() {
        trackInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                trackInfoStackView.topAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.topAnchor,
                    constant: 16
                ),
                trackInfoStackView.leadingAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                    constant: 20
                ),
                trackInfoStackView.trailingAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                    constant: -20
                ),
                trackInfoStackView.heightAnchor.constraint(
                    equalToConstant: 380
                )
            ]
        )
    }
}

