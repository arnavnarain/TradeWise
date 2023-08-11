//
//  SignUpViewController.swift
//  TradeWise
//
//  Created by user233615 on 6/12/23.
//

import UIKit
import PhotosUI
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

class SignUpViewController: UIViewController {
  
    let signupView = SignUpScreenView()
    let tabController = TabController()
    var tabNavController: UINavigationController!
    
    var pickedImage: UIImage?
    
    let db = Firestore.firestore()
    let storage = Storage.storage()
    
    
    override func loadView() {
        view = signupView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        signupView.buttonRegister.addTarget(self, action: #selector(onRegisterTapped), for: .touchUpInside)
        title = "Register"
        
        signupView.buttonTakePhoto.menu = getMenuImagePicker()
    }
    
    @objc func onRegisterTapped() {
        uploadProfilePhotoToStorage()
    }
    
    func getMenuImagePicker() -> UIMenu{
          let menuItems = [
              UIAction(title: "Camera",handler: {(_) in
                  self.pickUsingCamera()
              }),
              UIAction(title: "Gallery",handler: {(_) in
                  self.pickPhotoFromGallery()
              })
          ]
          
          return UIMenu(title: "Select source", children: menuItems)
      }
      
      //MARK: take Photo using Camera...
      func pickUsingCamera(){
          let cameraController = UIImagePickerController()
          cameraController.sourceType = .camera
          cameraController.allowsEditing = true
          cameraController.delegate = self
          present(cameraController, animated: true)
      }
      
      //MARK: pick Photo using Gallery...
      func pickPhotoFromGallery(){
          //MARK: Photo from Gallery...
          var configuration = PHPickerConfiguration()
          configuration.filter = PHPickerFilter.any(of: [.images])
          configuration.selectionLimit = 1
          
          let photoPicker = PHPickerViewController(configuration: configuration)
          
          photoPicker.delegate = self
          present(photoPicker, animated: true, completion: nil)
      }
    
    
    
    func showErrorAlert(_ msg: String) {
        let alert = UIAlertController(title: "Uh oh!", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"OK", style: .default))
        self.present(alert, animated:true)
    }
    
    func uploadProfilePhotoToStorage() {
        var profilePhotoURL: URL?
        
        if let image = pickedImage{
            if let jpegData = image.jpegData(compressionQuality: 80) {
                let storageRef = storage.reference()
                let imagesRepo = storageRef.child("imagesUsers")
                let imagesRef = imagesRepo.child("\(NSUUID().uuidString).jpg")
                let uploadTask = imagesRef.putData(jpegData, completion: {(metadata, error) in
                    if error == nil {
                        imagesRef.downloadURL(completion: {(url, error) in
                            if error == nil {
                                profilePhotoURL = url
                                self.registerUser(photoURL: profilePhotoURL)
                            }
                        })
                        
                    } else {
                        print("Error + \(error)")
                    }
                })
                
            }
        } else {
            registerUser(photoURL: profilePhotoURL)
        }
    }
    
    func registerUser(photoURL: URL?) {
        if let name = signupView.textFieldName.text,
           let email = signupView.textFieldEmail.text,
           let password = signupView.textFieldPassword.text {
            Auth.auth().createUser(withEmail: email, password: password, completion: {result, error in
                if error == nil {
                    self.setNameAndPhotoOfTheUserInFirebaseAuth(name: name, email: email, photoURL: photoURL)
                }
            })
        }
    }
    
    func createStatsDoc(email: String) {
        db.collection("stats").document(email)
            .setData(["num_comments": 0,
                      "points": 0,
                      "last_lesson_title": "",
                      "last_lesson_name":""])
    }
    
    func setNameAndPhotoOfTheUserInFirebaseAuth(name: String, email: String, photoURL: URL?){
            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = name
            changeRequest?.photoURL = photoURL
            
            print("\(photoURL)")
            changeRequest?.commitChanges(completion: {(error) in
                if error != nil{
                    print("Error occured: \(String(describing: error))")
                }else{
                    self.addToHistory(user: User(name: name, email: email))
                }
            })
        }
    
    func addToHistory(user: User) {
        do {
            try db.collection("history").document(user.name).setData(["history": [String]()], completion: {(error) in
                if error != nil {
                    print("Error updating history")
                } else {
                    self.createStatsDoc(email: user.email)
                    self.showTabController()
                }
            })
        } catch {
            print("Error adding to history")
        }
    }
    
    
    func setNameOfTheUserInFirebaseAuth(name: String, user: User) {
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = name
        changeRequest?.commitChanges(completion: {(error) in
            if error != nil {
                print("Error occured \(String(describing: error))")
            } else {
                self.showTabController()
            }
        })
    }
    
    // Checks whether the email entered by the user is valid using a regex
    // Source: https://stackoverflo.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift/25471164#25471164
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    
    func isValidProfile() -> Bool {
        let noFieldsEmpty: Bool =
            !signupView.textFieldName.text!.isEmpty &&
            !signupView.textFieldEmail.text!.isEmpty &&
            !signupView.textFieldPassword.text!.isEmpty
        
        if (!noFieldsEmpty) {
            showErrorAlert("Please fill out all fields!")
        } else if (!isValidEmail(email: signupView.textFieldEmail.text!)) {
            showErrorAlert("Please enter a valid email!")
        } else {
            return true
        }
        return false
    }
    
    func showTabController() {
        //MARK: setting up bottom search sheet...
        signupView.textFieldEmail.text = ""
        signupView.textFieldName.text = ""
        signupView.textFieldPassword.text = ""
        tabNavController = UINavigationController(rootViewController: tabController)
        tabNavController.modalPresentationStyle = .fullScreen
        tabNavController.modalTransitionStyle = .coverVertical

        present(tabNavController, animated: true)
    }
}



