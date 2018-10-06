def bubble_sort(a)
  while true
    changed=false
    a.each_index do |i|
      puts i
      if i<(a.length)-1 and a[i] > a[i+1]
        puts a[i].to_s + " is greater than " + a[i+1].to_s
        val=a.delete_at(i)
        puts "val is " + val.to_s
        a.insert(i+1,val)
        changed=true
        puts a.to_s
      end
    end
    if !changed
      break
    end
  end
  a
end