function _pisces_wrap -a left right -d "Wraps text with string pairs"

    # Natural Selection integration:
    if functions -q _natural_selection_is_selecting; and _natural_selection_is_selecting
        _natural_selection_wrap_selection "$left" "$right"
        return 0
    end

    set length (string length -- $left)

    if [ $left = $right ]; and [ (_pisces_lookup -1 $length) = $left ]
        _pisces_append $right
        return 1
    else
        commandline -i -- $left
        and _pisces_append $right
        return 1
    end
end
