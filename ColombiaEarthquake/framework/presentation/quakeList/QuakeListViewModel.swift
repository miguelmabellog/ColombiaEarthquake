//
//  QuakeListViewModel.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 5/08/24.
//

import Foundation

class QuakeListViewModel: ObservableObject{
    @Published private var error: QuakeError?
    @Published var isLoading=false
    @Published var isErrorLoading=false
    
    let fetchAllQuakesUseCase:FetchAllQuakesUseCaseProtocol
    
    init(fetchAllQuakesUseCase:FetchAllQuakesUseCaseProtocol){
        self.fetchAllQuakesUseCase=FetchAllQuakesUseCase(quakesRepository: QuakesRepositoryImpl())
    }
    
    
//    func fetchQuakes() async {
//        isLoading = true
//        do {
//            isErrorLoading=false
//            try await provider.fetchQuakes()
//            
//        } catch {
//            isErrorLoading=true
//            self.error = error as? QuakeError ?? .unexpectedError(error: error)
//            self.hasError = true
//        }
//        isLoading = false
//    }
    
}
