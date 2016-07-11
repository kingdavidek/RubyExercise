


#while 1
#	puts "Enter a number>>"
#	begin
#		num = Kernel.gets.match(/\d+/)[0]
#	rescue
#		puts "Wrong Input"
#	else
#		puts "#{num} + 1 is: #{num.to_i+1}"
#	end
#end


require 'open-uri'
require 'timeout'

remote_base_url = "http://en.wikipedia.org/wiki"


[1900, 1910, 'xj3490', 2000].each do |yr|
	retries = 3

	begin  #BEGIN starts off the exception handling block. 
		url = "#{remote_base_url}/#{yr}"
		puts "getting #{url}"
		rpage = open(url)	#the operation at risk of failing
	rescue StandardError =>e    #executes if an exception or error is raised. In the casse, if an error of the StandardError class is raised.
		puts "\tError: #{e}"	#the error is stored in variable 'e'
		if retries > 0
			puts "\tTrying #{retries} more times"
			retries -=1
			sleep 1
			retry #this skips everything below and goes back to the beginning
		else
			puts "\t\tCan't get that page, trying next"
		end
	else
		puts "\tGot page for #{yr}"
		rdata = rpage.read  #if all goes well, we should end up here.
	ensure	#this will execute regardless of whether or not there was an error.
		puts "sleeping"
		sleep 2
	end

	if rdata 
		File.open("copy-of-#{yr}.html", "w"){|f| f.write(rdata)}
	end
end
##########################################################
##########################################################

#The template for exception handling

#for i in 'A'..'C'
#  retries = 2
#  begin
#    puts "Executing command #{i}"
#    raise "Exception: #{i}" 	#use the raise statement to create an Exception to be caught
#  rescue Exception=>e
#    puts "\tCaught: #{e}"
#    if retries > 0
#      puts "\tTrying #{retries} more times\n"
#      retries -= 1
#      sleep 2
#      retry
#    end  
#  end
#end

