//
//  DetailViewController.swift
//  Blinklist
//
//  Created by Decagon on 28/07/2021.
//

import UIKit

class DetailViewController: UIViewController {
    var author: Author?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateFields(with: author)
    }
    
    private func populateFields(with author: Author?) {
        guard let author = author else { return }
        titleLabel.text = author.title
        imageView.image = UIImage(named: author.image)
        authorLabel.text = author.author
        descriptionLabel.text = author.description
    }
}
