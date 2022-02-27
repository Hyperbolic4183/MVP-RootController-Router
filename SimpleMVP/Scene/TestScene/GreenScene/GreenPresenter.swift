//
//  TestPresenter.swift
//  SimpleMVP
//
//  Created by 大塚周 on 2022/02/19.
//

protocol GreenPresenterProtocol: Presenter {
    func didTransitionButtonTapped(to color: GreenViewController.NextRoute)
}

final class GreenPresenter {
    
    private(set) weak var view: GreenViewController?
    private let router: GreenRouterProtocol
    
    init(view: GreenViewController) {
        print("TestPresenter init")
        self.view = view
        self.router = AppDelegate.shared.router
    }
    
    deinit {
        print("TestPresenter is released")
    }
}

extension GreenPresenter: GreenPresenterProtocol {
    
    func didTransitionButtonTapped(to color: GreenViewController.NextRoute) {
        router.transition(to: color)
    }
    
}
