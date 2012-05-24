after_readme do
  inject_into_file 'README.md', :after => "##Technology\n" do
    %Q{
### ImageMagick, RMagick, Mini-Magick Oh My!

In order to process uploaded images we need to have mini-magick installed.
In order to have mini-magick installed we need to have RMagick installed.
In order to have RMagick installed we need to have ImageMagick installed.

```bash
brew install imagemagick     # on OSX
apt-get install imagemagick  # on Linux (TODO: not yet tested)
```
}
  end
end

