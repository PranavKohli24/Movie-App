//
//  DetailViewController.swift
//  Dummy
//
//  Created by Pranav Kohli on 10/03/26.
//

import UIKit
import Combine

class DetailViewController: UIViewController {

    var movie_title:String = ""
    var desc:String = ""
    var castUrls:[String] = []
    var subscription = Set<AnyCancellable>()
    var prod = ""
    var direc = ""
    var releDate = ""
    
    let castservice = CastService()
    lazy var detailviewmodel = DetailViewModel(castservice: castservice)
    
    
    let movieservice = MovieService()
    lazy var movieviewmodel = MovieViewModel(movieservice: movieservice)
    
    
    let flowlayout = UICollectionViewFlowLayout()
    lazy var collectionview = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
    
    
    let producerLabel = UILabel()
    let directorLabel = UILabel()
    let releaseDateLabel = UILabel()
    let stackview = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemGray3
        title = "Details of \(movie_title))"
        
        view.addSubview(collectionview)
        
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120),
            collectionview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionview.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        
        collectionview.delegate = self
        collectionview.dataSource = self
        
        collectionview.register(Desc_Cell.self, forCellWithReuseIdentifier: "desc_cell")
        collectionview.register(Cast_Cell.self, forCellWithReuseIdentifier: "cast_cell")
        
//        print(castUrls)
        detailviewmodel.fetchCast(castUrls)
        
        detailviewmodel.$cast.sink{
            [weak self] _ in self?.collectionview.reloadData()
        }.store(in: &subscription)
        
        
        
//        producerLabel.text = movieviewmodel.movieProducer(at: movieIndex)
//        directorLabel.text = movieviewmodel.movieDirector(at: movieIndex)
//        releaseDateLabel.text = movieviewmodel.movieReleaseDate(at: movieIndex)
//
        
        producerLabel.text = prod
        print("prod")
        print(prod)
        directorLabel.text = direc
        releaseDateLabel.text = releDate
        
        view.addSubview(stackview)
        
        stackview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackview.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -30),
            stackview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
        
        
        producerLabel.backgroundColor = .lightGray
        directorLabel.backgroundColor = .lightGray
        releaseDateLabel.backgroundColor = .lightGray
        
        
        stackview.axis = .horizontal
        stackview.spacing = 20
        stackview.distribution = .fill
        stackview.addArrangedSubview(producerLabel)
        stackview.addArrangedSubview(directorLabel)
        stackview.addArrangedSubview(releaseDateLabel)
    }
    


}


extension DetailViewController:UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else{
            return detailviewmodel.numberOfCast()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "desc_cell", for: indexPath) as! Desc_Cell
            
            cell.desc_label.text = desc
            
            return cell
            
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cast_cell", for: indexPath) as! Cast_Cell
            cell.cast_label.text = detailviewmodel.castPerson(at: indexPath.item).name
            
            return cell
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0{
            return CGSize(width: view.frame.width - 20, height: 200)
        }else{
            return CGSize(width: 180, height: 70)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
    }
}
