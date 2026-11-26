Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795654366;
	b=zkxbBTFonU8kZi+RUc/Z16Ev/AXzgrfB5Obi0EKWdIXOpd+UL84+yMMUy5ym/4huB8hj
	 Sbg0YKFHB0M8888nrmjdoc29jFCHnMuyk/0qA2Qf4wUh3ku1EeEnRVgMrMwDfM6wNVosV
	 joJ8cpY7Ou+OKd8YMQ3gESdQscr3xrcP03WAaoFuajr3NVB773qfK1geke5P5Xz07dvAB
	 HrVH1ENi0oy6CFLugs7iDrdt8diiz4QP83HUEvfjKwGrhLgmDhefysxm+tr+oZfjEI+ay
	 mqrJnWotdchVMtOX5EjVOPrNp6YUlc1cO+qVENUUtkMJ6RoNI20wkV/yEIH9s3umuUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654366;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=i6atbjI+tX1RclLrNiP3EwAuP1Mylg3I8yI+DwB8t3A=;
	b=Sq16TE0nr1ATADqqyTOZ68JPoF1eetE7bCHGazm42IygzzteZ9ZS07nnZ7uJYODZqayK
	 tanP3eDpXC2pSMZvocmf8Mwj+ATnExjuzcHI6DWfirqn9H/kHtREnQy1GDzAQ3cCX1TuN
	 BLX/SOsv3Sd4H3D67tQUqvlQtUTLms/xnu744CcQ56/LqFQZNDr31bw10OyX0fhRt0wqf
	 gASErULsEiM/ClKra841PX+ebPXfEd4JlbrKNprGzzZ/+q//pxQIbsmCd6f9+fA+gKNIB
	 jSmPyb15XN8kFXyX+wXauOhWvy7lvagJUAelAHWZTdXKFRxSST31PdlqHhWSePHzIpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=he4g1df1;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C73F606A31E
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 00:52:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C73F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=he4g1df1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795654365; x=1827190365;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TXGTcpwtR7pSf+J1721R0fuSx0LKPLJTOsBO/SLG2rw=;
  b=he4g1df1YgZQy0Tq2N1jcy66vCt9mePeWV/PEu/ecGSY44skN45ttcd2
   QGhl/iZKDkb8kYXFZ/LtYmNqmIdFeJ+e4g4Xd+0oatSZO5UK4YcPx6VHC
   H8dSW5Nq2wpyfk/lgiOI9ekC6JyaSmp8idYAg30GmrdqRVYmBnFQogA+t
   dKo0IgSxkOl9jx0nsND5kb5sN46tcFADhZcKxKXnJ9l9kK/qhIZj+0i6y
   gto778M4SoJHlV2SjF7vV1QB/7iaNMu3vxIp2xQehVE+yZsZVi6T+9jQP
   3SwzU88IsbBGSLinG/6YOudeLZ4W+GPr0gLr6bbLXzuhFAY2b7WJtvYK1
   w==;
