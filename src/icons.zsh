################################################################
# icons
# This file holds the icon definitions and icon-functions
################################################################

typeset -gAH icons
() { # add scope to protect the users locale and not overwrite LC_CTYPE!

    # nerd-font patched (complete) font required! See
    # https://github.com/ryanoasis/nerd-fonts
    # http://nerdfonts.com/#cheat-sheet
    # Set the right locale to protect special characters
    local LC_ALL="" LC_CTYPE="en_US.UTF-8"
    icons=(
        # general
        CARRIAGE_RETURN_ICON           $'\u21B5'$'\u0020'
        DOLLAR_ICON                    $'\uF155'
        ROOT_ICON                      $'\uE614'
        SUDO_ICON                      $'\uF09C'
        OK_ICON                        $'\uF00C'
        FAIL_ICON                      $'\uF00D'
        DATE_ICON                      $'\uF5EC'
        TIME_ICON                      $'\uF64F'
        TEST_ICON                      $'\uFD2B'
        # os
        APPLE_ICON                     $'\uF179'
        WINDOWS_ICON                   $'\uFAB2'
        FREEBSD_ICON                   $'\uF30C'
        ANDROID_ICON                   $'\uF17B'
        LINUX_ARCH_ICON                $'\uF303'
        LINUX_CENTOS_ICON              $'\uF304'$'\u0020'
        LINUX_COREOS_ICON              $'\uF305'
        LINUX_DEBIAN_ICON              $'\uF306'
        LINUX_ELEMENTARY_ICON          $'\uF309'$'\u0020'
        LINUX_FEDORA_ICON              $'\uF30A'$'\u0020'
        LINUX_GENTOO_ICON              $'\uF30D'$'\u0020'
        LINUX_MAGEIA_ICON              $'\uF310'
        LINUX_MINT_ICON                $'\uF30E'$'\u0020'
        LINUX_NIXOS_ICON               $'\uF313'$'\u0020'
        LINUX_MANJARO_ICON             $'\uF312'$'\u0020'
        LINUX_DEVUAN_ICON              $'\uF307'
        LINUX_ALPINE_ICON              $'\uF300'$'\u0020'
        LINUX_AOSC_ICON                $'\uF301'$'\u0020'
        LINUX_OPENSUSE_ICON            $'\uF314'$'\u0020'
        LINUX_SABAYON_ICON             $'\uF317'$'\u0020'
        LINUX_SLACKWARE_ICON           $'\uF319'$'\u0020'
        LINUX_UBUNTU_ICON              $'\uF31B'
        LINUX_ICON                     $'\uF17C'
        SUNOS_ICON                     $'\uF185'$'\u0020'
        # directory
        FOLDER_ICON                    $'\uF755'
        FOLDER_HOME_ICON               $'\uF7DB'
        FOLDER_ETC_ICON                $'\uF992'
        FOLDER_GIT_ICON                $'\uF7A1'
        FOLDER_NPM_ICON                $'\uF898'$'\u0020'
        FOLDER_ROOT_ICON               $'\uF2DD'
        # vcs
        VCS_GIT_ICON                   $'\uF7A1'
        VCS_INCOMING_CHANGES_ICON      $'\uF01A'
        VCS_OUTGOING_CHANGES_ICON      $'\uF01B'
        VCS_STAGED_ICON                $'\uF055'
        VCS_CONFLICTS_ICON             $'\uFC85'
        VCS_UNTRACKED_ICON             $'\uF29C'
        VCS_UNSTAGED_ICON              $'\uF06A'
        VCS_CLEAN                      $'\uF62B'
        VCS_COMMIT_ICON                $'\uFC16'
        VCS_BRANCH_ICON                $'\uFB2B'
        # battery
        BATTERY_ICON                   $'\uF578'
        BATTERY_90_ICON                $'\uF581'
        BATTERY_80_ICON                $'\uF580'
        BATTERY_70_ICON                $'\uF57F'
        BATTERY_60_ICON                $'\uF57E'
        BATTERY_50_ICON                $'\uF57D'
        BATTERY_40_ICON                $'\uF57C'
        BATTERY_30_ICON                $'\uF57B'
        BATTERY_20_ICON                $'\uF57A'
        BATTERY_10_ICON                $'\uF579'
        BATTERY_ALERT_ICON             $'\uF582'
        BATTERY_CHARGING_ICON          $'\uF583'
    )
}

# Safety function for printing icons
# Prints the named icon, or if that icon is undefined, the string name.
function print_icon() {
  local icon_name=$1
  local icon_value=${icon_name/_ICON/ }
  if [[ -v ZSH_THEME_FLOWER7C3_${icon_name} ]]; then
    local ICON_USER_VARIABLE=ZSH_THEME_FLOWER7C3_${icon_name}
    icon_value="${(P)ICON_USER_VARIABLE}"
  elif [ ! -z "${icons[$icon_name]}" ]; then
    icon_value="${icons[$icon_name]}"
  fi
  printf "$icon_value"
}

# Get a list of configured icons
get_icon_names() {
  # Iterate over a ordered list of keys of the icons array
  for key in ${(@kon)icons}; do
    echo "$key='$(print_icon "$key")'"
  done
}
