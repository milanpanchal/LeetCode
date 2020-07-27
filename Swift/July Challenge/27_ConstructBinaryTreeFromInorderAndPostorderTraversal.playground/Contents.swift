/*:
# Construct Binary Tree from Inorder and Postorder Traversal
  https://leetcode.com/explore/challenge/card/july-leetcoding-challenge/547/week-4-july-22nd-july-28th/3403/

 ---

### Problem Statement:

 Given inorder and postorder traversal of a tree, construct the binary tree.


### Example:

 ```
 inorder = [9,3,15,20,7]
 postorder = [9,15,7,20,3]

 Return the following binary tree:

   3
  / \
 9  20
   /  \
  15   7

 ```
 

 ### Notes:
 + You may assume that duplicates do not exist in the tree.
 
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


class Solution {
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        return TreeNode()
    }
}

let sol = Solution()
sol.buildTree([9,3,15,20,7], [9,15,7,20,3])
