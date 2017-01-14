%% <% env = pillar['hosts'][grains['id']]['env'] %>
%%% ${pillar['do_not_modify']}
%%% -*- mode: erlang -*-
%%% ----------------------------------------------------------------------------
%%% RabbitMQ Sample Configuration File.
%%%
%%% See http://www.rabbitmq.com/configure.html for details.
%%% ----------------------------------------------------------------------------
[
 {rabbit,
  [%%
   %% Network Connectivity
   %% ====================
   %%

   %% By default, RabbitMQ will listen on all interfaces, using
   %% the standard (reserved) AMQP port.
   %%
   %% {tcp_listeners, [5672]},

   %% To listen on a specific interface, provide a tuple of {IpAddress, Port}.
   %% For example, to listen only on localhost for both IPv4 and IPv6:
   %%
   %% {tcp_listeners, [{"127.0.0.1", 5672},
   %%                  {"::1",       5672}]},

   %% SSL listeners are configured in the same fashion as TCP listeners,
   %% including the option to control the choice of interface.
   %%
   %% {ssl_listeners, [5671]},

   %% Log levels (currently just used for connection logging).
   %% One of 'info', 'warning', 'error' or 'none', in decreasing order
   %% of verbosity. Defaults to 'info'.
   %%
   %% {log_levels, [{connection, info}]},

   %% Set to 'true' to perform reverse DNS lookups when accepting a
   %% connection. Hostnames will then be shown instead of IP addresses
   %% in rabbitmqctl and the management plugin.
   %%
   %% {reverse_dns_lookups, true},

   %%
   %% Security / AAA
   %% ==============
   %%

   %% Configuring SSL.
   %% See http://www.rabbitmq.com/ssl.html for full documentation.
   %%
   %% {ssl_options, [{cacertfile,           "/path/to/testca/cacert.pem"},
   %%                {certfile,             "/path/to/server/cert.pem"},
   %%                {keyfile,              "/path/to/server/key.pem"},
   %%                {verify,               verify_peer},
   %%                {fail_if_no_peer_cert, false}]},

   %% Choose the available SASL mechanism(s) to expose.
   %% The two default (built in) mechanisms are 'PLAIN' and
   %% 'AMQPLAIN'. Additional mechanisms can be added via
   %% plugins.
   %%
   %% See http://www.rabbitmq.com/authentication.html for more details.
   %%
   %% {auth_mechanisms, ['PLAIN', 'AMQPLAIN']},

   %% Select an authentication database to use. RabbitMQ comes bundled
   %% with a built-in auth-database, based on mnesia.
   %%
   %% {auth_backends, [rabbit_auth_backend_internal]},

   %% Configurations supporting the rabbitmq_auth_mechanism_ssl and
   %% rabbitmq_auth_backend_ldap plugins.
   %%
   %% NB: These options require that the relevant plugin is enabled.
   %% See http://www.rabbitmq.com/plugins.html for further details.

   %% The RabbitMQ-auth-mechanism-ssl plugin makes it possible to
   %% authenticate a user based on the client's SSL certificate.
   %%
   %% To use auth-mechanism-ssl, add to or replace the auth_mechanisms
   %% list with the entry 'EXTERNAL'.
   %%
   %% {auth_mechanisms, ['EXTERNAL']},

   %% The rabbitmq_auth_backend_ldap plugin allows the broker to
   %% perform authentication and authorisation by deferring to an
   %% external LDAP server.
   %%
   %% For more information about configuring the LDAP backend, see
   %% http://www.rabbitmq.com/ldap.html.
   %%
   %% Enable the LDAP auth backend by adding to or replacing the
   %% auth_backends entry:
   %%
   %% {auth_backends, [rabbit_auth_backend_ldap]},

   %% This pertains to both the rabbitmq_auth_mechanism_ssl plugin and
   %% STOMP ssl_cert_login configurations. See the rabbitmq_stomp
   %% configuration section later in this fail and the README in
   %% https://github.com/rabbitmq/rabbitmq-auth-mechanism-ssl for further
   %% details.
   %%
   %% To use the SSL cert's CN instead of its DN as the username
   %%
   %% {ssl_cert_login_from, common_name},

   %%
   %% Default User / VHost
   %% ====================
   %%

   %% On first start RabbitMQ will create a vhost and a user. These
   %% config items control what gets created. See
   %% http://www.rabbitmq.com/access-control.html for further
   %% information about vhosts and access control.
   %%
   {default_vhost,       <<"/">>},
   {default_user,        <<"admin">>},
   {default_pass,        <<"admin">>},
   {default_permissions, [<<".*">>, <<".*">>, <<".*">>]},

   %% Tags for default user
   %%
   %% For more details about tags, see the documentation for the
   %% Management Plugin at http://www.rabbitmq.com/management.html.
   %%
   {default_user_tags, [administrator]},

   %%
   %% Additional network and protocol related configuration
   %% =====================================================
   %%

   %% Set the default AMQP heartbeat delay (in seconds).
   %%
   %% {heartbeat, 600},

   %% Set the max permissible size of an AMQP frame (in bytes).
   %%
   %% {frame_max, 131072},

   %% Customising Socket Options.
   %%
   %% See (http://www.erlang.org/doc/man/inet.html#setopts-2) for
   %% further documentation.
   %%
   %% {tcp_listen_options, [binary,
   %%                       {packet,        raw},
   %%                       {reuseaddr,     true},
   %%                       {backlog,       128},
   %%                       {nodelay,       true},
   %%                       {exit_on_close, false}]},

   %%
   %% Resource Limits & Flow Control
   %% ==============================
   %%
   %% See http://www.rabbitmq.com/memory.html for full details.

   %% Memory-based Flow Control threshold.
   %%
   %% {vm_memory_high_watermark, 0.4},

   %% Fraction of the high watermark limit at which queues start to
   %% page message out to disc in order to free up memory.
   %%
   %% {vm_memory_high_watermark_paging_ratio, 0.5},

   %% Set disk free limit (in bytes). Once free disk space reaches this
   %% lower bound, a disk alarm will be set - see the documentation
   %% listed above for more details.
   %%
   %% {disk_free_limit, 50000000},

   %% Alternatively, we can set a limit relative to total available RAM.
   %%
   %% {disk_free_limit, {mem_relative, 1.0}},

   %%
   %% Misc/Advanced Options
   %% =====================
   %%
   %% NB: Change these only if you understand what you are doing!
   %%

   %% To announce custom properties to clients on connection:
   %%
   %% {server_properties, []},

   %% How to respond to cluster partitions.
   %% See http://www.rabbitmq.com/partitions.html for further details.
   %%
   %% {cluster_partition_handling, ignore},

   %% Make clustering happen *automatically* at startup - only applied
   %% to nodes that have just been reset or started for the first time.
   %% See http://www.rabbitmq.com/clustering.html#auto-config for
   %% further details.
   %%
   {cluster_nodes, {[${','.join(["'rabbit@"+str(x)+"'" for x in pillar['envs'][env]['rabbitmq']['nodes'].keys()])}], disc}}

   %% Set (internal) statistics collection granularity.
   %%
   %% {collect_statistics, none},

   %% Statistics collection interval (in milliseconds).
   %%
   %% {collect_statistics_interval, 5000},

   %% Explicitly enable/disable hipe compilation.
   %%
   %% {hipe_compile, true}

  ]},

 %% ----------------------------------------------------------------------------
 %% Advanced Erlang Networking/Clustering Options.
 %%
 %% See http://www.rabbitmq.com/clustering.html for details
 %% ----------------------------------------------------------------------------
 {kernel,
  [%% Provide an explicit port-range for inter-node communications.
   %% See http://www.rabbitmq.com/clustering.html#firewall for further details.

   %% Sets the minimum / maximum port numbers
   %%
   %% {inet_dist_listen_min, 10000},
   %% {inet_dist_listen_max, 10005},

   %% Sets the net_kernel tick time.
   %% Please see http://erlang.org/doc/man/kernel_app.html and
   %% http://www.rabbitmq.com/nettick.html for further details.
   %%
   %% {net_ticktime, 60}
  ]},

 %% ----------------------------------------------------------------------------
 %% RabbitMQ Management Plugin
 %%
 %% See http://www.rabbitmq.com/management.html for details
 %% ----------------------------------------------------------------------------

 {rabbitmq_management,
  [%% Pre-Load schema definitions from the following JSON file. See
   %% http://www.rabbitmq.com/management.html#load-definitions
   %%
   %% {load_definitions, "/path/to/schema.json"},

   %% Log all requests to the management HTTP API to a file.
   %%
   %% {http_log_dir, "/path/to/access.log"},

   %% Change the port on which the HTTP listener listens,
   %% specifying an interface for the web server to bind to.
   %% Also set the listener to use SSL and provide SSL options.
   %%
   %% {listener, [{port,     12345},
   %%             {ip,       "127.0.0.1"},
   %%             {ssl,      true},
   %%             {ssl_opts, [{cacertfile, "/path/to/cacert.pem"},
   %%                         {certfile,   "/path/to/cert.pem"},
   %%                         {keyfile,    "/path/to/key.pem"}]}]},

   %% Configure how long aggregated data (such as message rates and queue
   %% lengths) is retained. Please read the plugin's documentation in
   %% https://www.rabbitmq.com/management.html#configuration for more
   %% details.
   %%
   %% {sample_retention_policies,
   %%  [{global,   [{60, 5}, {3600, 60}, {86400, 1200}]},
   %%   {basic,    [{60, 5}, {3600, 60}]},
   %%   {detailed, [{10, 5}]}]}
  ]},

 {rabbitmq_management_agent,
  [%% Misc/Advanced Options
   %%
   %% NB: Change these only if you understand what you are doing!
   %%
   %% {force_fine_statistics, true}
  ]},

 %% ----------------------------------------------------------------------------
 %% RabbitMQ AMQP 1.0 Support
 %%
 %% See http://hg.rabbitmq.com/rabbitmq-amqp1.0/file/default/README.md
 %% for details
 %% ----------------------------------------------------------------------------

 {rabbitmq_amqp1_0,
  [%% Connections that are not authenticated with SASL will connect as this
   %% account. See the README for more information.
   %%
   %% Please note that setting this will allow clients to connect without
   %% authenticating!
   %%
   {default_user, "admin"}

   %% Enable protocol strict mode. See the README for more information.
   %%
   %% {protocol_strict_mode, false}
  ]}
].

