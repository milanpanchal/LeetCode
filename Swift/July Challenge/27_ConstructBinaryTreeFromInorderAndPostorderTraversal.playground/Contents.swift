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


// 203 / 203 test cases passed.
// Status: Accepted
// Runtime: 24 ms
// Memory Usage: 22.2 MB

class Solution {
    
    var current: Int = 0

    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        
        guard inorder.count == postorder.count, inorder.count > 0 else {
            return nil
        }
        
        current = postorder.count-1
        var inorderMap = [Int: Int]()
        for (idx, val) in inorder.enumerated() {
            inorderMap[val] = idx
        }
        
        return buildTreePSTIN(inorderMap, postorder, 0, postorder.count-1)

    }
    
    private func buildTreePSTIN(_ inorderMap: [Int: Int], _ postorder: [Int], _ start: Int, _ end: Int) -> TreeNode? {
        
        if start > end || current < 0 {
            return nil
        }
        
        let value = postorder[current]
        let node = TreeNode(value)
        let index = inorderMap[value] ?? 0
        
        current -= 1
        
        node.right = buildTreePSTIN(inorderMap, postorder, index+1, end)
        node.left = buildTreePSTIN(inorderMap, postorder, start, index-1)
        
        return node
    }
}

let sol = Solution()
sol.buildTree([9,3,15,20,7], [9,15,7,20,3])
