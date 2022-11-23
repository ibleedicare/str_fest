package main

# Define variable

deny[msg] {
    not input.variable
    msg = "Variable block not defined"
}

deny[msg] {
    not input.variable.do_token
    msg = "do_token variable not defined"
}

deny[msg] {
    not input.variable.ssh_key
    msg = "ssh_key variable not defined"
}
