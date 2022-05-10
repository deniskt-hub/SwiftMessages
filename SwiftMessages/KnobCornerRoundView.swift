//
//  File.swift
//  
//
//  Created by Admin on 10.05.2022.
//

import UIKit


class KnobCornerRoundView: CornerRoundingView {
  
  private var hierarchyNotReady = true
  
  public let knobView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor(red: 0.68, green: 0.75, blue: 0.78, alpha: 1.0)
    view.clipsToBounds = true
    view.layer.cornerRadius = 3
    return view
  }()
  
  override func didMoveToWindow() {
    super.didMoveToWindow()
    guard hierarchyNotReady else {
      return
    }
    
    backgroundColor = .white
    clipsToBounds = true
    layer.cornerRadius = 14
    
    if #available(iOS 11.0, *) {
      layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    setupHierarchy()
    setupConstraints()
    hierarchyNotReady = false
  }

  private func setupHierarchy() {
    addSubview(knobView)
  }

  private func setupConstraints() {
    setupConstraintsKnobView()
  }
  
  private func setupConstraintsKnobView() {
    knobView.translatesAutoresizingMaskIntoConstraints = false
    let centerX = knobView.centerXAnchor.constraint(equalTo: centerXAnchor)
    let width = knobView.widthAnchor.constraint(equalToConstant: 40)
    let height = knobView.heightAnchor.constraint(equalToConstant: 4)
    let top = knobView.topAnchor.constraint(equalTo: topAnchor, constant: 8)
    NSLayoutConstraint.activate([centerX, width, height, top])
  }
  
}
