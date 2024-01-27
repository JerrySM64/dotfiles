{ config, ...}:

{
  home = {
    file = {
      ".config/neofetch/config.conf" = {
        text = ''
          # See this wiki page for more info:
          # https://github.com/dylanaraps/neofetch/wiki/Customizing-Info
          # Join The Linux Cast Discord https://discord.gg/bPJ4A3bPbV
          # Challenge script by technodaft
          # Improved by cerealkillerjohn
          # Customized by jerrysm64

          # All the Timing information
          let Minute=60
          let Hour=3600
          let Day=86400
          let Week=604800

          # Year_days=365.25 days # 4 years (1461 days cause leap year) Divided by 4
          # Month_days=30.4375 days # Year Divided by 12
          let Month=2629800
          let Year=31557600

          # Year = 365 days, Month = 30 days.
          # let Month=2592000
          # let Year=31536000

          # Calculation of everything needed
          let current=$(date +%s)
          #let birth_install=$(stat -c %W /) # Comment out if using the custom Epoch
          let birth_install=1685654642 # Custom Epoch for Reinstalls
          let reinstalls=0 # put how many times you've had to reinstall
          let restarts=0 # put how many times you've restarted
          let challenge_complete=(birth_install + Year / 2)
          let challenge_complete2=(birth_install + Year * 2)
          let challenge_complete3=(birth_install + Year * 10)
          let diff_left=(challenge_complete - current)
          let diff_left2=(challenge_complete2 - current)
          let diff_left3=(challenge_complete3 - current)
          let diff_done=(current - birth_install)

          let Years_done=(diff_done / Year)
          let Months_done=(diff_done % Year / Month)
          let Weeks_done=(diff_done % Month / Week)
          let Days_done=(diff_done % Week / Day)
          let Hours_done=(diff_done % Day / Hour)
          let Minutes_done=(diff_done % Hour / Minute)
          let Seconds_done=(diff_done % Minute)

          let Years_left=(diff_left / Year)
          let Months_left=(diff_left % Year / Month)
          let Weeks_left=(diff_left % Month / Week)
          let Days_left=(diff_left % Week / Day)
          let Hours_left=(diff_left % Day / Hour)
          let Minutes_left=(diff_left % Hour / Minute)
          let Seconds_left=(diff_left % Minute)

          let Years_left2=(diff_left2 / Year)
          let Months_left2=(diff_left2 % Year / Month)
          let Weeks_left2=(diff_left2 % Month / Week)
          let Days_left2=(diff_left2 % Week / Day)
          let Hours_left2=(diff_left2 % Day / Hour)
          let Minutes_left2=(diff_left2 % Hour / Minute)
          let Seconds_left2=(diff_left2 % Minute)

          let Years_left3=(diff_left3 / Year)
          let Months_left3=(diff_left3 % Year / Month)
          let Weeks_left3=(diff_left3 % Month / Week)
          let Days_left3=(diff_left3 % Week / Day)
          let Hours_left3=(diff_left3 % Day / Hour)
          let Minutes_left3=(diff_left3 % Hour / Minute)
          let Seconds_left3=(diff_left3 % Minute)

          print_info() {

              prin "$(color 6)╭───────────────────────────────────────────────────────────────────────────╮"
              info "$(color 6)\n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n " title prin "$(color 6) \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n  │"
              prin "$(color 6)╰───────────────────────────────────────────────────────────────────────────╯"

              prin "\n \n \n \n $(color 1) \n  $(color 2) \n  $(color 3) \n  $(color 4) \n  $(color 5) \n  $(color 6) \n  $(color 7) \n  $(color 8) \n  $(color 9) \n  $(color 10) \n  $(color 11) \n  $(color 12) \n  $(color 13) \n  $(color 14) \n  $(color 15) \n  $(color 16) \n  "

              prin "$(color 6)╭──────────────────────────────────────────────────────────────────────────────────────────────────────╮"

              info "${c2}\n \n OS------------------------>" distro
              info "${c6}\n \n \n""${c2} ├Kernel------------------->" os
              info "${c6}\n \n \n""${c2} ├Kernel Version----------->" kernel
              info "${c6}\n \n \n""${c2} ├Packages----------------->" packages
              info "${c6}\n \n \n""${c2} ╰Shell-------------------->" shell

              prin "${c6} \n"

              info "${c3}\n \n DE/WM--------------------->" de
              info "${c6}\n \n \n""${c3} ├Theme-------------------->" theme
              info "${c6}\n \n \n""${c3} ├Icons-------------------->" icons
              info "${c6}\n \n \n""${c3} ╰Terminal----------------->" term

              prin "${c6}\n \n \n"

              prin "${c4}\n \n PC------------------------>" "Green Demon (2019)"
              info "${c6}\n \n \n""${c4} ├Processor---------------->" cpu
              prin "${c6}\n \n \n""${c4} ├Graphics----------------->" "AMD Radeon RX 6650 XT"
              info "${c6}\n \n \n""${c4} ├Memory------------------->" memory
              info "${c6}\n \n \n""${c4} ├Uptime------------------->" uptime
              info "${c6}\n \n \n""${c4} ╰Resolution--------------->" resolution

              prin "${c6}\n \n \n"

              prin "${c5}\n \n NIXOS--------------------->" "${c4} ${c6} ${c4} \n ${c6}NO CHALLENGE NEEDED AS I FOUND MY ~/ BUT I'LL PLAY ALONG ${c4} ${c6} ${c4} "
              prin "${c6}\n \n \n""${c5} ├Installed---------------->" "$(echo $birth_install | awk '{print strftime("%d.%m.%Y, %H:%M:%S",$1)}')"
              prin "${c6}\n \n \n""${c5} ├Time Now----------------->" "$(echo $current | awk '{print strftime("%d.%m.%Y, %H:%M:%S",$1)}')"
              prin "${c6}\n \n \n""${c5} ├TLC 6 Month Challenge---->" "$(if [ $diff_left -lt 0 ]; then echo "${c6} WELL DONE! YOU COMPLETED THE CHALLENGE!!!"; else echo ""; fi)
                  $(if [ $Years_left -gt 0 ]; then echo "$Years_left year$([[ $Years_left -gt 1 ]] && echo 's'), "; else echo ""; fi)
                  $(if [ $Months_left -gt 0 ]; then echo "$Months_left month$([[ $Months_left -gt 1 ]] && echo 's'), "; else echo ""; fi)
                  $(if [ $Weeks_left -gt 0 ]; then echo "$Weeks_left week$([[ $Weeks_left -gt 1 ]] && echo 's'), "; else echo ""; fi)
                  $(if [ $Days_left -gt 0 ]; then echo "$Days_left day$([[ $Days_left -gt 1 ]] && echo 's'), "; else echo ""; fi)
                  $(if [ $Hours_left -gt 0 ]; then echo "$Hours_left hour$([[ $Hours_left -gt 1 ]] && echo 's'), "; else echo ""; fi)
                  $(if [ $Minutes_left -gt 0 ]; then echo "$Minutes_left minute$([[ $Minutes_left -gt 1 ]] && echo 's') "; else echo ""; fi)
                  $(if [ $Seconds_left -gt 0 ]; then echo "& $Seconds_left second$([[ $Seconds_left -gt 1 ]] && echo 's')"; else echo ""; fi)"
              prin "${c6}\n \n \n""${c5} ├TLC 2 Year Challenge----->" "$(if [ $diff_left2 -lt 0 ]; then echo "${c6} WELL DONE! YOU COMPLETED THE CHALLENGE!!!"; else echo ""; fi)
                  $(if [ $Years_left2 -gt 0 ]; then echo "$Years_left2 year$([[ $Years_left2 -gt 1 ]] && echo 's'), "; else echo ""; fi)
                  $(if [ $Months_left2 -gt 0 ]; then echo "$Months_left2 month$([[ $Months_left2 -gt 1 ]] && echo 's'), "; else echo ""; fi)
                  $(if [ $Weeks_left2 -gt 0 ]; then echo "$Weeks_left2 week$([[ $Weeks_left2 -gt 1 ]] && echo 's'), "; else echo ""; fi)
                  $(if [ $Days_left2 -gt 0 ]; then echo "$Days_left2 day$([[ $Days_left2 -gt 1 ]] && echo 's'), "; else echo ""; fi)
                  $(if [ $Hours_left2 -gt 0 ]; then echo "$Hours_left2 hour$([[ $Hours_left2 -gt 1 ]] && echo 's'), "; else echo ""; fi)
                  $(if [ $Minutes_left2 -gt 0 ]; then echo "$Minutes_left2 minute$([[ $Minutes_left2 -gt 1 ]] && echo 's') "; else echo ""; fi)
                  $(if [ $Seconds_left2 -gt 0 ]; then echo "& $Seconds_left2 second$([[ $Seconds_left3 -gt 1 ]] && echo 's')"; else echo ""; fi)"
              prin "${c6}\n \n \n""${c5} ├iynaix 10 Year Challenge->" "$(if [ $diff_left3 -lt 0 ]; then echo "${c6} WELL DONE! YOU COMPLETED THE CHALLENGE!!!"; else echo ""; fi)
                  $(if [ $Years_left3 -gt 0 ]; then echo "$Years_left3 year$([[ $Years_left3 -gt 1 ]] && echo 's'), "; else echo ""; fi)
                  $(if [ $Months_left3 -gt 0 ]; then echo "$Months_left3 month$([[ $Months_left3 -gt 1 ]] && echo 's'), "; else echo ""; fi)
                  $(if [ $Weeks_left3 -gt 0 ]; then echo "$Weeks_left3 week$([[ $Weeks_left3 -gt 1 ]] && echo 's'), "; else echo ""; fi)
                  $(if [ $Days_left3 -gt 0 ]; then echo "$Days_left3 day$([[ $Days_left3 -gt 1 ]] && echo 's'), "; else echo ""; fi)
                  $(if [ $Hours_left3 -gt 0 ]; then echo "$Hours_left3 hour$([[ $Hours_left3 -gt 1 ]] && echo 's'), "; else echo ""; fi)
                  $(if [ $Minutes_left3 -gt 0 ]; then echo "$Minutes_left3 minute$([[ $Minutes_left3 -gt 1 ]] && echo 's') "; else echo ""; fi)
                  $(if [ $Seconds_left3 -gt 0 ]; then echo "& $Seconds_left3 second$([[ $Seconds_left3 -gt 1 ]] && echo 's')"; else echo ""; fi)"
               prin "${c6}\n \n \n""${c5} ╰Rebuilding Config For---->" "$(start_date="2023-06-01 23:24:02"
                   current_date=$(date +"%Y-%m-%d %H:%M:%S")
                   start_timestamp=$(date -d "$start_date" +"%s")
                   current_timestamp=$(date -d "$current_date" +"%s")
                   elapsed_seconds=$((current_timestamp - start_timestamp))

                   years=$((elapsed_seconds / 31536000))
                   elapsed_seconds=$((elapsed_seconds % 31536000))
                   months=$((elapsed_seconds / 2592000))
                   elapsed_seconds=$((elapsed_seconds % 2592000))
                   weeks=$((elapsed_seconds / 604800))
                   elapsed_seconds=$((elapsed_seconds % 604800))
                   days=$((elapsed_seconds / 86400))
                   elapsed_seconds=$((elapsed_seconds % 86400))
                   hours=$((elapsed_seconds / 3600))
                   elapsed_seconds=$((elapsed_seconds % 3600))
                   minutes=$((elapsed_seconds / 60))
                   seconds=$((elapsed_seconds % 60))

                   time_units=()
                   if [ $years -eq 1 ]; then
                     time_units+=("1 year")
                   elif [ $years -gt 1 ]; then
                     time_units+=("$years years")
                   fi

                   if [ $months -eq 1 ]; then
                     time_units+=("1 month")
                   elif [ $months -gt 1 ]; then
                     time_units+=("$months months")
                   fi

                   if [ $weeks -eq 1 ]; then
                     time_units+=("1 week")
                   elif [ $weeks -gt 1 ]; then
                     time_units+=("$weeks weeks")
                   fi

                   if [ $days -eq 1 ]; then
                     time_units+=("1 day")
                   elif [ $days -gt 1 ]; then
                     time_units+=("$days days")
                   fi

                   if [ $hours -eq 1 ]; then
                     time_units+=("1 hour")
                   elif [ $hours -gt 1 ]; then
                     time_units+=("$hours hours")
                   fi

                   if [ $minutes -eq 1 ]; then
                     time_units+=("1 minute")
                   elif [ $minutes -gt 1 ]; then
                     time_units+=("$minutes minutes")
                   fi

                   if [ $seconds -eq 1 ]; then
                     time_units+=("1 second")
                   elif [ $seconds -gt 1 ]; then
                     time_units+=("$seconds seconds")
                   fi

                   num_units=${#time_units[@]}
                   formatted_output=""

                   for ((i = 0; i < num_units; i++)); do
                     if [ $i -eq $((num_units - 1)) ]; then
                       formatted_output+=" & ${time_units[$i]}"
                     elif [ $i -eq $((num_units - 2)) ]; then
                       formatted_output+="${time_units[$i]}"
                     else
                       formatted_output+="${time_units[$i]}, "
                     fi
                   done

                   echo "$formatted_output")"


              prin "$(color 6)╰──────────────────────────────────────────────────────────────────────────────────────────────────────╯"

          }

          title_fqdn="off"
          kernel_shorthand="on"
          distro_shorthand="on"
          os_arch="on"
          uptime_shorthand="off"
          memory_percent="on"
          memory_unit="gib"
          package_managers="tiny"
          shell_path="off"
          shell_version="on"
          speed_type="bios_limit"
          speed_shorthand="on"
          cpu_brand="on"
          cpu_speed="off"
          cpu_cores="logical"
          cpu_temp="C"
          gpu_brand="on"
          gpu_type="all"
          refresh_rate="on"
          gtk_shorthand="on"
          gtk2="off"
          gtk3="on"
          public_ip_host="http://ident.me"
          public_ip_timeout=2
          de_version="on"
          disk_show=('/')
          disk_subtitle="mount"
          disk_percent="on"
          music_player="auto"
          song_format="%artist% - %album% - %title%"
          song_shorthand="off"
          mpc_args=()
          colors=(distro)
          bold="on"
          underline_enabled="on"
          underline_char=""
          separator=" "
          block_range=(0 15)
          color_blocks="on"
          block_width=3
          block_height=1
          col_offset="auto"
          bar_char_elapsed="-"
          bar_char_total="="
          bar_border="on"
          bar_length=15
          bar_color_total="distro"
          cpu_display="off"
          memory_display="off"
          battery_display="off"
          disk_display="off"
          image_backend="ascii"
          image_source=auto
          ascii_distro="auto"
          ascii_colors=(1 2 3 4 5 6 7 8)
          ascii_bold="on"
          image_loop="off"
          thumbnail_dir="${XDG_CACHE_HOME:-${HOME}/.cache}/thumbnails/neofetch"
          crop_mode="normal"
          crop_offset="center"
          image_size="25%"
          gap=2
          yoffset=0
          xoffset=0
          background_color=
          stdout="off"
        '';
      };
    };
  };
}
