function _pisces_backspace -d "Overrides backspace to handle empty pairs removal"

    # Natural Selection integration:
    if functions -q _natural_selection_is_selecting; and _natural_selection_is_selecting
        _natural_selection_kill_selection
        return 0
    end

    set -l line (commandline | string join \n)
    set -l index (commandline -C)
    if [ $index -ge 1 ]
        set -l char (string sub -s $index -l 1 -- "$line")
        for pair in $pisces_pairs
            set -l var (string split -- ',' $pair)
            if [ $var[1] = $char ]
                _pisces_remove $var
                and return 0
            end
        end
    end

    commandline -f backward-delete-char
end
