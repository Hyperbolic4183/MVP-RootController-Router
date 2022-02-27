//
//  RedPresenter.swift
//  SimpleMVP
//
//  Created by 大塚周 on 2022/02/20.
//

protocol RedPresenterProtocol: Presenter {
    func didTransitionButtonTapped(to color: RedViewController.NextRoute)
}

final class RedPresenter {
    
    private(set) weak var view: RedViewController?
    private let router: RedRouterProtocol
    
    init(view: RedViewController) {
        print("RedPresenter is initialized")
        self.view = view
        self.router = AppDelegate.shared.router
    }
    
    deinit {
        print("RedPresenter is released")
    }
    
}

extension RedPresenter: RedPresenterProtocol {
    
    func didTransitionButtonTapped(to color: RedViewController.NextRoute) {
        router.transition(to: color)
    }
}

