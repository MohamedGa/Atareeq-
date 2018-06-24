//
//  MessageViewController.swift
//  Atareque
//
//  Created by Mohammed Gamal on 20/06/18.
//  Copyright © 2018 Mohammed Gamal. All rights reserved.
//

import UIKit

class GalleryViewController : UIViewController,UINavigationBarDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var menu: UIBarButtonItem!
     var imageArray = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        revealViewController().rearViewRevealWidth = 200
        menu.target = revealViewController()
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        
        // setup ImageScroll
                // mainScrollView.frame = view.frame
                imageArray = [UIImage(named: "img1"),UIImage(named: "img2")] as! [UIImage]
        
                for i in 0..<imageArray.count{
                    let imageView = UIImageView()
                    imageView.image = imageArray[i]
                    imageView.contentMode = .scaleAspectFit
                    let xPosition = self.view.frame.width * CGFloat(i)
                    imageView.frame = CGRect(x: xPosition, y: 0, width: self.mainScrollView.frame.width, height: self.mainScrollView.frame.height)
                    mainScrollView.contentSize.width = mainScrollView.frame.width * CGFloat(i + 1)
                   mainScrollView.addSubview(imageView)
          }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
