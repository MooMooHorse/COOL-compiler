if (if cell(position) = "X" then 1 else 0 fi
    + if cell_left_neighbor(position) = "X" then 1 else 0 fi
    + if cell_right_neighbor(position) = "X" then 1 else 0 fi
    = 1)
then
    "X"
else
    '.'
fi