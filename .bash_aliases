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

alias ls='ls -lhA'

swap()         
{
	local TMPFILE=tmp.$$
        mv "$1" $TMPFILE
	mv "$2" "$1"
	mv $TMPFILE "$2"
}
