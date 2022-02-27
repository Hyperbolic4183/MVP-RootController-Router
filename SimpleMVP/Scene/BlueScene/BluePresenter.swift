//
//  BluePresenter.swift
//  SimpleMVP
//
//  Created by 大塚周 on 2022/02/24.
//

protocol BluePresenterProtocol: Presenter {
    func didTransitionButtonTapped(to color: BlueViewController.NextRoute)
}

final class BluePresenter {
    
    private(set) weak var view: BlueViewController?
    private let router: BlueRouterProtocol
    
    init(view: BlueViewController) {
        print("BluePresenter is initialized")
        self.view = view
        self.router = AppDelegate.shared.router
    }
    
    deinit {
        print("BluePresenter is released")
    }
    
}

extension BluePresenter: BluePresenterProtocol {
    func didTransitionButtonTapped(to color: BlueViewController.NextRoute) {
        router.transition(to: color)
    }
}
