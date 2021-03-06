pkg_name=gs-accessing-data-mysql
pkg_origin=nathenharvey
pkg_version="0.1.0"
pkg_maintainer="Nathen Harvey <nharvey@chef.io>"
pkg_license=("Apache-2.0")
pkg_scaffolding="core/scaffolding-gradle"
pkg_upstream_url="https://github.com/nathenharvey/gs-accessing-data-mysql/tree/master/complete"
pkg_exports=(
  [port]=gs-accessing-data-mysql.port
)
pkg_exposes=(port)

pkg_binds=(
  [database]="port host"
)

do_install() {
  do_default_install
  ln -nsf "$pkg_svc_path/config/application.properties" "$pkg_prefix/app/"
}
