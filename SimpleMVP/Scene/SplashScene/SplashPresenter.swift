//
//  SplashPresenter.swift
//  SimpleMVP
//
//  Created by 大塚周 on 2022/02/21.
//

import Foundation
import UIKit

protocol SplashPresenterProtocol {
    func preparationComplete()
}

final class SplashPresenter: Presenter {
    
    private(set) weak var view: SplashViewController?
    private let router: SplashRouterProtocol
    
    init(view: SplashViewController) {
        self.view = view
        self.router = AppDelegate.shared.router
    }
    
    deinit {
        print("SplashPresenter is released")
    }
}

extension SplashPresenter: SplashPresenterProtocol {
    func preparationComplete() {
        router.transitionToRed()
    }
}
