/*:
# Contiguous Array
  https://leetcode.com/explore/challenge/card/may-leetcoding-challenge/537/week-4-may-22nd-may-28th/3341/

 ---

### Problem Statement:

 Given a binary array, find the maximum length of a contiguous subarray with equal number of 0 and 1.


### Example 1:

 ```
 Input: [0,1]
 Output: 2
 Explanation: [0, 1] is the longest contiguous subarray with equal number of 0 and 1.
 ```

 ### Example 2:

 ```
 Input: [0,1,0]
 Output: 2
 Explanation: [0, 1] (or [1, 0]) is a longest contiguous subarray with equal number of 0 and 1.
 ```

 ### Notes:
 + Note: The length of the given binary array will not exceed 50,000.
 
 */

import Foundation

///Complexity Analysis
///Time complexity : `O(n^2`). We consider every possible subarray by traversing over the complete array for every start point possible.
///Space complexity : O(1). Only two variables `subArrayLength` and `sum` are required.

func findMaxLengthBruteForce(_ nums: [Int]) -> Int {
   
    guard nums.count > 0 else {
        return 0
    }
    
    var subArrayLength = 0

    for i in 0..<nums.count {
        var sum = 0
        for j in i..<nums.count {
            sum += (nums[j] == 0 ? -1 : 1)
            if sum == 0 {
                subArrayLength = max(subArrayLength, j - i + 1)
            }
        }
        
    }
    
    return subArrayLength
}

// Time complexity : `O(n)`. The entire array is traversed only once.
// Space complexity : `O(n)`. Maximum size of the `hashMap` will be `n`, if all the elements are either 1 or 0.
func findMaxLength(_ nums: [Int]) -> Int {
   
    guard nums.count > 0 else {
        return 0
    }
    
    var count = 0
    var subArrayLength = 0
    var hashMap = [Int: Int]()
    
    for i in 0..<nums.count {
        
        count += (nums[i] == 0 ? -1 : 1)
        
        if count == 0 {
            subArrayLength = i + 1
        }
        
        if let val = hashMap[count] {
            subArrayLength = max(subArrayLength, i - val)
        } else {
            hashMap[count] = i
        }
        
        
    }
    
    return subArrayLength
}

findMaxLength([0, 1]) // 2
findMaxLength([0, 1, 0]) // 2
findMaxLength([0, 1, 1, 0, 1, 1]) // 4
findMaxLength([0, 0, 1, 0, 0, 1, 1]) // 6
findMaxLength([0, 0, 1, 0, 0, 0, 1, 1]) // 6
