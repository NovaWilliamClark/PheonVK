
#!/bin/bash

# Initialize module status
Engine="Not Selected"
Editor="Not Selected"
Sandbox="Not Selected"

# Function to display menu
display_menu() {
    clear
    echo "Please toggle the modules you want to build:"
    echo
    echo "[E] Engine       [$Engine]"
    echo "[D] Editor       [$Editor]"
    echo "[S] Sandbox      [$Sandbox]"
    echo "[A] All"
    echo "[N] None"
    echo "[B] Build"
    echo
    echo -n "Select an option (E, D, S, A, N, B): "
}

# Main menu loop
while true; do
    display_menu
    read choice
    case "$choice" in
        [Ee])
            if [ "$Engine" == "Selected" ]; then
                Engine="Not Selected"
            else
                Engine="Selected"
            fi
            ;;
        [Dd])
            if [ "$Editor" == "Selected" ]; then
                Editor="Not Selected"
            else
                Editor="Selected"
            fi
            ;;
        [Ss])
            if [ "$Sandbox" == "Selected" ]; then
                Sandbox="Not Selected"
            else
                Sandbox="Selected"
            fi
            ;;
        [Aa])
            Engine="Selected"
            Editor="Selected"
            Sandbox="Selected"
            ;;
        [Nn])
            Engine="Not Selected"
            Editor="Not Selected"
            Sandbox="Not Selected"
            ;;
        [Bb])
            break
            ;;
        *)
            echo "Invalid option."
            sleep 1
    esac
done

# Building based on selections
BUILD_OPTIONS=""
if [ "$Engine" == "Selected" ]; then
    BUILD_OPTIONS="$BUILD_OPTIONS --with-engine"
fi
if [ "$Editor" == "Selected" ]; then
    BUILD_OPTIONS="$BUILD_OPTIONS --with-editor"
fi
if [ "$Sandbox" == "Selected" ]; then
    BUILD_OPTIONS="$BUILD_OPTIONS --with-sandbox"
fi

if [ -n "$BUILD_OPTIONS" ]; then
    echo "Building with options: $BUILD_OPTIONS"
    pushd ..
    third_party/premake/bin/linux/premake5 $BUILD_OPTIONS --cc=clang --file=premake5.lua gmake2
    popd
else
    echo "No modules selected for building."
fi

read -p "Press any key to continue..."