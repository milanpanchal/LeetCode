/*:
# Find All Duplicates in an Array
  https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/549/week-1-august-1st-august-7th/3414/

 ---

### Problem Statement:

 Given an array of integers, 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.

 Find all the elements that appear twice in this array.

 Could you do it without extra space and in O(n) runtime?


### Example:

 ```
 Input:
 [4,3,2,7,8,2,3,1]

 Output:
 [2,3]

 ```
 
 */


import UIKit

class Solution {
    
    //    28 / 28 test cases passed.
    //    Status: Accepted
    //    Runtime: 536 ms
    //    Memory Usage: 25.6 MB
    
    func findDuplicates(_ nums: [Int]) -> [Int] {
        let groupedDict = Dictionary(grouping: nums, by: { $0 })
        return Array(groupedDict.filter { $1.count == 2 }.keys)
    }
    
    func findDuplicates2(_ nums: [Int]) -> [Int] {
        if nums.count <= 1 {
            return []
        }
        
        var nums = nums.sorted()
        nums.append(Int.max)
        
        for i in 1..<nums.count {
            if nums[i] != nums[i-1] {
                nums[i-1] = Int.max
            }
        }
        
        return nums.filter({ $0 != Int.max })
    }
    
    
    func findDuplicates3(_ nums: [Int]) -> [Int] {
        var nums = nums
        var results = [Int]()
        
        for i in 0 ..< nums.count {
            let index = abs(nums[i]) - 1
            
            if nums[index] > 0 {
                nums[index] = -nums[index]
            } else {
                results.append(index + 1)
            }
            
        }
        
        return results
    }
    
}

let sol = Solution()
sol.findDuplicates([]) // []
sol.findDuplicates([1]) // []
sol.findDuplicates([1, 1]) // [1]

sol.findDuplicates([4,3,2,7,8,2,3,1]) // [2, 3]
sol.findDuplicates2([4,3,2,7,8,2,3,1]) // [2, 3]

