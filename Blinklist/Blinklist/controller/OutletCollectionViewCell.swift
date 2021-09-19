//
//  OutletCollectionViewCell.swift
//  Blinklist
//
//  Created by Decagon on 27/07/2021.
//

import UIKit

class OutletCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var bookTitleOutlet: UILabel!
    @IBOutlet weak var authorOutlet: UILabel!
    @IBOutlet weak var descriptionOutlet: UILabel!
    @IBOutlet weak var bookType: UILabel!
    @IBOutlet weak var durationOutlet: UILabel!
    @IBOutlet weak var accessOutlet: UILabel!
    
    func setUp(with detailsOfAuthor: Author){
        imageOutlet.image = UIImage(named: detailsOfAuthor.image)
        bookTitleOutlet.text = detailsOfAuthor.title
        authorOutlet.text = detailsOfAuthor.author
//        descriptionOutlet.text = detailsOfAuthor.description
        bookType.text = detailsOfAuthor.book_type
        durationOutlet.text = ".\(detailsOfAuthor.length / 60)hr.\(detailsOfAuthor.length % 60)min"
        accessOutlet.text = detailsOfAuthor.access
        
    }
    
}

