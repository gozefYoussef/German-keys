#!/bin/bash

# Function to add a custom shortcut
add_custom_shortcut() {
    local shortcut_name="$1"
    local command="$2"
    local key_combination="$3"
    
    # Define the schema and custom keybinding index
    local schema="org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"
    local index="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom"

    # Set the custom shortcut details
    gsettings set $schema$index$shortcut_name name "$shortcut_name"
    gsettings set $schema$index$shortcut_name command "$command"
    gsettings set $schema$index$shortcut_name binding "$key_combination"

    echo "Custom shortcut added:"
    echo "Name: $shortcut_name"
    echo "Command: $command"
    echo "Key Combination: $key_combination"
}

# Add custom shortcuts for umlauts
add_custom_shortcut "Type Umlaut a" "xdotool key --clearmodifiers diaeresis a" "<Alt>a"
add_custom_shortcut "Type Umlaut o" "xdotool key --clearmodifiers diaeresis o" "<Alt>o"
add_custom_shortcut "Type Umlaut u" "xdotool key --clearmodifiers diaeresis u" "<Alt>u"
add_custom_shortcut "Type Umlaut A" "xdotool key --clearmodifiers diaeresis A" "<Alt><Shift>a"
add_custom_shortcut "Type Umlaut O" "xdotool key --clearmodifiers diaeresis O" "<Alt><Shift>o"
add_custom_shortcut "Type Umlaut U" "xdotool key --clearmodifiers diaeresis U" "<Alt><Shift>u"

echo "All custom shortcuts added. Press Enter to exit."
read

