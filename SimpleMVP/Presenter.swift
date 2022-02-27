//
//  Presenter.swift
//  SimpleMVP
//
//  Created by 大塚周 on 2022/02/27.
//

import UIKit

protocol Presenter {}

protocol PresenterInjectable: UIViewController {
    var presenter: Presenter? { get }
    func inject(presenter: Presenter)
}
