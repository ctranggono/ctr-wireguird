if [[ -f "/etc/os-release" ]]; then
    source "/etc/os-release"
    if [[ "${ID}" == "fedora" ]]; then
        echo "not supported yet"
        #sudo rpm
    elif [[ "${ID}" == "ubuntu" || "${ID}" == "pop" ]]; then
        sudo dpkg -i ./build/lottefastvpn_amd64.deb
    fi
fi

