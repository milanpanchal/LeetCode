/*:
# Maximum Width of Binary Tree
  https://leetcode.com/explore/featured/card/july-leetcoding-challenge/545/week-2-july-8th-july-14th/3385/

 ---

### Problem Statement:

 Given a binary tree, write a function to get the maximum width of the given tree. The width of a tree is the maximum width among all levels. The binary tree has the same structure as a full binary tree, but some nodes are null.

 The width of one level is defined as the length between the end-nodes (the leftmost and right most non-null nodes in the level, where the `null` nodes between the end-nodes are also counted into the length calculation.


### Example 1:

 ```
 Input:

            1
          /   \
         3     2
        / \     \
       5   3     9

 Output: 4
 Explanation: The maximum width existing in the third level with the length 4 (5,3,null,9).

 ```

 ### Example 2:

 ```
 Input:

           1
          /
         3
        / \
       5   3

 Output: 2
 Explanation: The maximum width existing in the third level with the length 2 (5,3).

 ```

 ### Example 3:

 ```
 Input:

           1
          / \
         3   2
        /
       5

 Output: 2
 Explanation: The maximum width existing in the second level with the length 2 (3,2).

 ```
 
 ### Example 4:
 
 ```
 Input:

           1
          / \
         3   2
        /     \
       5       9
      /         \
     6           7
 Output: 8
 Explanation:The maximum width existing in the fourth level with the length 8 (6,null,null,null,null,null,null,7).

 ```

 ### Notes:
 + Answer will in the range of 32-bit signed integer.
 
 */

import UIKit

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

//108 / 108 test cases passed.
//Status: Accepted
//Runtime: 28 ms
//Memory Usage: 21.2 MB

class Solution {
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
       
        guard let root = root else {
            return 0
        }

        var queue: [(node: TreeNode, val: Int)] = [(root, 1)]
        var maxWidth = 1

        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let curr = queue.removeFirst()
                
                if let left = curr.node.left {
                    queue.append((left, curr.val * 2))
                }

                if let right = curr.node.right {
                    queue.append((right, curr.val * 2 + 1))
                }
            }
            if !queue.isEmpty {
                maxWidth = max(maxWidth, queue.last!.val - queue.first!.val + 1)
            }
        }
        
        return maxWidth
    }
}

let node = TreeNode(1)
node.left = TreeNode(3)
node.left?.left = TreeNode(5)
node.left?.right = TreeNode(3)

let sol = Solution()
sol.widthOfBinaryTree(node) // 2 (5,3)

class Solution1 {
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var maxWidth = 0
        var queue: [(node: TreeNode, index: Int)] = []
        queue.append((node: root, index: 0))
        
        while !queue.isEmpty {
            let size = queue.count
            let first = queue.first!
            let last = queue.last!
            
            let currentWidth = last.index - first.index + 1
            
            if currentWidth > maxWidth {
                maxWidth = currentWidth
            }
            
            for _ in 0..<size {
                let tuple = queue.removeFirst()
                
                if let left = tuple.node.left {
                    queue.append((node: left, index: tuple.index * 2-1))
                }
                
                if let right = tuple.node.right {
                    queue.append((node: right, index: tuple.index * 2))
                }
            }
        }
        
        return maxWidth
    }
}
