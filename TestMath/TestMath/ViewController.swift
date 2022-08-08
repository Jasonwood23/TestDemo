//
//  ViewController.swift
//  TestMath
//
//  Created by dengjunjie on 2022/6/13.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let num = searchInsert([1,3,5,6], 3);
        print(num);
        
    }
    
    
    
    
    
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        
        var left = 0;
        var right = nums.count - 1;
        
        while left <= right {
            var mid = left + right / 2;
            if nums[mid] == target {
                return mid
            }else if nums[mid] < target{
                left = mid + 1;
            }else if nums[mid] > target{
                right = mid - 1;
            }
        }
        return right + 1;
        
    }
    
    
}

