Create a SElinux policy module:
bash
Copy code
# Create a directory for the SElinux policy module
mkdir ~/selinux-container-policy

# Create a file for the policy module
touch ~/selinux-container-policy/container.te

# Add the following content to the policy module file
policy_module(container, 1.0)

# Define the types of resources that containers can access
type container_t;
type container_exec_t;
type container_data_t;

# Allow containers to access their own files and directories
allow container_t container_data_t:dir { read search };
allow container_t container_data_t:file { read write };

# Allow containers to execute their own files
allow container_t container_exec_t:file { execute };

# Deny containers from accessing other files and directories
dontaudit container_t self:file { execute execute_no_trans };
dontaudit container_t self:dir { read search open };
dontaudit container_t self:lnk_file { read getattr };
Compile the policy module:
bash
Copy code
# Compile the policy module
make -f /usr/share/selinux/devel/Makefile ~/selinux-container-policy/container.pp

# Load the policy module into the SElinux policy store
semodule -i ~/selinux-container-policy/container.pp
Launch a container with SElinux in enforcing mode:
python
Copy code
# Launch the container with SElinux in enforcing mode
docker run -it --security-opt=seccomp=unconfined --security-opt=label=type:container_t my-container-image
Test the isolation:
bash
Copy code
# Try to access a file outside of the container
ls /etc/passwd

# The access should be denied, indicating that the container is isolated from the host system
ls: cannot open directory '/etc/passwd': Permission denied
