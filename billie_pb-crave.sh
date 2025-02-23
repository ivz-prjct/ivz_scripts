# Remove previous device setup
rm -rf .repo/local_manifests/
rm -rf device/oneplus
rm -rf kernel/oneplus
rm -rf vendor/oneplus
rm -rf hardware/oneplus

# Clone ROM Source 
repo init -u https://github.com/PixelBuildsROM/android_manifest -b unity

# Clone local_manifests setup
git clone -b billie_pb-unity https://github.com/ivz-prjct/local_manifests.git .repo/local_manifests

# repo sync
/opt/crave/resync.sh

# Set up build environment
export BUILD_USERNAME=nobody
export BUILD_HOSTNAME=android-build

# Run build script
./pb-build.sh billie -k .android-certs
