## [Unreleased]

## [0.3.0] - 2023-03-23

- Fix issue where keepgoing would not load the correct file for certain file names.
- Add support for ENV variable `CLEAR`, which defaults to true. Keepgoing will behave just as before and clear the screen on start-up and between reloads. If set to `false`, keepgoing will not clear the screen between runs. Example: `CLEAR=false ruby my_script.rb`
- Pass `wrap` true to `load` to wrap the script in an anonymous module. This doesn't actually solve a specific issue, but it felt like the right thing to do.

## [0.2.1] - 2022-06-14

- Update CHANGELOG 🤦‍♂️

## [0.2.0] - 2022-06-14

- Use `fork` to enable keepgoing to even restart blocking scripts on changes. This allows you to use keepgoing with scripts that start web servers or anything else that is blocking and keeps your script from exiting.

## [0.1.0] - 2022-05-11

- Initial release of keepgoing, my first gem ever 🎉
