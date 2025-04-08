# 🚀 Salesforce DX Project – Getting Started

Welcome to your **Salesforce DX project**! This guide will help you get up and running, whether you're building a new app or customizing existing functionality.

---

## 🛠️ What's Next?

Think about how you plan to **develop and deploy** your Salesforce changes:

### ➤ Choose Your Development Model:
Are you:
- Collaborating in a team using source control?
- Building a standalone app?
- Working with unlocked or managed packages?

👉 Learn more about the [Salesforce DX development models](https://developer.salesforce.com/tools/vscode/en/user-guide/development-models).

---

## ⚙️ Project Configuration

Your `sfdx-project.json` file contains important metadata about your project, such as:
- Project name and namespace
- Package directory structure
- API version
- Package aliases (for scratch orgs or unlocked packages)

📘 Refer to the [Salesforce DX Project Configuration Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm) to understand how to customize this file.

---

## 📚 Useful Resources

- **Salesforce Extensions for VS Code**  
  [Documentation](https://developer.salesforce.com/tools/vscode/)

- **Salesforce CLI Setup Guide**  
  [Setup Instructions](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)

- **Salesforce DX Developer Guide**  
  [Full Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)

- **Salesforce CLI Command Reference**  
  [Command List](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)

---

## ✅ Recommended First Steps

1. Authenticate your Dev Hub:
   ```bash
   sf login org --set-default-dev-hub
   ```

2. Create a scratch org:
   ```bash
   sf org create scratch --definition config/project-scratch-def.json --alias my-scratch-org --set-default
   ```

3. Push source to the org:
   ```bash
   sf project deploy start
   ```

4. Open the org:
   ```bash
   sf org open
   ```

---

Need help or stuck on something? Feel free to explore Trailhead or reach out on Salesforce Stack Exchange!