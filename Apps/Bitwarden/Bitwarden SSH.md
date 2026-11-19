https://bitwarden.com/help/about-ssh/


## Import an Existing Key into Bitwarden
1. Copy your key: Open your existing private SSH key file and copy its contents to your clipboard.
	• Note: Make sure to include the header and footer blocks (e.g., `-----BEGIN OPENSSH PRIVATE KEY----- and -----END OPENSSH PRIVATE KEY-----`).
2. Create a placeholder: In the Bitwarden Desktop App, click the **New** (or +) button and set the type to SSH key.
3. Save it immediately: Give it a name and click Save without filling in the key blocks (it will generate a temporary key automatically).
4. Edit the entry: Locate your newly saved item in your vault, click Edit, and look for the **Import key** from clipboard icon (or paste directly into the private key text box).
5. Save changes: Click **Save** to lock your encrypted key into the vault.
