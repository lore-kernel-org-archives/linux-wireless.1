Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992164;
	b=rxB/Giu7NmHzH26yIjeo07WH4eseoSAJQbS3X8U0g3s4Hk9e43g6/DBHaySRjVPgb//Q
	 WP84H/ahxRWzIrkASBjavSVNCv45/fqtkvfhdDNVExZYJoM/1JpYeLVy/df+ZjhOo39Ow
	 Y33ZJ3Q4chwocrZHKJ9xvHjFjlYcuEhJYlrfzktxT+kLvIEeLPjdODjjgRgA4wntAltgR
	 V5t53+ZKnSvkgiif9p3UGmV+UwIWv1crxuJZ2wHGjLH6ZGItG8jQwi0aC1Uqt5RYE9jFh
	 CxngF9jz90+4aVuzevkzk80f+/vw3cx5+nhSiFH/qpZgxJYls1YmWrY4fLFlz/ObEDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992164;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Organization:Content-Transfer-Encoding;
	bh=I1m7dNSrNNk2kme/WHHO3IvZebKqVRPslhlVkWW7pyc=;
	b=ANXqKnzVXPWtFg3y9olMHlMVFAZCjMd/lMHjlvpGTk+4HBSxUzYT60JE0WOwGMrf/sLb
	 3FM17KpKMiU9ddxTjBDFcqmmkg9+ZbFB4UNdBGNWeWpHv4GY8rnUzq5hsZy2caaRQAgOR
	 chq6kywG2w+ShpqAD8wbrbCONS45LqJDTz1tQJk7lkxSre8bMrp1kxAusDToGFal2LiAi
	 FHOTPgPRnG3IjiZ9Mb1D/FSIB6oYlasT5IOZo0N23v/FEQm3+aKEcA0GrHaw6Ds9l8rLF
	 Ydg4CdxcrsB6nVzDw863IvGXz3K600wymlV9+aGu+mtO7Ey1uYSrhvTZHOFPXZUJLdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kNTrAYzg;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A28606A332
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9A28606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kNTrAYzg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794992164; x=1826528164;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b+wfgwwa1OCAKPklI47eTFKnIjXfX6TniWnXUMW++Ys=;
  b=kNTrAYzgtCjxsGWghdgmZ4Vv4YDXuyKoneExttITvVh0374K/YKI/S6z
   WSxBuzNXztR1r9fna2MQma1Y2IflZzgrP01CrOGOH2ycA3fGqClZzWDQj
   q2edb7oeZnNNrEjZrnnfOXDGVG91SpMA1SPqbMRijMyLLwZhFxAVDWSki
   Un07LXJEu6IhOmhZYmWt7eGBFixN7nDe5A8P5vvufH/xFuMoTZYaZwL1D
   58/tv8jBtgKWi58OSYmsSLMpqeJ1Cj6TgtsTNpnFghA5XmUdmaBVXupaM
   n7Nj1bgNDRU4eG6h2CZSchBiJjd112tQmEretXiVfT/UZygI1RdmT0e59
   w==;
