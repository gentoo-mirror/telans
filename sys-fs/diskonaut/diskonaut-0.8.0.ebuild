# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Terminal disk space navigator"
HOMEPAGE="https://github.com/imsnif/diskonaut"

CRATES="
	addr2line-0.12.1
	adler32-1.1.0
	ansi_term-0.11.0
	arc-swap-0.4.7
	atty-0.2.14
	autocfg-1.0.0
	backtrace-0.3.49
	bitflags-1.2.1
	cassowary-0.3.0
	cc-1.0.55
	cfg-if-0.1.10
	clap-2.33.1
	clicolors-control-1.0.1
	console-0.10.3
	crossbeam-0.7.3
	crossbeam-channel-0.4.2
	crossbeam-deque-0.7.3
	crossbeam-epoch-0.8.2
	crossbeam-queue-0.2.3
	crossbeam-utils-0.7.2
	difference-2.0.0
	dtoa-0.4.6
	either-1.5.3
	encode_unicode-0.3.6
	failure-0.1.8
	failure_derive-0.1.8
	filesize-0.2.0
	gimli-0.21.0
	heck-0.3.1
	hermit-abi-0.1.14
	insta-0.16.0
	itertools-0.9.0
	itoa-0.4.6
	jwalk-0.5.1
	lazy_static-1.4.0
	libc-0.2.71
	linked-hash-map-0.5.3
	maybe-uninit-2.0.0
	memoffset-0.5.4
	miniz_oxide-0.3.7
	nix-0.17.0
	num_cpus-1.13.0
	numtoa-0.1.0
	object-0.20.0
	proc-macro-error-1.0.2
	proc-macro-error-attr-1.0.2
	proc-macro2-1.0.18
	quote-1.0.7
	rayon-1.3.1
	rayon-core-1.7.1
	redox_syscall-0.1.56
	redox_termios-0.1.1
	rustc-demangle-0.1.16
	ryu-1.0.5
	scopeguard-1.1.0
	serde-1.0.112
	serde_derive-1.0.112
	serde_json-1.0.55
	serde_yaml-0.8.13
	signal-hook-0.1.16
	signal-hook-registry-1.2.0
	strsim-0.8.0
	structopt-0.3.15
	structopt-derive-0.4.8
	syn-1.0.31
	syn-mid-0.5.0
	synstructure-0.12.4
	terminal_size-0.1.12
	termion-1.5.5
	termios-0.3.2
	textwrap-0.11.0
	tui-0.9.5
	unicode-segmentation-1.6.0
	unicode-width-0.1.7
	unicode-xid-0.2.0
	vec_map-0.8.2
	version_check-0.9.2
	void-1.0.2
	winapi-0.3.8
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-x86_64-pc-windows-gnu-0.4.0
	yaml-rust-0.4.4"

if [ ${PV} = "9999" ]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/PaulCombal/SamRewritten.git"
	SRC_URI="$(cargo_crate_uris ${CRATES})"
else
	SRC_URI="
		https://github.com/imsnif/${PN}/archive/${PV}.tar.gz
		$(cargo_crate_uris ${CRATES})"
		KEYWORDS="amd64 x86"
fi

LICENSE="MIT"
SLOT="0"

S="${WORKDIR}/${PN}-${PV}"

DEPEND="dev-lang/rust"
RDEPEND="${DEPEND}"

src_configure() {
	cargo_src_unpack
}

src_compile() {
	cargo_src_compile
}

src_test() {
	cargo_src_test
}

src_install() {
	cargo_src_install
}
