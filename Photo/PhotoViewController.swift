import UIKit

class PhotoViewController: UIViewController {
    @IBOutlet weak var outputImageView: UIImageView!
    @IBOutlet weak var showLabel: UILabel!
    @IBOutlet weak var bottomView: UIView!
    
    //接收從第一頁傳來的資料
    var stringLabel:String?
    var imageView:UIImageView!
    var image:UIImage!
    var cgRect :CGRect?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showLabel.text = stringLabel
        outputImageView.image = image
        outputImageView.frame = CGRect(x: 27, y: 19, width: cgRect!.width, height: cgRect!.height)
        self.bottomView.frame = CGRect(x: 30, y: -200, width: 354, height: 400)
        
        //動畫
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 3, delay: 0, animations: {
            self.bottomView.frame = CGRect(x: 30, y: 120, width: 354, height: 400)
        }, completion: nil)
    }
}
