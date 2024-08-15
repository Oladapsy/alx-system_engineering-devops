#0x19-postmortem task using webstack debugging #1



![Technical Issue Resolution](./postmorterm_technical.webp)

# Issue Summary
Duration of the Outage: The outage started at 11:45 AM and was resolved by 12:45 PM West African Time.

# Impact:
The site was not listening on port 80, causing all users to be unable to access the website.

# Root Cause:
The Nginx server's site settings were not properly linked. Specifically, the sites-available configuration was not linked to sites-enabled, meaning the configuration was correct but not activated, preventing users from accessing the site.

# Timeline
11:45 AM: The issue was detected when ALX (the platform) attempted to access the website and found it unresponsive.

11:50 AM: ALX monitoring alerts indicated that the site was down, and the issue was escalated to me.

11:55 AM: Initial investigation focused on checking the Nginx configuration files for errors, but no errors were found in the configuration itself.

12:15 PM: Further investigation led to checking which service was listening on port 80. It was then discovered that the Nginx configuration in sites-available was not linked to sites-enabled.

12:30 PM: The default configuration was correctly linked in sites-enabled, and Nginx was restarted to apply the changes.

12:45 PM: The issue was resolved, and the site was back online.

# Root Cause and Resolution
# Root Cause:
The root cause was the failure to link the sites-available configuration to sites-enabled, meaning the Nginx server configuration was not active despite being correct.

# Resolution:
The issue was resolved by linking the default configuration from sites-available to sites-enabled and restarting the Nginx service.

# Corrective and Preventative Measures

# Improvements:
Ensuring that after any configuration changes, a script or automated check is run to confirm that the necessary configurations are linked and active.
Improve the monitoring system to detect such issues earlier.

# Task List:

Create and execute a script to link the sites-available configuration to sites-enabled after each configuration change.
Add a monitoring check to ensure that Nginx is correctly listening on port 80.

# Example Script
Here is the script i mentioned to ensure the configuration is always active:

______________________________________________________________
[bash]
(Copy code)
#!/usr/bin/env bash
# Ensure Nginx is properly configured and listening on port 80

cat /etc/nginx/sites-available/default > /etc/nginx/sites-enabled/default
sudo service nginx restart
_______________________________________________________________

# This script ensures that the correct configuration is enabled and restarts Nginx to apply the changes.
the flow diagram
![Nginx Configuration Flow](./postmoterm_flow_chart.webp)
