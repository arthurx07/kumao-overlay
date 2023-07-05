# kumao-overlay

This overlay may have packages not updated and unmaintained; as it consists on packages not present in the gentoo official repository but which I use.

When finding a bug, please [file an issue](https://github.com/arthurx07/kumao-overlay/issues/new).

## Installation
```shell
emerge app-eselect/eselect-repository
eselect repository add kumao-overlay git https://github.com/arthurx07/kumao-overlay.git
emerge --sync
```

## Only unmask specific packages from this repository
Based on [Masking installed but unsafe ebuild repositories](https://wiki.gentoo.org/wiki/Ebuild_repository#Masking_installed_but_unsafe_ebuild_repositories).

In `/etc/portage/package.mask/kumao-overlay`, mask all packages from this repository by default:

```plain
*/*::kumao-overlay
```

In `/etc/portage/package.unmask/kumao-overlay`, allow specific packages from this repository:

```plain
foo-category/bar::kumao-overlay
```

## Standard git workflow

Based on [Standard git workflow](https://wiki.gentoo.org/wiki/Standard_git_workflow) and [Gentoo git workflow](https://wiki.gentoo.org/wiki/Gentoo_git_workflow).

**Preparing a working directory**
```shell
emerge --ask dev-util/pkgcheck dev-util/pkgdev
git clone git@github.com:arthurx07/kumao-overlay.git # git pull --rebase origin main
```
**Bumping foo-category/bar**
```shell
cd kumao-overlay/foo-category/bar # enter the directory of the ebuild # [run as root]
# edit the ebuild; when updating a package read the upstream release notes!
pkgdev manifest # generate a new Manifest
pkgcheck scan # check for QA issues during the work/change process.
```
**Testing foo-category/bar**
```shell
emerge -av1o --with-test-deps bar.ebuild # install the dependencies of the package [run as root]
ebuild bar-ver.ebuild clean test install # test the new ebuild
bar --version # test/run the tool
```
**Commiting foo-category/bar**
```shell
git add foo-category/bar/bar.ebuild && pkgdev commit -s # commit changes
# if rev-bumping and ebuild, remove the outdated version (git add bar-r1.ebuild && rm bar.ebuild)
git push -u origin main # push the commit (pkgdev push?)
```

_For information in writing ebuilds see: [Gentoo Development Guide](https://devmanual.gentoo.org/) and [Quickstart Ebuild Guide](https://devmanual.gentoo.org/quickstart/index.html)_
