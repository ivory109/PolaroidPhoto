import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var pikachuImageView: UIImageView!
    @IBOutlet weak var inputTextField: UITextField!
    
    let width = 300
    var height = 0
    var inputText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //將TextField的delegate指向Controller
        inputTextField.delegate = self
    }
    
    @IBAction func changeSegmented(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            height = width
        } else if sender.selectedSegmentIndex == 1 {
            height = width / 3 * 2
        } else if sender.selectedSegmentIndex == 2{
            height = width / 4 * 3
        } else{
            height = width / 16 * 9
        }
        pikachuImageView.frame = CGRect(x: 57, y: 125, width: width, height: height)
    }
    
    //取出輸入的inputTextField，並再清空
    @IBAction func checkButton(_ sender: UIButton) {
        if let text = inputTextField.text {
            inputText = text
            inputTextField.text = ""
        }
        inputTextField.resignFirstResponder()
    }
    
    //點擊return鍵讓鍵盤下去
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //將第一頁輸入的TextField文字傳到第二頁的Label顯示，要先將storyboard的segue命名ID
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhoto"{
            let vc = segue.destination as! PhotoViewController
            vc.stringLabel = inputText
            vc.image = pikachuImageView.image
            vc.cgRect = pikachuImageView.frame
        }
    }
}
