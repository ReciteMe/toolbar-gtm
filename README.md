# Recite Me Tag Manager

Google Tag Manager Plugin for Recite Me.

This project provides a Google Tag Manager (GTM) template to integrate the Recite Me Accessibility Toolbar into your website. The core functionality is defined in the `template.tpl` file, which includes the necessary configuration, parameters, and JavaScript logic to load and initialize the toolbar.

---

## Features

- Adds the Recite Me Accessibility Toolbar to your site.
- Configurable parameters for `Client Key`, `Options JSON`, and `Region`.
- Supports multiple regions: UK, US, and AU.
- Includes sandboxed JavaScript for secure execution.
- Dynamically injects the Recite Me toolbar script into the website.
- Handles permissions for accessing global variables and injecting scripts.

---

## How It Works

1. The `template.tpl` file defines the GTM template structure, including parameters and permissions.
2. The toolbar is loaded dynamically using the provided `clientKey` and `optionsJson`.
3. The `region` parameter determines the appropriate API endpoint for the toolbar.
4. The script is injected securely, and success or failure callbacks are triggered accordingly.

---

## Usage

1. **Import the Template**:
   - Import the `template.tpl` file into your Google Tag Manager account.

2. **Configure Parameters**:
   - Fill in the required fields:
     - **Client Key**: Enter your Recite Me client key.
     - **Options JSON**: Provide any custom options in JSON format (or leave as `{}` for default settings).
     - **Region**: Select the appropriate region (UK, US, or AU).

3. **Publish the Tag**:
   - Add the tag to your GTM container and publish it to your website.

4. **Verify Integration**:
   - Check the browser console for logs confirming the successful loading of the Recite Me toolbar.

---

## Example Configuration

### Template Parameters

| Parameter      | Type   | Default Value | Description                                      |
|----------------|--------|---------------|--------------------------------------------------|
| `clientKey`    | Text   | (Required)    | Your unique Recite Me client key.               |
| `optionsJson`  | Text   | `{}`          | Custom JSON options for toolbar configuration.  |
| `region`       | Select | `UK`          | Region for Recite Me configuration (UK, US, AU).|

### Example JSON for `optionsJson`

```json
{
  "UserGuide": { "enabled": true },
  "PageStructure": { "enabled": true },
  "FocusText": { "enabled": true },
}
```

---

## Updating GTM

To update GTM:

1. Push your changes to the repository.

2. Get the commit hash of the push you just made. You can find this on the commit page:
   - **Commits**: [ReciteMe/toolbar-gtm](https://github.com/ReciteMe/toolbar-gtm)

3. Edit metadata.yaml and add a new entry to the top of the `versions` section. For example:

   ```yaml
   - sha: 5221e68f10bb0895cb566e8c1f8a30c1e337b211
     changeNotes: Updated title and moved to official GitHub organisation.
   ```

   - Replace the `sha` with the commit hash you copied from GitHub.

4. Push this commit. GTM will automatically update. Unfortunately, there is no management page to check the status of the update.

---
## Related Projects

This template is related to the following project:

- [Toolbar GTM Script](https://github.com/ReciteMe/toolbar-gtm-script)

Please refer to the related project for more details on how the integration works and how this script is triggered.

## Notes

For more information, visit the [Recite Me website](https://knowledge.reciteme.com/knowledge/google-tag-manager) or refer to the [Google Tag Manager Community Template Gallery Developer Terms of Service](https://developers.google.com/tag-manager/gallery-tos).
```