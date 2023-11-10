# tunblkctl
Command-line frontend for [Tunnelblick](https://tunnelblick.net/).

## Usage
There are a various ways **tunblkctl** can be used to automated **VPN** management. 
Feel free to create shell **aliases** for frequently-used commands. 

### Get information about installed configurations
```shell
# Enumerate installed configuration names
$ tunblkctl list

# Show status report for installed configurations
$ tunblkctl status

# Show status report in a form suitable for script processing (w/o headers, etc.)
$ tunblkctl status --raw

# Show only names and inbound traffic volumes
$ tunblkctl status | cut -f 1,3

# Align columns (if necessary)
$ tunblkctl status | column -t -s $'\t'
```

### Establish a connection to a VPN
```shell
# Begin connecting to a VPN
$ tunblkctl connect <some-vpn-conf>

# Begin connecting to a VPN and wait until connection is established
$ tunblkctl connect <some-vpn-conf> -w
```

### Shutdown VPN connections
```shell
# Disconnect from some particular VPN
$ tunblkctl disconnect <some-vpn-conf>

# Disconnect all the established connections
$ tunblkctl disconnect

# Quit Tunnelblick (shutting down all the active connections)
$ tunblkctl quit
```
