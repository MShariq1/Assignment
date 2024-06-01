//
//  ListingDetailsRouter.swift
//  Assignment
//
//  Created by M.Shariq Hasnain on 31/05/2024.
//

import UIKit

protocol PresenterToRouterListingDetailsProtocol: AnyObject {
    static func createModule() -> ListingDetailsView
    func navigateBack(navigationController:UINavigationController, refresh: (() -> Void)?)
}

public class ListingDetailsRouter: PresenterToRouterListingDetailsProtocol {
     
    public static func createModule() -> ListingDetailsView {
        
        let view = storyboard.instantiateViewController(withIdentifier: "ListingDetailsView") as! ListingDetailsView
        
        let router:PresenterToRouterListingDetailsProtocol = ListingDetailsRouter()
        let presenter: ViewToPresenterListingDetailsProtocol = ListingDetailsPresenter()
        
        view.presenter = presenter
        presenter.router = router
        return view
        
    }
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name:"ListingDetailsStoryboard",bundle: Bundle(for: Self.self))
    }
    
    func navigateBack(navigationController:UINavigationController, refresh: (() -> Void)?) {
        refresh?()
        navigationController.popViewController(animated: true)
        
    }
    
}
