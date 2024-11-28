function _read_confirm
	# Parse arguments
	argparse --name _read_confirm 'p/prompt=' 'y/defaultyes' -- $argv or return
	# If prompt not set, do a default
    if test -z "$_flag_p"
        set _flag_p "Continue?"
    end

	while true
		# declare variable
		set confirm ''

		if test "$_flag_y"
			read -p 'set_color green; echo -n "$_flag_p [Y/n]: "; set_color normal' -l temp_conf
			# write to $confirm
			set confirm "$temp_conf"
		else 
			read -p 'set_color green; echo -n "$_flag_p [y/N]: "; set_color normal' -l temp_conf
			set confirm "$temp_conf"
		end

		switch $confirm
			case Y y
				return 0
			case N n
				return 1
			case ''
				if test "$_flag_y"
					return 0
				else
					return 1
				end
		end
	end
end

