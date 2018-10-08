module Enumerable
    def my_each
        for i in 0..self.length-1 do
            yield self[i]
        end
    end
    def my_each_with_index
        for i in 0..self.length-1 do
            yield self[i], i
        end
    end
    def my_select
        newenum=[]
        for i in 0..self.length-1 do
          if yield self[i]
              newenum << self[i]
          end
        end
        newenum
    end
    def my_any?
        for i in 0..self.length-1 do
            if yield self[i]
                return true
            end
        end
        return false
    end
    def my_none?
        for i in 0..self.length-1 do
            if yield self[i]
                return false 
            end
        end
        return true
    end
    def my_count
        count=0
        for i in 0..self.length-1 do
            if yield self[i]
                count+=1
            end
        end
        count
    end
    def my_map procx=nil
        newarray=[]
        for i in 0..self.length-1 do
            if (procx)
                newarray<<procx.call(self[i])
            else
                newarray << yield(self[i])
            end
        end
        newarray
    end
    def my_inject(accum=0)
        for i in 0..self.length-1 do
            accum=yield(accum,self[i])
        end
        accum
    end
end

=begin
array=[1,5,2,7,9]

array.my_each do |a|
    puts a.to_s
end

thishash={}
array.my_each_with_index do |val, i|
    thishash[i]=val
end
puts thishash

newarray = array.my_select { |val|  val%2 == 1 }
puts newarray

if array.my_any? { |val| val==7 }
    puts "found 7"
else
    puts "didn't find 7"
end 

if array.my_none? { |val| val == 7 }
    puts "didn't find 7"
else
    puts "found 7"
end

puts "count = " + (array.my_count { |val| val%2 == 1 }).to_s
=end