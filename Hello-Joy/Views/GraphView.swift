//
//  GraphView.swift
//  Hello-Joy
//
//  Created by Vuk Radosavljevic on 2/25/19.
//  Copyright © 2019 Vuk Radosavljevic. All rights reserved.
//

import UIKit

@IBDesignable
class GraphView: UIView {

    var contentView:UIView?
    @IBInspectable var nibName:String?
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
        }
    }
    
    @IBOutlet weak var pageControl: UIPageControl!

    @IBOutlet weak var firstGraphCheckInButton: UIButton! {
        didSet {
            firstGraphCheckInButton.layer.cornerRadius = firstGraphCheckInButton.frame.height / 2
        }
    }
    
    @IBOutlet weak var secondGraphCheckInButton: UIButton!  {
        didSet {
            secondGraphCheckInButton.layer.cornerRadius = secondGraphCheckInButton.frame.height / 2
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        xibSetup()
    }
    
    

    
    func xibSetup() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        addSubview(view)
        contentView = view
    }
    
    func loadViewFromNib() -> UIView? {
        guard let nibName = nibName else { return nil }
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(
            withOwner: self,
            options: nil).first as? UIView
    }

}

extension GraphView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = bounds.width / 2
        pageControl.currentPage = Int(scrollView.contentOffset.x / pageWidth)
    }
}
