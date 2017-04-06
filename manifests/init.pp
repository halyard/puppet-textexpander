# == Class: textexpander
#
# Install textexpander
#
class textexpander (
  $install_path = "/Users/${::boxen_user}/Applications/TextExpander.app",
) {
  package { 'textexpander-halyard':
    provider => 'brewcask',
    require  => Homebrew::Tap['halyard/casks']
  }
  -> osx_login_item { 'TextExpander':
    hidden => true,
    path   => $install_path
  }
  ~> exec { 'launch textexpander':
    command     => "/usr/bin/open ${install_path}",
    refreshonly => true,
  }
}
