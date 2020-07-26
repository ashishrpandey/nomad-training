
Define Nomad server address : 

    $ export NOMAD_ADDR=http://host01:4646

Display status information about the local agent.

     nomad agent-info
     
     
Preloading TLS Environment Variables...

        $ export NOMAD_CAPATH=/etc/nomad.d/tls/nomad-agent-ca.pem
        $ export NOMAD_CLIENT_CERT=/etc/nomad.d/tls/global-server-nomad-0.pem
        $ export NOMAD_CLIENT_KEY=/etc/nomad.d/tls/global-server-nomad-0-key.pem
        $ export NOMAD_ADDR=https://127.0.0.1:4646
        
        
Enable nomad service

    systemctl enable nomad 
    
    
