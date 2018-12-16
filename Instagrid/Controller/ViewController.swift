//
//  ViewController.swift
//  Instagrid
//
//  Created by Roland Lariotte on 10/12/2018.
//  Copyright © 2018 Roland Lariotte. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    // Main stack view outlets for images, views control and buttons
    @IBOutlet weak var topLeftView: UIView!
    @IBOutlet weak var topRightView: UIView!
    @IBOutlet weak var bottomLeftView: UIView!
    @IBOutlet weak var bottomRightView: UIView!
    
    @IBOutlet weak var cell1Button: UIButton!
    @IBOutlet weak var cell2Button: UIButton!
    @IBOutlet weak var cell3Button: UIButton!
    
    @IBOutlet weak var checkMark1: UIImageView!
    @IBOutlet weak var checkMark2: UIImageView!
    @IBOutlet weak var checkMark3: UIImageView!
    
    // Outlets for downloading images
    @IBOutlet weak var topLeftImage: UIImageView!
    @IBOutlet weak var topRightImage: UIImageView!
    @IBOutlet weak var bottomLeftImage: UIImageView!
    @IBOutlet weak var bottomRightImage: UIImageView!
    
    @IBOutlet weak var topLeftButton: UIButton!
    @IBOutlet weak var topRightButtom: UIButton!
    @IBOutlet weak var bottomLeftButton: UIButton!
    @IBOutlet weak var bottomRightButton: UIButton!
    
    // Swipe text feild and log outlet
    @IBOutlet weak var swipeTextField: UITextField!
    @IBOutlet weak var swipeImageLogo: UIImageView!
    
    
    // The app opens with the cell 3 button style
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectCell3Style()
        
        
    }
    
    
//    // Method that tell when the phone rotate
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//
//        let image = swipeImageLogo
//        super.viewWillTransition(to: size, with: coordinator)
//
//        if UIDevice.current.orientation.isLandscape {
//
//            image!.image = UIImage(named: "swipeLeftLogo")
//        } else {
//            print("Portrait")
//            //imageView.image = UIImage(named: const)
//        }
//    }
    
    
    //MARK: - Cells buttons
    @IBAction func cell1ViewStyle(_ sender: Any) {
        selectCell1Style()
    }
    
    @IBAction func cell2ViewStyle(_ sender: Any) {
        selectCell2Style()
    }
    
    @IBAction func cell3ViewStyle(_ sender: Any) {
        selectCell3Style()
    }
    
    
    //MARK: - Load Images Buttons
    @IBAction func loadTopLeftImage(_ sender: Any) {
        loadPhotoLibrary()
    }
    
    @IBAction func loadTopRightImage(_ sender: Any) {
        loadPhotoLibrary()
    }
    
    @IBAction func loadBottomLeftImage(_ sender: Any) {
        loadPhotoLibrary()
    }
    
    @IBAction func loadBottomRightImage(_ sender: Any) {
        loadPhotoLibrary()
    }
    
    
    //MARK: - Selected Button Stack View Action Method
    private func selectCell1Style() {
        
        showCell1CheckMark()
        showCell1Button()
        cell1StackView()
    }
    
    
    private func selectCell2Style() {
        
        showCell2CheckMark()
        showCell2Button()
        cell2StackView()
    }
    
    
    private func selectCell3Style() {
        
        showCell3CheckMark()
        showCell3Button()
        cell3StackView()
        
    }
    
    
    // Methods that define the button background style for each cell
    private func showCell1Button() {
        cell2Button.backgroundColor = .clear
        cell3Button.backgroundColor = .clear
        cell1Button.backgroundColor = UIColor(red: 78.0/255.0, green: 145.0/255.0, blue: 184.0/255.0, alpha: 0.6)
    }
    
    private func showCell2Button() {
        cell1Button.backgroundColor = .clear
        cell3Button.backgroundColor = .clear
        cell2Button.backgroundColor = UIColor(red: 78.0/255.0, green: 145.0/255.0, blue: 184.0/255.0, alpha: 0.6)
    }
    
    private func showCell3Button() {
        cell1Button.backgroundColor = .clear
        cell2Button.backgroundColor = .clear
        cell3Button.backgroundColor = UIColor(red: 78.0/255.0, green: 145.0/255.0, blue: 184.0/255.0, alpha: 0.6)
    }
    
    
    // Methods that define the way each stack view cells get organised
    private func cell1StackView() {
        topRightView.isHidden = true
        bottomLeftView.isHidden = false
        bottomRightView.isHidden = false
    }
    
    private func cell2StackView() {
        topLeftView.isHidden = false
        topRightView.isHidden = false
        bottomRightView.isHidden = true
    }
    
    private func cell3StackView() {
        topLeftView.isHidden = false
        topRightView.isHidden = false
        bottomLeftView.isHidden = false
        bottomRightView.isHidden = false
    }
    
    
    // Methods that show each cell checkmark
    private func showCell1CheckMark() {
        checkMark1.isHidden = false
        checkMark2.isHidden = true
        checkMark3.isHidden = true
    }
    
    private func showCell2CheckMark() {
        checkMark2.isHidden = false
        checkMark1.isHidden = true
        checkMark3.isHidden = true
    }
    
    private func showCell3CheckMark() {
        checkMark3.isHidden = false
        checkMark1.isHidden = true
        checkMark2.isHidden = true
    }

    
    //MARK: - Method to load Photo Library
    func loadPhotoLibrary() {
        
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        image.allowsEditing = false
        
        self.present(image, animated: true) {
            // After it is complete
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            topLeftImage.image = image
        }
        else {
            // Error message
        }
        
        self.dismiss(animated: true, completion: nil)
    }

}