X-CSE-ConnectionGUID: y4XrMyFZSlmppYZVzK+Cwg==
X-CSE-MsgGUID: jNkk1FYLTxON6zDvkbS+Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4522502"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4522502"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 16:52:45 -0800
X-CSE-ConnectionGUID: BPNUk/uNRqaJwX6sMCFK/g==
X-CSE-MsgGUID: o3HPEoViQY2oPXOpE73+8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11907096"
Received: from emr-371.sh.intel.com ([10.112.106.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 16:52:43 -0800
From: Baoli Zhang <baoli.zhang@linux.intel.com>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: Johannes Berg <johannes.berg@intel.com>,
	linux-wireless@vger.kernel.org,
	Baoli Zhang <baoli.zhang@linux.intel.com>
Subject: [PATCH] backports: look for kernel headers in source dir too
Date: Thu, 26 Nov 2026 08:42:00 +0800
Message-ID: <20261126004200.626863-1-baoli.zhang@linux.intel.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Debian splits the kernel headers: /lib/modules/<ver>/build only has
.config, Module.symvers and the generated headers, include/linux is
under /lib/modules/<ver>/source. The grep checks in compat/Kconfig
then can't find the headers and all evaluate to n, so on 7.3 we
redefine the spinlock_bh guards and fail to build.

Add KLIB_SRC for these checks. Use the build dir if it has
include/linux, otherwise its source symlink (O= builds), and only then
$(KLIB)/source, so that a custom KLIB_BUILD doesn't pick up the headers
of the running kernel. Warn if no headers are found at all, instead of
silently disabling the checks.

Fixes: e0449c805011 ("backports: auto-detect spinlock_bh guard()")
Fixes: e9e903010322 ("[BUGFIX] backports: Auto detect genlmsg_multicast_allns()")
Fixes: 6bd0558a1593 ("[FROMGIT] netfilter: flowtable: restore ieee80211 forward path")
Signed-off-by: Baoli Zhang <baoli.zhang@linux.intel.com>
---
 Makefile       | 14 +++++++++++++-
 compat/Kconfig |  6 +++---
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 2b33a80c3..daba7181e 100644
--- a/Makefile
+++ b/Makefile
@@ -19,8 +19,13 @@ KLIB_BUILD ?= $(KLIB)/build/
 KERNEL_CONFIG := $(KLIB_BUILD)/.config
 KERNEL_MAKEFILE := $(KLIB_BUILD)/Makefile
 CONFIG_MD5 := $(shell md5sum $(KERNEL_CONFIG) 2>/dev/null | sed 's/\s.*//')
+# Debian splits the headers, its build dir has no include/linux
+KLIB_SRC ?= $(patsubst %/include/linux,%,$(firstword $(wildcard	\
+	$(KLIB_BUILD)/include/linux					\
+	$(KLIB_BUILD)/source/include/linux				\
+	$(KLIB)/source/include/linux)))
 
-export KLIB KLIB_BUILD BACKPORT_DIR KMODDIR KMODPATH_ARG
+export KLIB KLIB_BUILD KLIB_SRC BACKPORT_DIR KMODDIR KMODPATH_ARG
 
 # disable built-in rules for this file
 .SUFFIXES:
@@ -60,6 +65,13 @@ mrproper:
 	echo "| (that isn't currently running.)"					;\
 	echo "\\--"									;\
 	false)
+	@test -n "$(KLIB_SRC)" || (							\
+	echo "/--------------"								;\
+	echo "| WARNING: kernel headers (include/linux) not found in"		;\
+	echo "| $(KLIB_BUILD) or its source dir, kernel feature"			;\
+	echo "| detection will not work. Set KLIB_SRC to the kernel"		;\
+	echo "| source tree to fix this."						;\
+	echo "\\--")
 	@set -e ; if [ "$$(cat .kernel_config_md5 2>/dev/null)" != "$(CONFIG_MD5)" ]	;\
 	then 										\
 		echo -n "Generating local configuration database from kernel ..."	;\
diff --git a/compat/Kconfig b/compat/Kconfig
index 09663a8bc..e1db4dd71 100644
--- a/compat/Kconfig
+++ b/compat/Kconfig
@@ -74,13 +74,13 @@ config BP_MODULES
 	for the "modules" directive to control the 'm' state.
 
 config KERNEL_HAS_SPINLOCK_BH_GUARD
-	def_bool $(success,grep -q DEFINE_LOCK_GUARD_1\$(left_paren)spinlock_bh$(comma) $(KLIB_BUILD)/include/linux/spinlock.h)
+	def_bool $(success,grep -q DEFINE_LOCK_GUARD_1\$(left_paren)spinlock_bh$(comma) $(KLIB_SRC)/include/linux/spinlock.h)
 
 config KERNEL_HAS_GENLMSG_MULTICAST_ALLNS_GFP
-	def_bool $(success,grep -A5 'int genlmsg_multicast_allns' $(KLIB_BUILD)/include/net/genetlink.h | grep -q gfp_t)
+	def_bool $(success,grep -A5 'int genlmsg_multicast_allns' $(KLIB_SRC)/include/net/genetlink.h | grep -q gfp_t)
 
 config KERNEL_HAS_DEV_PATH_IEEE80211
-	def_bool $(success,grep -q DEV_PATH_IEEE80211 $(KLIB_BUILD)/include/linux/netdevice.h)
+	def_bool $(success,grep -q DEV_PATH_IEEE80211 $(KLIB_SRC)/include/linux/netdevice.h)
 
 config BPAUTO_BUILD_NLATTR
 	def_bool y
-- 
2.43.0

