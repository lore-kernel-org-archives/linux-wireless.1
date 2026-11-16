Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864122;
	b=tSUilDWIeU+GCpEmQAVdDsQvtUoz0E0PdkB0fpuf7Fj3DuMxkIBXz4YYnEigIJ9xrqmt
	 KQt3ChlKuxAv5jntqmGpdq8YZyDqeN8pJZ512QtebzWmbQQZoZcoDoJE7UmLg6Cjn4S5t
	 pUfYUkCmHe6Xi1BwbRFzRXHSHIkbMBYYS1tponq8hrfzEHiWq4BIJcdtfKw4AdGyL5ssX
	 GNtMd3jzuTu2NGEkIA5TYC8Mbt+9cIoekCCirQR5180unlv8+qNdX0yT29Ak1gGHJ4Dzc
	 Wgl6uZrWiphgcO4QjoId4EztWYwANTm6xxCWYLh2OtkxXmycyCKXCherHZkP9CAvwnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864122;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Organization:Content-Transfer-Encoding;
	bh=GFEsekYuzh0cqr1r+f2TNRJtzQ28LaSFMt46z6b7faY=;
	b=ld3qMF9HsTsuhhuqwYRE9Qdot2fHs2QkIylMCyVaQ05O37xQLaKGpxSJ9LOQ6kwdJmlu
	 a9K8Hc/vreHEjJ9n+TYgfbBnXZyQKQEFVUTADln2gc9oFRe/AN5snk6OdHMUsKh5MfJwR
	 MfXvZbKPqsLIY7XhLvgVvViJQ1IaqRGIs9AoR6XZpqjxwj88Mgfm7vf+EV1qkNr3JExUd
	 DgUsFO4UpAj+kKUpcrNjC0U+Nm2ZLzDAK+xJvnC86drRPUSXpU2N2fQH+MUT0L93JYMNI
	 N+VQAHrcWzN8XiUC2IQrqBQ9TlTkuXcLrqcJk6d1KOp+pflWPt28zFGJJ1rHltjxmBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eojgyhSU;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE75606A331
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 21:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBE75606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eojgyhSU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794864122; x=1826400122;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=04FhjFGqi0Lt5Qa7hXRNYd63ZFAeE350pe6ct2Nl/Sk=;
  b=eojgyhSUgGFKHsL3HDatbOgmAsBIQQPlwoecLju42kmyGHlJ8jZ6u0ID
   YQyKh2xh2dz3wEVUAixD+HWwu5Aq86V9kFFAJrOt9yIAbiN2YxOpFrqms
   PS2Yknk0eaWcbXXYABM2Ms+MEu3Sf37XMplEPd2zGHoetBHPy9NMwTIQb
   WgPuYFkEecd23s8HrTjKj4Sl4LP+qBA9ZCJg0JSQpn6HUzksyu6CVTwzD
   PqOeiqtFUmAeKM1lJHFb+WbRik47zAQlPJ0dyUluW27JY6PfoPRihLiq6
   IgOhLfCxAb4veaLCET98oJauNOf3eoTPMxAujnf6Q3psZyjemmqIdKPNe
   Q==;
