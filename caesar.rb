Aupper= "A".bytes[0]
Alower = "a".bytes[0]
Zupper = "Z".bytes[0]
Zlower = "z".bytes[0]
Maxshift=Zupper-Aupper+1

def caesar_cipher(s,i)
    encoded=""
    s.each_byte do |c|
        if c>=Aupper && c<=Zupper  #uppercase letter
           d=((c-Aupper+i)%Maxshift)+Aupper
           encoded_char=d.chr 
           encoded+=encoded_char
         elsif c>=Alower && c<=Zlower
           d=((c-Alower+i)%Maxshift)+Alower
           encoded_char=d.chr
           encoded+=encoded_char
         else # not in A-Z or a-z
           encoded+=c.chr
        end 
    end
    return encoded
end


puts "enter a string"
s=gets.chomp
puts "enter a number"
i=gets.chomp.to_i
puts "the encoded string is: " + caesar_cipher(s,i)
           
        
        