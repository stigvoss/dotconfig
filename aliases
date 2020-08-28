cd()
{
	if [[ $@ == "@c" ]]; then
		command cd /mnt/c/
	elif [[ $@ == "@projects" ]]; then
		command cd /mnt/c/Projects/
	else
		command cd "$@"
	fi
}

qr()
{
    qrencode -t UTF8 $1 | cat
}

alias cd..='cd ../'
alias ls='ls -lhA'
alias ..'=cd ../'
alias cls='clear'
