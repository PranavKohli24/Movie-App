//
//  ViewController.swift
//  Dummy
//
//  Created by Pranav Kohli on 09/03/26.
//

import UIKit
import Combine

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
    
    let label = UILabel()

    let flowlayout = UICollectionViewFlowLayout()
    lazy var collectionview = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
    
    let movieservice = MovieService()
    lazy var movieviewmodel = MovieViewModel(movieservice: movieservice)
    
    
    var subscription = Set<AnyCancellable>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        
        title = "Movies"
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        label.text = "App info"
        label.backgroundColor = .systemCyan
        label.textAlignment = .center
        
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            label.widthAnchor.constraint(equalToConstant: 100),
            label.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(infoTapped))
        label.addGestureRecognizer(tap)
        
        
        
        view.addSubview(collectionview)
        collectionview.backgroundColor = UIColor(red: 128/255, green: 0, blue: 32/255, alpha: 0.75)
        
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            collectionview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionview.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        collectionview.delegate = self
        collectionview.dataSource = self
        
        collectionview.register(Movie_Cell.self, forCellWithReuseIdentifier: "movie_cell")
        
        movieviewmodel.fetchMovies()
        
        
        movieviewmodel.$movies.sink{
            [weak self] _ in self?.collectionview.reloadData()
        }.store(in: &subscription)
        
        
    }
    
    
    @objc func infoTapped(){
        let alert = UIAlertController(title: "Ghibli Movies", message: "Data from Studio Ghibli API", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okkk", style: .default))
        present(alert,animated: true)
    }
}


extension ViewController:UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieviewmodel.numberOfMovies()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movie_cell", for: indexPath) as! Movie_Cell
        let movie = movieviewmodel.movie(at: indexPath.item)
//        cell.movie_label.text = movieviewmodel.movieTitle(at: indexPath.item)
        cell.movie_label.text = movie.title
        
        movieviewmodel.fetchImage(at: indexPath.item){
            
            img in cell.imageview.image = img
            
        }
        
        cell.imageview.image = nil
        cell.isSelected = false
        
        return cell
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 180)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        let movie = movieviewmodel.movie(at: indexPath.item)
        
        detailVC.castUrls = movie.people
        print("hello")
        let ind = indexPath.item
        
        detailVC.desc = movieviewmodel.movieDescription(at: ind)
        detailVC.movie_title = movieviewmodel.movieTitle(at: ind)
        detailVC.releDate = movieviewmodel.movieReleaseDate(at: ind)
        detailVC.prod = movieviewmodel.movieProducer(at: ind)
        detailVC.direc = movieviewmodel.movieDirector(at: ind)
        
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
