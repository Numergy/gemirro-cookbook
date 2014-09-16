# gemirro Cookbook | [![Build Status](https://travis-ci.org/Numergy/gemirro-cookbook.svg)](https://travis-ci.org/Numergy/gemirro-cookbook)

This cookbook install and configure [gemirro][gemirro].

## Requirements

- `nginx`
- `apache2`
- `apt`
- `hostsfile`

## Attributes

#### gemirro::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['gemirro']['version']</tt></td>
    <td>String</td>
    <td>Which version of Gemirro you want to install. (Nil is latest)</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['gemirro']['force_update']</tt></td>
    <td>Boolean</td>
    <td>Get Gemirro always up to date by forcing update.</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['gemirro']['directory']</tt></td>
    <td>String</td>
    <td>The directory where the repository will be created.</td>
    <td><tt>/opt/gemirro</tt></td>
  </tr>
  <tr>
    <td><tt>['gemirro']['gems']</tt></td>
    <td>Hash of array</td>
    <td>List of gem containing a list of versions. (Example: {'gemirro': ['0.1.0', '0.2.0']}</td>
    <td><tt>{}</tt></td>
  </tr>
  <tr>
    <td><tt>['gemirro']['server']['type']</tt></td>
    <td>String</td>
    <td>Define if you want to use nginx or apache for the proxypass.</td>
    <td><tt>nginx</tt></td>
  </tr>
  <tr>
    <td><tt>['gemirro']['server']['host']</tt></td>
    <td>String</td>
    <td>The hostname for the apache or nginx configuration.</td>
    <td><tt>node['fqdn']</tt></td>
  </tr>
  <tr>
    <td><tt>['gemirro']['server']['port']</tt></td>
    <td>String</td>
    <td>The port used for the apache or nginx configuration.</td>
    <td><tt>80</tt></td>
  </tr>
  <tr>
    <td><tt>['gemirro']['server']['log_directory']</tt></td>
    <td>String</td>
    <td>The directory where access and error log are stored.</td>
    <td><tt>/var/log/gemirro</tt></td>
  </tr>
</table>

## Usage

#### gemirro::default

Just include `gemirro` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[gemirro]"
  ]
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors

Authors:

 - Pierre Rambaud (pierre.rambaud@numergy.com)

[gemirro]:            https://github.com/PierreRambaud/gemirro
