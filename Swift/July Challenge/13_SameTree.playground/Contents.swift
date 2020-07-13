/*:
# Same Tree
  https://leetcode.com/explore/challenge/card/july-leetcoding-challenge/545/week-2-july-8th-july-14th/3389/

 ---

### Problem Statement:

 Given two binary trees, write a function to check if they are the same or not.

 Two binary trees are considered the same if they are structurally identical and the nodes have the same value.

### Example:

 ```
 Input:     1         1
           / \       / \
          2   3     2   3

         [1,2,3],   [1,2,3]

 Output: true

 
 Input:     1         1
           /           \
          2             2

         [1,2],     [1,null,2]

 Output: false

 
 Input:     1         1
           / \       / \
          2   1     1   2

         [1,2,1],   [1,1,2]

 Output: false

 ```
 
 */

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

import UIKit

class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        
        return true
    }
}

let p = TreeNode(1)
p.left = TreeNode(2)
p.right = TreeNode(3)

let q = TreeNode(1)
q.left = TreeNode(2)
q.right = TreeNode(3)


let sol = Solution()
sol.isSameTree(p, q)
