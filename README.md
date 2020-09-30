# Dialog notes

This repository contains examples of [DIALOG command](http://transit.iut2.upmf-grenoble.fr/cgi-bin/man/man2html?1+dialog).

* `yesno.sh`: print a YES/NO form.
* `radio.sh`: print a radio box with a single selection.
* `radio-multi.sh`: print a "radio box" with a multi selection.
* `menu.sh`: print a menu.
* `input-box.sh`: print a input form that allows the user to specify a string of characters.
* `file-select.sh`: print a box used to select a file.

All examples begin with the following code:

    tmp_file=`tempfile 2> /dev/null` || tmp_file="/tmp/test${$}"
    trap "echo \"Remove the temporary file ${tmp_file}\"; rm -f ${tmp_file}" 0 1 2 5 15

By default, boxes that allow the selection of values print the value to the error output.
That's why we use the following construction:

    dialog --clear \
           ...
           2> "${tmp_file}"

However, it is possible to configure the box so that it prints the selected value to the standard output.
To do so, you set the option `--stdout`. For example:

* `radio-stdout.sh`: print a radio box with a single selection. The prints the selected value to the standard output.
