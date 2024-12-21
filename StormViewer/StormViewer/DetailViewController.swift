//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Erik Sebastian de Erice Jerez on 21/12/24.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    var selectedImageIndex = 0
    var totalImages = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadImage()
        title = "Image \(selectedImageIndex + 1) of \(totalImages)"
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    private func loadImage() {
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
}
