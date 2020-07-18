/*:
# 1470. Shuffle the Array
  https://leetcode.com/problems/shuffle-the-array/

 ---

### Problem Statement:

 Given the array `nums` consisting of `2n` elements in the form `[x1,x2,...,xn,y1,y2,...,yn]`.

 Return the array in the form `[x1,y1,x2,y2,...,xn,yn]`.


### Example:

 ```
 Input: nums = [2,5,1,3,4,7], n = 3
 Output: [2,3,5,4,1,7]
 Explanation: Since x1=2, x2=5, x3=1, y1=3, y2=4, y3=7 then the answer is [2,3,5,4,1,7].

 
 Input: nums = [1,2,3,4,4,3,2,1], n = 4
 Output: [1,4,2,3,3,2,4,1]

 Input: nums = [1,1,2,2], n = 2
 Output: [1,2,1,2]

 ```
 
 ### Constraints:
 + 1 <= n <= 500
 + nums.length == 2n
 + 1 <= nums[i] <= 10^3
 
 */


import UIKit

class Solution {
    
//    53 / 53 test cases passed.
//    Status: Accepted
//    Runtime: 48 ms
//    Memory Usage: 21.1 MB

    func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
        if n == 1 {
            return nums
        }
        var result = [Int]()
        for i in 0..<n {
            result.append(nums[i])
            result.append(nums[i+n])
        }
        return result
    }
}

let sol = Solution()
sol.shuffle([2,5,1,3,4,7], 3)       // [2,3,5,4,1,7]
sol.shuffle([1,2,3,4,4,3,2,1], 4)   // [1,4,2,3,3,2,4,1]
sol.shuffle([1,1,2,2], 2)           // [1,2,1,2]

