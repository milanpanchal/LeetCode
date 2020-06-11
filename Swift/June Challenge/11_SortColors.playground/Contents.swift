/*:
# Sort Colors
  https://leetcode.com/explore/featured/card/june-leetcoding-challenge/540/week-2-june-8th-june-14th/3357/

 ---

### Problem Statement:

 Given an array with n objects colored red, white or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white and blue.

 Here, we will use the integers 0, 1, and 2 to represent the color red, white, and blue respectively.

### Example:

 ```
 Input: [2,0,2,1,1,0]
 Output: [0,0,1,1,2,2]

 ```
 
 ### Note:
 You are not suppose to use the library's sort function for this problem.


 ### Follow up:
 + A rather straight forward solution is a two-pass algorithm using counting sort.
 + First, iterate the array counting number of 0's, 1's, and 2's, then overwrite array with total number of 0's, then 1's and followed by 2's.
 + Could you come up with a one-pass algorithm using only constant space?
 
 */

import UIKit

func sortColors1(_ nums: inout [Int]) {
    
    for i in 0..<nums.count {
        for j in i..<nums.count {
            if nums[i] > nums[j] {
                nums.swapAt(i, j)
            }
        }
    }
}

func sortColors(_ nums: inout [Int]) {
    
    var counts = Array(repeating: 0, count: 3)
    
    for i in 0..<nums.count {
        counts[nums[i]] += 1
    }

    for index in 0..<nums.count {
        if 0..<counts[0] ~= index {
            nums[index] = 0 //counts[0]
        } else if counts[0]..<counts[0]+counts[1] ~= index {
            nums[index] = 1
        } else {
            nums[index] = 2
        }
        
    }
}
var colors = [2,0,2,1,1,0]
sortColors(&colors)
print(colors)

var colors2 = [2,0,1]
sortColors(&colors2)
print(colors2)
