 SaltStack  . P . L . A . T . F . O . R . M .

Welcome to host ${grains['id']}...
 - Architecture: ${grains['cpuarch']}
 - IP Interfaces: ${grains['ip_interfaces']}
 - Manufacturer: ${grains['manufacturer']}
 - OS: ${grains['redhat-release']}
 - CPU Cores: ${grains['num_cpus']}  
 - CPU Model: ${grains['cpu_model']}
 - Memory: ${grains['mem_total']} Mb
 - Environment: ${pillar['hosts'][grains['id']]['env']}
 - Roles: ${pillar['hosts'][grains['id']]['roles']}
 - Description: ${pillar['hosts'][grains['id']]['desc']}
