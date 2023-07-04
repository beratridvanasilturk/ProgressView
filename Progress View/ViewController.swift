//
//  ViewController.swift
//  Progress View
//
//  Created by Berat Rıdvan Asiltürk on 4.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Variables
    
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var usernameTextField: UITextField!
    
    var ratio: Float?
    // Progress bar'in kac adimda tamamlanacagini bildirir
    let progress = Progress(totalUnitCount: 4)
    
    
    // MARK: Function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitViews()
        
    }
    
    private func setInitViews() {
        
        progressView.isHidden = true
        
        usernameTextField.text = ""
        passwordTextField.text = ""
        
        ratio = 0
        progressView.progress = ratio!
        
    }

    @IBAction func tappedSubmitButton(_ sender: UIButton) {
        
        if usernameTextField.text != "" && passwordTextField.text != "" {
            
            messageLabel.isHidden = false
            progressView.isHidden = false
            
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                guard self.progress.isFinished == false else {

                    timer.invalidate()
                    self.messageLabel.text = "Veriler Kaydedildi."
                    return
                }
                self.progress.completedUnitCount += 1
                let progressFloat = Float(self.progress.fractionCompleted)
                self.progressView.setProgress(progressFloat, animated: true)
            }
            
        } else {
                messageLabel.text = " Tum alanlari doldur!"
            }
        }
    }
