//
//  PageCell.swift
//  Audible
//
//  Created by  Decagon on 21/08/2021.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            guard let page = page else {
                return
            }
            
            let color = UIColor(white: 0.2, alpha: 1)
            
            imageView.image = UIImage(named: page.imageName)
            let attributedText = NSMutableAttributedString(string: page.title, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .medium), NSAttributedString.Key.foregroundColor: color])
            
            attributedText.append(NSAttributedString(string: "\n\n\(page.message)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: color]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let length = attributedText.string.count
            attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
            textView.attributedText = attributedText
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .yellow
        iv.image = UIImage(named: "Tes")
        iv.clipsToBounds = true
        return iv
    }()
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.text = "Sample for now"
        tv.isEditable = false
        tv.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        return tv
    }()
    
    let lineSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return view
    }()
    
    func setupViews(){
        addSubview(imageView)
        addSubview(textView)
        addSubview(lineSeparatorView)
        imageView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
        textView.anchorWithConstantToTop(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        lineSeparatorView.anchorToTop(top: nil, left: leftAnchor, bottom: imageView.bottomAnchor, right: rightAnchor)
        lineSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
