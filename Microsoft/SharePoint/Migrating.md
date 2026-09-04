# Migrating Data between SharePoint Sites

## Libraries
### Copying the Library Structure (Without Files)
1. Go to the SharePoint site where you want the new library.
2. Click New > Document library.
3. Select From existing library.
4. Choose the source site containing the original library, then select the target library to duplicate.
5. This copies columns, metadata, and view formatting, but leaves files behind.

### Moving or Copying the Files and Content
To populate the new library with your files, use one of these methods depending on size:
- Built-in Copy/Move: Open the source library, select your files, click Copy to on the command bar, and pick the new destination site and library.
- OneDrive Sync (Larger Libraries): As noted by users on Microsoft Learn, sync both source and destination libraries using the OneDrive app, then drag and drop folders locally in File Explorer.
- PowerShell or Power Automate: For large migrations or automated recurring copies, use PnP PowerShell or a Power Automate flow.
- Rclone

## Lists

### Method 1: Copy Structure Only (Native "From Existing List")
1. This duplicates columns, views, and formatting without data.
Go to your destination SharePoint site.
2. Click New > List.
3. Select From existing list.
4. Choose the source site on the left panel, then pick the target list on the right.
5. Click Next, name your new list, and click Create.

### Method 2: Copy Structure and Data (Grid View Paste)
1. Follow the steps above to create the empty list structure on the destination site.
2. Open your original source list and click Edit in grid view.
3. Select all items (Ctrl + A or highlight) and copy them (Ctrl + C).
4. Go to the destination list, click Edit in grid view, click the first cell, and paste (Ctrl + V).

### Method 3: Export and Import via Excel
1. Open the source SharePoint list, click Export, and select Export to Excel.
2. Go to the destination site and click New > List.
3. Choose From Excel to upload the spreadsheet and create the new populated list.
