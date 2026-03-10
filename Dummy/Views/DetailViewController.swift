//
//  DetailViewController.swift
//  Dummy
//
//  Created by Pranav Kohli on 09/03/26.
//

import UIKit
import Combine

class DetailViewController: UIViewController {

    var movie_title = ""
    var desc = ""
    
    var actorUrls:[String] = []
    
    let flowlayout = UICollectionViewFlowLayout()
    
    
    lazy var collectionview = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
    
    
//    let label
    var cancellables = Set<AnyCancellable>()
    
    
//    var actors:[Actors] = []
    let actorservice = ActorService()
//    lazy var detailviewmodel = DetailViewModel(actorService: actorservice)
    
    lazy var detailviewmodel = DetailViewModel(actorService: actorservice)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        title = "Details of \(movie_title)"
//        print(actorUrls)
//        detailviewmodel.$actors
//                .sink { [weak self] _ in
//                    self?.collectionview.reloadData()
//                }
//                .store(in: &cancellables)
//

        
        detailviewmodel.$actors.sink{
            [weak self] _ in self?.collectionview.reloadData()
        }.store(in: &cancellables)
        
        
        
        detailviewmodel.fetchActors(actorUrls)
        
        
        
        
        
        view.addSubview(collectionview)
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            collectionview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionview.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
        
        
        collectionview.delegate = self
        collectionview.dataSource = self
        
        
        collectionview.register(DescCell.self, forCellWithReuseIdentifier: "desc_cell")
        collectionview.register(ActorsCell.self, forCellWithReuseIdentifier: "actors_cell")
        
        
//        detailviewmodel.fetchActors(actorUrls){
//            self.collectionview.reloadData()
//        }
        
//        detailviewmodel(actorUrls)
    }
    
    
    
//    func fetchActors(){
//        for u in actorUrls{
//            guard let url = URL(string: u) else {return}
//            
//            URLSession.shared.dataTask(with: url){
//                data,_,_ in
//                guard let data else {return}
//                
//                do{
//                    
//                    let actor = try JSONDecoder().decode(Actors.self, from: data)
//                    DispatchQueue.main.async {
//                        
//                        self.detailviewmodel.actors.append(actor)
//                        self.collectionview.reloadData()
//                    }
//                    
//                }catch{
//                    
//                }
//            }.resume()
//            
//        }
//    }
    
    

    

}



extension DetailViewController:UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        
        else{
            return detailviewmodel.numberOfActors()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let actor = actors[indexPath.row]
        
        if indexPath.section == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "desc_cell", for: indexPath) as! DescCell
//            print(desc)
            
            cell.label.text = "Description"
           
            cell.desc_label.text = desc
            
            return cell
            
        }else{
            var actor = detailviewmodel.nameForActor(at: indexPath.item)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "actors_cell", for: indexPath) as! ActorsCell
            cell.label.text = actor
            return cell
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0{
            return CGSize(width: view.frame.width - 50 , height: 250)
        }else{
            return CGSize(width: 150, height: 150)
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    
}
