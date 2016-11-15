.PHONY: build_casa casa meqtrees build_miriad miriad build_miriad_umd miriad_umd tigger build_notebooks notebooks build_pvextractor ds9 build_gipsy gipsy build_karma karma build_wsclean wsclean build_aoflagger aoflagger build_purify purify build_aips aips build_tirific tirific build_sofia sofia build_fat fat build_pybdsm pybdsm build_sourcery sourcery build_ddfacet ddfacet build_simms simms build_karoogp karoo_gp build_sofia_1404 sofia_1404 build_aips_patch aips_patch build_gipsy_patch gipsy_patch build_karma_patch karma_patch

DOCKER_OPTS=-it --rm --net=host -e QT_X11_NO_MITSHM=1 -e DISPLAY=${DISPLAY} --volume="${HOME}:${HOME}:rw" --volume="/etc/group:/etc/group:ro" --volume="/etc/passwd:/etc/passwd:ro" --volume="/etc/shadow:/etc/shadow:ro" --volume="/etc/sudoers.d:/etc/sudoers.d:ro" --user=`id -ur` --workdir="${HOME}" -e HOME="${HOME}"

#SRC_PATH=/data/ben/3GCIV/src
SRC_PATH=./

build_casa:
	docker build -t casa_3gciv -f ${SRC_PATH}/casa/Dockerfile ${SRC_PATH}/casa/
casa:
	docker run ${DOCKER_OPTS} casa_3gciv

meqtrees:
	docker run ${DOCKER_OPTS} radioastro/meqtrees

build_miriad:
	docker build -t miriad_csiro_3gciv -f ${SRC_PATH}/miriad/Dockerfile ${SRC_PATH}/miriad
miriad:
	docker run ${DOCKER_OPTS} miriad_csiro_3gciv

build_miriad_umd:
	docker build -t miriad_3gciv -f ${SRC_PATH}/miriad_umd/Dockerfile ${SRC_PATH}/miriad_umd
miriad_umd:
	docker run ${DOCKER_OPTS} miriad_3gciv


tigger:
	docker run ${DOCKER_OPTS} --entrypoint tigger radioastro/meqtrees

build_notebooks: #build_miriad_umd
	docker build -t notebooks_3gciv -f ${SRC_PATH}/notebooks/Dockerfile ${SRC_PATH}/notebooks

notebooks:
	docker run ${DOCKER_OPTS} notebooks_3gciv

build_pvextractor: build_notebooks

ds9:
	docker run ${DOCKER_OPTS} --entrypoint ds9 h1_3gciv

build_gipsy:
	docker build -t gipsy_3gciv -f ${SRC_PATH}/gipsy/Dockerfile ${SRC_PATH}/gipsy

gipsy:
	docker run ${DOCKER_OPTS} gipsy_3gciv
build_karma:
	docker build -t karma_3gciv -f ${SRC_PATH}/karma/Dockerfile ${SRC_PATH}/karma
karma:
	docker run ${DOCKER_OPTS} karma_3gciv
build_wsclean:
	docker build -t wsclean_3gciv -f ${SRC_PATH}/wsclean/Dockerfile ${SRC_PATH}/wsclean
wsclean:
	docker run ${DOCKER_OPTS} wsclean_3gciv
build_aoflagger:
	docker build -t aoflagger_3gciv -f ${SRC_PATH}/aoflagger/Dockerfile ${SRC_PATH}/aoflagger
aoflagger:
	docker run ${DOCKER_OPTS} aoflagger_3gciv
build_purify:
	docker build --no-cache -t purify_3gciv -f ${SRC_PATH}/purify/Dockerfile ${SRC_PATH}/purify
purify:
	docker run ${DOCKER_OPTS} purify_3gciv
build_aips: build_commbase
	docker build -t aips_3gciv -f ${SRC_PATH}/aips/Dockerfile ${SRC_PATH}/aips
build_commbase:
	docker build -t comm-base -f ${SRC_PATH}/aips/Dockerfile.commbase ${SRC_PATH}/aips
aips:
	docker run ${DOCKER_OPTS} aips_3gciv
build_lofar:
	docker build -t lofar_3gciv -f ${SRC_PATH}/lofar/Dockerfile ${SRC_PATH}/lofar
build_tirific:
	docker build -t tirific_3gciv -f ${SRC_PATH}/tirific/Dockerfile ${SRC_PATH}/tirific
tirific:
	docker run ${DOCKER_OPTS} tirific_3gciv
build_sofia: build_tirific
	docker build -t sofia_3gciv -f ${SRC_PATH}/sofia/Dockerfile ${SRC_PATH}/sofia
sofia: 
	docker run ${DOCKER_OPTS} sofia_3gciv
build_fat: build_sofia
	docker build -t fat_3gciv -f ${SRC_PATH}/fat/Dockerfile ${SRC_PATH}/fat
fat:
	docker run ${DOCKER_OPTS} fat_3gciv
build_pybdsm:
	docker build -t pybdsm_3gciv -f ${SRC_PATH}/pybdsm/Dockerfile ${SRC_PATH}/pybdsm
pybdsm:
	docker run ${DOCKER_OPTS} pybdsm_3gciv
build_sourcery: build_pybdsm
	docker build -t sourcery_3gciv -f ${SRC_PATH}/sourcery/Dockerfile ${SRC_PATH}/sourcery
sourcery:
	docker run ${DOCKER_OPTS} sourcery_3gciv
build_ddfacet:
	docker build -t ddf_3gciv -f ${SRC_PATH}/ddf/DDFacet/Dockerfile ${SRC_PATH}/ddf/DDFacet
ddfacet:
	docker run ${DOCKER_OPTS} ddf_3gciv
build_simms:
	docker build -t simms_3gciv -f ${SRC_PATH}/simms/Dockerfile ${SRC_PATH}/simms
simms:
	docker run ${DOCKER_OPTS} simms_3gciv
build_karoogp:
	docker build -t karoogp_3gciv -f ${SRC_PATH}/karoo_gp/Dockerfile ${SRC_PATH}/karoo_gp
karoogp:
	docker run ${DOCKER_OPTS} karoogp_3gciv
build_sofia1404:
	docker build --no-cache -t sofia_1404_3gciv -f ${SRC_PATH}/sofia1404/Dockerfile ${SRC_PATH}/sofia1404
sofia1404:
	docker run ${DOCKER_OPTS} sofia_1404_3gciv
build_aips_patch:
	docker build -t aips_patch_3gciv -f ${SRC_PATH}/aips/Dockerfile.patch ${SRC_PATH}/aips
aips_patch:
	docker run ${DOCKER_OPTS} aips_patch_3gciv
build_gipsy_patch:
	docker build -t gipsy_patch_3gciv -f ${SRC_PATH}/gipsy/Dockerfile.patch ${SRC_PATH}/gipsy
gipsy_patch:
	docker run ${DOCKER_OPTS} gipsy_patch_3gciv
build_karma_patch:
	docker build -t karma_patch_3gciv -f ${SRC_PATH}/karma/Dockerfile.patch ${SRC_PATH}/karma
karma_patch:
	docker run ${DOCKER_OPTS} karma_patch_3gciv

