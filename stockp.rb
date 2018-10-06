def stock_picker(arr)
    buy_day=0
    sell_day=1
    net=arr[1]- arr[0]
    arr.each_index do |i|
        # puts i, buy_day, sell_day, net
        if i<arr.length-1
            later_prices=arr[i+1..-1]
            # puts later_prices.to_s
            j=later_prices.max
            # puts "max is " + j.to_s
            new_net=j-arr[i]
            if new_net>net
                buy_day=i
                sell_day=later_prices.index(j)+i+1
                net=new_net
            end  
        end
    end
    a=[buy_day,sell_day]
    return a
end


prices=[]
while true do
    puts "Enter a price for the day, or a blank line to quit."
    s=gets.chomp
    if s=="" 
        break
    end
    prices << s.to_i
end

buysell=stock_picker(prices)
puts "You buy on day " + buysell[0].to_s + " and sell on day " + buysell[1].to_s + " for a net profit of " + (prices[buysell[1]] - prices[buysell[0]]).to_s + " per share."
    
        