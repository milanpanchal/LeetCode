/*
# Two City Scheduling
#  https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/539/week-1-june-1st-june-7th/3349/
#
# ---
#
#### Problem Statement:
# There are 2N people a company is planning to interview. The cost of flying the i-th person to city A is costs[i][0], and the cost of flying the i-th person to city B is costs[i][1].
#
#Return the minimum cost to fly every person to a city such that exactly N people arrive in each city.
#
# 
#
#Example 1:
#
#Input: [[10,20],[30,200],[400,50],[30,20]]
#Output: 110
#Explanation: 
#The first person goes to city A for a cost of 10.
#The second person goes to city A for a cost of 30.
#The third person goes to city B for a cost of 50.
#The fourth person goes to city B for a cost of 20.
#
#The total minimum cost is 10 + 30 + 50 + 20 = 110 to have half the people interviewing in each city.
#
# 
#
#Note:
#
#    1 <= costs.length <= 100
#    It is guaranteed that costs.length is even.
#    1 <= costs[i][0], costs[i][1] <= 1000
#
*/

class Solution {
public:
    int twoCitySchedCost(vector<vector<int>>& costs) {
        sort(costs.begin(), costs.end(), 
            [](const vector<int> & a, const vector<int> & b) -> bool
             { 
                 return (a[0]-a[1]) < (b[0]-b[1]); 
             }
            );
        int len = costs.size() /2;      
        /*
        std::cout << '[';
        for (vector<vector<int>>::iterator i = costs.begin(); i != costs.end(); ++i)
            std::cout << '[' << (*i)[0] << ',' << (*i)[1] << ']' << ',';
        
        std::cout << "] :";        
        std::cout << '(' <<len<< ')' << endl;
       */ 
        int sum=0;
        vector<vector<int>>::iterator it = costs.begin();
        for(; it != costs.begin()+len; ++it)
            sum += (*it)[0];
        for(; it != costs.end(); ++it)
            sum += (*it)[1];
        
        return sum;
    }
};
