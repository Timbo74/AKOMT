## Redirect Domains
1. Go to **DNS \ Records**:  add a DNS entry for the domain (eg @ or www):
	- Set it to *Proxied*.
	- Set the IP address to `192.0.2.1`[^1].
2. Go to **Rules \ Redirect Rules**: and create a rule to redirect incoming traffic to the required destination URL.

[^1]: In **Cloudflare**, this IP is used as a **dummy placeholder** for DNS A records when setting up redirects, Page Rules, or Workers for domains that do not have an actual origin server. 
