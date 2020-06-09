/*
## Queue Reconstruction by Height
#  https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/539/week-1-june-1st-june-7th/3352/
#
# ---
#
#### Problem Statement:
#
# Suppose you have a random list of people standing in a queue. Each person is described by a pair of integers (h, k), where h is the height of the person and k is the number of people in front of this person who have a height greater than or equal to h. Write an algorithm to reconstruct the queue.
#
#
#### Example:
#
# ```
# Input:
# [[7,0], [4,4], [7,1], [5,0], [6,1], [5,2]]
#
# Output:
# [[5,0], [7,0], [5,2], [6,1], [4,4], [7,1]]
#
# ```
# 
# ### Hint:
# + What can you say about the position of the shortest person? If the position of the shortest person is i, how many people would be in front of the shortest person?
# + Once you fix the position of the shortest person, what can you say about the position of the second shortest person?
#
#
# ### Notes:
# +  The number of people is less than 1,100.
# 
#
*/
class Solution {
public:
    int getInsertIndex( int * iposList, int skipZero)
    {
        int * iposList_origin = iposList;
        while(true)
        {
            while( *iposList != 0)
                iposList++;
            if(skipZero >0)
            {
                --skipZero;
                iposList++;
                continue;
            }
            *iposList = 1;
            return iposList-iposList_origin;
        }
    }
    vector<vector<int>> reconstructQueue(vector<vector<int>>& people) {
       
        sort(people.begin(), people.end(),
            [](const vector<int>& a, const vector<int>& b)
            {
                if( a[0] == b[0] )
                    return a[1]>b[1];
                return a[0] < b[0];
            });
        
        int * ipos = new int[people.size()];
        vector<vector<int>> returnVec;
        returnVec.reserve(people.size());
        
        //ZeroMemory(ipos, sizeof(people.size()*sizeof(int)));
        vector<int> dummy;
        dummy.push_back(0);
        dummy.push_back(0);
        for(int i=0; i<people.size(); ++i)
        {
            ipos[i] = 0;
            returnVec.push_back(dummy);
            //cout<< "[" << people[i][0] << "," << people[i][1] <<"],";
        }
        
        for(int i=0; i<people.size(); ++i)
        {
            returnVec[getInsertIndex(ipos, people[i][1])] = people[i];
        }
        return returnVec;
    }
};

