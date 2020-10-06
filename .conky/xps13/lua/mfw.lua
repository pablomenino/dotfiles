--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
-- MFW Lua script - Version 0.1
--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

conky_set_update_interval(2)

min_thr_disc = 60
med_thr_disc = 85
max_thr_disc = 100

min_thr_mem = 60
med_thr_mem = 85
max_thr_mem = 100

min_thr_temp = 40
med_thr_temp = 55
max_thr_temp = 100

--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

function conky_get_memperc( )
	local cmd="${memperc}"
	local percent_str=tonumber(conky_parse(cmd))
	local val = ""

	if ( percent_str <= max_thr_mem ) then
		val = "${color3}"
	end

	if ( percent_str <= med_thr_mem ) then
		val = "${color2}"
	end

	if ( percent_str <= min_thr_mem ) then
		val = "${color1}"
	end

	val = val .. cmd .. "%${color}"

	return val
end

--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

function conky_get_cpu_use_perc( )
	local cmd="${cpu cpu}"
	local percent_str=tonumber(conky_parse(cmd))
	local val = ""

	if ( percent_str <= max_thr_mem ) then
		val = "${color3}"
	end

	if ( percent_str <= med_thr_mem ) then
		val = "${color2}"
	end

	if ( percent_str <= min_thr_mem ) then
		val = "${color1}"
	end

	val = val .. cmd .. "%${color}"

	return val
end

--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

function conky_get_part_used( part_srt )
	local cmd="${fs_used_perc " .. part_srt .. "}"
	local percent_str=tonumber(conky_parse(cmd))
	local val = ""

	if ( percent_str <= max_thr_disc ) then
		val = "${color3}"
	end

	if ( percent_str <= med_thr_disc ) then
		val = "${color2}"
	end

	if ( percent_str <= min_thr_disc ) then
		val = "${color1}"
	end

	val = val .. cmd .. "%${color}"

	return val
end

--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

function conky_get_cpu_temp(  )
	local cmd="${execi 120 sensors | grep -A 0 'Package id 0' | awk '{print $4}' | cut -c2-3}"
	local percent_str=tonumber(conky_parse(cmd))
	local val = ""

	if ( percent_str <= max_thr_temp ) then
		val = "${color3}"
	end

	if ( percent_str <= med_thr_temp ) then
		val = "${color2}"
	end

	if ( percent_str <= min_thr_temp ) then
		val = "${color1}"
	end

	val = val .. cmd .. "°C${color}"

	return val
end

--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

function conky_get_cpu_c0_temp(  )
	local cmd="${exec sensors | grep -A 0 'Core 0' | awk '{print $3}' | cut -c2-3}"
	local percent_str=tonumber(conky_parse(cmd))
	local val = ""

	if ( percent_str <= max_thr_temp ) then
		val = "${color3}"
	end

	if ( percent_str <= med_thr_temp ) then
		val = "${color2}"
	end

	if ( percent_str <= min_thr_temp ) then
		val = "${color1}"
	end

	val = val .. cmd .. "°C${color}"

	return val
end

--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

function conky_get_cpu_c1_temp(  )
	local cmd="${exec sensors | grep -A 0 'Core 1' | awk '{print $3}' | cut -c2-3}"
	local percent_str=tonumber(conky_parse(cmd))
	local val = ""

	if ( percent_str <= max_thr_temp ) then
		val = "${color3}"
	end

	if ( percent_str <= med_thr_temp ) then
		val = "${color2}"
	end

	if ( percent_str <= min_thr_temp ) then
		val = "${color1}"
	end

	val = val .. cmd .. "°C${color}"

	return val
end

--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

function conky_get_mb_temp1(  )
	local cmd="${exec sensors | grep -A 0 'temp1:' | awk '{print $2}' | cut -c2-3 | head -1}"
	local percent_str=tonumber(conky_parse(cmd))
	local val = ""

	if ( percent_str <= max_thr_temp ) then
		val = "${color3}"
	end

	if ( percent_str <= med_thr_temp ) then
		val = "${color2}"
	end

	if ( percent_str <= min_thr_temp ) then
		val = "${color1}"
	end

	val = val .. cmd .. "°C${color}"

	return val
end

--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

function conky_get_mb_temp2(  )
	local cmd="${exec sensors | grep -A 0 'temp2:' | awk '{print $2}' | cut -c2-3}"
	local percent_str=tonumber(conky_parse(cmd))
	local val = ""

	if ( percent_str <= max_thr_temp ) then
		val = "${color3}"
	end

	if ( percent_str <= med_thr_temp ) then
		val = "${color2}"
	end

	if ( percent_str <= min_thr_temp ) then
		val = "${color1}"
	end

	val = val .. cmd .. "°C${color}"

	return val
end

--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

function conky_get_mb_temp3(  )
	local cmd="${exec sensors | grep -A 0 'temp3:' | awk '{print $2}' | cut -c2-3}"
	local percent_str=tonumber(conky_parse(cmd))
	local val = ""

	if ( percent_str <= max_thr_temp ) then
		val = "${color3}"
	end

	if ( percent_str <= med_thr_temp ) then
		val = "${color2}"
	end

	if ( percent_str <= min_thr_temp ) then
		val = "${color1}"
	end

	val = val .. cmd .. "°C${color}"

	return val
end

--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

function conky_get_hdd_temp( part_srt )
	local cmd="${exec hddtemp | grep -A 0 '" .. part_srt .. "' | awk '{print $4}' | cut -c1-2}"
	local percent_str=tonumber(conky_parse(cmd))
	local val = ""

	if ( percent_str <= max_thr_disc ) then
		val = "${color3}"
	end

	if ( percent_str <= med_thr_disc ) then
		val = "${color2}"
	end

	if ( percent_str <= min_thr_disc ) then
		val = "${color1}"
	end

	val = val .. cmd .. "%${color}"

	return val
end

--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
