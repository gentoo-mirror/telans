# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="GIT utilities -- repo summary, repl, changelog population, author commit percentages and more"
HOMEPAGE="https://github.com/tj/git-extras"

if [ ${PV} = "9999" ]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/tj/git-extras.git"
else
	SRC_URI="https://github.com/tj/git-extras/archive/${PV}.tar.gz"
fi

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-vcs/git
"

DEPEND="
	${RDEPEND}
"

src_compile() {
	# ebuild will attempt to run make without the install command
	# so just bypass this step.
	true
}

src_install() {
	emake DESTDIR="${D}" \
		PREFIX=/usr \
		MANPREFIX=/usr/share/man/man1 \
		SYSCONFDIR=/etc \
		install
}
