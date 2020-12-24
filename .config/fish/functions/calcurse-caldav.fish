function calcurse-caldav
	command calcurse-caldav --config $XDG_CONFIG_HOME/calcurse/caldav/config --lockfile $XDG_DATA_HOME/calcurse/lock --syncdb $XDG_DATA_HOME/calcurse/sync.db --datadir $XDG_DATA_HOME/calcurse/ --hookdir $XDG_CONFIG_HOME/calcurse/hooks $argv
end
