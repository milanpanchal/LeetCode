#
#https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/539/week-1-june-1st-june-7th/3347/
#Day-1: Invert a binary tree.
#
#Example:
#
#Input:
#
#     4
#   /   \
#  2     7
# / \   / \
#1   3 6   9
#
#Output:
#
#     4
#   /   \
#  7     2
# / \   / \
#9   6 3   1
#*/
#

# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right
class Solution:
    def invertTree(self, root: TreeNode) -> TreeNode:
        if root != None :
            root.left, root.right = self.invertTree(root.right), self.invertTree(root.left)
        
        return root
        
        