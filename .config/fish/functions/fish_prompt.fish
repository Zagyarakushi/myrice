function fish_prompt
	set_color  cc8800 
	printf "["(date +%T)"]" 
	set_color 7fd7ff 
	printf "["(pwd)"]"
	set_color cc0000
	printf "-"
	printf "> "
end
