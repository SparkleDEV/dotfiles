function update_mirrorlist
    if not _read_confirm -p 'Are you sure you want to update your mirrorlist?' -d
        return
    end

    sudo -v

    echo "Backing up old mirrorlist"
    sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist_(date +%Y-%m-%d_%H-%M-%S).bak

    echo "Generating new mirrorlist"
    sudo reflector -c DE --protocol https --sort rate --latest 50 --download-timeout 5 --threads 5 --save /etc/pacman.d/mirrorlist

    echo "Updating mirrors"
    sudo pacman -Sy

    echo Done
end
