require_relative "enumer.rb"
require "test/unit"
 
class TestMyEnumerables < Test::Unit::TestCase
    
    def gen_times(factor)
        return Proc.new { |n| n*factor }
    end

    def setup
        @array=[1,5,2,7,9]
    end

    def test_my_each
        newarray=[]
        @array.my_each do |a|
            newarray << a
        end
        assert newarray==@array
    end
    
    def test_my_each_with_index
        thishash={}
        @array.my_each_with_index do |val, i|
            thishash[i]=val
        end
        assert thishash=={0=>1,1=>5,2=>2,3=>7,4=>9}
    end
    
    def test_my_select
        newarray = @array.my_select { |val|  val%2 == 1 }
        assert newarray==[1,5,7,9]
    end
    
    def test_my_any
        assert @array.my_any? { |val| val==7 }
    end 

    def test_my_none
        assert_equal(false,@array.my_none? { |val| val == 7 })
    end

    def test_my_count
        assert_equal(4, @array.my_count { |val| val%2 == 1 })
    end
    
    def test_my_map
        assert_equal([2,6,3,8,10],@array.my_map { |val| val + 1})
    end
    
    def test_my_inject
        assert_equal(630,(@array.my_inject(1) { |product, val| product*val}))
    end
    
    def test_my_map_with_proc
        myproc=gen_times(3)
        assert_equal([3,15,6,21,27],@array.my_map(myproc))
    end
end