X-CSE-ConnectionGUID: JE1R4HfMTpGC30gm5dAHKQ==
X-CSE-MsgGUID: dQfFzBvFT8qEwBItCE3g+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3604213"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3604213"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:22:01 -0800
X-CSE-ConnectionGUID: 19sPxobaQICdVAkxnCYeqg==
X-CSE-MsgGUID: lAbHadx6RdSxe7zoQNwG6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9969167"
Received: from weis0040.iil.intel.com ([10.12.217.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:22:00 -0800
From: Miri Korenblit <miriam.rachel.korenblit@intel.com>
To: miriam.rachel.korenblit@intel.com
Cc: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>
Subject: [PATCH iwlwifi-next 15/15] wifi: iwlwifi: partially enable context analysis
Date: Mon, 16 Nov 2026 23:23:33 +0200
Message-Id: <20261116232138.ed9b4972855e.I80c52567724e568471c89cf058a29c0e5c2cd29d@changeid>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116212333.2404653-1-miriam.rachel.korenblit@intel.com>
References: <20261116212333.2404653-1-miriam.rachel.korenblit@intel.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Organization: Intel Israel (74) Limited
Content-Transfer-Encoding: 8bit

From: Johannes Berg <johannes.berg@intel.com>

Enable context analysis for the iwlwifi driver core
(including pcie/fw since they're built via the same
Makefile), but not the opmodes yet.

This also restores the nic-access tracking that we'd
previously removed since it wasn't correct, doing a
translation from the PCIe spinlock to the new token
(iwl_nic_access) used for that in iwl-trans.c.

The debug code is too complicated for clang since it
does the locking conditionally depending on data, so
that needs to have it disabled.

A couple of places are possibly wrong, I've marked
disabled analysis there with FIXMEs for now.

Signed-off-by: Johannes Berg <johannes.berg@intel.com>
Signed-off-by: Miri Korenblit <miriam.rachel.korenblit@intel.com>
---
 drivers/net/wireless/intel/iwlwifi/Makefile   |  2 ++
 .../net/wireless/intel/iwlwifi/fw/dbg-old.c   |  3 +++
 drivers/net/wireless/intel/iwlwifi/fw/dbg.c   | 21 +++++++++++++++++
 .../wireless/intel/iwlwifi/fw/notif-wait.c    |  7 +++++-
 .../wireless/intel/iwlwifi/fw/notif-wait.h    | 20 ++++++++++------
 .../wireless/intel/iwlwifi/iwl-nvm-parse.c    |  3 +++
 .../net/wireless/intel/iwlwifi/iwl-trans.c    |  8 ++++++-
 .../net/wireless/intel/iwlwifi/iwl-trans.h    | 23 ++++++++++++++-----
 .../wireless/intel/iwlwifi/pcie/internal.h    | 18 ++++++++++-----
 .../net/wireless/intel/iwlwifi/pcie/trans.c   |  6 +++++
 .../net/wireless/intel/iwlwifi/pcie/utils.h   |  7 ++++--
 11 files changed, 95 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/Makefile b/drivers/net/wireless/intel/iwlwifi/Makefile
index 504381b4aac7..b9d0f8a643d9 100644
--- a/drivers/net/wireless/intel/iwlwifi/Makefile
+++ b/drivers/net/wireless/intel/iwlwifi/Makefile
@@ -50,6 +50,8 @@ obj-$(CONFIG_IWLMVM)	+= mvm/
 obj-$(CONFIG_IWLMEI)	+= mei/
 obj-$(CONFIG_IWLMLD)	+= mld/
 
+CONTEXT_ANALYSIS := y
+
 obj-$(CONFIG_IWLWIFI_KUNIT_TESTS) += tests/
 
 CFLAGS_iwl-devtrace.o := -I$(src)
diff --git a/drivers/net/wireless/intel/iwlwifi/fw/dbg-old.c b/drivers/net/wireless/intel/iwlwifi/fw/dbg-old.c
index 09c798d2eba3..069acf9ef85f 100644
--- a/drivers/net/wireless/intel/iwlwifi/fw/dbg-old.c
+++ b/drivers/net/wireless/intel/iwlwifi/fw/dbg-old.c
@@ -61,6 +61,7 @@ static void iwl_read_radio_regs(struct iwl_fw_runtime *fwrt,
 static void iwl_fwrt_dump_rxf(struct iwl_fw_runtime *fwrt,
 			      struct iwl_fw_error_dump_data **dump_data,
 			      int size, u32 offset, int fifo_num)
+	__must_hold(iwl_nic_access)
 {
 	struct iwl_fw_error_dump_fifo *fifo_hdr;
 	u32 *fifo_data;
@@ -116,6 +117,7 @@ static void iwl_fwrt_dump_rxf(struct iwl_fw_runtime *fwrt,
 static void iwl_fwrt_dump_txf(struct iwl_fw_runtime *fwrt,
 			      struct iwl_fw_error_dump_data **dump_data,
 			      int size, u32 offset, int fifo_num)
+	__must_hold(iwl_nic_access)
 {
 	struct iwl_fw_error_dump_fifo *fifo_hdr;
 	u32 *fifo_data;
@@ -510,6 +512,7 @@ static const struct iwl_prph_range iwl_prph_dump_addr_ax210[] = {
 
 static void iwl_read_prph_block(struct iwl_trans *trans, u32 start,
 				u32 len_bytes, __le32 *data)
+	__must_hold(iwl_nic_access)
 {
 	u32 i;
 
diff --git a/drivers/net/wireless/intel/iwlwifi/fw/dbg.c b/drivers/net/wireless/intel/iwlwifi/fw/dbg.c
index e29c58575859..95103b9fb649 100644
--- a/drivers/net/wireless/intel/iwlwifi/fw/dbg.c
+++ b/drivers/net/wireless/intel/iwlwifi/fw/dbg.c
@@ -95,6 +95,7 @@ struct iwl_dump_ini_region_data {
 static int iwl_dump_ini_prph_mac_iter_common(struct iwl_fw_runtime *fwrt,
 					     void *range_ptr, u32 addr,
 					     __le32 size)
+	__must_hold(iwl_nic_access)
 {
 	struct iwl_fw_ini_error_dump_range *range = range_ptr;
 	__le32 *val = range->data;
@@ -112,6 +113,7 @@ static int
 iwl_dump_ini_prph_mac_iter(struct iwl_fw_runtime *fwrt,
 			   struct iwl_dump_ini_region_data *reg_data,
 			   void *range_ptr, int idx)
+	__must_hold(iwl_nic_access)
 {
 	struct iwl_fw_ini_region_tlv *reg = (void *)reg_data->reg_tlv->data;
 	u32 addr = le32_to_cpu(reg->addrs[idx]) +
@@ -125,6 +127,7 @@ static int
 iwl_dump_ini_prph_mac_block_iter(struct iwl_fw_runtime *fwrt,
 				 struct iwl_dump_ini_region_data *reg_data,
 				 void *range_ptr, int idx)
+	__must_hold(iwl_nic_access)
 {
 	struct iwl_fw_ini_region_tlv *reg = (void *)reg_data->reg_tlv->data;
 	struct iwl_fw_ini_addr_size *pairs = (void *)reg->addrs;
@@ -138,6 +141,7 @@ iwl_dump_ini_prph_mac_block_iter(struct iwl_fw_runtime *fwrt,
 static int iwl_dump_ini_prph_phy_iter_common(struct iwl_fw_runtime *fwrt,
 					     void *range_ptr, u32 addr,
 					     __le32 size, __le32 offset)
+	__must_hold(iwl_nic_access)
 {
 	struct iwl_fw_ini_error_dump_range *range = range_ptr;
 	__le32 *val = range->data;
@@ -198,6 +202,7 @@ static int
 iwl_dump_ini_prph_phy_iter(struct iwl_fw_runtime *fwrt,
 			   struct iwl_dump_ini_region_data *reg_data,
 			   void *range_ptr, int idx)
+	__must_hold(iwl_nic_access)
 {
 	struct iwl_fw_ini_region_tlv *reg = (void *)reg_data->reg_tlv->data;
 	u32 addr = le32_to_cpu(reg->addrs[idx]);
@@ -211,6 +216,7 @@ static int
 iwl_dump_ini_prph_phy_block_iter(struct iwl_fw_runtime *fwrt,
 				 struct iwl_dump_ini_region_data *reg_data,
 				 void *range_ptr, int idx)
+	__must_hold(iwl_nic_access)
 {
 	struct iwl_fw_ini_region_tlv *reg = (void *)reg_data->reg_tlv->data;
 	struct iwl_fw_ini_addr_size *pairs = (void *)reg->addrs;
@@ -271,6 +277,7 @@ static int iwl_dump_ini_config_iter(struct iwl_fw_runtime *fwrt,
 static int iwl_dump_ini_dev_mem_iter(struct iwl_fw_runtime *fwrt,
 				     struct iwl_dump_ini_region_data *reg_data,
 				     void *range_ptr, int idx)
+	__must_hold(iwl_nic_access)
 {
 	struct iwl_fw_ini_region_tlv *reg = (void *)reg_data->reg_tlv->data;
 	struct iwl_fw_ini_error_dump_range *range = range_ptr;
@@ -360,6 +367,7 @@ iwl_dump_ini_mon_dram_iter(struct iwl_fw_runtime *fwrt,
 static int iwl_dump_ini_mon_smem_iter(struct iwl_fw_runtime *fwrt,
 				      struct iwl_dump_ini_region_data *reg_data,
 				      void *range_ptr, int idx)
+	__must_hold(iwl_nic_access)
 {
 	struct iwl_fw_ini_region_tlv *reg = (void *)reg_data->reg_tlv->data;
 	struct iwl_fw_ini_error_dump_range *range = range_ptr;
@@ -428,6 +436,7 @@ static bool iwl_ini_txf_iter(struct iwl_fw_runtime *fwrt,
 static int iwl_dump_ini_txf_iter(struct iwl_fw_runtime *fwrt,
 				 struct iwl_dump_ini_region_data *reg_data,
 				 void *range_ptr, int idx)
+	__must_hold(iwl_nic_access)
 {
 	struct iwl_fw_ini_region_tlv *reg = (void *)reg_data->reg_tlv->data;
 	struct iwl_fw_ini_error_dump_range *range = range_ptr;
@@ -492,6 +501,7 @@ static int
 iwl_dump_ini_prph_snps_dphyip_iter(struct iwl_fw_runtime *fwrt,
 				   struct iwl_dump_ini_region_data *reg_data,
 				   void *range_ptr, int idx)
+	__must_hold(iwl_nic_access)
 {
 	struct iwl_fw_ini_region_tlv *reg = (void *)reg_data->reg_tlv->data;
 	struct iwl_fw_ini_error_dump_range *range = range_ptr;
@@ -601,6 +611,7 @@ static void iwl_ini_get_rxf_data(struct iwl_fw_runtime *fwrt,
 static int iwl_dump_ini_rxf_iter(struct iwl_fw_runtime *fwrt,
 				 struct iwl_dump_ini_region_data *reg_data,
 				 void *range_ptr, int idx)
+	__must_hold(iwl_nic_access)
 {
 	struct iwl_fw_ini_region_tlv *reg = (void *)reg_data->reg_tlv->data;
 	struct iwl_fw_ini_error_dump_range *range = range_ptr;
@@ -662,6 +673,7 @@ static int
 iwl_dump_ini_err_table_iter(struct iwl_fw_runtime *fwrt,
 			    struct iwl_dump_ini_region_data *reg_data,
 			    void *range_ptr, int idx)
+	__must_hold(iwl_nic_access)
 {
 	struct iwl_fw_ini_region_tlv *reg = (void *)reg_data->reg_tlv->data;
 	struct iwl_fw_ini_region_err_table *err_table = &reg->err_table;
@@ -681,6 +693,7 @@ static int
 iwl_dump_ini_special_mem_iter(struct iwl_fw_runtime *fwrt,
 			      struct iwl_dump_ini_region_data *reg_data,
 			      void *range_ptr, int idx)
+	__must_hold(iwl_nic_access)
 {
 	struct iwl_fw_ini_region_tlv *reg = (void *)reg_data->reg_tlv->data;
 	struct iwl_fw_ini_region_special_device_memory *special_mem =
@@ -702,6 +715,7 @@ static int
 iwl_dump_ini_dbgi_sram_iter(struct iwl_fw_runtime *fwrt,
 			    struct iwl_dump_ini_region_data *reg_data,
 			    void *range_ptr, int idx)
+	__must_hold(iwl_nic_access)
 {
 	struct iwl_fw_ini_region_tlv *reg = (void *)reg_data->reg_tlv->data;
 	struct iwl_fw_ini_error_dump_range *range = range_ptr;
@@ -748,6 +762,7 @@ static int iwl_dump_ini_fw_pkt_iter(struct iwl_fw_runtime *fwrt,
 static int iwl_dump_ini_imr_iter(struct iwl_fw_runtime *fwrt,
 				 struct iwl_dump_ini_region_data *reg_data,
 				 void *range_ptr, int idx)
+	__must_hold(iwl_nic_access)
 {
 	/* read the IMR memory and DMA it to SRAM */
 	struct iwl_fw_ini_error_dump_range *range = range_ptr;
@@ -801,6 +816,7 @@ static u32 mask_apply_and_normalize(u32 val, u32 mask)
 
 static __le32 iwl_get_mon_reg(struct iwl_fw_runtime *fwrt, u32 alloc_id,
 			      const struct iwl_fw_mon_reg *reg_info)
+	__must_hold(iwl_nic_access)
 {
 	u32 val, offs;
 
@@ -821,6 +837,7 @@ static void *
 iwl_dump_ini_mon_fill_header(struct iwl_fw_runtime *fwrt, u32 alloc_id,
 			     struct iwl_fw_ini_monitor_dump *data,
 			     const struct iwl_fw_mon_regs *addrs)
+	__must_hold(iwl_nic_access)
 {
 	data->write_ptr = iwl_get_mon_reg(fwrt, alloc_id,
 					  &addrs->write_ptr);
@@ -843,6 +860,7 @@ static void *
 iwl_dump_ini_mon_dram_fill_header(struct iwl_fw_runtime *fwrt,
 				  struct iwl_dump_ini_region_data *reg_data,
 				  void *data, u32 data_len)
+	__must_hold(iwl_nic_access)
 {
 	struct iwl_fw_ini_monitor_dump *mon_dump = (void *)data;
 	struct iwl_fw_ini_region_tlv *reg = (void *)reg_data->reg_tlv->data;
@@ -856,6 +874,7 @@ static void *
 iwl_dump_ini_mon_smem_fill_header(struct iwl_fw_runtime *fwrt,
 				  struct iwl_dump_ini_region_data *reg_data,
 				  void *data, u32 data_len)
+	__must_hold(iwl_nic_access)
 {
 	struct iwl_fw_ini_monitor_dump *mon_dump = (void *)data;
 	struct iwl_fw_ini_region_tlv *reg = (void *)reg_data->reg_tlv->data;
@@ -869,6 +888,7 @@ static void *
 iwl_dump_ini_mon_dbgi_fill_header(struct iwl_fw_runtime *fwrt,
 				  struct iwl_dump_ini_region_data *reg_data,
 				  void *data, u32 data_len)
+	__must_hold(iwl_nic_access)
 {
 	struct iwl_fw_ini_monitor_dump *mon_dump = (void *)data;
 
@@ -1756,6 +1776,7 @@ static u32
 iwl_dump_ini_dump_entries(struct iwl_fw_runtime *fwrt,
 			  struct list_head *list,
 			  enum iwl_dump_ini_region_selector which)
+	__context_unsafe("NIC access is tracked in a bool across the loop")
 {
 	struct iwl_fw_ini_dump_entry *entry, *tmp;
 	bool have_nic_access;
diff --git a/drivers/net/wireless/intel/iwlwifi/fw/notif-wait.c b/drivers/net/wireless/intel/iwlwifi/fw/notif-wait.c
index 231d2517f398..db33817e1acc 100644
--- a/drivers/net/wireless/intel/iwlwifi/fw/notif-wait.c
+++ b/drivers/net/wireless/intel/iwlwifi/fw/notif-wait.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
 /*
- * Copyright (C) 2005-2014, 2021 Intel Corporation
+ * Copyright (C) 2005-2014, 2021, 2026 Intel Corporation
  * Copyright (C) 2015-2017 Intel Deutschland GmbH
  */
 #include <linux/sched.h>
@@ -86,6 +86,7 @@ iwl_init_notification_wait(struct iwl_notif_wait_data *notif_wait,
 			   bool (*fn)(struct iwl_notif_wait_data *notif_wait,
 				      struct iwl_rx_packet *pkt, void *data),
 			   void *fn_data)
+	__acquires(wait_entry)
 {
 	if (WARN_ON(n_cmds > MAX_NOTIF_CMDS))
 		n_cmds = MAX_NOTIF_CMDS;
@@ -100,21 +101,25 @@ iwl_init_notification_wait(struct iwl_notif_wait_data *notif_wait,
 	spin_lock_bh(&notif_wait->notif_wait_lock);
 	list_add(&wait_entry->list, &notif_wait->notif_waits);
 	spin_unlock_bh(&notif_wait->notif_wait_lock);
+	__acquire(wait_entry);
 }
 IWL_EXPORT_SYMBOL(iwl_init_notification_wait);
 
 void iwl_remove_notification(struct iwl_notif_wait_data *notif_wait,
 			     struct iwl_notification_wait *wait_entry)
+	__releases(wait_entry)
 {
 	spin_lock_bh(&notif_wait->notif_wait_lock);
 	list_del(&wait_entry->list);
 	spin_unlock_bh(&notif_wait->notif_wait_lock);
+	__release(wait_entry);
 }
 IWL_EXPORT_SYMBOL(iwl_remove_notification);
 
 int iwl_wait_notification(struct iwl_notif_wait_data *notif_wait,
 			  struct iwl_notification_wait *wait_entry,
 			  unsigned long timeout)
+	__releases(wait_entry)
 {
 	int ret;
 
diff --git a/drivers/net/wireless/intel/iwlwifi/fw/notif-wait.h b/drivers/net/wireless/intel/iwlwifi/fw/notif-wait.h
index 0e49794911c1..2a93ab3494aa 100644
--- a/drivers/net/wireless/intel/iwlwifi/fw/notif-wait.h
+++ b/drivers/net/wireless/intel/iwlwifi/fw/notif-wait.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
 /*
- * Copyright (C) 2005-2014, 2023 Intel Corporation
+ * Copyright (C) 2005-2014, 2023, 2026 Intel Corporation
  * Copyright (C) 2015-2017 Intel Deutschland GmbH
  */
 #ifndef __iwl_notif_wait_h__
@@ -18,6 +18,9 @@ struct iwl_notif_wait_data {
 
 #define MAX_NOTIF_CMDS	5
 
+/* separate for kernel-doc */
+context_lock_struct(iwl_notification_wait);
+
 /**
  * struct iwl_notification_wait - notification wait entry
  * @list: list head for global list
@@ -77,21 +80,24 @@ iwl_notification_wait_notify(struct iwl_notif_wait_data *notif_data,
 }
 
 /* user functions */
-void __acquires(wait_entry)
+void
 iwl_init_notification_wait(struct iwl_notif_wait_data *notif_data,
 			   struct iwl_notification_wait *wait_entry,
 			   const u16 *cmds, int n_cmds,
 			   bool (*fn)(struct iwl_notif_wait_data *notif_data,
 				      struct iwl_rx_packet *pkt, void *data),
-			   void *fn_data);
+			   void *fn_data)
+	__acquires(wait_entry);
 
-int __must_check __releases(wait_entry)
+int __must_check
 iwl_wait_notification(struct iwl_notif_wait_data *notif_data,
 		      struct iwl_notification_wait *wait_entry,
-		      unsigned long timeout);
+		      unsigned long timeout)
+	__releases(wait_entry);
 
-void __releases(wait_entry)
+void
 iwl_remove_notification(struct iwl_notif_wait_data *notif_data,
-			struct iwl_notification_wait *wait_entry);
+			struct iwl_notification_wait *wait_entry)
+	__releases(wait_entry);
 
 #endif /* __iwl_notif_wait_h__ */
diff --git a/drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c b/drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c
index 31badfa35f97..5745a5236974 100644
--- a/drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c
+++ b/drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c
@@ -1367,11 +1367,14 @@ static void iwl_set_hw_address_family_8000(struct iwl_trans *trans,
 	}
 
 	if (nvm_hw) {
+		/* FIXME: is the no-grab correct? */
+		disable_context_analysis();
 		/* read the mac address from WFMP registers */
 		__le32 mac_addr0 = cpu_to_le32(iwl_trans_read_prph_no_grab(trans,
 									   WFMP_MAC_ADDR_0));
 		__le32 mac_addr1 = cpu_to_le32(iwl_trans_read_prph_no_grab(trans,
 									   WFMP_MAC_ADDR_1));
+		enable_context_analysis();
 
 		iwl_flip_hw_address(mac_addr0, mac_addr1, data->hw_addr);
 
diff --git a/drivers/net/wireless/intel/iwlwifi/iwl-trans.c b/drivers/net/wireless/intel/iwlwifi/iwl-trans.c
index e75d3a6cf5a6..8f01d042406d 100644
--- a/drivers/net/wireless/intel/iwlwifi/iwl-trans.c
+++ b/drivers/net/wireless/intel/iwlwifi/iwl-trans.c
@@ -685,7 +685,11 @@ bool iwl_trans_grab_nic_access(struct iwl_trans *trans)
 {
 	if (WARN_ON_ONCE(!trans->ops->grab_nic_access))
 		return false;
-	return trans->ops->grab_nic_access(trans);
+	if (!trans->ops->grab_nic_access(trans))
+		return false;
+
+	__acquire(iwl_nic_access);
+	return true;
 }
 IWL_EXPORT_SYMBOL(iwl_trans_grab_nic_access);
 
@@ -697,7 +701,9 @@ void iwl_trans_resched_with_nic_access(struct iwl_trans *trans)
 }
 
 void iwl_trans_release_nic_access(struct iwl_trans *trans)
+	__releases(iwl_nic_access)
 {
+	__release(iwl_nic_access);
 	if (WARN_ON_ONCE(!trans->ops->release_nic_access))
 		return;
 	trans->ops->release_nic_access(trans);
diff --git a/drivers/net/wireless/intel/iwlwifi/iwl-trans.h b/drivers/net/wireless/intel/iwlwifi/iwl-trans.h
index c65d9f012d15..0bb455cf92cd 100644
--- a/drivers/net/wireless/intel/iwlwifi/iwl-trans.h
+++ b/drivers/net/wireless/intel/iwlwifi/iwl-trans.h
@@ -921,9 +921,14 @@ void iwl_trans_write32(struct iwl_trans *trans, u32 ofs, u32 val);
 
 u32 iwl_trans_read32(struct iwl_trans *trans, u32 ofs);
 
-u32 iwl_trans_read_prph_no_grab(struct iwl_trans *trans, u32 ofs);
+/* held between successful iwl_trans_grab_nic_access() and release */
+token_context_lock(iwl_nic_access);
 
-void iwl_trans_write_prph_no_grab(struct iwl_trans *trans, u32 ofs, u32 val);
+u32 iwl_trans_read_prph_no_grab(struct iwl_trans *trans, u32 ofs)
+	__must_hold(iwl_nic_access);
+
+void iwl_trans_write_prph_no_grab(struct iwl_trans *trans, u32 ofs, u32 val)
+	__must_hold(iwl_nic_access);
 
 int iwl_trans_read_mem(struct iwl_trans *trans, u32 addr,
 		       void *buf, int dwords);
@@ -934,7 +939,8 @@ int iwl_trans_read_mem(struct iwl_trans *trans, u32 addr,
  * not release NIC access.
  */
 int iwl_trans_read_mem_no_grab(struct iwl_trans *trans, u32 addr,
-			       void *buf, u32 dwords);
+			       void *buf, u32 dwords)
+	__must_hold(iwl_nic_access);
 
 int iwl_trans_read_config32(struct iwl_trans *trans, u32 ofs,
 			    u32 *val);
@@ -950,6 +956,7 @@ int iwl_trans_read_config32(struct iwl_trans *trans, u32 ofs,
 static inline int
 iwl_trans_read_mem_bytes_no_grab(struct iwl_trans *trans,
 				 u32 addr, void *buf, u32 bufsize)
+	__must_hold(iwl_nic_access)
 {
 	return iwl_trans_read_mem_no_grab(trans, addr, buf,
 					  bufsize / sizeof(u32));
@@ -1028,6 +1035,7 @@ static inline u32 iwl_trans_umac_prph(struct iwl_trans *trans, u32 ofs)
 }
 
 static inline u32 iwl_trans_read_umac_prph_no_grab(struct iwl_trans *trans, u32 ofs)
+	__must_hold(iwl_nic_access)
 {
 	return iwl_trans_read_prph_no_grab(trans, ofs +
 					   trans->mac_cfg->umac_prph_offset);
@@ -1044,7 +1052,8 @@ static inline void iwl_trans_write_umac_prph(struct iwl_trans *trans, u32 ofs,
 	iwl_trans_write_prph(trans, ofs + trans->mac_cfg->umac_prph_offset, val);
 }
 
-bool iwl_trans_grab_nic_access(struct iwl_trans *trans);
+bool iwl_trans_grab_nic_access(struct iwl_trans *trans)
+	__cond_acquires(true, iwl_nic_access);
 
 /**
  * iwl_trans_resched_with_nic_access - reschedule while holding NIC access
@@ -1055,9 +1064,11 @@ bool iwl_trans_grab_nic_access(struct iwl_trans *trans);
  * but a lot of processing is happening and the CPU may need to be
  * released. In practice, this is only during FW dump.
  */
-void iwl_trans_resched_with_nic_access(struct iwl_trans *trans);
+void iwl_trans_resched_with_nic_access(struct iwl_trans *trans)
+	__must_hold(iwl_nic_access);
 
-void iwl_trans_release_nic_access(struct iwl_trans *trans);
+void iwl_trans_release_nic_access(struct iwl_trans *trans)
+	__releases(iwl_nic_access);
 
 static inline void iwl_trans_schedule_reset(struct iwl_trans *trans,
 					    enum iwl_fw_error_type type)
diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/internal.h b/drivers/net/wireless/intel/iwlwifi/pcie/internal.h
index 01bfc1492c84..1440ba9adffd 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/internal.h
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/internal.h
@@ -29,7 +29,8 @@ void iwl_trans_pcie_write8(struct iwl_trans *trans, u32 ofs, u8 val);
 void iwl_trans_pcie_write32(struct iwl_trans *trans, u32 ofs, u32 val);
 u32 iwl_trans_pcie_read32(struct iwl_trans *trans, u32 ofs);
 u32 iwl_trans_pcie_read_prph(struct iwl_trans *trans, u32 reg);
-void iwl_pcie_write_prph_no_grab(struct iwl_trans *trans, u32 addr, u32 val);
+void iwl_pcie_write_prph_no_grab(struct iwl_trans *trans, u32 addr, u32 val)
+	__must_hold(iwl_nic_access);
 
 /* bus-specific transport operations table */
 extern const struct iwl_trans_ops iwl_trans_pcie_ops;
@@ -621,7 +622,8 @@ void iwl_trans_pcie_free(struct iwl_trans *trans);
 void iwl_trans_pcie_free_pnvm_dram_regions(struct iwl_dram_regions *dram_regions,
 					   struct device *dev);
 
-bool _iwl_trans_pcie_grab_nic_access(struct iwl_trans *trans, bool silent);
+bool _iwl_trans_pcie_grab_nic_access(struct iwl_trans *trans, bool silent)
+	__cond_acquires(true, &IWL_TRANS_GET_PCIE_TRANS(trans)->reg_lock);
 
 void iwl_trans_pcie_check_product_reset_status(struct pci_dev *pdev);
 void iwl_trans_pcie_check_product_reset_mode(struct pci_dev *pdev);
@@ -1149,7 +1151,8 @@ void iwl_trans_pcie_op_mode_leave(struct iwl_trans *trans);
 int iwl_trans_pcie_read_mem(struct iwl_trans *trans, u32 addr,
 			    void *buf, int dwords);
 int iwl_trans_pcie_read_mem_no_grab(struct iwl_trans *trans, u32 addr,
-				    void *buf, u32 dwords);
+				    void *buf, u32 dwords)
+	__must_hold(iwl_nic_access);
 int iwl_trans_pcie_sw_reset(struct iwl_trans *trans, bool retake_ownership);
 void iwl_trans_pcie_fw_reset_handshake(struct iwl_trans *trans);
 struct iwl_trans_dump_data *
@@ -1165,9 +1168,12 @@ void iwl_trans_pcie_set_bits_mask(struct iwl_trans *trans, u32 reg,
 				  u32 mask, u32 value);
 int iwl_trans_pcie_read_config32(struct iwl_trans *trans, u32 ofs,
 				 u32 *val);
-bool iwl_trans_pcie_grab_nic_access(struct iwl_trans *trans);
-void iwl_trans_pcie_resched_with_nic_access(struct iwl_trans *trans);
-void iwl_trans_pcie_release_nic_access(struct iwl_trans *trans);
+bool iwl_trans_pcie_grab_nic_access(struct iwl_trans *trans)
+	__cond_acquires(true, &IWL_TRANS_GET_PCIE_TRANS(trans)->reg_lock);
+void iwl_trans_pcie_resched_with_nic_access(struct iwl_trans *trans)
+	__must_hold(&IWL_TRANS_GET_PCIE_TRANS(trans)->reg_lock);
+void iwl_trans_pcie_release_nic_access(struct iwl_trans *trans)
+	__releases(&IWL_TRANS_GET_PCIE_TRANS(trans)->reg_lock);
 void iwl_pcie_alloc_fw_monitor(struct iwl_trans *trans, u8 max_power);
 int _iwl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent,
 		   const struct iwl_mac_cfg *mac_cfg,
diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/trans.c b/drivers/net/wireless/intel/iwlwifi/pcie/trans.c
index 0f4e309fe32b..10bc61fe7ea5 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/trans.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/trans.c
@@ -1745,6 +1745,7 @@ static int iwl_pcie_init_msix_handler(struct pci_dev *pdev,
 }
 
 static int iwl_trans_pcie_clear_persistence_bit(struct iwl_trans *trans)
+	__context_unsafe("FIXME: the HPM_DEBUG access might be broken?")
 {
 	u32 hpm, wprot;
 
@@ -2354,6 +2355,7 @@ static void iwl_trans_pcie_reset(struct iwl_trans *trans, enum iwl_reset_mode mo
  * already disabled.
  */
 bool _iwl_trans_pcie_grab_nic_access(struct iwl_trans *trans, bool silent)
+	__cond_acquires(true, &IWL_TRANS_GET_PCIE_TRANS(trans)->reg_lock)
 {
 	int ret;
 	struct iwl_trans_pcie *trans_pcie = IWL_TRANS_GET_PCIE_TRANS(trans);
@@ -2437,6 +2439,7 @@ bool _iwl_trans_pcie_grab_nic_access(struct iwl_trans *trans, bool silent)
 }
 
 bool iwl_trans_pcie_grab_nic_access(struct iwl_trans *trans)
+	__cond_acquires(true, &IWL_TRANS_GET_PCIE_TRANS(trans)->reg_lock)
 {
 	bool ret;
 
@@ -2451,6 +2454,7 @@ bool iwl_trans_pcie_grab_nic_access(struct iwl_trans *trans)
 }
 
 void iwl_trans_pcie_resched_with_nic_access(struct iwl_trans *trans)
+	__must_hold(&IWL_TRANS_GET_PCIE_TRANS(trans)->reg_lock)
 {
 	struct iwl_trans_pcie *trans_pcie = IWL_TRANS_GET_PCIE_TRANS(trans);
 
@@ -2462,6 +2466,7 @@ void iwl_trans_pcie_resched_with_nic_access(struct iwl_trans *trans)
 }
 
 void iwl_trans_pcie_release_nic_access(struct iwl_trans *trans)
+	__releases(&IWL_TRANS_GET_PCIE_TRANS(trans)->reg_lock)
 {
 	struct iwl_trans_pcie *trans_pcie = IWL_TRANS_GET_PCIE_TRANS(trans);
 
@@ -3996,6 +4001,7 @@ int iwl_trans_pcie_copy_imr(struct iwl_trans *trans,
 static void get_crf_id(struct iwl_trans *iwl_trans,
 		       struct iwl_trans_info *info,
 		       u32 *hw_wfpm_id)
+	__must_hold(iwl_nic_access)
 {
 	u32 sd_reg_ver_addr;
 	u32 val = 0;
diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/utils.h b/drivers/net/wireless/intel/iwlwifi/pcie/utils.h
index ece1caaa4948..cbc47f22634d 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/utils.h
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/utils.h
@@ -19,8 +19,10 @@ int iwl_pcie_poll_prph_bit(struct iwl_trans *trans, u32 addr,
 int iwl_pcie_poll_umac_prph_bit(struct iwl_trans *trans, u32 addr,
 				u32 bits, u32 mask, int timeout);
 int iwl_pcie_poll_umac_prph_bits_no_grab(struct iwl_trans *trans, u32 addr,
-					 u32 bits, u32 mask, int timeout);
-void iwl_pcie_write_prph64_no_grab(struct iwl_trans *trans, u32 ofs, u64 val);
+					 u32 bits, u32 mask, int timeout)
+	__must_hold(iwl_nic_access);
+void iwl_pcie_write_prph64_no_grab(struct iwl_trans *trans, u32 ofs, u64 val)
+	__must_hold(iwl_nic_access);
 void iwl_pcie_write_direct64(struct iwl_trans *trans, u64 reg, u64 value);
 
 static inline void iwl_pcie_write64(struct iwl_trans *trans, u64 ofs, u64 val)
@@ -31,6 +33,7 @@ static inline void iwl_pcie_write64(struct iwl_trans *trans, u64 ofs, u64 val)
 
 static inline void iwl_pcie_write_umac_prph_no_grab(struct iwl_trans *trans,
 						    u32 ofs, u32 val)
+	__must_hold(iwl_nic_access)
 {
 	iwl_pcie_write_prph_no_grab(trans, ofs + trans->mac_cfg->umac_prph_offset,
 				    val);
-- 
2.34.1