X-CSE-ConnectionGUID: CCQd1cC8RNGG+eLAq2ePEw==
X-CSE-MsgGUID: cODo/EOtSaKkDLtoX9mWLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3871953"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3871953"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 00:56:04 -0800
X-CSE-ConnectionGUID: TROJam4cSyCeoJ4v2S3P6g==
X-CSE-MsgGUID: 8nvh9T/KRJCbIFQzcg9Uyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10000253"
Received: from weis0040.iil.intel.com ([10.12.217.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 00:56:02 -0800
From: Miri Korenblit <miriam.rachel.korenblit@intel.com>
To: miriam.rachel.korenblit@intel.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v2 iwlwifi-next 06/15] wifi: iwlwifi: rename IWL_MAX_CMD_TBS_PER_TFD
Date: Wed, 18 Nov 2026 10:57:38 +0200
Message-Id: <20261118105612.bac27862da2e.Ia703dcfca36eee4699ac4ea70787c104976e2207@changeid>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118085747.3845425-1-miriam.rachel.korenblit@intel.com>
References: <20261118085747.3845425-1-miriam.rachel.korenblit@intel.com>
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

This is not really representing TBs per TFD (which is 20 and not 2),
this is just the API that the transport provides.

Signed-off-by: Miri Korenblit <miriam.rachel.korenblit@intel.com>
---
 .../wireless/intel/iwlwifi/iwl-devtrace-iwlwifi.h    |  4 ++--
 drivers/net/wireless/intel/iwlwifi/iwl-trans.h       | 11 +++++------
 drivers/net/wireless/intel/iwlwifi/pcie/tx-gen2.c    | 10 +++++-----
 drivers/net/wireless/intel/iwlwifi/pcie/tx.c         | 12 ++++++------
 4 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/iwl-devtrace-iwlwifi.h b/drivers/net/wireless/intel/iwlwifi/iwl-devtrace-iwlwifi.h
index ead72c3d33bd..1743490ad2e6 100644
--- a/drivers/net/wireless/intel/iwlwifi/iwl-devtrace-iwlwifi.h
+++ b/drivers/net/wireless/intel/iwlwifi/iwl-devtrace-iwlwifi.h
@@ -4,7 +4,7 @@
  * Copyright(c) 2009 - 2014 Intel Corporation. All rights reserved.
  * Copyright(c) 2015 Intel Mobile Communications GmbH
  * Copyright(c) 2016 - 2017 Intel Deutschland GmbH
- * Copyright(c) 2018, 2023-2024  Intel Corporation
+ * Copyright(c) 2018, 2023-2024, 2026  Intel Corporation
  *****************************************************************************/
 
 #if !defined(__IWLWIFI_DEVICE_TRACE_IWLWIFI) || defined(TRACE_HEADER_MULTI_READ)
@@ -35,7 +35,7 @@ TRACE_EVENT(iwlwifi_dev_hcmd,
 		__entry->flags = cmd->flags;
 		memcpy(__get_dynamic_array(hcmd), hdr, offset);
 
-		for (i = 0; i < IWL_MAX_CMD_TBS_PER_TFD; i++) {
+		for (i = 0; i < IWL_MAX_CMD_CHUNKS_PER_HCMD; i++) {
 			if (!cmd->len[i])
 				continue;
 			memcpy((u8 *)__get_dynamic_array(hcmd) + offset,
diff --git a/drivers/net/wireless/intel/iwlwifi/iwl-trans.h b/drivers/net/wireless/intel/iwlwifi/iwl-trans.h
index 7a358daab584..a07dd492beb5 100644
--- a/drivers/net/wireless/intel/iwlwifi/iwl-trans.h
+++ b/drivers/net/wireless/intel/iwlwifi/iwl-trans.h
@@ -166,10 +166,9 @@ struct iwl_device_tx_cmd {
 	(TFD_MAX_PAYLOAD_SIZE - sizeof(struct iwl_cmd_header_wide))
 
 /*
- * number of transfer buffers (fragments) per transmit frame descriptor;
- * this is just the driver's idea, the hardware supports 20
+ * number of transfer buffers (fragments) per hcmd;
  */
-#define IWL_MAX_CMD_TBS_PER_TFD	2
+#define IWL_MAX_CMD_CHUNKS_PER_HCMD	2
 
 /**
  * enum iwl_hcmd_dataflag - flag for each one of the chunks of the command
@@ -215,15 +214,15 @@ enum iwl_error_event_table_status {
  *	version and group as well
  */
 struct iwl_host_cmd {
-	const void *data[IWL_MAX_CMD_TBS_PER_TFD];
+	const void *data[IWL_MAX_CMD_CHUNKS_PER_HCMD];
 	struct iwl_rx_packet *resp_pkt;
 	unsigned long _rx_page_addr;
 	u32 _rx_page_order;
 
 	u32 flags;
 	u32 id;
-	u16 len[IWL_MAX_CMD_TBS_PER_TFD];
-	u8 dataflags[IWL_MAX_CMD_TBS_PER_TFD];
+	u16 len[IWL_MAX_CMD_CHUNKS_PER_HCMD];
+	u8 dataflags[IWL_MAX_CMD_CHUNKS_PER_HCMD];
 };
 
 static inline void iwl_free_resp(struct iwl_host_cmd *cmd)
diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/tx-gen2.c b/drivers/net/wireless/intel/iwlwifi/pcie/tx-gen2.c
index b235a4539d7c..3dcb62a67e2f 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/tx-gen2.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/tx-gen2.c
@@ -1210,8 +1210,8 @@ int iwl_pcie_gen2_enqueue_hcmd(struct iwl_trans *trans,
 	u16 copy_size, cmd_size, tb0_size;
 	bool had_nocopy = false;
 	u8 group_id = iwl_cmd_groupid(cmd->id);
-	const u8 *cmddata[IWL_MAX_CMD_TBS_PER_TFD];
-	u16 cmdlen[IWL_MAX_CMD_TBS_PER_TFD];
+	const u8 *cmddata[IWL_MAX_CMD_CHUNKS_PER_HCMD];
+	u16 cmdlen[IWL_MAX_CMD_CHUNKS_PER_HCMD];
 	struct iwl_tfh_tfd *tfd;
 	unsigned long flags;
 
@@ -1221,7 +1221,7 @@ int iwl_pcie_gen2_enqueue_hcmd(struct iwl_trans *trans,
 	copy_size = sizeof(struct iwl_cmd_header_wide);
 	cmd_size = sizeof(struct iwl_cmd_header_wide);
 
-	for (i = 0; i < IWL_MAX_CMD_TBS_PER_TFD; i++) {
+	for (i = 0; i < IWL_MAX_CMD_CHUNKS_PER_HCMD; i++) {
 		cmddata[i] = cmd->data[i];
 		cmdlen[i] = cmd->len[i];
 
@@ -1325,7 +1325,7 @@ int iwl_pcie_gen2_enqueue_hcmd(struct iwl_trans *trans,
 	copy_size = sizeof(struct iwl_cmd_header_wide);
 
 	/* and copy the data that needs to be copied */
-	for (i = 0; i < IWL_MAX_CMD_TBS_PER_TFD; i++) {
+	for (i = 0; i < IWL_MAX_CMD_CHUNKS_PER_HCMD; i++) {
 		int copy;
 
 		if (!cmd->len[i])
@@ -1390,7 +1390,7 @@ int iwl_pcie_gen2_enqueue_hcmd(struct iwl_trans *trans,
 	}
 
 	/* map the remaining (adjusted) nocopy/dup fragments */
-	for (i = 0; i < IWL_MAX_CMD_TBS_PER_TFD; i++) {
+	for (i = 0; i < IWL_MAX_CMD_CHUNKS_PER_HCMD; i++) {
 		void *data = (void *)(uintptr_t)cmddata[i];
 
 		if (!cmdlen[i])
diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/tx.c b/drivers/net/wireless/intel/iwlwifi/pcie/tx.c
index 0c29fb6b9ca7..ad9b80ed7214 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/tx.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/tx.c
@@ -1370,8 +1370,8 @@ int iwl_pcie_enqueue_hcmd(struct iwl_trans *trans,
 	u8 group_id = iwl_cmd_groupid(cmd->id);
 	int i, ret;
 	u32 cmd_pos;
-	const u8 *cmddata[IWL_MAX_CMD_TBS_PER_TFD];
-	u16 cmdlen[IWL_MAX_CMD_TBS_PER_TFD];
+	const u8 *cmddata[IWL_MAX_CMD_CHUNKS_PER_HCMD];
+	u16 cmdlen[IWL_MAX_CMD_CHUNKS_PER_HCMD];
 	unsigned long flags;
 
 	if (WARN(!trans->conf.wide_cmd_header &&
@@ -1388,9 +1388,9 @@ int iwl_pcie_enqueue_hcmd(struct iwl_trans *trans,
 	}
 
 	/* need one for the header if the first is NOCOPY */
-	BUILD_BUG_ON(IWL_MAX_CMD_TBS_PER_TFD > IWL_NUM_OF_TBS - 1);
+	BUILD_BUG_ON(IWL_MAX_CMD_CHUNKS_PER_HCMD > IWL_NUM_OF_TBS - 1);
 
-	for (i = 0; i < IWL_MAX_CMD_TBS_PER_TFD; i++) {
+	for (i = 0; i < IWL_MAX_CMD_CHUNKS_PER_HCMD; i++) {
 		cmddata[i] = cmd->data[i];
 		cmdlen[i] = cmd->len[i];
 
@@ -1505,7 +1505,7 @@ int iwl_pcie_enqueue_hcmd(struct iwl_trans *trans,
 	}
 
 	/* and copy the data that needs to be copied */
-	for (i = 0; i < IWL_MAX_CMD_TBS_PER_TFD; i++) {
+	for (i = 0; i < IWL_MAX_CMD_CHUNKS_PER_HCMD; i++) {
 		int copy;
 
 		if (!cmd->len[i])
@@ -1574,7 +1574,7 @@ int iwl_pcie_enqueue_hcmd(struct iwl_trans *trans,
 	}
 
 	/* map the remaining (adjusted) nocopy/dup fragments */
-	for (i = 0; i < IWL_MAX_CMD_TBS_PER_TFD; i++) {
+	for (i = 0; i < IWL_MAX_CMD_CHUNKS_PER_HCMD; i++) {
 		void *data = (void *)(uintptr_t)cmddata[i];
 
 		if (!cmdlen[i])
-- 
2.34.1

