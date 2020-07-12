/*:
# 78. Subsets
  https://leetcode.com/problems/subsets/

 ---

### Problem Statement:
 Given a set of distinct integers, nums, return all possible subsets (the power set).

### Example:

 ```
 Input: nums = [1,2,3]
 Output:
 [
   [3],
   [1],
   [2],
   [1,2,3],
   [1,3],
   [2,3],
   [1,2],
   []
 ]

 ```
 
 ### Notes:
 + The solution set must not contain duplicate subsets.
 
 */

import UIKit

// 10 / 10 test cases passed.
// Status: Accepted
// Runtime: 24 ms
// Memory Usage: 21 MB

extension Collection {
  public var powerSet: [[Element]] {
    guard let fisrt = self.first else {return [[]]}
    return self.dropFirst().powerSet.flatMap{[$0, [fisrt] + $0]}
  }
}

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        return nums.powerSet
    }
    

//    10 / 10 test cases passed.
//    Status: Accepted
//    Runtime: 16 ms
//    Memory Usage: 21.5 MB

    func subsets2(_ nums: [Int]) -> [[Int]] {
        return nums.reduce([[]]) { result, num in
                result + result.map{ $0 + [num]
            }
        }
    }
    
}

let sol = Solution()
sol.subsets([1,2,3])
