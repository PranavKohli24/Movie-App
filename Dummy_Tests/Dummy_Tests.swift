//
//  Dummy_Tests.swift
//  Dummy_Tests
//
//  Created by Pranav Kohli on 17/03/26.
//

import XCTest
@testable import Dummy


final class MovieViewModelTests: XCTestCase {
    
    
    func test_numberOfMovies(){
        let service = MovieService()
        let viewmodel = MovieViewModel(movieservice: service)
        
        
        viewmodel.movies = [
            Movie(id: "1", title: "A", image: "", description: "", director: "", producer: "", people: []),
            Movie(id: "2", title: "B", image: "", description: "", director: "", producer: "", people: [])
        ]
        
        XCTAssertEqual(viewmodel.numberOfMovies(), 0)
    }
}
