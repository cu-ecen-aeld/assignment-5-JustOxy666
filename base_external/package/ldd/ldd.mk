
##############################################################
#
# LDD
#
##############################################################
LDD_VERSION = c59d481c6e708c57c77bebd334075beb98bd9886
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-JustOxy666.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

LDD_MODULE_SUBDIRS = misc-modules
LDD_MODULE_SUBDIRS += scull

# define LDD_BUILD_CMDS
# 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/misc-modules modules
# 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/scull modules
# endef

define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/init $(TARGET_DIR)/etc/init.d/S98lddmodules
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/bin/module_load
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/bin/module_unload
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/bin/scull_load
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/bin/scull_unload
endef

$(eval $(kernel-module))
$(eval $(generic-package))
