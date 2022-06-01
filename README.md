# Lockness

Lockness manages encrypted files from the command line and from within your program.

It provides similar functionality to the `rails credentials:show` and `rails credentials:edit` tasks but can be used for any file in a plain old ruby app.

# Usage -- Command Line

```
lockness init                 # generates a master.key
lockness edit  <filename>     # create or edit a new file
lockness show  <filename>     # view an encrypted file
lockness                      # show this help
```

# Usage -- Within application

```ruby
Lockness.decrypt('<path to encrypted file>')
```
