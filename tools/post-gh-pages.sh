#!/usr/bin/env bash

SN=$(basename "${0}")

usage() {
	echo "usage: ${SN} <build_directory> <offline_file_basename>"
	return
}

error() {
	echo "ERROR: ${1}" >&2
	usage
	exit 1
}

isdir() {
	[[ -d "${1}" ]] || return 1
	[[ -r "${1}" ]] || return 1
	[[ -w "${1}" ]] || return 1
	return 0
}

isfile() {
	[[ -f "${1}" ]] || return 1
	[[ -r "${1}" ]] || return 1
	[[ -w "${1}" ]] || return 1
	return 0
}

[[ -z "${1}" ]] && error "missing argument: build directory"
BUILDDIR="${1}"
shift

HTML="${BUILDDIR}/html"
LATEX="${BUILDDIR}/latex"
LATEXTEX=$(echo "${BUILDDIR}"/latex/*.tex | head -1)
LATEXPDF="${LATEXTEX%%.tex}.pdf"
REVEALJS="${BUILDDIR}/revealjs"
DOCTREES="${BUILDDIR}/doctrees"

isdir "${HTML}" || error "wrong build directory: missing 'html': '${HTML}'"
isdir "${LATEX}" || error "wrong build directory: missing 'latex': '${LATEX}'"
isfile "${LATEXPDF}" || error "wrong build directory: missing offline file: '${LATEXPDF}'"
isdir "${REVEALJS}" || error "wrong build directory: missing 'revealjs': '${REVEALJS}'"
isdir "${DOCTREES}" || error "wrong build directory: missing 'doctrees': '${DOCTREES}'"

cp -vf "${LATEXPDF}" "${BUILDDIR}"
rm -rvf "${LATEX}"
rm -rvf "${DOCTREES}"

touch "${BUILDDIR}/.nojekyll"
cat << :EOF | tee "${BUILDDIR}/index.html"
<!DOCTYPE HTML>
<html lang="en-US">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="refresh" content="1;url=html/index.html">
        <title>Page Redirection</title>
    </head>
    <body>
        If you are not redirected automatically, 
        follow the <a href="html/index.html">link to the documentation</a>
    </body>
</html>
:EOF
