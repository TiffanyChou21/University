nums=eval(input())
for i in range(1, len(nums)):#直接dp存到原数组
    nums[i] = max(nums[i], nums[i] + nums[i-1])#即nums[i-1]=dp[i-1]
print(max(nums))
