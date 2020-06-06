/*:
# 406. Queue Reconstruction by Height
  https://leetcode.com/problems/queue-reconstruction-by-height/
 
 ---

### Problem Statement:

 Suppose you have a random list of people standing in a queue. Each person is described by a pair of integers (h, k), where h is the height of the person and k is the number of people in front of this person who have a height greater than or equal to h. Write an algorithm to reconstruct the queue.


### Example:

 ```
 Input:
 [[7,0], [4,4], [7,1], [5,0], [6,1], [5,2]]

 Output:
 [[5,0], [7,0], [5,2], [6,1], [4,4], [7,1]]

 ```
 
 ### Hint:
 + What can you say about the position of the shortest person? If the position of the shortest person is i, how many people would be in front of the shortest person?
 + Once you fix the position of the shortest person, what can you say about the position of the second shortest person?


 ### Notes:
 +  The number of people is less than 1,100.
 
 */

import UIKit

func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
    
    let sortedByHeight = people.sorted { (p1, p2) -> Bool in
        return p1[0] == p2[0] ? p1[1] < p2[1] : p1[0] > p2[0]
    }
    
    var result = [[Int]]()
    sortedByHeight.forEach { result.insert($0, at: $0[1]) }

    return result
}

reconstructQueue([[7,0], [4,4], [7,1], [5,0], [6,1], [5,2]])

