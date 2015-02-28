class VimDependency < SystemSoftwareDependency
  def name
    "vim"
  end

  private

  def build_and_install_command
    %{
      wget ftp://ftp.vim.org/pub/vim/unix/vim-#{version}.tar.bz2
      tar xvfj vim-#{version}.tar.bz2
      echo "#{checksum}  vim-#{version}.tar.bz2" | md5sum -c -
      cd vim73
      ./configure --prefix=#{install_prefix} --with-features=huge --enable-rubyinterp=yes
      make -j 2
      make install
    }
  end

  def required_packages
    %w{ build-essential libncurses5-dev ruby-dev }
  end

  def default_version
    "7.3"
  end

  def checksum
    super || "5b9510a17074e2b37d8bb38ae09edbf2"
  end
end
