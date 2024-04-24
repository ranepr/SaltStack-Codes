$vcenter = $args[0]
$targetcluster = $args[1]
$targethost = $args[2]

connect-viserver $vcenter

get-baseline -name "ESXi Patch Demo" | Add-EntityBaseline -entity $targethost

test-compliance -entity $targethost

get-compliance -entity $targethost

Get-VMHost -Name $targethost | set-vmhost -State Maintenance
 
#get-baseline -name "ESXi Patch Demo" | update-entity -entity $targethost -confirm:$false

Get-VMHost -Name $targethost | set-vmhost -State Connected
 
disconnect-viserver
