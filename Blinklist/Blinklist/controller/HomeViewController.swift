//
//  ViewController.swift
//  Blinklist
//
//  Created by Decagon on 26/07/2021.
//

import UIKit

class HomeViewController: UIViewController {
  // variables
  private var authorData = [Author]()
  let dataLoader = JSONParser()
  
  // outlets
  @IBOutlet weak var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.dataSource = self
    collectionView.delegate = self
    
    // closure
    dataLoader.parseJSON { authorData in
      self.authorData = authorData
    }
    
    // protocol
//    dataLoader.delegate = self
//    dataLoader.parseJSON()
    
    collectionView.collectionViewLayout = UICollectionViewFlowLayout()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let author = sender as? Author {
      if let segueDestination = segue.destination as? DetailViewController {
        segueDestination.author = author
      }
    }
  }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return authorData.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! OutletCollectionViewCell
    
    cell.setUp(with: authorData[indexPath.row])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let author = authorData[indexPath.item]
    
    performSegue(withIdentifier: "segue", sender: author)
  }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let bounds = collectionView.bounds
    return  CGSize(width: bounds.width/2 - 5, height: bounds.height/2)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}

extension HomeViewController: JSONParserProtocol {
  func fetchData(from data: [Author]) { authorData = data }
}
