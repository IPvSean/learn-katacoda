# Validate the Environment
>For this scenario, we have started installing SQL Server in the background. The background task will take between 2-5 minutes to complete. 

To check if ansible installation is complete, we can use the following command -
`systemctl status mssql-server.service --no-pager`{{execute T1}}

<pre class="file">
<< OUTPUT ABRIDGED >>

Active: active (running) since Monday 2019-07-15 19:24:18 EDT; 3h 59min left

<< OUTPUT ABRIDGED >>
</pre>

Verify that the Active status is __active (running)__.

Next, verify the currently active RHEL tuned profile.

`tuned-adm active`{{execute T1}}
<pre class="file">
Current active profile: virtual-guest
</pre>

Finally, verify that you can connect to SQL Server 

`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Redhat1! -Q "select @@version"`{{execute T1}}

<pre class="file">
Microsoft SQL Server 2019 (RTM-CU3) (KB4538853) - 15.0.4023.6 (X64)
        Mar  4 2020 00:59:26
        Copyright (C) 2019 Microsoft Corporation
        Enterprise Evaluation Edition (64-bit) on Linux (Red Hat Enterprise Linux 8.1 (Ootpa)) <X64>

(1 rows affected)
</pre>
