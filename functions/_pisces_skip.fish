function _pisces_skip -a text -d "Skips given text if it's already under the cursor"

    # Natural Selection integration:
    if functions -q _natural_selection_is_selecting; and _natural_selection_is_selecting
        _natural_selection_replace_selection "$text"
        return 0
    end

    set length (string length -- $text)

    if [ (_pisces_lookup 0 $length) = $text ]
        _pisces_jump $length
        return 0
    else
        commandline -i -- $text
        return 1
    end
end
