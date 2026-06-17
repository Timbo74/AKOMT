# Devices

## Installation of device is blocked by policy!

### Step 1 - Identify the Blocked Device

On the PC go to the ```%windir%\inf\``` folder and look for a file called ```setupapi.dev.log```.

Towards the bottom of the file search for ```Restricted installation of devices not described by policy```, just above that text you will find ```Class GUID of device changed to: {#######-####-####-####-############}```.

### Step 2: Update the Microsoft Defender Policy
Open the Microsoft Defender admin console (link).

Go to ```Endpoints \ Configuration management \ Endpoint security policies```.

Find the Block Removable Storage Policy.

Click **Edit**.

On the **Basics** pane click Next.

On the **Configuration settings** pane scroll down to the **Allowed classes** section and click on the **Add button**.  This will add an empty entry to the end of the **Allowed classes** list so you may need to scroll down to see it.

Paste in the GUID we copied from step 1.  Make sure to include the curly braces { }.

Scroll down to the bottom of the Configuration settings pane and click **Next**.

On the **Assignments pane** click **Next**.

On the **Review** pane click **Save**.

Restart the client device.
