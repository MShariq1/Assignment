//
//  ListingsPresenter.swift
//  Assignment
//
//  Created by M.Shariq Hasnain on 31/05/2024.
//

import UIKit
import RealmSwift
import Entity

protocol InteractorToPresenterListingsProtocol: AnyObject {
    func listingsApiSuccess(data: List<ListingsModel>)
    func listingsApiError(errMsg: String)
}

protocol ViewToPresenterListingsProtocol: AnyObject{
    
    var view: PresenterToViewListingsProtocol? {get set}
    var interactor: PresenterToInteractorListingsProtocol? {get set}
    var router: PresenterToRouterListingsProtocol? {get set}
    func getUniversities()
    func showNextView(navigationController:UINavigationController, data: ListingsModel)

}

class ListingsPresenter:ViewToPresenterListingsProtocol {
    var view: PresenterToViewListingsProtocol?
    
    var interactor: PresenterToInteractorListingsProtocol?
    
    var router: PresenterToRouterListingsProtocol?
    
    func getUniversities() {
        interactor?.callApi()
    }
    
    func showNextView(navigationController: UINavigationController, data: ListingsModel) {
        router?.pushToListingDetails(navigationController:navigationController, data: data, refresh: {
            self.getUniversities()
        })
    }

}

//MARK: Conform to interactor protocol
extension ListingsPresenter: InteractorToPresenterListingsProtocol{
    
    func listingsApiSuccess(data: List<ListingsModel>) {
        view?.listingsApiSuccess(data: data)
    }
    
    func listingsApiError(errMsg: String) {
        view?.listingsApiError(errMsg: errMsg)
    }
    
    
}