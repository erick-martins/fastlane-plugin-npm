# npm plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-npm)



## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-npm`, add it to your project by running:

```bash
fastlane add_plugin npm
```



## About npm

A very simple plugin to run npm scripts

**Note to author:** Add a more detailed description about this plugin here. If your plugin contains multiple actions, make sure to mention them here.



## Actions

```ruby
lane :test do
  npm_install(
    fresh: true,                            # [Optional] Boolean: Defines if modules should be fresh instaled. Deletes node_modules folder (Default: false)
    arguments: [],                          # [Optional] Array: List of arguments
    step_name: 'Starting with reset cache'  # [Optional] String: Text that will be printed into the console
  )

  npm_post_install(
    arguments: [],                          # [Optional] Array: List of arguments
    step_name: 'Starting with reset cache'  # [Optional] String: Text that will be printed into the console
  )

  npm_lint(
    script: 'lint',                         # [Optional] String: Overrides default lint script name (Default: lint)
    fix: true,                              # [Optional] Boolean: Adds a --fix flag (Default: false)
    arguments: [],                          # [Optional] Array: List of arguments
    step_name: 'Starting with reset cache'  # [Optional] String: Text that will be printed into the console
  )

  npm_test(
    script: 'test',                         # [Optional] String: Overrides default test script name (Default: test)
    coverage: true,                         # [Optional] Boolean: Adds a --coverage flag (Default: false)
    arguments: [],                          # [Optional] Array: List of arguments
    step_name: 'Starting with reset cache'  # [Optional] String: Text that will be printed into the console
  )

  npm_run(
    script: 'start',                        # [Required] String: Script to run
    arguments: ['--reset-cache'],           # [Optional] Array: List of arguments
    step_name: 'Starting with reset cache'  # [Optional] String: Text that will be printed into the console
  )

  upgrade_package_json_version(
    new_version: "1.5.0",                  # [Required] String: Version to set
    version_match: "(\d+\.\d+\.\d+)"       # [Optional] String: Regex as a string to match the version in the package.json (Default: "(\d+\.\d+\.\d+)")
  )
end
```
## Run tests for this plugin

To run both the tests, and code style validation, run

```bash
rake
```

To automatically fix many of the styling issues, use
```bash
rubocop -a
```



## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.



## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.



## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).



## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
