Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864109;
	b=r5igcV9EDNyRFRXOE6LjVdyAegdk48sd3p42pSbCzf2etLJg5DNDR3oNeubchFjhOS4K
	 0irwhFh9P6YeSDZN5nRQt3/CXQy1SlEO7P05FN8wVcNOIMty+U2nrFXwFx2OrZ+lRTamx
	 fdNPPX/B9LdaOrCmtI2CtRGAqh+vaGqyUw9pqoCV7tli7cILaSPId+xiXp3+rvvEpMaeT
	 QW67UwE/4oLMoFQgB6tqIjT7QTMXLqKYLK25Hmw7Ci4ItNFysbn3ySK7e+BEoZlJcciHa
	 VNXWvtB0GK6B8g3d7cpqj92Ns8QMTw1dz6Y6BtkGEKL/IbAVnkQ41nQgLnbHRpklvMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864109;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Organization:Content-Transfer-Encoding;
	bh=I1m7dNSrNNk2kme/WHHO3IvZebKqVRPslhlVkWW7pyc=;
	b=JSSr/ZGGjdpGvKoP1acnreMnotlX+4OYQq1BzWnk9zJRKQ7KZeS8VqGK/01rI3LXwM0I
	 aWngTH8ELF3vFugBTGz9XGqP8eqgZQOsb2berd6n/VCz/JyS8pt/rpsHMowPYKRQHvERX
	 Tl0MKb2eZpkPhian0QjpHAe85b8CzOjZs2qRFFydsxafGFM2TwY0262iUw+pBQUzlCNH/
	 ovyoE25D3ngVDuV0cNaeI3uX3YdolKRkDx01XXLm0LvRBxU0CDGFJnDh7l3Mq4UDjB0QZ
	 f4vXD6IfCn8kXw++TykD0xt1KLwiXYaU5pT2edAoD9rZhKT5wILk8QZysa/q2fLH5Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=foxEd1uR;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A28E606A33B
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 21:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A28E606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=foxEd1uR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794864109; x=1826400109;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b+wfgwwa1OCAKPklI47eTFKnIjXfX6TniWnXUMW++Ys=;
  b=foxEd1uRmB3eESeJYmGx8PjF2k3dv4cFc2jJtcI1nyZdckuRt2w376hc
   Slp/xlhmegkvqoqO1f9oGaGPy5H3rduvPmAR/Qs3t9QJ2T5/RlK4TduQr
   2Oi7QT5bwn6jT6j0NBXZoF+iuYCP6CrS8cohxSsWvlmm4Q+vaMvujTHWm
   wS+B4Jv9ZTKIa81CIWQ1c9xIKwjgh/mJcI2/vtjuJaoLDuL2sshrfENNm
   2v+FHsZsRVfCAsoKLKWhPoPqJHfgAzt0kZsFLAjvTvpEOFFqpAweTHwb7
   DhG4zv41QWjrXKfDH3ZQ0qpJoFqmak/b9JGJjV7Z/dGSLB7dDDdnYUPuZ
   Q==;
X-CSE-ConnectionGUID: GHciM9p3TOivOOVyxD40UQ==
X-CSE-MsgGUID: 8WKO6avGStWjCxZoRwHMLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3604198"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3604198"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:21:49 -0800
X-CSE-ConnectionGUID: 9MjwlU3iTmaqoEcj2blh3A==
X-CSE-MsgGUID: DTwHJjO9TYGDAHST+9Z8XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9969124"
Received: from weis0040.iil.intel.com ([10.12.217.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:21:48 -0800
From: Miri Korenblit <miriam.rachel.korenblit@intel.com>
To: miriam.rachel.korenblit@intel.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH iwlwifi-next 06/15] wifi: iwlwifi: rename IWL_MAX_CMD_TBS_PER_TFD
Date: Mon, 16 Nov 2026 23:23:24 +0200
Message-Id: <20261116232138.bac27862da2e.Ia703dcfca36eee4699ac4ea70787c104976e2207@changeid>
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

