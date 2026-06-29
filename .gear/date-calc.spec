Name: date-calc
Version: 0.1
Release: alt1

Summary: GTK-based graphical date calculator
License: GPL-3.0
Group: System/X11
Url: https://github.com/andr-sokolov/date-calc
Packager: Vsevolod Myalitsin <ub4nal@mail.ru>
Source0: %name-%version.tar

BuildRequires: libgtk+3-devel

Requires: libgtk+3
%description
GTK-based graphical date calculator

%prep
%setup

%build
%make_build

%install
install -Dm 644 %name.desktop %buildroot%_desktopdir/%name.desktop
install -Dm 755 %name %buildroot%_bindir/%name

%files
%_bindir/%name
%_desktopdir/%name.desktop


%changelog
* Tue Jun 09 2026 Vsevolod Myalitsin <ub4nal@mail.ru> 0.1-alt1
- First build for ALT
