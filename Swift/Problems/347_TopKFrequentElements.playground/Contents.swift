/*:
# 347. Top K Frequent Elements
  https://leetcode.com/problems/top-k-frequent-elements/

 ---

### Problem Statement:
 Given a non-empty array of integers, return the `k` most frequent elements.

### Example:

 ```
 Input: nums = [1,1,1,2,2,3], k = 2
 Output: [1,2]

 Input: nums = [1], k = 1
 Output: [1]

 ```
 
 ### Note:
 + You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
 + Your algorithm's time complexity must be better than O(n log n), where n is the array's size.
 + It's guaranteed that the answer is unique, in other words the set of the top k frequent elements is unique.
 + You can return the answer in any order.

 */

import UIKit

class Solution {
    
//    21 / 21 test cases passed.
//    Status: Accepted
//    Runtime: 156 ms
//    Memory Usage: 22.1 MB

    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
       
        if nums.isEmpty {
            return []
        }
        
        var hashMap = [Int:Int]()
        for n in nums {
            hashMap[n, default:0] += 1
        }
        
        var result = [(Int, Int)]()
        for (key, val) in hashMap {
            result.append((key,val))
        }
        result.sort { (a, b) -> Bool in
            return a.1 > b.1
        }
        
        var ans = [Int]()
        
        for i in 0..<k {
            ans.append(result[i].0)
        }
        return ans
    }
    
    func topKFrequent2(_ nums: [Int], _ k: Int) -> [Int] {
        if nums.isEmpty {
            return []
        }
        
        var freqDict = [Int: Int]()
        var bucket = [Int: [Int]]()
        
        for num in nums {
            freqDict[num, default: 0] += 1
        }

        for (num, freq) in freqDict {
            bucket[freq, default: []].append(num)
        }

        var res = [Int]()
        var n = nums.count
        
        while res.count < k {
            if let vals = bucket[n] {
                for val in vals {
                    res.append(val)
                }
            }
            
            n -= 1
        }
        
        return res
    }
}

let sol = Solution()
sol.topKFrequent([1,1,1,2,2,3, 4], 2) // [1, 2]
sol.topKFrequent([1], 1) // [1]
