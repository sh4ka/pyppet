# -*- mode: ruby -*-
# vi: set ft=ruby :
 
Vagrant.configure('2') do |config|
 
  # Sistema operativo
  config.vm.box = 'ubuntu/trusty64'
 
  # IP privada
  config.vm.network 'private_network', ip: '10.0.0.102'
 
  # Configuración de VirtualBox
  config.vm.provider :virtualbox do |vb|
 
    # Nombre de la máquina virtual
    vb.name = 'pyppet'
 
    # Memoria
    vb.memory = 1024
   
    # Número de procesadores
    vb.cpus = 2
   
  end
 
  # Habilitar aprovisionamiento por Puppet
  config.vm.provision :puppet do |puppet|
 
    # Localización de los ficheros de configuración manifiestos
    puppet.manifests_path = 'puppet/manifests'

    # Directorio de los módulos
    puppet.module_path = 'puppet/modules'

    # Nombre del manifiesto que se va a ejecutar inicialmente
    puppet.manifest_file = 'default.pp'
 
    # Opciones de Puppet. Se activa el modo debug y verbose
    puppet.options = [
      '--verbose',
      '--debug',
    ]
 
  end
 
end
