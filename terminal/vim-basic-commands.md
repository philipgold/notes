# Vim basic commands \(Terminal\)

Vim is a very powerful editor that has many commands.

1. To move the cursor, press the h,j,k,l keys as indicated.

   ```text
             ^
             k              Hint:  The h key is at the left and moves left.
       < h       l >               The l key is at the right and moves right.
             j                     The j key looks like a down arrow.
             v
   ```

2. To start Vim from the shell prompt type: `vim FILENAME <ENTER>`
3. To exit Vim type: `<ESC> :q! <ENTER>` to trash all changes. OR type: `<ESC> :wq <ENTER>` to save the changes.
4. To delete the character at the cursor type: `x`
5. To insert or append text type: `i` type inserted text `<ESC>` insert before the cursor `A` type appended text `<ESC>` append after the line

NOTE: Pressing `<ESC>` will place you in Normal mode or will cancel an unwanted and partially completed command.

1. To delete from the cursor up to the next word type:    `dw`
2. To delete from the cursor to the end of a line type:    `d$`
3. To delete a whole line type:    `dd`
4. To repeat a motion prepend it with a number:   `2w`
5. The format for a change command is:

   ```text
           operator   [number]   motion
   where:
   operator - is what to do, such as  d  for delete
   [number] - is an optional count to repeat the motion
   motion   - moves over the text to operate on, such as  w (word),
               $ (to the end of line), etc.
   ```

6. To move to the start of the line use a zero: `0`
7. To undo previous actions, type: `u (lowercase u)` To undo all the changes on a line, type: `U (capital U)` To undo the undo's, type: `CTRL-R`

