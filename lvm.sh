#!/bin/bash

# Variables
DISK="/dev/sdb"
PARTITION="${DISK}1"
VG_NAME="vg_minio"
LV_NAME="lv_minio"
MOUNT_POINT="/mnt/minio-data"

# Step 1: Create a partition on the disk
echo "Creating partition on ${DISK}..."
sudo parted -s ${DISK} mklabel gpt
sudo parted -s ${DISK} mkpart primary 0% 100%
sudo parted -s ${DISK} set 1 lvm on

# Step 2: Create a Physical Volume (PV)
echo "Creating Physical Volume on ${PARTITION}..."
sudo pvcreate ${PARTITION}

# Step 3: Create a Volume Group (VG)
echo "Creating Volume Group '${VG_NAME}'..."
sudo vgcreate ${VG_NAME} ${PARTITION}

# Step 4: Create a Logical Volume (LV)
echo "Creating Logical Volume '${LV_NAME}'..."
sudo lvcreate -l 100%FREE -n ${LV_NAME} ${VG_NAME}

# Step 5: Format the Logical Volume with ext4
echo "Formatting Logical Volume with ext4..."
sudo mkfs.ext4 /dev/${VG_NAME}/${LV_NAME}

# Step 6: Create the mount point directory
echo "Creating mount point directory at ${MOUNT_POINT}..."
sudo mkdir -p ${MOUNT_POINT}

# Step 7: Mount the Logical Volume
echo "Mounting Logical Volume to ${MOUNT_POINT}..."
sudo mount /dev/${VG_NAME}/${LV_NAME} ${MOUNT_POINT}

# Step 8: Add to /etc/fstab for automatic mounting on boot
echo "Adding mount point to /etc/fstab..."
FSTAB_ENTRY="/dev/${VG_NAME}/${LV_NAME} ${MOUNT_POINT} ext4 defaults 0 0"
echo "${FSTAB_ENTRY}" | sudo tee -a /etc/fstab

# Step 9: Verify the mount
echo "Verifying the mount..."
df -h | grep ${MOUNT_POINT}

echo "LVM setup and mounting completed successfully!"
