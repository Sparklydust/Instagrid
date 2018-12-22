//
//  ViewController.swift
//  Instagrid
//
//  Created by Roland Lariotte on 10/12/2018.
//  Copyright © 2018 Roland Lariotte. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
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
    
    // Outlets for downloaded images
    @IBOutlet weak var topLeftImage: UIImageView!
    @IBOutlet weak var topRightImage: UIImageView!
    @IBOutlet weak var bottomLeftImage: UIImageView!
    @IBOutlet weak var bottomRightImage: UIImageView!
    
    // Buttons for the action of loading a image
    @IBOutlet weak var topLeftButton: UIButton!
    @IBOutlet weak var topRightButtom: UIButton!
    @IBOutlet weak var bottomLeftButton: UIButton!
    @IBOutlet weak var bottomRightButton: UIButton!
    
    // Swipe text feild and log outlet
    @IBOutlet weak var swipeTextField: UITextField!
    @IBOutlet weak var swipeImageLogo: UIImageView!
    
    // Variable for images loading from the library
    var imageManager = ImageManager()
    
    // Swipe Gesture incorporated into the main vue and the square view for sharing
    @IBOutlet var mainViewOutlet: UIView!
    @IBOutlet weak var viewToShare: UIView!
    
    
    @IBOutlet weak var topStackView: UIStackView!
    @IBOutlet weak var bottomStackView: UIStackView!
    
    
    // The app opens with the cell 3 button style
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectCell3Style()
        manageGesturesRecognizer()
    }
    
    
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
        loadPhotoLibrary(setImageView: topLeftImage)
    }
    
    @IBAction func loadTopRightImage(_ sender: Any) {
        loadPhotoLibrary(setImageView: topRightImage)
    }
    
    @IBAction func loadBottomLeftImage(_ sender: Any) {
        loadPhotoLibrary(setImageView: bottomLeftImage)
    }
    
    @IBAction func loadBottomRightImage(_ sender: Any) {
        loadPhotoLibrary(setImageView: bottomRightImage)
    }
    
    
    //MARK: - Selected Button Stack View Action Method
    private func selectCell1Style() {
        
        cell1StackView()
        showTopBottomStackView()
        showCell1CheckMark()
        showCell1Button()
    }
    
    private func selectCell2Style() {
        
        cell2StackView()
        showTopBottomStackView()
        showCell2CheckMark()
        showCell2Button()
    }
    
    private func selectCell3Style() {
        
        cell3StackView()
        showTopBottomStackView()
        showCell3CheckMark()
        showCell3Button()
    }
    
    
    // Methods that define the button background style for each cell
    private func showCell1Button() {
        cell1Button.backgroundColor = UIColor(red: 78.0/255.0, green: 145.0/255.0, blue: 184.0/255.0, alpha: 0.6)
        cell2Button.backgroundColor = .clear
        cell3Button.backgroundColor = .clear
    }
    
    private func showCell2Button() {
        cell1Button.backgroundColor = .clear
        cell2Button.backgroundColor = UIColor(red: 78.0/255.0, green: 145.0/255.0, blue: 184.0/255.0, alpha: 0.6)
        cell3Button.backgroundColor = .clear
    }
    
    private func showCell3Button() {
        cell1Button.backgroundColor = .clear
        cell2Button.backgroundColor = .clear
        cell3Button.backgroundColor = UIColor(red: 78.0/255.0, green: 145.0/255.0, blue: 184.0/255.0, alpha: 0.6)
    }
    
    
    // Methods that define the way each stack view cells get organised
    private func cell1StackView() {
        topLeftView.isHidden = false
        topRightView.isHidden = true
        bottomLeftView.isHidden = false
        bottomRightView.isHidden = false
    }
    
    private func cell2StackView() {
        topLeftView.isHidden = false
        topRightView.isHidden = false
        bottomLeftView.isHidden = false
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
    
    
    //MARK: - Method for when the phone is shaken
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        secretHideCheckMark()
        secretHideCellButton()
        secretShowOneImage()
    }
    
    private func secretHideCheckMark() {
        checkMark3.isHidden = true
        checkMark1.isHidden = true
        checkMark2.isHidden = true
    }
    
    private func secretHideCellButton() {
        cell1Button.backgroundColor = .clear
        cell3Button.backgroundColor = .clear
        cell2Button.backgroundColor = .clear
    }
    
    private func secretShowOneImage() {
        topStackView.isHidden = false
        bottomStackView.isHidden = true
        topLeftView.isHidden = true
        topRightView.isHidden = false
    }
    
    private func showTopBottomStackView() {
        topStackView.isHidden = false
        bottomStackView.isHidden = false
    }
    
    
    //MARK: - Method to load Photo Library
    func loadPhotoLibrary(setImageView imageView: UIImageView) {
        
        // Settings instance of Image Manager to be the delegate
        imageManager.delegate = self
        imageManager.sourceType = UIImagePickerController.SourceType.photoLibrary
        imageManager.allowsEditing = false
        
        // For the image to go where the UIButton was clicked
        imageManager.completionHandler = { image in
            if let image = image {
                imageView.image = image
            }
        }
        self.present(imageManager, animated: true)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let myPicker = picker as? ImageManager {
            myPicker.completionHandler!(info[UIImagePickerController.InfoKey.originalImage] as? UIImage)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: - Method for main view swipe action
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        // Setting the swipe gesture into the main view
        if let manageSwipeGesture = mainViewOutlet.gestureRecognizers {
            
            for action in manageSwipeGesture {
                mainViewOutlet.removeGestureRecognizer(action)
            }
        }
        manageGesturesRecognizer()
    }
    
    
    // Action that happens when the swipe gesture is triggered to share content
    @objc func mainViewSwiped(recognizer: UISwipeGestureRecognizer) {
        
        let link = NSURL(string: "http://www.openclassroooms.com")
        
        // Code that use the share iphone menu
        let sharePicturesViewFrame = UIActivityViewController(activityItems: [viewToShare!, link!], applicationActivities: nil)
        
        present(sharePicturesViewFrame, animated: true, completion: nil)
    }
    
    
    //MARK: - Method for rotated state actions
    func manageGesturesRecognizer() {
        
        // Variable of the swipe gesture
        let swipeToShare = UISwipeGestureRecognizer(target: self, action: #selector(mainViewSwiped(recognizer:)))
        
        // Settings to use the swipe gesture on the main view
        swipeToShare.numberOfTouchesRequired = 1
        mainViewOutlet.isUserInteractionEnabled = true
        mainViewOutlet.addGestureRecognizer(swipeToShare)
        
        // What happens when the iPhone is in landscape mode
        if UIDevice.current.orientation.isLandscape {
            swipeTextField.text = "Swipe left to share"
            swipeImageLogo.transform = CGAffineTransform(rotationAngle: -.pi / 2)
            swipeToShare.direction = .left
        }
            // What happens when the iPhone is in portrait mode
        else {
            swipeTextField.text = "Swipe up to share"
            swipeImageLogo.transform = CGAffineTransform(rotationAngle: 0)
            swipeToShare.direction = .up
        }
    }
    
}
