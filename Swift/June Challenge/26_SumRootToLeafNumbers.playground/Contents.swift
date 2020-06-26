/*:
# Sum Root to Leaf Numbers
  https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/542/week-4-june-22nd-june-28th/3372/

 ---

### Problem Statement:

 Given a binary tree containing digits from `0-9` only, each root-to-leaf path could represent a number.

 An example is the root-to-leaf path `1->2->3` which represents the number `123`.

 Find the total sum of all root-to-leaf numbers.


### Example 1:

 ```
 Input: [1,2,3]
     1
    / \
   2   3
 Output: 25
 Explanation:
 The root-to-leaf path 1->2 represents the number 12.
 The root-to-leaf path 1->3 represents the number 13.
 Therefore, sum = 12 + 13 = 25.
 ```

 ### Example 2:

 ```
 Input: [4,9,0,5,1]
     4
    / \
   9   0
  / \
 5   1
 Output: 1026
 Explanation:
 The root-to-leaf path 4->9->5 represents the number 495.
 The root-to-leaf path 4->9->1 represents the number 491.
 The root-to-leaf path 4->0 represents the number 40.
 Therefore, sum = 495 + 491 + 40 = 1026.

 ```

 ### Notes:
 + A leaf is a node with no children.
 
 */

import UIKit

// Definition for a binary tree node.
 public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init() { self.val = 0; self.left = nil; self.right = nil; }
     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
 }
 
// 110 / 110 test cases passed.
// Status: Accepted
// Runtime: 12 ms
// Memory Usage: 21.5 MB

class Solution {
    func sumNumbers(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        var result = [Int]()
        var current = [root.val]

        dfs(root, &current, &result)

        return result.reduce(0, +)
    }
    
    func dfs(_ root: TreeNode?, _ currentArray: inout [Int], _ finalResult: inout [Int]) {
        
        guard let root = root else {
            return
        }
        
        if currentArray.isEmpty { return }
        let cur = currentArray.removeFirst()
        
        if let left = root.left {
            currentArray.append(left.val + cur*10)
            dfs(left, &currentArray, &finalResult)
        }

        if let right = root.right {
            currentArray.append(right.val + cur*10)
            dfs(right, &currentArray, &finalResult)
        }

        // Add current value to final result
        if root.left == nil, root.right == nil {
            finalResult.append(cur)
        }
        
    }
}

let root = TreeNode(1)
root.left = TreeNode(2)
root.right = TreeNode(3)

let sol = Solution()
sol.sumNumbers(root) // 25

let root1 = TreeNode(4)
root1.left = TreeNode(9)
root1.right = TreeNode(0)
root1.left?.left = TreeNode(5)
root1.left?.right = TreeNode(1)
sol.sumNumbers(root1) // 1026
