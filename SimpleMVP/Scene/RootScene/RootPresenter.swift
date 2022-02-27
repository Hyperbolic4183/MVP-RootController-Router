//
//  Presenter.swift
//  SimpleMVP
//
//  Created by 大塚周 on 2022/02/13.
//

import Foundation
import UIKit

protocol RootPresenterProtocol: AnyObject {
    func viewDidLoad()
}

final class RootPresenter: Presenter {

    private(set) weak var view: RootViewController?
    private let router: RootRouterProtocol
    
    init(view: RootViewController) {
        print("RootPresenter is initialized")
        self.view = view
        self.router = AppDelegate.shared.router
    }
    
    deinit {
        print("RootPresenter is released")
    }
    
}

extension RootPresenter: RootPresenterProtocol {
    func viewDidLoad() {
        router.transitionToSplash()
    }
}
