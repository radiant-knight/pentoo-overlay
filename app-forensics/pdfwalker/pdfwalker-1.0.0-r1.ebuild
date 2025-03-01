# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

USE_RUBY="ruby27 ruby30 ruby31"

inherit desktop ruby-fakegem xdg-utils

DESCRIPTION="A GTK frontend to explore the internals of a PDF document with Origami"
HOMEPAGE="https://github.com/gdelugre/pdfwalker"

LICENSE="GPL-3"
SLOT=0
KEYWORDS="~amd64"

IUSE="test"

ruby_add_bdepend "test? ( dev-ruby/minitest:5 )"
ruby_add_rdepend "
	app-forensics/origami-pdf
	dev-ruby/colorize
	dev-ruby/ruby-gtk2"

all_ruby_install() {
	all_fakegem_install

	make_desktop_entry "${PN}" \
		"PDFWalker" \
		"application-pdf" \
		"Utility;Office"
}

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
