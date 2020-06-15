/*:
# Search in a Binary Search Tree
  https://leetcode.com/explore/featured/card/june-leetcoding-challenge/541/week-3-june-15th-june-21st/3361/

 ---

### Problem Statement:

 Given the root node of a binary search tree (BST) and a value. You need to find the node in the BST that the node's value equals the given value. Return the subtree rooted with that node. If such node doesn't exist, you should return NULL.


### Example:

 ```
 Given the tree:
         4
        / \
       2   7
      / \
     1   3

 And the value to search: 2

 ```
 In the example above, if we want to search the value 5, since there is no node with value 5, we should return NULL.

 Note that an empty tree is represented by NULL, therefore you would see the expected output (serialized tree format) as [], not null.
 
 */

import UIKit

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

class Solution {
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        
    }
}
