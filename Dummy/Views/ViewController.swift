//
//  ViewController.swift
//  Dummy
//
//  Created by Pranav Kohli on 09/03/26.
//

import UIKit

//
//struct Movie:Decodable{
//    let id:String
//    let title:String
//    let image:String
//    let description:String
//    let director:String
//    let producer:String
//    let people:[String]
//}

class ViewController: UIViewController {

    let flowlayout = UICollectionViewFlowLayout()
    
    lazy var collectionview = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
    
    
    let viewmodel = MovieViewModel()
//
//    var movies:[Movie] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Movies"
        
        
        view.backgroundColor = .systemGray3
        
        view.addSubview(collectionview)
        
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        
        collectionview.backgroundColor = .systemBlue
        
        NSLayoutConstraint.activate([
            collectionview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionview.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        collectionview.delegate = self
        collectionview.dataSource = self
        
        collectionview.register(MovieCell.self, forCellWithReuseIdentifier: "cell")
        
        
//        fetchMovies()
        
        viewmodel.fetchMovies{
            self.collectionview.reloadData()
        }
        
    }
    
    
    
    
}


extension ViewController:UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewmodel.numberOfMovies()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieCell
        
//        let movie = viewmodel.movies[indexPath.row]
//        let movie = viewmodel.movie(at: indexPath.row)
//        
//        cell.label.text = movie.title
//        
        
        cell.label.text = viewmodel.titleForMovie(at: indexPath.row)
        let imageUrl = viewmodel.imageUrl(at: indexPath.row)
//        
//        if let url = URL(string: imageUrl){
//            
//            URLSession.shared.dataTask(with: url){
//                data,_,_ in
//                if let data{
//                    
//                    DispatchQueue.main.async {
//                        cell.imageview.image = UIImage(data: data)
//                    }
//                    
//                }
//            }.resume()
//        }
        
        
        viewmodel.fetchImage(from: imageUrl){
            image in cell.imageview.image = image
        }
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailVC = DetailViewController()
//        let movie = movies[indexPath.row]
        let movie = viewmodel.movie(at: indexPath.row)
        
        detailVC.movie_title = movie.title
        
        detailVC.desc = movie.description
        detailVC.actorUrls = movie.people

        
        
        navigationController?.pushViewController(detailVC, animated: true)
        
        
    }
}
