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

class Solution {
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
       
        return 1
    }
}

let node = TreeNode(1)
node.left = TreeNode(3)
node.left?.left = TreeNode(5)
node.left?.right = TreeNode(3)

let sol = Solution()
sol.widthOfBinaryTree(node) // 2 (5,3)
